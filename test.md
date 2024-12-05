                                  List of relations
          Schema           |        Name         | Type  |           Owner

---------------------------+---------------------+-------+----------------------------
python_test_deploy_schema | alembic_version | table | irelius_database_rffj_user
python_test_deploy_schema | child_as | table | irelius_database_rffj_user
python_test_deploy_schema | child_bs | table | irelius_database_rffj_user
python_test_deploy_schema | mtm_children | table | irelius_database_rffj_user
python_test_deploy_schema | mtm_parent_children | table | irelius_database_rffj_user
python_test_deploy_schema | mtm_parents | table | irelius_database_rffj_user
python_test_deploy_schema | parent_as | table | irelius_database_rffj_user
python_test_deploy_schema | parent_bs | table | irelius_database_rffj_user
python_test_deploy_schema | users | table | irelius_database_rffj_user
(9 rows)

irelius_database_rffj=> \d+ python_test_deploy_schema.\*;
Index "python_test_deploy_schema.alembic_version_pkc"
Column | Type | Key? | Definition | Storage | Stats target
-------------+-----------------------+------+-------------+----------+--------------
version_num | character varying(32) | yes | version_num | extended |
primary key, btree, for table "python_test_deploy_schema.alembic_version"

                                                                     Table "python_test_deploy_schema.child_as"

Column | Type | Collation | Nullable | Default | Storage | Compression | Stats target | Description
-------------+------------------------+-----------+----------+----------------------------------------------------------------+----------+-------------+--------------+-------------
id | integer | | not null | nextval('python_test_deploy_schema.child_as_id_seq'::regclass) | plain | | |
child_a | character varying(100) | | not null | | extended | | |
parent_a_id | integer | | | | plain | | |
Indexes:
"child_as_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
"child_as_parent_a_id_fkey" FOREIGN KEY (parent_a_id) REFERENCES python_test_deploy_schema.parent_as(id)
Access method: heap

         Sequence "python_test_deploy_schema.child_as_id_seq"

Type | Start | Minimum | Maximum | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
integer | 1 | 1 | 2147483647 | 1 | no | 1
Owned by: python_test_deploy_schema.child_as.id

        Index "python_test_deploy_schema.child_as_pkey"

Column | Type | Key? | Definition | Storage | Stats target
--------+---------+------+------------+---------+--------------
id | integer | yes | id | plain |
primary key, btree, for table "python_test_deploy_schema.child_as"

                                                                     Table "python_test_deploy_schema.child_bs"

Column | Type | Collation | Nullable | Default | Storage | Compression | Stats target | Description
-------------+------------------------+-----------+----------+----------------------------------------------------------------+----------+-------------+--------------+-------------
id | integer | | not null | nextval('python_test_deploy_schema.child_bs_id_seq'::regclass) | plain | | |
child_b | character varying(100) | | not null | | extended | | |
parent_b_id | integer | | | | plain | | |
Indexes:
"child_bs_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
"child_bs_parent_b_id_fkey" FOREIGN KEY (parent_b_id) REFERENCES python_test_deploy_schema.parent_bs(id)
Access method: heap

         Sequence "python_test_deploy_schema.child_bs_id_seq"

Type | Start | Minimum | Maximum | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
integer | 1 | 1 | 2147483647 | 1 | no | 1
Owned by: python_test_deploy_schema.child_bs.id

        Index "python_test_deploy_schema.child_bs_pkey"

Column | Type | Key? | Definition | Storage | Stats target
--------+---------+------+------------+---------+--------------
id | integer | yes | id | plain |
primary key, btree, for table "python_test_deploy_schema.child_bs"

                                                                      Table "python_test_deploy_schema.mtm_children"
    Column     |          Type          | Collation | Nullable |                              Default                               | Storage  | Compression | Stats target | Description

