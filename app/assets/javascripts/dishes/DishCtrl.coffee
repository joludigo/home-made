
class DishCtrl

    constructor: (@$log, @DishService) ->
        @$log.debug "constructing DishController"
        @dishes = []
        @getAllDishes()

    getAllDishes: () ->
        @$log.debug "getAllDishes()"

        @DishService.listDishes()
        .then(
            (data) =>
                @$log.debug "Promise returned #{data.length} Dishes"
                @dishes = data
            ,
            (error) =>
                @$log.error "Unable to get Dishes: #{error}"
            )


controllersModule.controller('DishCtrl', DishCtrl)