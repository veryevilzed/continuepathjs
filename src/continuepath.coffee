
class ContinuePath
    constructor: () ->
        @actions = []
        @errors = []
        @dt = 0

    add: (actionCallback) => 
        @actions.push(actionCallback)
        @

    error: (actionCallback) =>
        @error.push(actionCallback)
        @

    currentAction: () => 
        
        if (@actions.length > 0)
            @actions[0]
        else
            null

    update: (deltaTime) =>
        cur = @currentAction()
        if !cur
            return;
        @dt += deltaTime;
        status = cur(@)
        if (status?.startsWith("err"))
            @actions = @errors
            @errors = []
            @dt = 0
        else if (status?.startsWith("im"))
            @dt = 0
            @actions.splice(0, 1)
            @update(0)
        else if (status?.startsWith("cont") || status == "cnt")
            null
        else
            @dt = 0
            @actions.splice(0, 1)



module.exports = ContinuePath


