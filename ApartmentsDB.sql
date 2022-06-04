PGDMP                         z           apartments_DB    14.2    14.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    25185    apartments_DB    DATABASE     l   CREATE DATABASE "apartments_DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Europe.1251';
    DROP DATABASE "apartments_DB";
                postgres    false            �            1259    25186 
   apartments    TABLE     �  CREATE TABLE public.apartments (
    id integer NOT NULL,
    address character varying(100) NOT NULL,
    size character varying(12),
    floor integer,
    rent integer NOT NULL,
    services integer NOT NULL,
    deposit integer NOT NULL,
    provision integer NOT NULL,
    link character varying(200),
    broker_id integer,
    city_part_id integer,
    status_id integer,
    our_feelings character varying(120)
);
    DROP TABLE public.apartments;
       public         heap    postgres    false            �            1259    25191    brokers    TABLE     "  CREATE TABLE public.brokers (
    id integer NOT NULL,
    name character varying(40),
    email character varying(50),
    tel character varying(50),
    rating integer,
    organisation character varying(30),
    CONSTRAINT brokers_rating_check CHECK (((rating > 0) AND (rating < 6)))
);
    DROP TABLE public.brokers;
       public         heap    postgres    false            �            1259    25197 	   city_part    TABLE     �   CREATE TABLE public.city_part (
    id integer NOT NULL,
    name_of_city_part character varying(400),
    CONSTRAINT city_part_id_check CHECK (((id > 0) AND (id < 23)))
);
    DROP TABLE public.city_part;
       public         heap    postgres    false            �            1259    25205    status    TABLE     `   CREATE TABLE public.status (
    id integer NOT NULL,
    description character varying(200)
);
    DROP TABLE public.status;
       public         heap    postgres    false                       0    25186 
   apartments 
   TABLE DATA           �   COPY public.apartments (id, address, size, floor, rent, services, deposit, provision, link, broker_id, city_part_id, status_id, our_feelings) FROM stdin;
    public          postgres    false    209   :                 0    25191    brokers 
   TABLE DATA           M   COPY public.brokers (id, name, email, tel, rating, organisation) FROM stdin;
    public          postgres    false    210   �                 0    25197 	   city_part 
   TABLE DATA           :   COPY public.city_part (id, name_of_city_part) FROM stdin;
    public          postgres    false    211   �                 0    25205    status 
   TABLE DATA           1   COPY public.status (id, description) FROM stdin;
    public          postgres    false    212   �"       k           2606    25190    apartments apartments_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.apartments DROP CONSTRAINT apartments_pkey;
       public            postgres    false    209            m           2606    25196    brokers brokers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.brokers
    ADD CONSTRAINT brokers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.brokers DROP CONSTRAINT brokers_pkey;
       public            postgres    false    210            o           2606    25201    city_part city_part_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.city_part
    ADD CONSTRAINT city_part_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.city_part DROP CONSTRAINT city_part_pkey;
       public            postgres    false    211            q           2606    25229    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    212            i           1259    25235 #   apartments_city_part_total_rent_idx    INDEX     �   CREATE INDEX apartments_city_part_total_rent_idx ON public.apartments USING btree (city_part_id, ((((rent + services) + deposit) + provision)));
 7   DROP INDEX public.apartments_city_part_total_rent_idx;
       public            postgres    false    209    209    209    209    209            s           2606    25218 $   apartments apartments_broker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_broker_id_fkey FOREIGN KEY (broker_id) REFERENCES public.brokers(id);
 N   ALTER TABLE ONLY public.apartments DROP CONSTRAINT apartments_broker_id_fkey;
       public          postgres    false    209    210    3181            r           2606    25213 '   apartments apartments_city_part_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_city_part_id_fkey FOREIGN KEY (city_part_id) REFERENCES public.city_part(id);
 Q   ALTER TABLE ONLY public.apartments DROP CONSTRAINT apartments_city_part_id_fkey;
       public          postgres    false    211    209    3183            t           2606    25230 $   apartments apartments_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);
 N   ALTER TABLE ONLY public.apartments DROP CONSTRAINT apartments_status_id_fkey;
       public          postgres    false    3185    209    212                g  x����n�6���S�hQ+/��@��@;h:Eg�n��e:fD��n��$�e�]�fe�zHَ3H�E������F���5�;D��K�5�
Q��$IM�`�XW]w�~�����m�Ъ��M���P:�m�7���cÛ��X�h�6���mv��4�)���T}�-�ZR���d��P��vAo�Ý0m���VUGl8!@�X��VUO�n]+�2�xN�^dP�F>|�Z����"���b��걞Fu-���Q�lL(K(��f^8<��w64�����	yv+��"Tm؛�l��R*��u��;�������$9��^dV��������[�1�v'y�Jє���A��䶑K����T���.���q�g�c���з��3��=��d�����z�쭦F�)�3B3Ƽ�J��Wrd��Jo?��ݰf{���Z8mR���v�$ɡ���J4`E�G��w��s��$�|NP�
���r_9�T��o*g�� ��=U�d�S} �l�C�������x2�ro�{7i��`�`���[<���10r7`ɤ'}n�|�x�.$�<�$%;���.E� �J[�
3�B1o�f���ep�������S�${��w��b����>(cW�X�э�(7�)��u���r�3Eo�Y�TF�R��6��ą�֪t�䰻p�=�TO�S7��	�$Kv�" q9��ڰ�p�#�N-{J�Ȩ_���b��x��n�����*���A��4'I<)lRv�������'V��AN���%lT��@<���$O�(�a�զG3�i�,;����@�D�l;��JM�]�y���u��хj^��3�_�e����C?��JY���g�	c�W�驜+�ek����up�Ђ�
2L�8�C]��k���6��麛�=��J�4ү%�����y���5���G�YN��g%���E�3����;������x:�l�k�-E�]\�Nh{Y�b�m;��s�3NpBY�+�!A�V/f�zB��/��m'��߱L_�,=|	N��>k�7v>.�4�1�]��A��F��ڍ*U�q4��*�CE���ɓ"eX���lF���?σ ��)>�            x�mTK��6\��x+oRF�wv���g�Q<5NM*U�<Q���TY�D�Y� 9����^y EYNe� ��~�lb�i��{�'�TȐ;/�^ۮQ�<�bB�e4R��	Y�&3���[H���5z�0Eמ��;�6K[8���+g�-W�@&	I��HXn�L��t��ꪂ�P�ڬ�%:���RB
�$-o�up
+��G����~Ԧ�^��!/�Z��n-!ѼVTz���,_�Ha�"6���� �6[9��B�0C�tj�45U���j�F֣i�gq��9	��A����{�)�T��ä�+�b��8��bU��xi�Qn�oI,�`�#a����;���m��M+�յ��5�y�HH����&'�r����V8|��K|>,a1�jpKE��ȜEieY�)!^��
���:�a��/L�}����
]Z��N��E��1���(Ԑ{�O=t�[����o��������~HOX�ws��oI��ć��w�<�=;w�B(ؽYq��֧#I�N9V�k�uzG�s|�x#��LPɏ迴�M��O8�Ź���w]C�l~�q/��2"%��N����%9Sն�AkW�]+����2��CW�{��/�����6�R��k��*�h��1�<��<����	D���t���0��GU��4�+U�5�~�J�ߪdL2�?�⼕��&{F����3�����ɾ��z��l2� Jr�<��~|�����Aè�^E���ߟ`t����g "~?C�6t%+i��~F^���O:`�X�<y������~A�����m��         �  x��T�n�0�ɧ�� B�I��n��� N=]h��dQ�!��'�P�u=i�`d/�,߫G�?�-#/�I��黻��>#���w�E����}!�����KU�߄ʷ�AQ��iv�)g:7޴X&:W����G���Ʒ��3�J#�#��sa�&4�j�z��@���l���� H��
	k�t#�K(p�~$�S�,Q+Aq��0�tΪ׍�A��œ�_,�"!�N�1��<��B�_W��DM���k�AH�>p�Ų�Sqd��_�ND�Z�J �bd�E��"��LH�(�r�L�J������hOf�m_�A�V�'S(�OG�	�@mO����������D���^�~��φ�5�1@�7�W�>H����!�,�4�5�l�O�Y&�%��$dM�KX,��8����t�;�ТE�l�����A�] �j\���BO�ߧ9i*���-:.�r �4�e�=9ʸsp���_~X��j=4��>Gr쓖'!��⨓��ح�^�l7[~���]#��?l��c$c�I�H�^� �z�P�V�}�_<�Ӷ�g������mԗ�^�Gٓ�ܼ>�0�"Χ���i����%r� �+7#nr?�mT�Dt�x*�4�����1��P/3#�&hs�\�<�ə�:��u�#1����f��R����&۟�I�a�ݳD���}�z#�3ܾ�"=ٌ̍ⶍԟ1��DP�ܳ���gV�"e�f���9��\��8����ݺ�%         e   x�3�t�/�K�2�/�/I�2���S(�/M��22�R�K2��L9���J��K�R��K2��f���E��)\朾�e�
�y\�Ήyɩ99@�=... �X     