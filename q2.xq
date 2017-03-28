<important>{
let $Reqs:= fn:doc("posting.xml")//posting/reqSkill/(@level * @importance)
let $max := max ($Reqs)

fn:doc("posting.xml")//posting[reqSkill/(@level* @importance) = $max]
}
</important>
