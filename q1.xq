declare variable $dataset0 external;
<dbjobs>{
	($dataset0//posting[reqSkill/@what='SQL']) 
	intersect
	($dataset0//posting[reqSkill/@level='5'])
	}
</dbjobs>
