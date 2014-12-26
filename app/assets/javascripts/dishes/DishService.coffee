
class DishService

    @headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
    @defaultConfig = { headers: @headers }

    constructor: (@$log, @$http, @$q) ->
        @$log.debug "constructing DishService"

    listDishes: () ->
        @$log.debug "listDishes()"
        deferred = @$q.defer()

        @$http.get("/dishes")
        .success((data, status, headers) =>
                @$log.info("Successfully listed Dishes - status #{status}")
                deferred.resolve(data)
            )
        .error((data, status, headers) =>
                @$log.error("Failed to list Dishes - status #{status}")
                deferred.reject(data);
            )
        deferred.promise

    createDish: (dish) ->
        @$log.debug "createDish #{angular.toJson(dish, true)}"
        deferred = @$q.defer()

        @$http.post('/dish', dish)
        .success((data, status, headers) =>
                @$log.info("Successfully created Dish - status #{status}")
                deferred.resolve(data)
            )
        .error((data, status, headers) =>
                @$log.error("Failed to create dish - status #{status}")
                deferred.reject(data);
            )
        deferred.promise

servicesModule.service('DishService', DishService)