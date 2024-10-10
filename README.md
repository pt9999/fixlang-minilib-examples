# Example programs for fixlang_minilib


## json_cat

Reads JSON from a file (or standard input), and writes it to a file (or standar output).

```
$ ./json_cat.out --help
json_cat.out 1.0
Reads JSON from a file (or standard input), and writes it to a file (or standar output).

USAGE:
    json_cat.out [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -i, --input <VALUE>         Input file (default: standard input)
    -o, --output <VALUE>        Output file (default: standard output)
    -p, --plain <VALUE>         Disable pretty printing (default: enable pretty printing)
```

## sample_client

Fetches contents from remote HTTP server.
Currently HTTPS is not supported.

```
$ ./sample_client.out --help
ERROR: sample_client 0.1
Fetches contents from remote HTTP server.

USAGE:
    sample_client [OPTIONS] [URL]

ARGS:
    [URL]      The URL to fetch. NOTE: URL should start with 'http://'.

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
```

## sample_server

This program implements a chat server.
The chat server listens on `127.0.0.1:2525` by default.

Chat members can connect to the chat server using `nc` (netcat) command.
Chat messages are broadcasted to all chat members.

Prerequisite:

`$ sudo apt install netcat`

Start server:  (Type Ctrl+C to stop server)

`$ examples/sample_server.out`

Start client:  (Type Ctrl+C to disconnect)

`$ nc 127.0.0.1 2525`

```
$ ./sample_server.out --help
sample_server.out 1.0
Sample chat server

USAGE:
    sample_server.out [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -h, --host <VALUE>          IP address to liten (default: 127.0.0.1)
    -p, --port <VALUE>          port number to listen (default: 2525)
```

## sample_http_server

Sample HTTP server that serves a chat room.

Start the server and open `http://127.0.0.1:8080/` in your favorite browser.
To stop the server, type Ctrl+C.

```
$ ./sample_http_server.out --help
sample_http_server.out 1.0
Sample http server

USAGE:
    sample_http_server.out [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -h, --host <VALUE>          IP address to liten (default: 127.0.0.1)
    -p, --port <VALUE>          port number to listen (default: 8080)
```

## grep

Find lines matching a regular expression.

```
$ ./grep.out --help
grep 0.1.0
Find lines matching a regular expression.

USAGE:
    grep [OPTIONS] <PATTERN> [FILES]...

ARGS:
    <PATTERN>  Regular expression pattern
    [FILES]... Input files

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
```

## calc_pi

Calculates PI (3.1415926...) with the specified number of digits.
By default, it prints 1000 digits.

```
$ ./calc_pi.out --help
calc_pi 0.1.0
Calculates pi

USAGE:
    calc_pi [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -p, --prec <VALUE>          precision of base 10 (default: 1000)
    -f, --f64                   calculate with F64
```

## fractal_server

An HTTP server that renders Mandelbrot fractal images.

Start the server and open `http://127.0.0.1:8080/` in your favorite browser.
To stop the server, type Ctrl+C.

```
$ examples/fractal_server.out --help
fractal_server.out 0.1
An HTTP server that renders Mandelbrot fractal images.

USAGE:
    fractal_server.out [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -h, --host <VALUE>          IP address to liten (default: 127.0.0.1)
    -p, --port <VALUE>          port number to listen (default: 8080)
```

## probable_primes

Generates probable primes.
By default, it generates probable primes of 128 bit to 1024 bit.

```
$ examples/probable_primes.out --help
probable_primes.out 0.1.0
Generates probable primes

USAGE:
    probable_primes.out [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -f, --from <VALUE>          Minimum number of bits (default: 128)
    -t, --to <VALUE>            Maximum number of bits (default: 1024)
    -s, --step <VALUE>          Step of bits (default: 128)
        --seed <VALUE>          Seed of the random number generator (default: current time)
```

## spell_checker

This is a sample program for spell checker.

Currently, you can only enter a single word, and if the word is not in the word list,
correction suggestions will be displayed.

Although the spell checker can be used with user-defined word lists,
I recommend that you use predefined word list files.

For Ubuntu 22.04, American English word list file can be installed by the command below.
It is installed to `/usr/share/dict/american-english`.
```
$ sudo apt install wamerican
```

```
$ examples/spell_checker.out --help
spell_checker.out 1.0
Sample spell checker

USAGE:
    spell_checker.out [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -w, --word-list <VALUE>     Word list file (default: /usr/share/dict/american-english)
```

## sudoku

This program generates or solves a [Sudoku](https://en.wikipedia.org/wiki/Sudoku) problem.
Currently it is localized for Japanese.

```
$ examples/sudoku.out --help
sudoku.out 0.1
数独の問題を作成または解決します。

USAGE:
    sudoku.out [OPTIONS] [SUBCOMMAND]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information

SUBCOMMANDS:
    solve      数独の問題を解決します。
    generate   数独の問題を作成します。

$ examples/sudoku.out solve --help
sudoku.out solve
数独の問題を解決します。

USAGE:
    sudoku.out solve [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -i, --input <VALUE>         数独問題ファイル。未指定時はサンプルの問題を解決する。
    -d, --max-step <VALUE>      問題解決の最大ステップ数 (default: 100)
    -v, --verbose               進捗状況を表示する (default: false)

$ examples/sudoku.out generate --help
sudoku.out generate
数独の問題を作成します。

USAGE:
    sudoku.out generate [OPTIONS]

OPTIONS:
    -h, --help                  Print help information
    -V, --version               Print version information
    -o, --output <VALUE>        出力先の数独問題ファイル
    -r, --max-retry <VALUE>     穴開け処理の最大試行回数 (default: 100)
    -n, --min-digits <VALUE>    数字の最小配置数 (default: 25)
    -d, --max-step <VALUE>      問題解決の最大ステップ数 (default: 100)
    -s, --seed <VALUE>          乱数生成器の種 (default: 現在時刻)
    -g, --svg                   SVGファイルを出力する (default: false)
    -v, --verbose               進捗状況を表示する (default: false)
```
