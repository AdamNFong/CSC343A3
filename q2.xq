<important>{
	let $max := max (let $postings := fn:doc("posting.xml")//posting
					return $postings/reqSkill/ (@level*@importance))

	for $posting in fn:doc("posting.xml")//posting
	where $posting/reqSkill/(@level*@importance) = $max
	return $posting
}
</important>