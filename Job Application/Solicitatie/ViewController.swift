//
//  ViewController.swift
//  Solicitatie
//
//  Created by Jan Dirk Blaauw on 12/06/2019.
//  Copyright © 2019 JDBPrivate. All rights reserved.
//

// MARK: Startup


import UIKit
public let DevName = "Jan Dirk Blaauw"

// MARK: First View


class ViewController: UIViewController {
    // tja was niet super creatief en het is makkelijk zo.
    @IBOutlet weak var BeginLabel: UILabel!
    func Bootup() {
        NSLog("Ah the app started succesfully.")
        let alertmessage = "This is an Alpha release; the first one in the wild. I will be publishing this on GitHub soon, and enhance this. Version Alpha 0.1: Basics are laid, not all things work properly just yet. I am sorry for the inconvenience. "
        let alert = UIAlertController(title: "Warning for Error", message: alertmessage, preferredStyle: .alert)
        let dismissWarning1 = UIAlertAction(title: "Okay", style: .default)
        
        alert.addAction(dismissWarning1)
        present(alert, animated: true, completion: nil)
        // I honestly wanted to add a Pong-esque game with Swift, ARKit, a randomizer, and a few UIViews... But I want to apply before time runs out. sorry!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        BeginLabel.text = "Hallo en welkom bij mijn CV en Solicitatie"
        BeginLabel.textColor = UIColor(red: 0, green: 0, blue: 60, alpha: 1)
        // Ik moet toch een beetje tonen dat het werkt.
        ////  Ik weet dat Constraints heel belangerijk zijn voor StoryBoards. Dus ik heb gekozen om daar een paar van te gebruiken zodat ik zeker weet dat het werkt.
        /// en hierna kwam ik tot de conclusie dat ik de rest als tekst zal doen in StoryBoard, dan heb ik Taalmogelijkheden. de rest wordt Engels.
        func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                completion()
            }
        }
        delayWithSeconds(0) {
                        self.performSegue(withIdentifier: "Doorstuur", sender: nil)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "Doorstuur", sender: nil)

    }
}

// MARK: Reason code switch
// MARK: FurtherPathChoice

class SelectionOfFuturePathView: UIViewController {
    /* I just remembered most things are in Dutch if I do it coding, and since I love the ability to add multiple languages, and I do not know how to do this in Code, I will do it all within StoryBoard, the calling. Base Localization normally fixes these issues.
     
     please note that all things seen here and around have been learnt in the last 8 months. What if I were to have a Job in a sector helping me expand? We will either learn that together, or not.
     */
    
    @IBOutlet weak var RoundOldschool: UIView!
    @IBOutlet weak var RoundPlain: UIView!
    @IBOutlet weak var RoundWriter: UIView!
    @IBAction func WritersStyle(_ sender: Any) {
        NSLog("hahaha it seems you chose my favorite format.")
        UserDefaults.standard.set(true, forKey: "WriterSeen")
    }
    @IBOutlet weak var WriterSeen: UIImageView!
    @IBOutlet weak var PlainSheetSeen: UIImageView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        RoundPlain.layer.cornerRadius = 25
        RoundWriter.layer.cornerRadius = 25
        RoundOldschool.layer.cornerRadius = 25
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "WriterSeen") == false {
            WriterSeen.isHidden = true}
        //closed ifstatent
        
    }
}
// MARK: WriterView

class WritersView: UITableViewController {
    // If i have to declare my name somewhere i will do it with a var. thats easier and more fun.
    @IBOutlet weak var NameLBL: UILabel!
    // Tag area.
    @IBOutlet weak var SwiftLabel: UILabel!
    @IBOutlet weak var PentestLabel: UILabel!
    @IBOutlet weak var AppleFanboyLabel: UILabel!
    @IBOutlet weak var MotivationDisclaimer: UILabel!
    
