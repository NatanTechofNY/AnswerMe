if Meteor.isClient
	window.updateSess = (data, accessor) ->
		curr = Session.get 'userSessItem'
		if !curr then curr = new Object()
		curr[accessor] = data

		Session.setPersistent('userSessItem', curr)

	Tracker.autorun(->
		sessr = Session.get 'userSessItem'
		if sessr && sessr.userId
			Meteor.subscribe 'userDoc', sessr.userId
		if sessr && sessr.sessionId
			Meteor.subscribe 'sessionData', sessr.sessionId
		
		
	)