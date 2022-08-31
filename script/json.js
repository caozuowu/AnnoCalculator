const XLSX = require('xlsx')
const FS = require('fs')

var xlsxPath = "data.xlsx"
var outputPath = __dirname + "/" + "../assets"
const workbook = XLSX.readFile(xlsxPath)

function generateResidentJson() {
    var sheet = XLSX.utils.sheet_to_json(workbook.Sheets["resident"]);
    for (const row of sheet) {
        row.necessity = row.necessity.split(",")
        row.luxary = row.luxary.split(",")
        if (row.skyscraper) {
            row.skyscraper = row.skyscraper.split(",")
        }
    }
    var jstring = JSON.stringify(sheet, null, 2);
    FS.writeFileSync(outputPath + '/resident.json', jstring);
}

function generateProductJson() {
    var sheet = XLSX.utils.sheet_to_json(workbook.Sheets["product"]);
    var result = {};
    for (var row of sheet) {
        var material = []
        for (let key of Object.keys(row)) {
            if (key.startsWith("material")) {
                material.push(row[key])
                delete row[key]
            }
        }
        row["material"] = material
        result[row.key] = row;
    }
    // console.log(sheet)
    var jstring = JSON.stringify(result, null, 2);
    FS.writeFileSync(outputPath + '/product.json', jstring);
}
  
function generateConsumeJson() {

    var sheet = XLSX.utils.sheet_to_json(workbook.Sheets["consume"])
        
    var rowIndex = [];
    for (var r in sheet) {
        var row = sheet[r]
        rowIndex.push(row["resident"])
        delete row["resident"]
    }

    var columeIndex = [];
    var keys = Object.keys(sheet[0])
    for (var key of keys) {
        columeIndex.push(key)
    }

    var data = [];
    for (var r in sheet) {
        let values = Object.values(sheet[r])
        data.push(values)
    }
    // console.log(data)
   
    var jstring = JSON.stringify({
        "rowIndex": rowIndex,
        "columeIndex": columeIndex,
        "data": data
    }, null, 2);
    FS.writeFileSync(outputPath + '/consume.json', jstring);

      
}
(function (){
    generateResidentJson()
    generateProductJson()
    generateConsumeJson()
})()
