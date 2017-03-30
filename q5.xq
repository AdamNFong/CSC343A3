let $postingPath := fn:doc("posting.xml")
let $resumePath := fn:doc("resume.xml")

let $resumes := $resumePath//resume
let $postings := $postingPath//posting
let $skills := $postings/reqSkill/string(@what)

for $skill in distinct-values($skills)
return(
<skill name = '{data($skill)}'>
	for $level in 1 to 5
		let $resumeWithSkill := $resumes/skills/skill[@what = $skill]
		let $resumeWithLevel := $resumes/skills/skill[@level = $level]
		return count (($resumeWithSkill) intersect ($resumeWithLevel))
</skill>
	)
