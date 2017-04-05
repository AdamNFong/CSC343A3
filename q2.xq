declare variable $dataset0 external;
<important>{
	let $max := max (let $postings := $dataset0//posting
					return $postings/reqSkill/ (@level*@importance))

	for $posting in $dataset0//posting
	where $posting/reqSkill/(@level*@importance) = $max
	return $posting
}
</important>
