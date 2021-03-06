﻿using System;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Hmcr.Model.Utils
{
    public static class CsvUtils
    {
        public static string ConvertToCsv<T>(T entity, string[] wholeNumberFields)
        {
            var csvValue = new StringBuilder();

            var fields = typeof(T).GetProperties();

            foreach (var field in fields)
            {
                var val = field.GetValue(entity);

                if (val == null)
                {
                    csvValue.Append($",");
                    continue;
                }

                //road length rules may contain UTF8 characters and Excel only handles ANSI
                // we need to update the value if it contains the ≤ to be <= (see HMCR-1005)
                if (field.Name == "RoadLengthRuleName")
                {
                    if (val.ToString().Contains("≤"))
                    {
                        val = val.ToString().Replace("≤", "<=");
                    }
                }

                if (field.PropertyType == typeof(DateTime))
                {
                    csvValue.Append($"{DateUtils.CovertToString((DateTime)val)},");
                }
                else if(wholeNumberFields.Contains(field.Name, StringComparer.InvariantCultureIgnoreCase))
                {
                    var value = Regex.Replace(val.ToString(), @"\.0+$", "");
                    csvValue.Append($"{value},");
                }
                else
                {
                    //we need to deal with the possibilities of commas in the string values
                    if (val.ToString().Contains(",") && !val.ToString().Contains("\""))
                    {
                        csvValue.Append($"\"{val}\",");
                    }
                    else
                    {
                        csvValue.Append($"{val},");
                    }
                }
            }

            return csvValue.ToString().Trim(',');
        }

        public static string GetCsvHeader<T>()
        {
            var csvValue = new StringBuilder();

            var fields = typeof(T).GetProperties();

            foreach (var field in fields)
            {
                var val = field.Name.WordToWords();
                csvValue.Append($"{val},");
            }

            return csvValue.ToString().Trim(',');

        }

        public static string[] GetLowercaseFieldsFromCsvHeaders(string[] headers)
        {
            var fields = new string[headers.Length];

            var i = 0;
            foreach(var header in headers)
            {
                fields[i] = Regex.Replace(header.ToLower(), @"[\s|\/]", string.Empty);
                i++;
            }

            return fields;
        }
    }
}