    @IBAction func PressedInterested(_ sender: UIButton) {
        
        let alert = UIAlertController(title:"Outlet Choice", message: "Thank you for giving me the honor of joining your work force! Have you read the additional information too? There are some really important details there.", preferredStyle: .alert)
        let dismissToCheck = UIAlertAction(title:"I want to read it now", style: .default)
        
        
        
        alert.addAction(dismissToCheck)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // Disclaimer land
    @IBOutlet weak var PersonalDisclaimer: UILabel!
    
    
    override func viewDidLoad() {
        // for fun
        NameLBL.text = "*snap*"
       
        let ColorSetAquaBlue = UIColor(red: 40/255, green: 113/255, blue: 134/255, alpha: 0.5)
        // Too much code for not that much additional context.
        
        SwiftLabel.backgroundColor = ColorSetAquaBlue; SwiftLabel.layer.cornerRadius = 3; SwiftLabel.layer.borderWidth = 1; SwiftLabel.layer.borderColor = UIColor.systemBlue.cgColor; SwiftLabel.layer.masksToBounds = true
        
        PentestLabel.backgroundColor = ColorSetAquaBlue;PentestLabel.layer.cornerRadius = 3; PentestLabel.layer.borderWidth = 1; PentestLabel.layer.borderColor = UIColor.systemBlue.cgColor; PentestLabel.layer.masksToBounds = true
        
        AppleFanboyLabel.backgroundColor = ColorSetAquaBlue; AppleFanboyLabel.layer.cornerRadius = 3; AppleFanboyLabel.layer.borderWidth = 1; AppleFanboyLabel.layer.borderColor = UIColor.systemBlue.cgColor; AppleFanboyLabel.layer.masksToBounds = true
        
        // here we go again...
        PersonalDisclaimer.backgroundColor = UIColor.systemRed
        PersonalDisclaimer.layer.cornerRadius = 3
        PersonalDisclaimer.layer.masksToBounds = true
        PersonalDisclaimer.textColor = UIColor.white
        
        MotivationDisclaimer.backgroundColor = UIColor.systemRed
        MotivationDisclaimer.layer.cornerRadius = 3
        MotivationDisclaimer.layer.masksToBounds = true
        MotivationDisclaimer.textColor = UIColor.white
        
        
    }
    
    
    // overriding view's properties
    override func viewDidAppear(_ animated: Bool) {
        NameLBL.text = DevName
       
    }
    
    
    
    
}
import WebKit
// MARK: Goodbye View
///  I hope the code here is not going to be neccesary; This will be the code that will take most of my time too because I do not want Safari to be opened afterwards. Yet it does that. Wellp it works. Since it means you do not want me, whatever. lego!

class Goodbye: UIViewController {
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This is a very not-save method of doing this, but I dont plan on keeping the bot afterwards anyways.
        let TestMessageVal =  "Thanks,+but+No+thanks"
         let urlm = URL(string: "https://api.telegram.org/bot800357411:AAEfoL1Uf_G6fMBqf9saLlOvaeZIOzemEkA/sendMessage?chat_id=525497557&text=Hey+there,+\(TestMessageVal)")
        if #available(iOS 10.0, *) {
        UIApplication.shared.open(urlm!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(urlm!)
        }
    }
}
// MARK: LoginView

class LoginView: UIViewController {
    @IBOutlet weak var Enterbuttn: UIButton!
    @IBOutlet weak var signupbttn: UIButton!
    
    @IBAction func Exitbutton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var paswordfield: UITextField!
    
    override func viewDidLoad() {
        Enterbuttn.layer.cornerRadius = 15
        Enterbuttn.backgroundColor = UIColor.systemBlue
        signupbttn.layer.cornerRadius = 15
        signupbttn.backgroundColor = UIColor.systemBlue
        
    }
    
}
// MARK: MoreInfoViews

class MoreInfoIntern: UIViewController {
    
    @IBOutlet weak var Dismiss: UIButton!
    @IBAction func DismissPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ahum
        Dismiss.layer.backgroundColor = UIColor.systemBlue.cgColor
        Dismiss.layer.cornerRadius = 12
    }
}
class MoreInfoHacker: UIViewController {
    
    @IBOutlet weak var Dismiss: UIButton!
    @IBAction func DismissPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ahum
        Dismiss.layer.backgroundColor = UIColor.systemBlue.cgColor
        Dismiss.layer.cornerRadius = 12
    }
}


class MyItems: UITableViewController {
    @IBOutlet weak var MyImage: UIImageView!
    override func viewDidLoad() {
        MyImage.layer.borderWidth = 3
        MyImage.layer.borderColor = UIColor.gray.cgColor
        MyImage.layer.cornerRadius = 45
        MyImage.layer.backgroundColor = UIColor.darkGray.cgColor
        
    }
    
}

// MARK: PlainSheet Style

// Will contain just 3 Views.

class PlainSheet: UITableViewController {
    // I will now have to learn how to do localization from code. Nice...
    
