PGDMP     0                     w         	   ratingapp    12.1    12.1 +    p           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            r           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            s           1262    16621 	   ratingapp    DATABASE     g   CREATE DATABASE ratingapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE ratingapp;
                postgres    false            �            1259    16672    comments    TABLE     �   CREATE TABLE public.comments (
    cid integer NOT NULL,
    comment character varying(255),
    author character varying,
    user_id integer,
    post_id integer,
    date_created timestamp without time zone
);
    DROP TABLE public.comments;
       public         heap    postgres    false            t           0    0    TABLE comments    ACL     ]   GRANT ALL ON TABLE public.comments TO PUBLIC;
GRANT ALL ON TABLE public.comments TO "Admin";
          public          postgres    false    209            �            1259    16670    comments_cid_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_cid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.comments_cid_seq;
       public          postgres    false    209            u           0    0    comments_cid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.comments_cid_seq OWNED BY public.comments.cid;
          public          postgres    false    208            �            1259    16625    movies_ratings    TABLE     �   CREATE TABLE public.movies_ratings (
    id integer NOT NULL,
    title character varying(255),
    poster_path character varying(300),
    rating integer DEFAULT 1,
    overview character varying(485)
);
 "   DROP TABLE public.movies_ratings;
       public         heap    postgres    false            v           0    0    TABLE movies_ratings    ACL     i   GRANT ALL ON TABLE public.movies_ratings TO PUBLIC;
GRANT ALL ON TABLE public.movies_ratings TO "Admin";
          public          postgres    false    203            �            1259    16623    movies_ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.movies_ratings_id_seq;
       public          postgres    false    203            w           0    0    movies_ratings_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.movies_ratings_id_seq OWNED BY public.movies_ratings.id;
          public          postgres    false    202            �            1259    16650    posts    TABLE     �   CREATE TABLE public.posts (
    pid integer NOT NULL,
    title character varying(255),
    body character varying,
    user_id integer,
    author character varying,
    date_created timestamp without time zone,
    likes integer DEFAULT 0
);
    DROP TABLE public.posts;
       public         heap    postgres    false            x           0    0    TABLE posts    ACL     W   GRANT ALL ON TABLE public.posts TO PUBLIC;
GRANT ALL ON TABLE public.posts TO "Admin";
          public          postgres    false    207            �            1259    16648    posts_pid_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_pid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.posts_pid_seq;
       public          postgres    false    207            y           0    0    posts_pid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.posts_pid_seq OWNED BY public.posts.pid;
          public          postgres    false    206            �            1259    16637    users    TABLE     �   CREATE TABLE public.users (
    uid integer NOT NULL,
    username character varying(255),
    email character varying(255),
    email_verified boolean,
    date_created date,
    last_login date
);
    DROP TABLE public.users;
       public         heap    postgres    false            z           0    0    TABLE users    ACL     W   GRANT ALL ON TABLE public.users TO PUBLIC;
