from PyQt5.QtSql import QSqlQueryModel, QSqlQuery
from PyQt5.QtCore import Qt, pyqtSlot
from PyQt5.QtWidgets import QTableView


class Model(QSqlQueryModel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.refresh()

    def refresh(self):
        sql = '''
            select mt.title_mtype, m.title_material, m.min_quantity, m.storage_quantity, 
            (
            SELECT STRING_AGG(title_supplier, ', ') FROM (
                select title_supplier from suppliers
                where id_supplier in (
                    select supplier_id from materials_suppliers
                    where material_id = m.id_material
            ))
            ) as supplier
            from materials as m, mtype as mt
            where m.mtype_id = mt.id_mtype ;
        '''
        self.setQuery(sql)

class View(QTableView):
    def __init__(self, parent=None):
        super().__init__(parent)
        model = Model(parent=self)
        self.setModel(model)
        model.setHeaderData(0, Qt.Horizontal, "Тип")
        model.setHeaderData(1, Qt.Horizontal, "Наименование")
        model.setHeaderData(2, Qt.Horizontal, "Минимальное кол-во")
        model.setHeaderData(3, Qt.Horizontal, "Остаток")
        model.setHeaderData(4, Qt.Horizontal, "Поставщики")
        self.setSelectionBehavior(self.SelectRows)
        self.setSelectionMode(self.SingleSelection)
        vh = self.verticalHeader()
        vh.setSectionResizeMode(vh.Fixed)
        hh = self.horizontalHeader()
        hh.setSectionResizeMode(hh.ResizeToContents)
        hh.setSectionResizeMode(4, hh.Stretch)