    @IBAction func DetailsCrew(_ sender: UIButton) {
        let alert = UIAlertController(title:"Crew", message: "Just an usual member, nothing really special. I did succesfully gain a recommendation from others on Google Reviews, while our restaurant is rated low.", preferredStyle: .alert)
        let dismissDC = UIAlertAction(title: "Okay", style: .default)
        
        alert.addAction(dismissDC)
        NSLog("Why did I need to do this again? oh wait, I dont have the requested education so I show off whatever I can.")
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func InternDetails(_ sender: UIButton) {
        let alert = UIAlertController(title:"CISO Internship", message: "This was temparary internship. There are more details in the PowerUserView options.", preferredStyle: .alert)
        let dismissInternDetails = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissInternDetails)
        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var GreyHatTag: UILabel!
    
    @IBAction func GreyDetails(_ sender: UIButton) {
        let alert = UIAlertController(title:"Grey Hat", message: "This assignment was taken upon myself when others were trying to hurt the system. I reported containment failures, and to prevent further abuse, continuously researched other failing restrictions. These actions normally were justified afterwards; Therefore I see it as Grey.", preferredStyle: .alert)
        let dismissGreyDetails = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissGreyDetails)
        self.present(alert, animated: true, completion: nil)
    }
    // MARK: Qualities
    
