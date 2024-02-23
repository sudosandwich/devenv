@SET DEVENV_COL_RESET=\e[0m
@SET DEVENV_COL_GRAY=\e[1;37m
@SET DEVENV_COL_RED=\e[1;31m
@SET DEVENV_COL_GREEN=\e[1;32m

@SET        DEVENV_ECHO=printf "%DEVENV_COL_BLUE%[devenv]%DEVENV_COL_GREEN% %%s %DEVENV_COL_WHITE%\n"
@SET   DEVENV_ECHO_INFO=printf "%DEVENV_COL_BLUE%[devenv]%DEVENV_COL_GRAY% %%s %DEVENV_COL_WHITE%\n"
@SET DEVENV_ECHO_SEVERE=printf "%DEVENV_COL_BLUE%[devenv]%DEVENV_COL_RED% %%s %DEVENV_COL_WHITE%\n"

@%DEVENV_ECHO% "preparing environment variables"

@IF [%DEVENV_ROOT%] == [] (
    @printf "  external DEVENV_ROOT not found\n"
    @SET DEVENV_ROOT=%~dp0..
)
@printf "  DEVENV_ROOT=%DEVENV_ROOT%\n"

@SET PATH=%DEVENV_ROOT%\cygwin\bin;%PATH%
@%DEVENV_ECHO_INFO% "  prefixed cygwin\bin to PATH"

