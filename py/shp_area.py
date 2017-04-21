# Calculate AREA values
import arcpy
workspace = "C:/Data/Habitat"
fkk = ["Air-Port.shp","Beach.shp" "Coastline.shp", "Cultivation.shp", "Developed_Area.shp", "Expressway.shp","Fisheries.shp", "Lagoon.shp", "Main road.shp", "Open_Ground.shp", "Open-Ground.shp", "Play-Ground.shp", "Reef.shp", "Road-Network.shp", "Sea-Wall.shp", "Vegetation.shp", "Water-Bodies.shp", "Water-Intake-Point.shp", "Water-Planned-Intake-Point.shp", "Wetland.shp" ]
fkkout = ["a_Coastline.shp", "a_Cultivation.shp", "a_Developed_Area.shp", "a_Expressway.shp","a_Fisheries.shp", "a_Lagoon.shp", "a_Main road.shp", "a_Open_Ground.shp", "a_Open-Ground.shp", "a_Play-Ground.shp", "a_Reef.shp", "a_Road-Network.shp", "a_Sea-Wall.shp", "a_Vegetation.shp", "a_Water-Bodies.shp", "a_Water-Intake-Point.shp", "a_Water-Planned-Intake-Point.shp", "a_Wetland.shp" ]
for i in range(0,17):
    input = fkk[i]
    calculate_output = fkkout[i]
    arcpy.env.workspace = workspace
    arcpy.CalculateAreas_stats(input, calculate_output)
        except:
            print arcpy.GetMessages()
#"Air-Port.shp" "Expressway.shp", Main road.shp" "Open-Ground.shp" "Play-Ground.shp" "Road-Network.shp" "Sea-Wall.shp" "Water-Bodies.shp" "Water-Intake-Point.shp", "Water-Planned-Intake-Point.shp", "Wetland.shp" not valid 
        
 
fkk = ["Water-Intake-Point.shp", "Water-Planned-Intake-Point.shp", "Wetland.shp" ]
fkkout = ["a_Water-Intake-Point.shp", "a_Water-Planned-Intake-Point.shp", "a_Wetland.shp" ]