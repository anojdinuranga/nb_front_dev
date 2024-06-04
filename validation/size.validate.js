const joi = require("joi");



const size_validate = joi.object({
    key:joi.string().min(1).max(3).required(),
    type:joi.number().min(1).max(4).required(),
})

module.exports = {
    size_validate
}