    @IBAction func FastLearnerInfo(_ sender: UIButton) {
        let alert = UIAlertController(title:"Fast learner", message: "I have learned to master Powershell while the focus was on other things. I can read any script and understand most of its purpose. And if I read any other code, I do understand it fully. I for example have learned many things about Swift in less than a year, while the total time I spent is less than I would spend on it if I were to work for you; I would have had more time in the first month than I have had now", preferredStyle: .alert)
        let dismissFastLearnerDetails = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissFastLearnerDetails)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func JobFocussedInfo(_ sender: UIButton) {
        let alert = UIAlertController(title:"Job Focussed", message: "The bible asks us to be devoted to whatever we do as if we would do that for God. I not only would do this work the best way I can, I would do it with enjoyment; I love coding, designing UIs, and I want to do it the best way possible.", preferredStyle: .alert)
        let dismissJobFocussedDetails = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissJobFocussedDetails)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func PersistentInfo(_ sender: UIButton) {
        let alert = UIAlertController(title:"Persistent", message: "I am unable to say'I failed so I give up.' I will carry onwards. Therefore I am not scared to see a project I cannot handle on my own.", preferredStyle: .alert)
        let dismissPersistentDetails = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissPersistentDetails)
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func TeamPlayerInfo(_ sender: UIButton) {
        let alert = UIAlertController(title:"Team Player", message: "Many people rather work on their own. Although I like working alone, I still do need a leader in projects. For this project to be made within short time, was a goal, a plan of approach, and a lot of effort to get the time. If there were to be a project leader, an UI Designer, and a backend-builder, I would have had a much easier time. Now I have a hard time managing all. ", preferredStyle: .alert)
        let dismissTPDetails = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissTPDetails)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func MoralInfo(_ sender: UIButton) {
        // This might be something that will make me being turned down, but I actually have to write this.
        
        let alert = UIAlertController(title:"Moral Code", message: "The Bible mentions some things that I just cannot help with. With these, I will not be able to help; for example: I cannot work on an app for - recreational drugs -cheating on marriage partners -pride month updates for apps -gambling. I work honestly, I will not lie, cheat, fraud, or steal others work and say it is mine without proper crediting.", preferredStyle: .alert)
        let dismissMoralCodeDetails = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissMoralCodeDetails)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HighSchoolDetails(_ sender: UIButton) {
        let alert = UIAlertController(title:"High School", message: "I finished High School without any inadequate grades. I passed for every test; I did this with less effort, and was acknowledged for this; I got a certificate as a 'Thank You' for helping with the IT Department. They said: 'He spent more effort on protecting the network than school'. This was because School only gives theory, and any InfoSec /  Programming job requires experience, not just theory.", preferredStyle: .alert)
        let dismissHSD = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissHSD)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func SelfLearingDetails(_ sender: UIButton) {
        let alert = UIAlertController(title: "Self-Learning", message: "I have been taking an interest in coding in general. I started as a scripter; Powershell was my main. This too was self-learned. I used this to learn as much as I could about ActiveDirectories, which were within my Scope for the pentests. Now, a short time later, I have started with teaching myself Swift; for the main purpose of building amazing apps. The main benefit will be that I can be formed into whatever is required for a project, and this will become my main method.", preferredStyle: .alert)
        let dismissSLD = UIAlertAction(title: "Cool", style: .default)
        alert.addAction(dismissSLD)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func CompTIA(_ sender: UIButton) {
        let alert = UIAlertController(title: "CompTIA Security+ training", message: "I have followed the course. I have not gone further to get myself the certification, but I did finish the course on Cybrary.IT", preferredStyle: .alert)
        let dismissCompTIA = UIAlertAction(title:"Okay", style: .default)
        alert.addAction(dismissCompTIA)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func JehovahsWitness(_ sender: UIButton) {
        let alertmessage = "Being a Jehovah's Witness means following the moral guidelines set within the Bible. "
        let alert = UIAlertController(title: "Jehovah's Witness", message: alertmessage, preferredStyle: .alert)
        let dismissJehovahsWitness = UIAlertAction(title: "Okay", style: .default)
        
        alert.addAction(dismissJehovahsWitness)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var ImportantBubble: UILabel!
    override func viewDidLoad() {
        // GreyHatTag changes
        GreyHatTag.layer.cornerRadius = 5; GreyHatTag.layer.masksToBounds = true; GreyHatTag.layer.borderColor = UIColor.lightGray.cgColor; GreyHatTag.layer.borderWidth = 2
        ImportantBubble.layer.cornerRadius = 5; ImportantBubble.layer.masksToBounds = true; ImportantBubble.layer.borderColor = UIColor.red.cgColor; ImportantBubble.layer.borderWidth = 2; ImportantBubble.layer.backgroundColor = UIColor.systemRed.cgColor
        
    }
    
    
    
}
class MotiviatieView: UIViewController {
    let Motivatiebrief = "Hallo! Dit lijkt mij een schitterende baan; Dit is een kans voor mij om te kunnen starten, al ben ik niet vanuit school opgeleid voor deze baan. Ik wil indien mogelijk heel graag bij jullie werken!"
    let Motivatiebrief2 = "Ik heb structuur nodig om werk te kunnen doen. Mijn SolicitatieApp heb ik gemaakt door een periode van 1 maand, door elke dag zo;n 10 minuten eraan te besteden. Ik ben bereid om 2 dagen voor jullie te werken, de maandag en dinsdag. Ik hoop dat het geen probleem is dat ik part-time wil werken."
    let Motiviatiebrief3 = "Ik houd heel veel van schone code; het meeste wil ik zo overzichtelijk mogelijk hebben. Ik kan in elke mogelijke manier werken, en ik weet niet wat jullie overzichtelijk vinden; zo veel mogelijk nieuwe regels, zo min mogelijk, wat jullie willen kan ik maken. Vraag om een type UserInterface die ik niet ken, dan tackle ik het en breng er heel snel eentje op de been voor jullie. Ik ben geen fan van Templates, en ik begrijp Constraints, terwijl de meesten dit niet echt doen."
    let Motiviatiebrief4 = "Ik heb niet bepaald veel kennis van BackEnd ontwikkelingen in iOS; Ik hoop dat jullie me er veel over kunnen leren, anders ben ik slechts een FrontEnd Developer. Als ik code lees, begrijp ik meestal, als niet altijd, wat er staat en/of doet."
    
    @IBOutlet weak var Motivatie1: UILabel!
    @IBOutlet weak var Motivatie2: UILabel!
    @IBOutlet weak var Motivatie3: UILabel!
    
    @IBOutlet weak var Motivatie4: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
  
        
    
}

//import ARKit
class OOPSIE: UIViewController {
    func GotHere() {
        NSLog("Is this called?")
        let alertmessage = "As I was working on this in another Project, so it took less time to open StoryBoard, There is an error. I will try to fix this later on, but this is a safeguard. Sorry for letting you be stuck with a dead button! I have formulated it into a .txt, I hope that is enough. Sorry for all the trouble! "
        let alert = UIAlertController(title: "Warning for Error", message: alertmessage, preferredStyle: .alert)
        let dismissWarning1 = UIAlertAction(title: "Okay", style: .default)
        
        alert.addAction(dismissWarning1)
        present(alert, animated: true, completion: nil)
        // I honestly wanted to add a Pong-esque game with Swift, ARKit, a randomizer, and a few UIViews... But I want to apply before time runs out. sorry!
    }
    override func viewDidAppear(_ animated: Bool) {
       GotHere()
    }
}
