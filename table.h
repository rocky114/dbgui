#ifndef TABLE_H
#define TABLE_H

#include <QObject>
#include <qqml.h>
#include <QAbstractTableModel>
#include <QSqlQuery>

class TableModel : public QAbstractTableModel
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(int columnCount READ columnCount NOTIFY columnCountChanged)

public:
    explicit TableModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    Q_INVOKABLE void executeQuery(const QString &sqlQuery);

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
signals:
    void columnCountChanged();

private:
    QSqlQuery m_query{};
    QVector<QVector<QVariant>> m_data{};
    QVector<QString> m_headers{};
};

#endif