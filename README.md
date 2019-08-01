# Friends

Demo project to demonstrate the problem with rolling back index creation when
using Ecto with CockroachDB.

## Start CockroachDB

```sh
$ cockroach start --insecure --listen-addr=localhost
```

## Setting up the database

```sh
$ mix ecto.create
```

## Create Table with index

```sh
$ mix ecto.migrate
```

## Rollback and observe error

```sh
$ mix ecto.rollback

15:17:54.049 [info]  == Running 20190801131605 Friends.Repo.Migrations.CreatePeople.change/0 backward

15:17:54.050 [info]  drop index people_first_name_index

15:17:54.053 [info]  drop table people

15:17:54.060 [info]  == Migrated 20190801131605 in 0.0s

15:17:54.113 [error] Postgrex.Protocol (#PID<0.186.0>) disconnected: ** (Postgrex.Error) ERROR 40003 (statement_completion_unknown) cannot update progress on succeeded job (id 473809138654281729)
failed to update running status of job 473809138654281729
github.com/cockroachdb/cockroach/pkg/sql.(*SchemaChanger).done.func2
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/schema_changer.go:1030
github.com/cockroachdb/cockroach/pkg/sql.LeaseStore.Publish.func1
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/lease.go:438
github.com/cockroachdb/cockroach/pkg/internal/client.(*DB).Txn.func1
	/go/src/github.com/cockroachdb/cockroach/pkg/internal/client/db.go:598
github.com/cockroachdb/cockroach/pkg/internal/client.(*Txn).exec
	/go/src/github.com/cockroachdb/cockroach/pkg/internal/client/txn.go:688
github.com/cockroachdb/cockroach/pkg/internal/client.(*DB).Txn
	/go/src/github.com/cockroachdb/cockroach/pkg/internal/client/db.go:597
github.com/cockroachdb/cockroach/pkg/sql.LeaseStore.Publish
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/lease.go:388
github.com/cockroachdb/cockroach/pkg/sql.(*SchemaChanger).done
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/schema_changer.go:974
github.com/cockroachdb/cockroach/pkg/sql.(*SchemaChanger).runStateMachineAndBackfill
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/schema_changer.go:1102
github.com/cockroachdb/cockroach/pkg/sql.(*SchemaChanger).exec
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/schema_changer.go:850
github.com/cockroachdb/cockroach/pkg/sql.(*schemaChangerCollection).execSchemaChanges
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/exec_util.go:1028
github.com/cockroachdb/cockroach/pkg/sql.(*connExecutor).txnStateTransitionsApplyWrapper
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/conn_executor.go:1993
github.com/cockroachdb/cockroach/pkg/sql.(*connExecutor).run
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/conn_executor.go:1315
github.com/cockroachdb/cockroach/pkg/sql.(*Server).ServeConn
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/conn_executor.go:436
github.com/cockroachdb/cockroach/pkg/sql/pgwire.(*conn).processCommandsAsync.func1
	/go/src/github.com/cockroachdb/cockroach/pkg/sql/pgwire/conn.go:580
runtime.goexit
	/usr/local/go/src/runtime/asm_amd64.s:1333
```
