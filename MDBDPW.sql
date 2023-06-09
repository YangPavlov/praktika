PGDMP                          {            MDBDPW    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16403    MDBDPW    DATABASE     |   CREATE DATABASE "MDBDPW" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "MDBDPW";
                postgres    false                        2615    16404 
   BrandModel    SCHEMA        CREATE SCHEMA "BrandModel";
    DROP SCHEMA "BrandModel";
                postgres    false            �            1259    16405    Brand    TABLE     v   CREATE TABLE "BrandModel"."Brand" (
    "Id" integer NOT NULL,
    name text NOT NULL,
    active boolean NOT NULL
);
 !   DROP TABLE "BrandModel"."Brand";
    
   BrandModel         heap    postgres    false    6            �            1259    16419    Brand_Id_seq    SEQUENCE     �   ALTER TABLE "BrandModel"."Brand" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BrandModel"."Brand_Id_seq"
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 123456
    CACHE 1
);
         
   BrandModel          postgres    false    6    215            �            1259    16410    Model    TABLE     �   CREATE TABLE "BrandModel"."Model" (
    "Id" integer NOT NULL,
    name text NOT NULL,
    brandid integer NOT NULL,
    active boolean NOT NULL
);
 !   DROP TABLE "BrandModel"."Model";
    
   BrandModel         heap    postgres    false    6            �            1259    16420    Model_Id_seq    SEQUENCE     �   ALTER TABLE "BrandModel"."Model" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BrandModel"."Model_Id_seq"
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 123456789
    CACHE 1
);
         
   BrandModel          postgres    false    216    6            �            1259    16426    Brand    TABLE     t   CREATE TABLE public."Brand" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Active" boolean NOT NULL
);
    DROP TABLE public."Brand";
       public         heap    postgres    false            �            1259    16433    Models    TABLE     �   CREATE TABLE public."Models" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "BrandID" integer NOT NULL,
    "Active" boolean NOT NULL
);
    DROP TABLE public."Models";
       public         heap    postgres    false                      0    16405    Brand 
   TABLE DATA           ;   COPY "BrandModel"."Brand" ("Id", name, active) FROM stdin;
 
   BrandModel          postgres    false    215                    0    16410    Model 
   TABLE DATA           D   COPY "BrandModel"."Model" ("Id", name, brandid, active) FROM stdin;
 
   BrandModel          postgres    false    216   7                 0    16426    Brand 
   TABLE DATA           9   COPY public."Brand" ("Id", "Name", "Active") FROM stdin;
    public          postgres    false    219   �                 0    16433    Models 
   TABLE DATA           E   COPY public."Models" ("Id", "Name", "BrandID", "Active") FROM stdin;
    public          postgres    false    220   �                  0    0    Brand_Id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"BrandModel"."Brand_Id_seq"', 3, true);
       
   BrandModel          postgres    false    217                       0    0    Model_Id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"BrandModel"."Model_Id_seq"', 7, true);
       
   BrandModel          postgres    false    218            t           2606    16418    Brand Brand_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY "BrandModel"."Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY "BrandModel"."Brand" DROP CONSTRAINT "Brand_pkey";
    
   BrandModel            postgres    false    215            v           2606    16416    Model Model_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY "BrandModel"."Model"
    ADD CONSTRAINT "Model_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY "BrandModel"."Model" DROP CONSTRAINT "Model_pkey";
    
   BrandModel            postgres    false    216            x           2606    16432    Brand Brand_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY ("Id");
 >   ALTER TABLE ONLY public."Brand" DROP CONSTRAINT "Brand_pkey";
       public            postgres    false    219            z           2606    16439    Models Model_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."Models"
    ADD CONSTRAINT "Model_pkey" PRIMARY KEY ("Id");
 ?   ALTER TABLE ONLY public."Models" DROP CONSTRAINT "Model_pkey";
       public            postgres    false    220            {           2606    16421    Model brand_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "BrandModel"."Model"
    ADD CONSTRAINT brand_fkey FOREIGN KEY (brandid) REFERENCES "BrandModel"."Brand"("Id") NOT VALID;
 B   ALTER TABLE ONLY "BrandModel"."Model" DROP CONSTRAINT brand_fkey;
    
   BrandModel          postgres    false    3188    215    216            |           2606    16440    Models brand_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public."Models"
    ADD CONSTRAINT brand_fkey FOREIGN KEY ("BrandID") REFERENCES public."Brand"("Id");
 =   ALTER TABLE ONLY public."Models" DROP CONSTRAINT brand_fkey;
       public          postgres    false    219    3192    220               &   x�3�t�vu�,�2�t�0�8�A�4.cNO�H� ��          A   x�3��M,�V0�4�,�2�p��4.#��1P�&��d���La2 �L���&���qqq (.[         &   x�3�t�vu�,�2�t1Ҹ9�!"��F� ��         r   x�5���0k{
&@��w
RP�X"PP�X'�%7�{�&�ϊ�Î]�Кax�1���!��RCf��3�`�C�w���#l��'g��#�ʗ��<�e�K�
24�\\kD�H`+�     