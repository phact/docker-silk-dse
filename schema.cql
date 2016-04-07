CREATE KEYSPACE silkconfig WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

CREATE TABLE silkconfig.silkconfig (
defaultIndex text,
"_index" text,
"_type" text,
"_id" text,
"_score" float,
"_source" text,
"_version" int,
found boolean,
PRIMARY KEY ("_id")
);
