#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`mktemp ${TMPDIR:-/tmp}/bzexe.XXXXXXXXXX` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> "$tmpfile"; then
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
BZh91AY&SY�Q[� @_�0�����������PD@� ��� P���+Zt��@4HmS�L�f��i�	��@ 4��z��h�@�'�iOI�� �F�  4      @�&S@�G��� �OSA��@ � q����4@ h h@  0�"hS�12i�F�S�M�I�OL����zz����f�@~���؋RV����9��m��$�ϫ�9�p0�~�����t6�\���Ӕ��WP�'@��G�&���/��T����4F��w���!b6��_%��8#�%%D������f��˽�H��x3��ؔAA���d�bƵ\�%����K�=l�JЯ��n��'�Z0uh�R�o���;����$���}��@K����H��\Q�&H�J��UQ�V�kR�4�c:ƆMc���&!G2p�0b���`�?��ڹV
yȔ�
aw�D^��r��T'(�Cm��	�`��UR;9+�"�J �ѣ�� ~N��y�çH�DQ��WY@���zxu����͠���@��87Y߻�OV�w��s�����Cx����G?�*F��.�Ig�n\�u�L֌�-Z��n�Ĉh��S����F(Hc,�*}�P&��\���Tsz���I1�+�>Y�����%�KP%�`��3��޾�3��'?�M�:����vn,a���y>�<���IRmzo`"1�Ve.k�P�)%��ȵ��z����B��E`<8TgHQ ���@�N3T���#?%d�TG��XHd�2��[[R�����H�m�P�[��ߋ��n�	%ZRO	:���TӐ�%U%XL� �L��ji��{
�]y�ec6z�M=x�۞Y/b���UJ��}�a�|�1cݘ�W.�5�iҦu�����:�k�I?g���(8���3�BPG�uua$-*>�C��@BI$�o�Q� >�uMd���0���j�Zw�*!�n3;�E��ʮ�g<�Jpq�c�����&�<�J�hץx�.�׃�&r�n�1�%������ŞՓ�;�%�����F��-�<�+�,(0�4l�))e�|�Ƀ����Y[D�Mka�n��.�_�,͓{	ˊ�����f�;�%>%_�Ǌ��X)5"�@㙌Ȑ2� T��L�))���4T��+F���͟	|�;JK���Ъ�%��0p�h0�i�Pʴ���1`^X�	�pά���Ƨ�S3�ϖ��z�u�E�=�"�z̲����J8�C�al1�p�!ģ-�K4��૜�Gej�ጆ�'T$�݁$zfrWvշ��tr�_"���Ϊ��ӫ@����}��)�C��է�&�vWa���+�V��j=�ڥJ<GW��4up\Y?�*�F����pv\��YpoX�	�@�CY�Q��丁M<�D�8�OH}#&J�<�8�Y�0����ט�=�E>�=�0x_`�5i�ܼ
�)4�?-�ނ��#<8�sƜ�Mts�]]ņ �>�")VzMv�˳Z(3	�	�x=��O���o,.։���fD��u�q@P�����d�Z�$�p �5���Gp_HV�k�ą6�?�rE8P��Q[