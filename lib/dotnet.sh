test -n "${__dotnet:+x}" && return ; __dotnet=1


find_sln() {
    ls *.sln 2> /dev/null || true
}
