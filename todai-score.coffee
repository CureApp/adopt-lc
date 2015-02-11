class TodaiScore

    ###*
    constructor

    @constructor
    @param {Number} age
    @param {ChildPughClassification} chlidChildPughClassification
    @param {CharlsonComorbidityIndex} charlsonComorbidityIndex
    @param {Number} durationOfAnesthesia unit: minutes
    ###
    constructor: (
        @age
        @childPughClassification
        @charlsonComorbidityIndex
        @durationOfAnesthesia
    )->


    getScore: ->
        score = 0

        scores =
            age        : @constructor.getScoreByAge(@age)
            childPugh  : @constructor.getScoreByChildPughClassification(@childPughClassification)
            charlson   : @constructor.getScoreByCharlsonComorbidityIndex(@charlsonComorbidityIndex)
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

        score = getScore()

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
    get score parts by Child-Pugh classification

    @method getScoreByChildPughClassification
    @private
    @static
    @param {ChildPughClassification} childPughClassification
    @return {Number} score
    ###
    @getScoreByChildPughClassification: (childPughClassification) ->

        childPughScore = childPughClassification.getScore() # A,B,C

        switch childPughScore

            when 'A'
                return 0

            when 'B'
                return 1

            when 'C'
                return 4


    ###*
    get score parts by Charlson Comorbidity Index

    @method getScoreByCharlsonComorbidityIndex
    @private
    @static
    @param {CharlsonComorbidityIndex} charlsonComorbidityIndex
    @return {Number} score
    ###
    @getScoreByCharlsonComorbidityIndex: (charlsonComorbidityIndex) ->

        charlsonComorbidityScore = charlsonComorbidityIndex.getScore() # number

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

module.exports = TodaiScore
