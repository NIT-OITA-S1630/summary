| ファイル | 内容 |
----|---- 
|README.md| これ |
|nitocs.cls| スタイルファイル。テンプレートを、文字コード変換しただけ。|
|summary.pdf| 生成したやつ |
|**summary.tex**| **抄録本編** |

# メモ
- WSL2(Ubuntu 20.10)
- TeX Liveをフルインストール
- VSCode(LaTeX Workshop)を使用
- ptex2pdfでコンパイル成功。他はエラーを吐いた。 
- Better Commentsプラグインを使用。コメントにTODOとか!とか?とか書いてあるのは、これを使うため。

以下の内容は[[LaTex]VSCodeとWSLで作るLaTex環境構築の備忘録 - Qiita](https://qiita.com/uoyuki/items/c0b3feeb80f9a2699759#%E3%83%84%E3%83%BC%E3%83%AB%E3%81%AE%E8%A8%AD%E5%AE%9A)を参考にした。
## latex-tools.sh
- このファイルをCドライブ直下に配置
```sh
#!/bin/bash
#Windows特有の c:/hoge/piyo → /mnt/c/hoge/piyo に書き換えてコマンドを実行するshellscript
newArgs=()
for arg in $@; do
      if [ ${arg:1:1} = : ]; then
          arg=/mnt/${arg:0:1}${arg#*:}
      fi
          newArgs+=( $arg )
      done
${newArgs[@]}
```

## settings.json (VSCode)
- ptex2pdf以外ではエラーを吐いたため項目を削除した。
```
{
    "latex-workshop.latex.tools": [
        {
        "name":"ptex2pdf",
        "command": "wsl.exe",
        "args": [
            "ptex2pdf",
            "-l",
            "-ot",
            "-kanji=utf8 -synctex=1",
            "-interaction=nonstopmode",
            "%DOC%"
            ]
        }
      ],
      
      "latex-workshop.latex.recipes": [
        {
            "name": "ptex2pdf", 
            "tools": [
                "ptex2pdf"
            ]
        }
    ]
}
```
