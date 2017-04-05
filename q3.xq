declare variable $dataset0 external;
<qualified>{
let $path := $dataset0
let $allResumes := $path//resume
for $resume in $allResumes
where $resume/skills/count(skill)>3
return 
	<candidate
		rid = '{data($resume/@rID)}'
		numskills = '{data($resume/skills/count(skill))}'
		citizenzhip = '{data($resume/identification/citizenship)}'>
		<name>
			{data($resume/identification/name/forename)}
		</name>
	</candidate>
}
</qualified>