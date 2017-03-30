<histogram>{
let $postingPath := fn:doc("posting.xml")
let $resumePath := fn:doc("resume.xml")

let $resumes := $resumePath//resume
let $postings := $postingPath//posting
let $skills := $postings/reqSkill/string(@what)

for $skill in distinct-values($skills)

let $count := (for $level in 1 to 5
		let $resumeWithSkill := $resumes/skills/skill[@what = $skill]
		let $resumeWithLevel := $resumes/skills/skill[@level = $level]
		let $levelCount := count(($resumeWithSkill) intersect ($resumeWithLevel))
		return (<count level = '{data($level)}' count='{data($levelCount)}'> </count>))
return
	<skill name = '{data($skill)}'>{ 
		$count
	}
	</skill>
}
</histogram>