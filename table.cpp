#include "table.h"
#include <QSqlError>
#include <QSqlRecord>

TableModel::TableModel(QObject *parent) : QAbstractTableModel{parent}
{
}

int TableModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);

    return m_data.size();
}

int TableModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);

    return m_headers.size();
}

QVariant TableModel::data(const QModelIndex &index, int role) const
{
    switch (role)
    {
    case Qt::DisplayRole:
        return m_data[index.row()][index.column()];
    default:
        break;
    }

    return QVariant();
}

QVariant TableModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role == Qt::DisplayRole && orientation == Qt::Horizontal)
    {
        return m_headers[section];
    }

    return QAbstractTableModel::headerData(section, orientation, role);
}

QHash<int, QByteArray> TableModel::roleNames() const
{
    return {{Qt::DisplayRole, "display"}, {Qt::UserRole + 1, "internalData"}};
}

void TableModel::executeQuery(const QString &sqlQuery)
{
    if (m_query.exec(sqlQuery))
    {
        m_data.clear();
        m_headers.clear();

        int columnCount = m_query.record().count();

        for (int i = 0; i < columnCount; i++)
        {
            m_headers.append(m_query.record().fieldName(i));
        }

        while (m_query.next())
        {
            QVector<QVariant> row;
            for (int i = 0; i < columnCount; ++i)
            {
                row.append(m_query.value(i));
            }

            m_data.append(row);
        }

        emit dataChanged(index(0, 0), index(rowCount() - 1, columnCount - 1));
        emit headerDataChanged(Qt::Horizontal, 0, columnCount - 1);

        qDebug() << "execute successfully";
    }
    else
    {
        qDebug() << "failed to execute sql query:" << m_query.lastError().text();
    }
}
