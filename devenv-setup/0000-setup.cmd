@CALL %~dp0\print-macros.cmd

@REM ============================================================================
@REM Some helpful things.
@REM ============================================================================

@REM This gets the directory of the current script, even if it's called from a
@REM different directory.
@SET DEVENV_SETUP_ROOT=%~dp0
@SET DEVENV_ROOT=%DEVENV_SETUP_ROOT%\..
@SET DEVENV_DOWNLOADS=%DEVENV_SETUP_ROOT%\downloads

@SET DEVENV_CYG_MIRROR=http://cygwin.mirror.constant.com
@SET DEVENV_CYG_LOCAL_CACHE=%DEVENV_DOWNLOADS%\cyg-cache
@SET DEVENV_CYG_ROOT=%DEVENV_ROOT%\cygwin
@SET DEVENV_CYG_PACKAGES=fish zsh wget curl nano make sed awk 

@REM ============================================================================
@REM Preamble
@REM ============================================================================

@%DEVENV_ECHO% Devenv Setup
@ECHO %DEVENV_COL_WHITE%

@REM ============================================================================
@REM Directories
@REM ============================================================================

@%DEVENV_ECHO% Creating directory structure...
@%DEVENV_ECHO_INFO% $DEVENV_ROOT
@%DEVENV_ECHO_INFO% └───devenv
@%DEVENV_ECHO_INFO%     ├───cygwin
@%DEVENV_ECHO_INFO%     ├───devenv-init
@%DEVENV_ECHO_INFO%     ├───devenv-setup
@%DEVENV_ECHO_INFO%     │   └───downloads
@%DEVENV_ECHO_INFO%     │       └───cyg-cache
@%DEVENV_ECHO_INFO%     ├───libs
@%DEVENV_ECHO_INFO%     │   └───github.com
@%DEVENV_ECHO_INFO%     └───tools %DEVENV_COL_WHITE%

@mkdir %DEVENV_ROOT%\devenv-setup\downloads\cyg-cache
@mkdir %DEVENV_ROOT%\cygwin
@mkdir %DEVENV_ROOT%\libs\github.com
@mkdir %DEVENV_ROOT%\tools

@%DEVENV_ECHO% done.

@REM ============================================================================
@REM Downloading/Installing Cygwin
@REM ============================================================================

@ECHO.
@%DEVENV_ECHO% Locating cygwin installer... %DEVENV_COL_WHITE%

@if not exist "%DEVENV_DOWNLOADS%\cygwin-setup-x86_64.exe" (
    @%DEVENV_ECHO_SEVERE% "%DEVENV_DOWNLOADS%\cygwin-setup-x86_64.exe" not found... downloading
    @pwsh -Command "Invoke-WebRequest 'https://cygwin.com/setup-x86_64.exe' -OutFile '%DEVENV_DOWNLOADS%\cygwin-setup-x86_64.exe'"
    @if errorlevel 1 (
        @ECHO.
        @%DEVENV_ECHO_SEVERE% Download failed. You can try to
        @%DEVENV_ECHO_SEVERE% continue, or restart the setup after adjusting firewalls, links in this file etc.
        @ECHO %DEVENV_COL_WHITE%
        PAUSE
    )
    @%DEVENV_ECHO% done.
)

@%DEVENV_ECHO% Installing cygwin packages (^>cygwin-setup.log) ...
@%DEVENV_ECHO_INFO%   packages = %DEVENV_CYG_PACKAGES%
@%DEVENV_ECHO_INFO%   root     = %DEVENV_CYG_ROOT% 
@%DEVENV_ECHO_INFO%   cache    = %DEVENV_CYG_LOCAL_CACHE%
@%DEVENV_ECHO_INFO%   mirror   = %DEVENV_CYG_MIRROR% %DEVENV_COL_WHITE%

@%DEVENV_DOWNLOADS%\cygwin-setup-x86_64.exe --root %DEVENV_CYG_ROOT% --site %DEVENV_CYG_MIRROR% --local-package-dir %DEVENV_CYG_LOCAL_CACHE% --packages %DEVENV_CYG_PACKAGES% --quiet-mode --no-admin --no-shortcuts > cygwin-setup.log

@%DEVENV_ECHO% done.
@ECHO %DEVENV_COL_WHITE%

@%DEVENV_ECHO% Going fishing... %DEVENV_COL_WHITE%
@%DEVENV_CYG_ROOT%\bin\fish.exe --version
@%DEVENV_ECHO% done. Continuing setup in a friendly and interactive shell... %DEVENV_COL_WHITE%
@ECHO %DEVENV_COL_WHITE%

@REM we now have fish, wget and companions, so let's try to avoid cmd.exe now

@%DEVENV_CYG_ROOT%\bin\fish.exe %DEVENV_SETUP_ROOT%\0100-setup.fish
@%DEVENV_ECHO% done.
@ECHO %DEVENV_COL_WHITE%
