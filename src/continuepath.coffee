
class ContinuePath
    constructor: () ->
        @actions = []
        @errors = []
        @deltaTime = 0

    add: (actionCallback) => 
        actions.push(actionCallback)
        @

    error: (actionCallback) =>
        error.push(actionCallback)
        @

    currentAction: () => 
        if (@actions? && @actions.length > 0)
            @actions[0]
        null

    update: (deltaTime) =>
        @deltaTime += deltaTime;
        cur = @currentAction()
        if !cur
            return;

        status = cur(@)
        if (status.startWith("err"))
            @actions = @errors
            @errors = []
            @deltaTime = 0
        else if (status.startWith("im"))
            @deltaTime = 0
            @actions.pop()
            @update(0)
        else if (status != "contunue")
            @actions.pop()
            @deltaTime = 0





