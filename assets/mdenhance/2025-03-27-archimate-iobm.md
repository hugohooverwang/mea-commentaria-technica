@startuml
skinparam rectangle<<behavior>> {
	roundCorner 25
}
sprite $bProcess jar:archimate/business-process
sprite $aService jar:archimate/application-service
sprite $aComponent jar:archimate/application-component

rectangle "生物医学行业"  as IOBM <<$bProcess>><<behavior>> #Business
rectangle "创新追踪"  as INNO <<$bProcess>><<behavior>> #Business
rectangle "监管合规与最新动态" as REGU <<$bProcess>><<behavior>> #Business
rectangle "市场趋势与需求" as MARKTRED <<$bProcess>><<behavior>> #Business
rectangle "HEOR" as HEOR <<$bProcess>><<behavior>> #Business
rectangle "临床试验追踪" as CLIN <<$bProcess>><<behavior>> #Business
rectangle "知识产权追踪" as IP <<$bProcess>><<behavior>> #Business
rectangle "数据及分析应用" as DATA <<$bProcess>><<behavior>> #Business


IOBM *-down- INNO
IOBM *-down- REGU
IOBM *-down- MARKTRED
IOBM *-down- HEOR
IOBM *-down- CLIN
IOBM *-down- IP
IOBM *-down- DATA

INNO -right->> REGU
REGU -right->> MARKTRED
MARKTRED -right->> HEOR
HEOR -right->> CLIN
CLIN -right->> IP
IP -right->> DATA




rectangle Zotero <<$aService>><<behavior>> #Application
rectangle "GenAI" as genai <<$aService>><<behavior>> #Application
rectangle "Claims admnistration" as claimsAdministration <<$aService>><<behavior>> #Application
rectangle FreePlane <<$aService>><<behavior>> #Application
rectangle "JupyterLab\nRstudio" as dataanal <<$aService>><<behavior>> #Application

Zotero -up-> INNO
genai  -up-> INNO
genai  -up-> REGU
genai  -up-> MARKTRED
genai  -up-> HEOR
genai  -up-> CLIN
genai  -up-> IP
genai  -up-> DATA
claimsAdministration -up-> REGU
claimsAdministration -up-> MARKTRED
claimsAdministration -up-> HEOR
dataanal -up-> DATA

FreePlane -up-> MARKTRED
FreePlane -up-> REGU
FreePlane -up-> MARKTRED

rectangle "Document\nManagement\nSystem" as DMS <<$aComponent>> #Application
rectangle "General\nCRM\nSystem" as CRM <<$aComponent>>  #Application
rectangle "Home & Away\nPolicy\nAdministration" as HAPA <<$aComponent>> #Application
rectangle "Home & Away\nFinancial\nAdministration" as HFPA <<$aComponent>>  #Application

DMS .up.|> Zotero
DMS .up.|> FreePlane
CRM .up.|> genai
HAPA .up.|> claimsAdministration
HFPA .up.|> dataanal

legend left
Example from the "Archisurance case study" (OpenGroup).
See
====
<$bProcess> :business process
====
<$aService> : application service
====
<$aComponent> : application component
endlegend
@enduml
