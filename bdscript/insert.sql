/*\copy mtype(title_mtype) FROM '~/PycharmProjects/de/mtype.csv' DELIMITER ',' CSV HEADER;
*/
select * from mtype;

/*\copy materials(title_material, mtype_id, picture, price, storage_quantity, min_quantity, pack_quantity, unit) FROM '~/PycharmProjects/de/materials.csv' DELIMITER ',' CSV HEADER;
*/
select * from materials;

/*\copy stype(title_stype) FROM '~/PycharmProjects/de/stype.csv' DELIMITER ',' CSV HEADER;
*/
select * from stype;

/*\copy suppliers(title_supplier, stype_id, inn, rating, bdate) FROM '~/PycharmProjects/de/suppliers.csv' DELIMITER ',' CSV HEADER;
*/
select * from suppliers;

/*\copy materials_suppliers(material_id, supplier_id) FROM '~/PycharmProjects/de/materialsupplier.csv' DELIMITER ',' CSV HEADER;
*/

select * from materials_suppliers;
