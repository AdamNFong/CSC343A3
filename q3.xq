<qualified>{
let $path := fn:doc("resume.xml")
let $allSkills := $path//resume/skills
for $resume in $path//resume
where $resume/skills/count(skill)>3
return 
	<candidate
		rID = '{data($resume/@rID)}'
		numSkills = '{data($resume/skills/count(skill))}'
		citizenship = '{data($resume/identification/citizenship)}'>
		<name>
			{data($resume/identification/name/forename)}
		</name>
	</candidate>
}
</qualified>