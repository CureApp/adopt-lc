

###*
calculates Child-Pugh score

@class ChildPughClassification
@module HandlingLiverCirrhosis
###
class ChildPughClassification

    ###*
    constructor

    @constructor
    @param {Number} freqOfEncephalopathy 1|2|3
    @param {Number} degreeOfAscites 1|2|3
    @param {Number} totalBillirubin [mg/dl]
    @param {Number} albumin [g/dl]
    @param {Number} prothrombinTime [%]

    ###
    constructor: (
        @freqOfEncephalopathy
        @degreeOfAscites
        @totalBillirubin
        @albumin
        @prothrombinTime
    )->


    ###*
    get Child-Pugh score (A, B, C)

    @method getScore
    @return {String} score A|B|C
    ###
    getScore: ->

        point = @getPoint()
        return @constructor.getScoreByPoint(point)



    ###*
    calculate point by parameters

    @method getPoint
    @private
    returns {Number} point
    ###
    getPoint: ->

        point = 0

        points =
            encephalopathy : @constructor.getPointByEncephalopathy(@freqOfEncephalopathy)
            ascites        : @constructor.getPointByAscites(@degreeOfAscites)
            billirubin     : @constructor.getPointByTotalBillirubin(@totalBillirubin)
            albumin        : @constructor.getPointByAlbumin(@albumin)
            prothrombin    : @constructor.getPointByProthrombinTime(@prothrombinTime)

        point += pointPart for name, pointPart of points

        return point



    ###*
    get score by point

    @method getScoreByPoint
    @private
    @static
    @param {Number} point
    @return {String} score
    ###
    @getScoreByPoint: (point) ->

        if point <= 6
            return 'A'

        else if point <= 9
            return 'B'

        else
            return 'C'


    ###*
    get point parts by encephalopathy

    @method getPointByEncephalopathy
    @private
    @static
    @param {Number} freqOfEncephalopathy
    @return {Number} point
    ###
    @getPointByEncephalopathy: (freqOfEncephalopathy) ->

        return Math.min(Math.max(freqOfEncephalopathy, 1), 3)

        ###
        switch freqOfEncephalopathy
            when 1
                return 1
            when 2
                return 2
            when 3
                return 3

        ###


    ###*
    get point parts by ascites

    @method getPointByAscites
    @private
    @static
    @param {Number} degreeOfAscites
    @return {Number} point
    ###
    @getPointByAscites: (degreeOfAscites) ->

        return Math.min(Math.max(degreeOfAscites, 1), 3)

        ###
        switch degreeOfAscites
            when 1
                return 1
            when 2
                return 2
            when 3
                return 3

        ###


    ###*
    get point parts by total billirubin

    @method getPointByTotalBillirubin
    @private
    @static
    @param {Number} totalBillirubin
    @return {Number} point
    ###
    @getPointByTotalBillirubin: (totalBillirubin) ->

        if totalBillirubin < 2.0
            return 1

        else if totalBillirubin <= 3.0
            return 2

        else
            return 3



    ###*
    get point parts by albumin

    @method getPointByAlbumin
    @private
    @static
    @param {Number} albumin
    @return {Number} point
    ###
    @getPointByAlbumin: (albumin) ->

        if albumin > 3.5
            return 1

        else if albumin >= 2.8
            return 2

        else
            return 3



    ###*
    get point parts by prothrombin time

    @method getPointByProthrombinTime
    @private
    @static
    @param {Number} prothrombinTime
    @return {Number} point
    ###
    @getPointByProthrombinTime: (prothrombinTime) ->

        if prothrombinTime > 70
            return 1

        else if prothrombinTime >= 40
            return 2

        else
            return 3



module.exports = ChildPughClassification
