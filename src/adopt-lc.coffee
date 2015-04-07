
###*
calculates Adopt-lc

@class AdoptLC
@module HandlingLiverCirrhosis
###
class AdoptLC

    ###*
    constructor

    @constructor
    @param {Number} age
    @param {String} childPughScore
    @param {Number} charlsonComorbidityScore
    @param {Number} durationOfAnesthesia unit: minutes
    ###
    constructor: (
        @age
        @childPughScore
        @charlsonComorbidityScore
        @durationOfAnesthesia
    )->


    getScore: ->
        score = 0

        scores =
            age        : @constructor.getScoreByAge(@age)
            childPugh  : @constructor.getScoreByChildPughScore(@childPughScore)
            charlson   : @constructor.getScoreByCharlsonComorbidityScore(@charlsonComorbidityScore)
            anesthesia : @constructor.getScoreByDurationOfAnesthesia(@durationOfAnesthesia)

        score += scorePart for name, scorePart of scores

        return score




    ###*
    get mortality by this score

    @method getMortality
    @static
    returns mortality
    ###
    getMortality: ->

        score = @getScore()

        return @constructor.getMortalityByScore(score)



    ###*
    get score parts by age

    @method getScoreByAge
    @private
    @static
    @param {Number} age
    @return {Number} score
    ###
    @getScoreByAge: (age) ->

        if age > 60
            return 1

        else
            return 0



    ###*
    get score parts by Child-Pugh score

    @method getScoreByChildPughScore
    @private
    @static
    @param {String} childPughScore A|B|C
    @return {Number} score
    ###
    @getScoreByChildPughScore: (childPughScore) ->

        switch childPughScore

            when 'A'
                return 0

            when 'B'
                return 1

            when 'C'
                return 4

            else
                throw new Error("invalid Child-Pugh score, #{childPughScore}")


    ###*
    get score parts by Charlson Comorbidity score

    @method getScoreByCharlsonComorbidityScore
    @private
    @static
    @param {Number} charlsonComorbidityScore
    @return {Number} score
    ###
    @getScoreByCharlsonComorbidityScore: (charlsonComorbidityScore) ->

        if charlsonComorbidityScore <= 2
            return 0

        else if charlsonComorbidityScore <= 5
            return 1

        else
            return 2



    ###*
    get score parts by duration of anesthesia(min)

    @method getScoreByDurationOfAnesthesia
    @private
    @static
    @param {Number} durationOfAnesthesia
    @return {Number} score
    ###
    @getScoreByDurationOfAnesthesia: (durationOfAnesthesia) ->

        if durationOfAnesthesia <= 180
            return 0

        else if durationOfAnesthesia <= 420
            return 1

        else
            return 2




    ###*
    get mortality by score

    @method getMortality
    @private
    @static
    returns mortality
    ###
    @getMortalityByScore: (score) ->
        table =
            0: 0
            1: 0
            2: 0.8
            3: 1.0
            4: 5.7
            5: 7.5
            6: 13.6
            7: 23.3
            8: 33.3
            9: 50.0

        mortality = table[score]

        if not mortality?
            throw new Error('invalid score. score must be integer and ranged in 0 - 9')

        return mortality

module.exports = AdoptLC
