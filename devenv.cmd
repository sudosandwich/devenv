@SET DEVENV_ROOT=%~dp0.
@CALL %DEVENV_ROOT%\devenv-setup\print-macros.cmd

@FOR %%I IN (%~dp0.) DO @SET DEVENV_CURRENT_DIR_NAME=%%~nxI
@%DEVENV_ECHO% Setting up environment "%DEVENV_CURRENT_DIR_NAME%" %DEVENV_COL_WHITE%

@FOR %%F IN (%DEVENV_ROOT%\devenv-init\*.cmd) DO @(
    @%DEVENV_ECHO% %%F %DEVENV_COL_WHITE%
    @CALL "%%F")

@%DEVENV_ECHO% "Going fishing..."
@%DEVENV_ROOT%\cygwin\bin\fish.exe --interactive
