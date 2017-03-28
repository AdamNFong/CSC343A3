<qualified>{
	let $d := fn:doc("resume.xml")//candidate
	let $RelevantCondidates := $d//candidate[@numskill > 3]

	for $candidate in $RelevantCandidates
	where $d//candidate[@numskills > 3]
	return ($d//candidate/@rID | $d//candidate/name | $d//candidate/@numskills | $d//candidate/citizenzhip)
	}
</qualified>