---------------+------------------------+-----------+----------+--------------------------------------------------------------------+----------+-------------+--------------+-------------
id | integer | | not null | nextval('python_test_deploy_schema.mtm_children_id_seq'::regclass) | plain | | |
mtm_child_col | character varying(100) | | not null | | extended | | |
Indexes:
"mtm_children_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "python_test_deploy_schema.mtm_parent_children" CONSTRAINT "mtm_parent_children_mtm_child_join_id_fkey" FOREIGN KEY (mtm_child_join_id) REFERENCES python_test_deploy_schema.mtm_children(id)
Access method: heap

       Sequence "python_test_deploy_schema.mtm_children_id_seq"

Type | Start | Minimum | Maximum | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
integer | 1 | 1 | 2147483647 | 1 | no | 1
Owned by: python_test_deploy_schema.mtm_children.id

      Index "python_test_deploy_schema.mtm_children_pkey"

Column | Type | Key? | Definition | Storage | Stats target
--------+---------+------+------------+---------+--------------
id | integer | yes | id | plain |
primary key, btree, for table "python_test_deploy_schema.mtm_children"

                                                                        Table "python_test_deploy_schema.mtm_parent_children"
       Column       |          Type          | Collation | Nullable |                                  Default                                  | Storage  | Compression | Stats target | Description

--------------------+------------------------+-----------+----------+---------------------------------------------------------------------------+----------+-------------+--------------+-------------
id | integer | | not null | nextval('python_test_deploy_schema.mtm_parent_children_id_seq'::regclass) | plain | | |
mtm_extra_data | character varying(150) | | not null | | extended | | |
mtm_parent_join_id | integer | | | | plain | | |
mtm_child_join_id | integer | | | | plain | | |
Indexes:
"mtm_parent_children_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
"mtm_parent_children_mtm_child_join_id_fkey" FOREIGN KEY (mtm_child_join_id) REFERENCES python_test_deploy_schema.mtm_children(id)
"mtm_parent_children_mtm_parent_join_id_fkey" FOREIGN KEY (mtm_parent_join_id) REFERENCES python_test_deploy_schema.mtm_parents(id)
Access method: heap

Sequence "python_test_deploy_schema.mtm_parent_children_id_seq"
Type | Start | Minimum | Maximum | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
integer | 1 | 1 | 2147483647 | 1 | no | 1
Owned by: python_test_deploy_schema.mtm_parent_children.id

Index "python_test_deploy_schema.mtm_parent_children_pkey"
Column | Type | Key? | Definition | Storage | Stats target
--------+---------+------+------------+---------+--------------
id | integer | yes | id | plain |
primary key, btree, for table "python_test_deploy_schema.mtm_parent_children"

                                                                      Table "python_test_deploy_schema.mtm_parents"
     Column     |          Type          | Collation | Nullable |                              Default                              | Storage  | Compression | Stats target | Description

----------------+------------------------+-----------+----------+-------------------------------------------------------------------+----------+-------------+--------------+-------------
id | integer | | not null | nextval('python_test_deploy_schema.mtm_parents_id_seq'::regclass) | plain | | |
mtm_parent_col | character varying(100) | | not null | | extended | | |
Indexes:
"mtm_parents_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "python_test_deploy_schema.mtm_parent_children" CONSTRAINT "mtm_parent_children_mtm_parent_join_id_fkey" FOREIGN KEY (mtm_parent_join_id) REFERENCES python_test_deploy_schema.mtm_parents(id)
Access method: heap

       Sequence "python_test_deploy_schema.mtm_parents_id_seq"

Type | Start | Minimum | Maximum | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
integer | 1 | 1 | 2147483647 | 1 | no | 1
Owned by: python_test_deploy_schema.mtm_parents.id

      Index "python_test_deploy_schema.mtm_parents_pkey"

Column | Type | Key? | Definition | Storage | Stats target
--------+---------+------+------------+---------+--------------
id | integer | yes | id | plain |
primary key, btree, for table "python_test_deploy_schema.mtm_parents"

                                                                   Table "python_test_deploy_schema.parent_as"

