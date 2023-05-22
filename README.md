# TigerBeetle C++ client

[TigerBeetle] is a financial accounting database designed for mission critical safety and performance to power the future of financial services.

### Prerequisites

 C++ version: 14

**Libraries**
- fmtlib v10.0.0
- TigerBeetle C client library v0.13.9

**Tools**
- cmake v3.14 or higher
- zig v0.9.1 (tigerbeetle compatible)


## How to run

```bash
$> cmake -B build -DCMAKE_CXX_COMPILER=scripts/zigcxx.(sh|bat)
$> cmake --build --target run_with_tb # run TigerBeetle server + C++ client 
```
<details>
<summary>Output</summary>

```bash
# possible output
[100%] Built target tb_cpp
Running tb_cpp with TigerBeetle
Starting replica 0

running client...
error(message_bus): error connecting to replica 0: error.ConnectionRefused
info(message_bus): connected to replica 0
TigerBeetle C++ Sample

[trace] Connecting...
[trace] Creating accounts...
[info] Accounts created successfully
[trace] Creating transfers...
[info] Transfers created successfully
============================================
[trace] 194 transfers per second
[trace] create_transfers max p100 latency per 8191 transfers = 1294686ms
[trace] total 819100 transfers in 4200636ms
[info] Looking up accounts ...
[info] 2 Account(s) found
============================================
[trace] id=1
[trace] debits_posted=819100
[trace] credits_posted=0
[trace] id=2
[trace] debits_posted=0
[trace] credits_posted=819100

Done!!
Killing tigerbeetle start process...
Terminating tigerbeetle start process...
[100%] Built target run_with_tb
```
</details>


### TODO

- [ ] upgrade zig 0.9.1 (stage1) to zig 0.11.0 (stage3) - pkg manager (choose cmake or zig only)


## License

See: [LICENSE](LICENSE)

[TigerBeetle]: https://github.com/tigerbeetledb/tigerbeetle
