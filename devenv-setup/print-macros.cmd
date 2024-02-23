@REM ============================================================================
@REM Color Output
@REM ============================================================================

@REM The esape character here has been inserted using a hex-editor, value 27
@SET DEVENV_ASCII_ESC=

@SET    DEVENV_COL_GRAY=%DEVENV_ASCII_ESC%[0m
@SET     DEVENV_COL_RED=%DEVENV_ASCII_ESC%[1;31m
@SET   DEVENV_COL_GREEN=%DEVENV_ASCII_ESC%[1;32m
@SET  DEVENV_COL_ORANGE=%DEVENV_ASCII_ESC%[0;33m
@SET    DEVENV_COL_BLUE=%DEVENV_ASCII_ESC%[0;34m
@SET DEVENV_COL_MAGENTA=%DEVENV_ASCII_ESC%[0;35m
@SET    DEVENV_COL_CYAN=%DEVENV_ASCII_ESC%[1;36m
@SET   DEVENV_COL_WHITE=%DEVENV_ASCII_ESC%[1;37m

@SET DEVENV_ECHO=echo %DEVENV_COL_BLUE%[devenv]%DEVENV_COL_GREEN%
@SET DEVENV_ECHO_INFO=echo %DEVENV_COL_BLUE%[devenv]%DEVENV_COL_GRAY%
@SET DEVENV_ECHO_SEVERE=echo %DEVENV_COL_BLUE%[devenv]%DEVENV_COL_RED%