GRANT ALL ON TABLE public.users TO "Admin";
          public          postgres    false    205            �            1259    16635    users_uid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users_uid_seq;
       public          postgres    false    205            {           0    0    users_uid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.uid;
          public          postgres    false    204            �           2604    16675    comments cid    DEFAULT     l   ALTER TABLE ONLY public.comments ALTER COLUMN cid SET DEFAULT nextval('public.comments_cid_seq'::regclass);
 ;   ALTER TABLE public.comments ALTER COLUMN cid DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    16628    movies_ratings id    DEFAULT     v   ALTER TABLE ONLY public.movies_ratings ALTER COLUMN id SET DEFAULT nextval('public.movies_ratings_id_seq'::regclass);
 @   ALTER TABLE public.movies_ratings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    16653 	   posts pid    DEFAULT     f   ALTER TABLE ONLY public.posts ALTER COLUMN pid SET DEFAULT nextval('public.posts_pid_seq'::regclass);
 8   ALTER TABLE public.posts ALTER COLUMN pid DROP DEFAULT;
       public          postgres    false    207    206    207            �           2604    16640 	   users uid    DEFAULT     f   ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_uid_seq'::regclass);
 8   ALTER TABLE public.users ALTER COLUMN uid DROP DEFAULT;
       public          postgres    false    204    205    205            m          0    16672    comments 
   TABLE DATA           X   COPY public.comments (cid, comment, author, user_id, post_id, date_created) FROM stdin;
    public          postgres    false    209   �/       g          0    16625    movies_ratings 
   TABLE DATA           R   COPY public.movies_ratings (id, title, poster_path, rating, overview) FROM stdin;
    public          postgres    false    203   �/       k          0    16650    posts 
   TABLE DATA           W   COPY public.posts (pid, title, body, user_id, author, date_created, likes) FROM stdin;
    public          postgres    false    207   4=       i          0    16637    users 
   TABLE DATA           _   COPY public.users (uid, username, email, email_verified, date_created, last_login) FROM stdin;
    public          postgres    false    205   Q=       |           0    0    comments_cid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.comments_cid_seq', 1, false);
          public          postgres    false    208            }           0    0    movies_ratings_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.movies_ratings_id_seq', 1, false);
          public          postgres    false    202            ~           0    0    posts_pid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.posts_pid_seq', 1, false);
          public          postgres    false    206                       0    0    users_uid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_uid_seq', 1, false);
          public          postgres    false    204            �           2606    16680    comments comments_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (cid);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    209            �           2606    16634 "   movies_ratings movies_ratings_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.movies_ratings
    ADD CONSTRAINT movies_ratings_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.movies_ratings DROP CONSTRAINT movies_ratings_pkey;
       public            postgres    false    203            �           2606    16659    posts posts_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (pid);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    207            �           2606    16645    users users_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    205            �           2606    16647    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    205            �           2606    16681    comments comments_author_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_author_fkey FOREIGN KEY (author) REFERENCES public.users(username);
 G   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_author_fkey;
       public          postgres    false    205    209    3038            �           2606    16691    comments comments_post_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(pid);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_post_id_fkey;
       public          postgres    false    207    209    3040            �           2606    16686    comments comments_user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(uid);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public          postgres    false    209    3036    205            �           2606    16665    posts posts_author_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_fkey FOREIGN KEY (author) REFERENCES public.users(username);
 A   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_author_fkey;
       public          postgres    false    3038    207    205            �           2606    16660    posts posts_user_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(uid);
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public          postgres    false    3036    205    207            �           826    16622    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO "Admin";
                   postgres    false            m      x������ � �      g   {  x�uXKv�:�˫��Q�9Nْ�N��$��?e9�9o��h��L��6��%�*j'o%u#@9���i;%D�{�z��Jz� }�M�s%f:(��n�l�Y)��˒A�R��dsb����쿼�����R.;��j��km�b������� *|}�}�čϔ���K�����W{��x��]<m��ĭS�X�;+Rg+mk��AW9�X��'W�m�ʖ�RY�e��"Q���x���w�J#YUF�ۥ�����31��������9}���%?F��I~s8�g�l����B�uU{�+��t��&WV$��TW.}r]�y�V"�iuՈ�	�܊~STȘ�F�g32�P��	����A�X��g~��:�)��a����4ҪJ�H_��������\��3%j�JTr����2�.Ċ����L�it�oD���^�ԭQz��5�.��$�����Re�J�'d�`S��qʅ�ȿ3�i(�PE�
