const XLSX = require('xlsx')
const FS = require('fs')

var xlsxPath = "data.xlsx"
var outputPath = __dirname + "/" + "../assets"
const workbook = XLSX.readFile(xlsxPath)

function converToConsume(sheet) {
    var data = {};
    for (var row of sheet) {
        for (var key of Object.keys(row)) {
            if (row[key] == 0 || row[key] == "") {
                delete row[key]
            }
        }
        var key = row["resident"]
        delete row["resident"]
        data[key] = row
    }
    return data
}

function generateResidentJson() {
    var sheet = XLSX.utils.sheet_to_json(workbook.Sheets["resident"]);
    var areasName = []
    for (var row of sheet) {
        if (areasName.indexOf(row.area) == -1) {
            areasName.push(row.area)
        }
    }
    //console.log(areasName)
    var consume = {}
    for (let name of areasName) {
        var temp = converToConsume(XLSX.utils.sheet_to_json(workbook.Sheets[name]))
        consume = Object.assign(consume, temp)
    }
    for (let row of sheet) {
        var key = row.key
        row["consume"] = consume[key]
    }
    //console.log(sheet)
    var jstring = JSON.stringify(sheet, null, 2);
    FS.writeFileSync(outputPath + "/" + "resident" + '.json', jstring);
}

function generateProductJson() {
    var sheet = XLSX.utils.sheet_to_json(workbook.Sheets["product"]);
    for (var row of sheet) {
        var material = []
        for (let key of Object.keys(row)) {
            if (key.startsWith("material")) {
                material.push(row[key])
                delete row[key]
            }
        }
        row["material"] = material
    }
    // console.log(sheet)
    var jstring = JSON.stringify(sheet, null, 2);
    FS.writeFileSync(outputPath + "/" + "product" + '.json', jstring);
}
  
(function (){
    generateResidentJson()
    generateProductJson()
})()
