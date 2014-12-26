package models

case class Dish( age: Int,
                 firstName: String,
                 lastName: String,
                 active: Boolean)

object DishJsonFormats {
  import play.api.libs.json.Json

  // Generates Writes and Reads for Feed and Dish thanks to Json Macros
  implicit val dishFormat = Json.format[Dish]
}