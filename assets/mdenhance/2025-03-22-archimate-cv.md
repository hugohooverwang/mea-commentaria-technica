@startuml
skinparam rectangle<<behavior>> {
	roundCorner 25
}

sprite $bProcess jar:archimate/business-process
sprite $aService jar:archimate/application-service
sprite $aComponent jar:archimate/application-component

rectangle "个人发展过程"  as HC <<$bProcess>><<behavior>> #Business
rectangle "电子科技大学\n生命学院"  as UESTC <<$bProcess>><<behavior>> #Business
rectangle "成都军区\n临床检验中心" as NAS <<$bProcess>><<behavior>> #Business
rectangle "国家卫健委\n《医学参考报检验医学频道》\n编辑部" as MEDREF <<$bProcess>><<behavior>> #Business
rectangle "成都军辉\n生物医学研究所" as JH <<$bProcess>><<behavior>> #Business
rectangle "成都仁钦\n生物科技有限公司" as ZQbio <<$bProcess>><<behavior>> #Business
rectangle "成都仁钦\n健康管理有限公司" as RQhealth <<$bProcess>><<behavior>> #Business

HC *-down- UESTC
HC *-down- NAS
HC *-down- MEDREF
HC *-down- JH
HC *-down- ZQbio
HC *-down- RQhealth

UESTC -right->> NAS
NAS -right->> MEDREF
MEDREF -right->> JH
JH -right->> ZQbio
ZQbio -right->> RQhealth

rectangle "过继性免疫疗法" as adopImmu <<$aService>><<behavior>> #Application
rectangle "- 工程酶的定点突变;\n- 蛋白质结构生物学" as enzyMuta <<$aService>><<behavior>> #Application
rectangle "- 多/泛耐药致病微生物快速检测;\n- 活动性结核标志物;\n- DR70肿瘤极早期标志物" as mrsa <<$aService>><<behavior>> #Application
rectangle "单细胞测序分析" as sco <<$aService>><<behavior>> #Application
rectangle "- 睡眠障碍;\n- 神经退行性病变" as sleepAlzheimers <<$aService>><<behavior>> #Application
rectangle "功能性水凝胶" as hydrogel <<$aService>><<behavior>> #Application
rectangle "数据驱动的\n个体化健康管理" as digitalHealth <<$aService>><<behavior>> #Application


UESTC -down-> enzyMuta
NAS -down-> mrsa
MEDREF -down-> mrsa
MEDREF -down-> sco
MEDREF -down-> adopImmu
JH -down-> mrsa
JH -down-> sco
JH -down-> adopImmu
JH -down-> sleepAlzheimers
JH -down-> hydrogel
ZQbio -down-> adopImmu
ZQbio -down-> sco
ZQbio -down-> sleepAlzheimers
ZQbio -down-> hydrogel
RQhealth -down-> digitalHealth

rectangle "计算生物医学模块组:\n- 机器学习\n(支持向量机、随机森林、神经网络);\n- RBioconductor;\n- Python (JupyterLab);\n- STRING/Genemania;\n- Cytoscape+Rscript" as CompBioML <<$aComponent>> #Application
rectangle "翻译记忆库:\n- OmegaT" as omegat <<$aComponent>> #Application
rectangle "分子克隆与生物信息学:\n- 大引物设计;\n- 田口方法;\n- PCR;\n- 分子文库构建;\n- 中通量筛选;\n- 表达载体细胞培养;\n- 同源建模与分子对接;\n- 分子动力学;\n- 支持向量机" as molClon <<$aComponent>>  #Application
rectangle "文档管理、自动化及展示:\n- Git;\n- Vuepress;\n- Nginx;\n- NodeJS;\n- Ruby;\n- ZSH" as FrontendAuto <<$aComponent>> #Application
rectangle "文献检索及文本处理:\n- Zotero;\n- FreeMind/Freeplane;\n- Emacs;\n- WORD(VBA);\n- Vim" as Ref <<$aComponent>> #Application
rectangle "生成式AI:\n- Ollama;\n- Neo4j (知识图谱, 在建);\n- 提示词工程" as GenAI <<$aComponent>>  #Application
rectangle "项目管理与可视化:\n- Freeplane;;\n- RStudio+Cytoscape;\n- JupyterLab (机器学习);\n- Markdown+PlantUML;\n- draw.io+Mermaid;\n- D3.js" as projVis <<$aComponent>>  #Application

Ref .up.|> adopImmu
Ref .up.|> enzyMuta
Ref .up.|> mrsa
Ref .up.|> sco
Ref .up.|> digitalHealth
Ref .up.|> hydrogel
Ref .up.|> sleepAlzheimers

omegat .up.|> enzyMuta
omegat .up.|> mrsa
omegat .up.|> sco
CompBioML .up.|> hydrogel
CompBioML .up.|> enzyMuta
CompBioML .up.|> adopImmu
CompBioML .up.|> digitalHealth
CompBioML .up.|> sleepAlzheimers
molClon .up.|> enzyMuta
FrontendAuto .up.|> sco
FrontendAuto .up.|> mrsa
FrontendAuto .up.|> adopImmu
FrontendAuto .up.|> digitalHealth
GenAI .up.|> digitalHealth
GenAI .up.|> sleepAlzheimers
GenAI .up.|> adopImmu
projVis .up.|> digitalHealth
projVis .up.|> hydrogel
projVis .up.|> sleepAlzheimers
projVis .up.|> adopImmu

legend left
图示：
====
<$bProcess> : 团队经历
====
<$aService> : 项目或研究方向
====
<$aComponent> : 方法或技术栈
endlegend
@enduml
