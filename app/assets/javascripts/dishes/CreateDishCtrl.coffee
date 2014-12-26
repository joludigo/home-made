
class CreateDishCtrl

    constructor: (@$log, @$location,  @DishService) ->
        @$log.debug "constructing CreateDishController"
        @dish = {}

    createDish: () ->
        @$log.debug "createDish()"
        @dish.active = true
        @DishService.createDish(@dish)
        .then(
            (data) =>
                @$log.debug "Promise returned #{data} Dish"
                @dish = data
                @$location.path("/")
            ,
            (error) =>
                @$log.error "Unable to create Dish: #{error}"
            )

controllersModule.controller('CreateDishCtrl', CreateDishCtrl)