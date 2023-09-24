//
//  AnalysisText.swift
//  ShiYet
//
//  Created by Jiawen Wei on 9/24/23.
//

import Foundation

class AnalysisText {
    
    init() {
        self.setup()
    }

    var shape_advice: [String: String] = [:]
    var color_advice = Dictionary<String, String>()
    var amount_advice = Dictionary<String, String>()
    var smell_advice = Dictionary<String, String>()
    var feeling_advice = Dictionary<String, String>()
    var sticky_advice = Dictionary<Bool, String>()
    var blood_advice = Dictionary<Bool, String>()
    var time_advice = Dictionary<Int, String>()

    func setup() {
        // Set up shape advice
        shape_advice["gravy"] = "Because the body is cold-mounted, the overall condition is not good, soaking in a hot bath - will have a good effect."
        shape_advice["rabbit"] = "Don't hold your inconvenience, go poop when you feel like it to reduce the time it stays in your intestines. Eat more fiber food to promote intestinal peristalsis. "
        shape_advice["banana"] = "Pay attention to adequate rest, diarrhea before the risk of information, the body too soon fatigue caused by."
        shape_advice["oatmeal"] = "pay attention to adequate rest, diarrhea before the risk of information, the body too soon fatigue caused by."
        
        // Set up color advice
        color_advice["red"] = "Check if you have eaten foods that cause red poop (beet, tomatoes, cranberries, etc.). It may suggest bleeding from the lower wall of the intestines or hemorrhoids, so please promptly Seek medical attention! "
        color_advice["black"] = "Check if you have taken any food or medication (licorice, black beer, pig's blood, iron supplements, etc.) that causes black stools."
        color_advice["coffee"] = "Your poop color is healthy, meat and veggies are great, and the coffee color is due to the normal production of bile."
        color_advice["yellow"] = "Greasy, foul-smelling yellow stools are a sign of malabsorption of body fat or celiac disease."
        
        // Set up amount advice
        amount_advice["general"] = "Eat more vegetables and fruits rich in food fiber, food fiber can clean the intestinal tract, while increasing the amount of stool. Such as: sweet potatoes, potatoes, pumpkin, carrots, mushrooms, tofu, seaweed."
        amount_advice["Large"] = "Eat more vegetables and fruits that are rich in dietary fiber, which can clean the intestines and increase the amount of stool. Such as: sweet potatoes, potatoes, pumpkin, carrots, shiitake mushrooms, tofu, seaweed. "
        amount_advice["Little"] = "Eat more vegetables and fruits rich in dietary fiber, which can clean the intestines and increase the amount of stool. Such as: sweet potatoes, potatoes, pumpkin, carrots, mushrooms, tofu, seaweed. "
        
        // Set up feel advice
        feeling_advice["easy"] = "Please keep a happy and calm mood. Poor blood circulation will lead to slower intestinal peristalsis. "
        feeling_advice["difficult"] = "Psychological stress can cause and worsen constipation, please keep a pleasant and calm"
        
        // Set up smell advice
        smell_advice["bun"] = "Congratulations! Your farts and poop even have a little bit of flavor, which is a sign that the good bacteria in your body are completely outnumbering the bad ones, which are mainly composed of lactobacilli and bifidobacteria. "
        smell_advice["egg"] = "Congratulations! Your farts and poop even have a little bit of flavor, which is a sign that the good bacteria in your body are completely outnumbering the bad ones, which are mainly composed of lactobacilli and bifidobacteria. "
        smell_advice["deadfish"] = "Level one alert! Your farts and poop stink to high heaven, the sour odor of rotting and spoilage. The bad bacteria in your body have completely outnumbered the good bacteria, which are mainly made up of E. coli and gas-producing Inflammatory Bacteria. Please change your lifestyle immediately by eating more oligosaccharide-rich foods (bananas, honey milk, garlic, tomatoes, bulb onions, asparagus, inulin, and wheat), drinking more yogurt, keeping a regular routine, and relaxing so that the number of good bacteria will increase dramatically!"
        smell_advice["durian"] = "Alert! Your farts and poop smell pungent for a long time. Please eat more foods rich in oligosaccharides (bananas, honey see, garlic, tomatoes, bulb onions, asparagus, inulin and wheat), drink more yogurt, keep a regular life and relax so that the number of good bacteria will increase significantly!"
        
        // Set up blood advice
        blood_advice[false] = "After the stool is best to use warm water to rinse the butt, do not use hard paper to wipe the Prevent trauma. "
        blood_advice[true] = "Do not sit or stand for a long time, appropriate exercise to prevent hemorrhoidal bruising. "
        
        // Set up sticky advice
        sticky_advice[false] = "Keep it up! Eat more vegetables and fruits rich in dietary fiber (such as bananas, celery, etc.), food fiber can clean the intestinal tract. "
        sticky_advice[true] = "Adjust the diet, avoid eating spicy, cold and greasy food, eat more vegetables and fruits rich in food fiber (such as bananas, celery, etc.), food fiber can clean the intestinal tract. "
        
        // Set up time advice
        time_advice[1] = "Good for you! You poop for <3 minutes, which takes very little time and is less prone to hemorrhoids, while leaving the pit for more partners, thank you!"
        time_advice[2] = "Not bad at all! You poop for <5 minutes, which is a relatively short period of time, and it's best to keep it under 3 minutes, so it's not easy to get hemorrhoids."
        time_advice[3] = "It's taking too long, you're pooping for more than 10 minutes! Squatting for too long can easily lead to rectal congestion, increased venous pressure, and internal or external hemorrhoids. Try to keep the time of each bowel movement within 3 minutes. "
    }

}



