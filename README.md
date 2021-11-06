# ExDiscrepancies

A collection of discrepancies that can cause failure but that are not found by
[DIALYZER](https://www.erlang.org/doc/man/dialyzer.html), 
a DIscrepancy AnaLYZer for ERlang programs.

The example discrepancies can be found in the `lib/` folder.
The examples in this project can be typechecked with

```
mix deps.get
mix dialyzer
```

which (unexpectedly) returns

```
Total errors: 0, Skipped: 0, Unnecessary Skips: 0
done in 0m0.97s
done (passed successfully)
```

For each example there is also a test that demonstrates how the discrepancy can lead to
a crash or other undesired behaviour.
The tests can be found in the `test/` folder.

# Discrepancy 1

Discrepancy between the expected type of the argument to the client api and
the expected type of the function that is executed on the server to handle
the call.

Passing a value as argument that matches the client API in the example leads to a crash:

```
test discrepancy 1 (ExDiscrepanciesTest)
     test/ex_discrepancies_test.exs:4
     ** (EXIT from #PID<0.202.0>) an exception was raised:
         ** (FunctionClauseError) no function clause matching in String.upcase/2
             (elixir 1.10.0) lib/string.ex:725: String.upcase(42, :default)
             (ex_discrepancies 0.1.0) lib/discrepancy1.ex:28: Discrepancy1.handle_call/3
             (stdlib 3.11.2) gen_server.erl:661: :gen_server.try_handle_call/4
             (stdlib 3.11.2) gen_server.erl:690: :gen_server.handle_msg/6
             (stdlib 3.11.2) proc_lib.erl:249: :proc_lib.init_p_do_apply/`
```

# Discrepancy 2

Discrepancy between the expected type of the value returned by the client api
and the type of the return value send to the client by the function that is
executed on the server to handle the call.

```
test discrepancy 2 (ExDiscrepanciesTest)
     test/ex_discrepancies_test.exs:9
     Expected truthy, got false
     code: assert is_binary(s)
     arguments:

         # 1
         43

     stacktrace:
       test/ex_discrepancies_test.exs:11: (test)
```

# Discrepancy 3

Discrepancy between the type `{:ok, integer} | {:error, String.t}` and `{:error, integer}`.

```
test discrepancy 3 (ExDiscrepanciesTest)
     test/ex_discrepancies_test.exs:14
     Expected truthy, got false
     code: assert valid_result(Discrepancy3.safe_div(6, 0))
     arguments:

         # 1
         {:error, 0}

     stacktrace:
       test/ex_discrepancies_test.exs:16: (test)
```
