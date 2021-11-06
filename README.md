# ExDiscrepancies

A collection of discrepancies that can cause failure but that are not found by
[DIALYZER(https://www.erlang.org/doc/man/dialyzer.html)], 
a DIscrepancy AnaLYZer for ERlang programs.

This project can be typechecked with

```
mix deps.get
mix dialyzer
```

which returns

```
Total errors: 0, Skipped: 0, Unnecessary Skips: 0
done in 0m0.97s
done (passed successfully)
```

The example discrepancies can be found in the `lib/` folder.
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
``
