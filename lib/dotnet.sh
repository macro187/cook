test -n "${__types_dotnet:+x}" && return ; __types_dotnet=1


find_sln() {
    ls *.sln 2> /dev/null || true
}
