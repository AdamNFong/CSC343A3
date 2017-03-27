<dbjobs>
	{
		let $d := fn:doc("q1.xml")
		let $SQLPostings := $d//posting[/reqSkill/@what="SQL"]
		let $Level5Postings := $d//posting[/reqSkill/@level="5"]
		$SQLPostings intersect Level5Postings
	}
</dbjobs>