Column | Type | Collation | Nullable | Default | Storage | Compression | Stats target | Description
----------+------------------------+-----------+----------+-----------------------------------------------------------------+----------+-------------+--------------+-------------
id | integer | | not null | nextval('python_test_deploy_schema.parent_as_id_seq'::regclass) | plain | | |
parent_a | character varying(100) | | not null | | extended | | |
Indexes:
"parent_as_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "python_test_deploy_schema.child_as" CONSTRAINT "child_as_parent_a_id_fkey" FOREIGN KEY (parent_a_id) REFERENCES python_test_deploy_schema.parent_as(id)
Access method: heap

        Sequence "python_test_deploy_schema.parent_as_id_seq"

Type | Start | Minimum | Maximum | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
integer | 1 | 1 | 2147483647 | 1 | no | 1
Owned by: python_test_deploy_schema.parent_as.id

       Index "python_test_deploy_schema.parent_as_pkey"

Column | Type | Key? | Definition | Storage | Stats target
--------+---------+------+------------+---------+--------------
id | integer | yes | id | plain |
primary key, btree, for table "python_test_deploy_schema.parent_as"

                                                                   Table "python_test_deploy_schema.parent_bs"

Column | Type | Collation | Nullable | Default | Storage | Compression | Stats target | Description
----------+------------------------+-----------+----------+-----------------------------------------------------------------+----------+-------------+--------------+-------------
id | integer | | not null | nextval('python_test_deploy_schema.parent_bs_id_seq'::regclass) | plain | | |
parent_b | character varying(100) | | not null | | extended | | |
Indexes:
"parent_bs_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "python_test_deploy_schema.child_bs" CONSTRAINT "child_bs_parent_b_id_fkey" FOREIGN KEY (parent_b_id) REFERENCES python_test_deploy_schema.parent_bs(id)
Access method: heap

        Sequence "python_test_deploy_schema.parent_bs_id_seq"

Type | Start | Minimum | Maximum | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
integer | 1 | 1 | 2147483647 | 1 | no | 1
Owned by: python_test_deploy_schema.parent_bs.id

       Index "python_test_deploy_schema.parent_bs_pkey"

Column | Type | Key? | Definition | Storage | Stats target
--------+---------+------+------------+---------+--------------
id | integer | yes | id | plain |
primary key, btree, for table "python_test_deploy_schema.parent_bs"

                                                                       Table "python_test_deploy_schema.users"
     Column      |          Type          | Collation | Nullable |                           Default                           | Storage  | Compression | Stats target | Description

-----------------+------------------------+-----------+----------+-------------------------------------------------------------+----------+-------------+--------------+-------------
id | integer | | not null | nextval('python_test_deploy_schema.users_id_seq'::regclass) | plain | | |
username | character varying(40) | | not null | | extended | | |
email | character varying(255) | | not null | | extended | | |
hashed_password | character varying(255) | | not null | | extended | | |
Indexes:
"users_pkey" PRIMARY KEY, btree (id)
"users_email_key" UNIQUE CONSTRAINT, btree (email)
"users_username_key" UNIQUE CONSTRAINT, btree (username)
Access method: heap

               Index "python_test_deploy_schema.users_email_key"

Column | Type | Key? | Definition | Storage | Stats target
--------+------------------------+------+------------+----------+--------------
email | character varying(255) | yes | email | extended |
unique, btree, for table "python_test_deploy_schema.users"

          Sequence "python_test_deploy_schema.users_id_seq"

Type | Start | Minimum | Maximum | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
integer | 1 | 1 | 2147483647 | 1 | no | 1
Owned by: python_test_deploy_schema.users.id

         Index "python_test_deploy_schema.users_pkey"

Column | Type | Key? | Definition | Storage | Stats target
--------+---------+------+------------+---------+--------------
id | integer | yes | id | plain |
primary key, btree, for table "python_test_deploy_schema.users"

              Index "python_test_deploy_schema.users_username_key"

Column | Type | Key? | Definition | Storage | Stats target
----------+-----------------------+------+------------+----------+--------------
username | character varying(40) | yes | username | extended |
unique, btree, for table "python_test_deploy_schema.users"
