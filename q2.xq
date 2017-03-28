<important>
let $d := fn:doc("posting.xml")
let $Reqs:= $d//posting/reqSkill/(@level * @importance)
let $max := max ($Reqs)

$d//posting[reqSkill/(@level* @importance) = $max]

</important>
