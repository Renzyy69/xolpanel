#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYE�b  x��  }��v+�����@��T�2��SQ��=�ꍦML���4i�@=C�2�	�d$���MH� � �`F�  	�`$HBi�T~�MO&�jyC�44hh����ʹ߷�Ⱦ-`Q�چ�R�3H�XO+!�e�� aY���pk3MIJ���5�.�ƨ����.���OJ�t�>�MV�+Wp�_��ƅ���]T��.���g�4W�Arכ>e&h�a8�Z[�&%�8m�Qbȷ(]����ik�����·�5�LR=@�rė9��P�&�`�C3'�F�`��S¾����3�\�q��Snʩ ����V�G��dI&�s*��6Az��QS��&��X�����/�&���I m� Λ�dFi�e�MP��3������N�өS p%*i�F��<����x�ً�U5����JT��A�$���6a;�;��S��q�G� 0>ӀP�Q	!Shma �l�ˑ��H�\��A�$؃���@X@0 �V�_�"��YKž�2$��p>i�hh�έ���uDJ!6�!�����RA*����p�[X^��U�'�l�
��]�R����we�`I����#�W��'C�M0�$#wSX��L ��Px �"eK��/���-����$�R!nNE��+vȴ�nV2S&Ԉ��YƸ�f�<f_�҅�#
*4��$�����͕�a�2�xcm�xTi�J���
jO���)�B.+