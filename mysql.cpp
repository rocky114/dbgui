#include "mysql.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlQueryModel>
#include <QDebug>
#include <QSqlError>

MySQL::MySQL()
{
    this->connect();
}

QString MySQL::getDSN()
{
    return m_dsn;
}

void MySQL::setDSN(QString dsn)
{
    this->m_dsn = dsn;
}

void MySQL::connect()
{
    emit dsnChanged();

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    // db.setDatabaseName("test");
    db.setUserName("root");
    db.setPassword("123456");

    if (!db.open())
    {
        qDebug() << "Cannot open database: " << db.lastError().text();
        return;
    }

    qInfo() << "connect successfully";
}

void MySQL::disconnect()
{
}

QString MySQL::getDatabase()
{
    return m_database;
}

void MySQL::setDatabase(const QString &database)
{
    m_database = database;
}

QSqlQueryModel *MySQL::getDatabases()
{
    QSqlQueryModel *model = new QSqlQueryModel;
    model->setQuery("show databases");
    model->setHeaderData(0, Qt::Horizontal, tr("database"));

    return model;
}

QStringList MySQL::getTables()
{
    return QStringList{"user", "user_group", "user_group_user"};
}