��p|B
`��4�Ph��R�mwg�9�l���k�V�K�V����l�?/�N�U����v����_N�����8t)Y�PFK�i�?�
iM	U����XQ#2��Ʃ,jN�ס�t�O�.G��4
��hc�� �'��(Q��=���x� 9�1e�8���żq�d��wԂR��`�U�;�S�ށ�鴳W���0h^g���`�ϛ�۫Ǉ���Vr"�vNL��bl-~^xP�-ȍ��+��<��H��aW�/�b���t�T+[��m~�o�$e���|�<�"�
P�~ǮN���,�4�9||�N��GIu��NG�gW���ۀ������x���8���\W8�~���3�����p
t-�)BĹ|E��0(��$Mݵ3kT�#�ve�۴R�|�[1���P�Kzs��`�_5�X��E�
m���a�P�����3�a�|\^.��OOTc�_�N���$PE�eJ2�E����Ť��J}MD��dAѠv�[DH���q��x�H���5z@9C�"ch�u��3�V�r���3Cz�r��G&��?+�7�/Bg�j�/^���O����������K���:�^[��M�"1�׉�D���o@��%���3O�d|2��Rd�����	�b�d@-F��p��<�������h0=��=��m�������W�;c��qW�16�e�Y��� ��� ���@��m][��S�b��T$�fY��S�g�
1s7���k�5ª��w��tF�L�Tuő��y�:&ĿNY}!h�� ��m�Ֆ!�x�낻#�"��+S2�$��GtN������E���֦��?1���񿢿�;��m��߹+��ӱ�&��7����8}+�U����۟�fT��|?P;�<��_(������K� �x���WH���a �	؍D1L��v��N�י�"q��KtL1!&t�V����/�b����f���ݿ�.n�JL�̫_�,�x��n�+�]no �m��R���H�>�j����u$�	d�`��!���e����.Ob�۪ؘI`�bl�]p ��R ���������d��y�9� �9h�$r�S|��t�(q��� �9θ%�� �>�nKf�WJ��T��
�����Z|��b���;A�X����춦1-��Q;�~��V�T�&`n����o���'~М����nW?���o�����srf6�"�8w�T�PT�F���������>0�I� � T�
俘⒌\�,~���>"��b���[ٰ+��+.��"�I���l��)5�'�j#�'IZk�s�@$͹��Cz���1P �l=]	{
��T���2�Ȼ,���{�Rj�l�42`'r2:�%m�ɮ#�Ut~��_�9|�m斴|ن�A���&`=�a��Ҷ5K�z#��FX��LLjcTE�d���E���@�@�#�����_�����ӧ�g���^\��(6-"�J'��)m���9:�N��r�SQ	���&פ5�&�Re��9#�f\�'�b2K��b��h���#�a���!��M�|�4��}�}ڛ����h�,�`=o����F����`���J�Շ´�Timt�v*JK+��zf����1��*�Z�r�aF��I�Ui]�� ���h`������)[uw��i	!�� ��Sj<8]�jS�c?�6K�Ǉ�.�ު�zV�����{LO�^"�Yg?.��	X�,N���h3�3�$�&i��5+�t��-���4~5��<X�a�Ck�kLV�d����(����H�
�(�m�h0�h��1��Y�߁�r��Tޫ�|+�����,�3騁�yC]x�k��&�5�`�'���A[�Z.�q�7���j���M&�����x���7�Ã�r�}P�bF]�3 )��9���H�
нD/ /����_*����k20Q��:�QZ��9@�@`KKAo1���0>Vq��W�g61��|r?Y�?M�o��Q�N4�#���������B���it��Cx!<�Xh�gek��X�<[!U)�Z �?�$�ߍԁ�9[�m����-ɸr�Q�"��ę��C�-�Zlo��j�XSt�h��F�i�K��|̧�n���k�R��7bz;�ȱ��v�6zE.
#��J�����d�"����c��ep�.���4a�y���H�8���@]���vm���;�ɶ=���j]ufv]�Hq$�0>�\XvW7u���[?��~�Fo�~�y9��|6��4f��0X�H�P�3:�1z�M�x.hd������I=�:A�Q���kEs�"��8�+����+z���&����?� M���~]���RP����S#_b�8��c��l¢�i�׭�֚�-����v���4|b�F%�
���h�BF��H������O{��zCA@�:d�N�d9���+�b�|?���g7�h|�[�>%���%쭲64(�0����C:��+̞`����1&������1�%PD�����a;�^��q��4�$�awK�*	+�8�����X�����0Ų}	ü��Y�-�//Tɰbs�QF�u7s���0⌶����� a��-�����Ǡݍ+�E ������v�\�EY��d���Y�2�D��A�AE�"q����-d��֣�yz=����������׋�8�B��\�G�.�
�fW�)��
� ��%*_Ab�D��Ż3��K�ix��x!ȓ(L,�XKL�Eoᒉ��� c0���t���A�ӑ�e��r�t2���/^�"\/��ѡ���ы�t��H�Y����;<Oa���ѽS�S��}��������H=m�����l�q#�0+?��5�������t3��C*�l|���U<����E��G����ݝ��Lcq�      k      x������ � �      i      x������ � �     