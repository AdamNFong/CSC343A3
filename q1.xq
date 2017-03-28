<dbjobs>{
	(fn:doc("posting.xml")//posting[reqSkill/@what='SQL']) 
	intersect
	(fn:doc("posting.xml")//posting[reqSkill/@level='5'])
	}
</dbjobs>
