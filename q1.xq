<dbjobs>
	{
		let $d := fn:doc("posting.xml")
		let $SQLPostings := $d//posting[reqSkill/@what="SQL"]
		let $Level5Postings := $d//posting[reqSkill/@level="5"]
		$SQLPostings intersect Level5Postings
	}
</dbjobs>


<dbjobs>
	{
		(let $d := fn:doc("posting.xml")
		let $Postings := $d//posting
		for $post in $SQLPostings
		where $post/reqSkill/@what ="SQL"
		return $d//posting)

		intersect

		(let $Postings := $d//posting
		for $post in $SQLPostings
		where $post/reqSkill/@levels ="SQL"
		return $d//posting)
	}
</dbjobs>