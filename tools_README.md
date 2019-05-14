#这个文件是用来对personal_tools中的各个程序书写说明文件

# 程序名称：AA_fasta_analysis
## 使用方法
AA_fasta_analysis NGS/FGS -p /path/to/folder  -s scheme_of_numbering 
## 解释
这个程序的主要功能是从氨基酸的fasta文件开始进行分析。
### NGS/FGS:
 NGS/FGS表示的是分析的模式，因为NGS(二代测序)和FGS(一代测序)的两个fasta文件不同，NGS只需要存在单独的轻链或者重链的fasta文件即可，但是FGS需要轻链和重链的fasta文件，轻链和重链的fasta文件中的id需要相互匹配才可以。
### -p
这个参数代表需要指定一个路径，这个路径中含有各个文件夹形式如下
#### 假如分析的模式为FGS,需要注意的是
        |-----folder1 
        |             
        |             |---VH.fasta
folder_n|-----folder2-|
        |             |---VL.fasta
        |
        |-----folder3
#### 假如分析的模式为NGS，按照下述的文件夹结构
        |-----folder1|-VH_1.fasta
        |            |-VL_2.fasta
        |
        |            
folder_n|-----folder2|-VH_3.fasta
        |             
        |
        |-----folder3|-VL_4.fasta
那么就可以给定参数 -p /path/to/folder_n
需要注意的是：folder_n的文件夹中






