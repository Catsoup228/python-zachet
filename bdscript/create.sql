create table if not exists mtype (
	id_mtype serial primary key not null,
	title_mtype varchar(50)
);

create table if not exists materials (
	id_material serial primary key not null,
	title_material varchar(50) unique,
	mtype_id int not null references mtype(id_mtype) ON DELETE CASCADE,
	picture varchar(500) null,
	price money,
	storage_quantity int check(storage_quantity >= 0),
	min_quantity int check(min_quantity >= 0),
	pack_quantity int check(pack_quantity >= 0),
	unit char(2) check(unit in ('л', 'м', 'г', 'кг'))
);

create table if not exists stype (
	id_stype serial primary key not null,
	title_stype varchar(50)
);

create table if not exists suppliers (
	id_supplier serial primary key not null,
	title_supplier varchar(50) unique,
	stype_id int not null references stype(id_stype) ON DELETE CASCADE,
	inn char(10) unique,
	rating int,
	bdate date
);

create table if not exists materials_suppliers (
	material_id int not null references materials(id_material) ON DELETE CASCADE,
	supplier_id int not null references suppliers(id_supplier) ON DELETE CASCADE,
	unique(material_id, supplier_id)
);