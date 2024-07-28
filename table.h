#ifndef TABLE_H
#define TABLE_H

#include <QObject>
#include <qqml.h>
#include <QAbstractTableModel>

class TableModel : public QAbstractTableModel
{
    Q_OBJECT
    QML_ELEMENT

public:
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    /*public:
        static TableModel *instance();

    private:
        TableModel(QObject *parent = nullptr) : QAbstractTableModel(parent)
        {
        }
        TableModel(const TableModel &) = delete;
        TableModel &operator=(const TableModel &) = delete;

    private:
        static TableModel *m_instance;
        */
};

#endif