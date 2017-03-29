let $d := fn:doc("posting.xml")
let $SQLPostings := $d//posting[reqSkill/@what="SQL"]
let $Level5Postings := $d//posting[reqSkill/@level="5"]

(:<dbjobs>
	{
		$SQLPostings intersect Level5Postings
	}
</dbjobs>:)
