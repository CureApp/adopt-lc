
###*
calculates Child-Pugh score

@class CharlsonComorbidityIndex
@module HandlingLiverCirrhosis
###
class CharlsonComorbidityIndex


    ###*
    constructor

    @constructor
    @param {Boolean} hasMyocardialInfarction
    @param {Boolean} hasCongestiveHeartFailure
    @param {Boolean} hasPeripheralVascularDisease
    @param {Boolean} hasCerebrovascularDisease
    @param {Boolean} hasDementia
    @param {Boolean} hasChronicPulmonaryDisease
    @param {Boolean} hasConnectiveTissueDisease
    @param {Boolean} hasPepticUlcerDisease
    @param {Boolean} hasMildLiverDisease
    @param {Boolean} hasDiabetes
    @param {Boolean} hasHemipledia
    @param {Boolean} hasRenalDisease
    @param {Boolean} hasDiabetesWithOrganDamage
    @param {Boolean} hasSolidTumor
    @param {Boolean} hasLeukemia
    @param {Boolean} hasLymphoma
    @param {Boolean} hasMetastaticSolidTumor
    @param {Boolean} hasAIDS
    ###
    constructor: (
        @hasMyocardialInfarction
        @hasCongestiveHeartFailure
        @hasPeripheralVascularDisease
        @hasCerebrovascularDisease
        @hasDementia
        @hasChronicPulmonaryDisease
        @hasConnectiveTissueDisease
        @hasPepticUlcerDisease
        @hasMildLiverDisease
        @hasDiabetes
        @hasHemipledia
        @hasRenalDisease
        @hasDiabetesWithOrganDamage
        @hasSolidTumor
        @hasLeukemia
        @hasLymphoma
        @hasMetastaticSolidTumor
        @hasModerateLiverDisease
        @hasAIDS
    )->


    ###*
    calculates score (number)

    @method getScore
    @return {Number} score
    ###
    getScore: ->
        props = Object.keys(@).filter (name) -> name.slice(0, 3) is 'has'

        scoreTable = 
            hasMyocardialInfarction      : 1
            hasCongestiveHeartFailure    : 1
            hasPeripheralVascularDisease : 1
            hasCerebrovascularDisease    : 1
            hasDementia                  : 1
            hasChronicPulmonaryDisease   : 1
            hasConnectiveTissueDisease   : 1
            hasPepticUlcerDisease        : 1
            hasMildLiverDisease          : 1
            hasDiabetes                  : 1
            hasHemipledia                : 2
            hasRenalDisease              : 2
            hasDiabetesWithOrganDamage   : 2
            hasSolidTumor                : 2
            hasLeukemia                  : 2
            hasLymphoma                  : 2
            hasModerateLiverDisease      : 3
            hasMetastaticSolidTumor      : 6
            hasAIDS                      : 6

        scores = 0
        for prop in props
            if prop is 'hasDiabetes'
                continue if @hasDiabetesWithOrganDamage

            if prop is 'hasMildLiverDisease'
                continue if @hasModerateLiverDisease

            if prop is 'hasSolidTumor'
                continue if @hasMetastaticSolidTumor

            scores += scoreTable[prop] if @[prop]

        return scores



    ###*
    gets score description

    @method getScoreDescription
    @return {String} description
    ###
    getScoreDescription: ->

        score = @getScore()
        return @constructor.getDescriptionByScore(score)


    ###*
    gets description by score

    @method getDescriptionByScore
    @private
    @static
    @param {Number} score
    @return {String} description
    ###
    @getDescriptionByScore: (score) ->

        if score <= 0
            return 'Low'

        else if score <= 2
            return 'Medium'

        else if score <= 4
            return 'High'

        else
            return 'Very high'



module.exports = CharlsonComorbidityIndex
