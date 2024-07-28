#include "table.h"

/*
TableModel *TableModel::m_instance = nullptr;

TableModel *TableModel::instance()
{
    if (m_instance == nullptr)
    {
        m_instance = new TableModel;
    }

    return m_instance;
}
*/

int TableModel::rowCount(const QModelIndex &parent) const
{
    return 6;
}

int TableModel::columnCount(const QModelIndex &parent) const
{
    return 6;
}

QVariant TableModel::data(const QModelIndex &index, int role) const
{
    switch (role)
    {
    case Qt::DisplayRole:
        return QString("%1, %2").arg(index.column()).arg(index.row());
    default:
        break;
    }

    return QVariant();
}

QHash<int, QByteArray> TableModel::roleNames() const
{
    return {{Qt::DisplayRole, "display"}};
}
