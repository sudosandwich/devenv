@printf "  cl: "
@CALL "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64 >nul
@cl 2>&1 | head -n1

@SET PATH=C:\Program Files\LLVM\bin;%PATH%
@printf "  llvm: "
@clang-cl --version | head -n1


@printf "  conda: (will be activated on fish shell)\n"


