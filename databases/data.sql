-- we don't know how to generate root <with-no-name> (class Root) :(
create table test
(
	id INTEGER not null
		constraint test_pk
			primary key autoincrement,
	name VARCHAR(255)
);

