let $d := fn:doc("q1.xml")
let $SQLPostings := $d//posting[/reqSkill/@what="SQL"]
let $Level5Postings := $d//posting[/reqSkill/@level="5"]
let $dbjob := $SQLPostings intersect Level5Postings