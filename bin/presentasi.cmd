::/*#! 2> /dev/null                                 #
@ 2>/dev/null # 2>nul & echo off & goto BOF         #
if [ -z ${SIREUM_HOME} ]; then                      #
  echo "Please set SIREUM_HOME env var"             #
  exit -1                                           #
fi                                                  #
exec ${SIREUM_HOME}/bin/sireum slang run "$0" "$@"  #
:BOF
setlocal
if not defined SIREUM_HOME (
  echo Please set SIREUM_HOME env var
  exit /B -1
)
%SIREUM_HOME%\bin\sireum.bat slang run "%0" %*
exit /B %errorlevel%
::!#*/
// #Sireum

import org.sireum._
import org.sireum.presentasi._
import org.sireum.presentasi.Presentation._

val home = Os.slashDir.up.canon
val resources = home / "jvm" / "src" / "main" / "resources"
val image = resources / "image"
val video = resources / "video"
val audio = resources / "audio"

val delay = 700

val isRyan: B = Os.cliArgs match {
  case ISZ(string"Azure", "default", _*) => T
  case _ => F
}

val sireumW = "Seereum"

val logikaW = "Logeeka"

val hamrW = "Hammer"

val camkesW = "Cam Keys"

val intellijW = "IntelliJay"

val sel4W: String = if (isRyan) "S.E.L. 4" else "essy L4"

val aadlW: String = if (isRyan) "A.A.D.L." else "A A D L"

val dodW: String = if (isRyan) "DoD" else "D O D"

val smtW: String = if (isRyan) "SMT" else  "S M T"

val sbirW = "sibber"

val unswW: String = if (isRyan) "U.N.S.W." else "U N S W"

val cW: String = if (isRyan) "C" else "see"

val ideW: String = if (isRyan) "I.D.E." else "I D E"

val intro = Slide(
  path = (image / "01-intro.png").string,
  delay = 0,
  text =
    s"""
     [1000]
     Hello!
     [250]
     We'd like to share with you some tools that we are developing for building verified applications on top of $sel4W.
     [250]
     This work is funded primarily by a DARPA Phase 2 $sbirW, along with other related $dodW projects.
     """
)

val vision1 = Slide(
  path = (image / "02-vision-01-sel4-1.png").string,
  delay = 0,
  text =
    s"""
     This conference series got started due to the success of $sel4W, whose formal verification
     has been a significant success story in the formal methods and security communities.
     [250]
     In this talk, we are interested in exploring how we can continue to build on this great foundation.
     """
)

val vision2 = Slide(
  path = (image / "02-vision-02-sel4-2.png").string,
  delay = 0,
  text =
    s"""
     In particular, how can we provide tools to build verified applications on top of the $sel4W verified infrastructure?
     What are characteristics of the programming languages that we might use?
     [250]
     $sel4W is written in $cW.  Can we, or should we, use something else for applications?
     [250]
     What types of formal methods should be used?
     [250]
     $sel4W verification translated C code into representations in the Isabelle theorem prover,
     and verification was done within the theorem prover itself.  Might we do something different for applications?
     [250]
     Moreover, development is not just getting code right, it involves connecting to designs requirements
     and a host of other artifacts, so how should we accomplish that?
     [250]
     And how should we engineer our verification tools for continuous integrated delivery of formal verification?
     """
)

val vision3 = Slide(
  path = (image / "02-vision-03-hamr-1.png").string,
  delay = 0,
  text =
    s"""
     In a tutorial session on Monday, we presented part of our vision for building verified applications on $sel4W.
     [250]
     In particular, we showed how our $hamrW framework, developed under the DARPA CASE program with
     Collins Aerospace and $unswW, enables engineers to design their systems using the $aadlW
     industry standard modeling language, that provides key abstractions for building analyzable real-time embedded systems.
     """
)

val vision4 = Slide(
  path = (image / "02-vision-04-hamr-2.png").string,
  delay = 0,
  text =
    s"""
    To summarize, $hamrW enables engineers to use those models to automatically configure  $sel4W to enforce spatial and temporal partitioning.
    """
)

val vision5 = Slide(
  path = (image / "02-vision-05-hamr-3.png").string,
  delay = -500,
  text =
    s"""
    [-800]
    It also generates application code skeletons to help developers program their application logic in a way that guarantees that the system is aligned with the structure and semantics of the design.
    """
)

val vision6 = Slide(
  path = (image / "02-vision-06-hamr-4.png").string,
  delay = -500,
  text =
    s"""
    [-800]
    and then automatically generate system builds for deployment on $sel4W
    """
)

val vision7 = Slide(
  path = (image / "02-vision-07-hamr-aspects-1.png").string,
  delay = 0,
  text =
    s"""
    To a large extent, $hamrW already provides some key aspects of our vision for verified application development on $sel4W
    """
)

val vision8 = Slide(
  path = (image / "02-vision-08-hamr-aspects-2.png").string,
  delay = -500,
  text =
    s"""
    [-800]
    Firstly, it connects $sel4W deployments to formal and analyzable architecture models in a standardized modeling language
    """
)

val vision9 = Slide(
  path = (image / "02-vision-09-hamr-aspects-3.png").string,
  delay = -500,
  text =
    s"""
    [-800]
    System builds are organized, in part via the model, as an easy-to-understand and exchangeable visual artifact that
    provides a true picture of the system’s structure
    """
)

val vision10 = Slide(
  path = (image / "02-vision-10-hamr-aspects-4.png").string,
  delay = -500,
  text =
    s"""
    [-800]
    Safety and security aspects such as partitioning, information flow controls, and correctness properties
    reflected in the model, are guaranteed to be manifested in the deployed system
    """
)

val vision11 = Slide(
  path = (image / "02-vision-11-hamr-aspects-5.png").string,
  delay = -500,
  text =
    s"""
    [-800]
    System updates, reflected as changes to the model, can be rapidly reflected as a change
    in the build and deployment via automated code regeneration, which is a DARPA CASE theme
    """
)

val vision12 = Slide(
  path = (image / "02-vision-12-pl-1.png").string,
  delay = 0,
  text =
    s"""
    Given that $hamrW is beginning to address connections to designs models and the broader development context,
    in this talk, we want to share some of our vision for the remaining aspects circled below.
    """
)

val vision13 = Slide(
  path = (image / "02-vision-13-pl-2.png").string,
  delay = 0,
  text =
    s"""
    On Monday, we illustrated that $hamrW application logic can be programmed in $cW to help start the integration
    with legacy development practices.
    [250]
    However, our vision for programming new high-assurance applications leverages capabilities afforded by
    more modern languages.
    [250]
    In particular, developing high assurance applications for $sel4W
    can benefit from modern languages that have the following characteristics.
    [250]
    It is amenable to highly-automated, usable, and scalable formal verification, and
    effective for programming embedded safety and security critical systems.
    [250]
    It integrates easily with existing languages such as $cW, and
    with model-driven development as emphasized by the $dodW Digital Transformation.
    """
)

val vision14 = Slide(
  path = (image / "02-vision-14-tool.png").string,
  delay = 0,
  text =
    s"""
    So today we are going to tell you about out vision for this space based on a programming language called
    Slang, and an accompanying verification environment called $logikaW.
    [250]
    These tools are all part of Kansas State’s $sireumW high assurance system engineering platform.
    """
)

val slang1 = Slide(
  path = (image / "03-slang-1.png").string,
  delay = 0,
  text =
    s"""
     Slang is a safety critical subset of Scala with a simplified semantics.
     [250]
     Due to Scala's tight relation with Java, Slang benefits from the Java and Scala ecosystems which have
     strong tool support such as integrated development environments.
     [250]
     Moreover, Slang can be cross-compiled to Javascript via Scala J S, which is handy to develop
     rich web applications such as standalone and browsable interactive analysis reports and system simulations.
     [250]
     In addition, Slang can also be compiled ahead-of-time to native using Oracle's Graal V M, which avoids
     JVM boot up time and reduces footprint costs.
     [250]
     Slang offers a clean and unified facility to interoperate with existing libraries and host languages
     on all of its supported target platforms.
     [250]
     Another reason for building on Scala is that it has an extensible compiler architecture,
     and this enabled us to insert custom program transformations phases in the standard
     Scala compiler to implement the simplified Slang semantics.
     """
)

val slang2 = Slide(
  path = (image / "03-slang-2.png").string,
  delay = 0,
  text =
    s"""
     Due to its careful design, Slang is also effective for programming embedded systems.
     [250]
     The Slang embedded subset can be translated to $cW without garbage collection runtime,
     which helps ensure predictable run-time behavior.
     [250]
     For achieving a higher level of assurance, the generated $cW code can be compiled
     using the CompCert Verified $cW compiler.
     [250]
     The generated $cW code can also be used to generate hardware by using
     available high level hardware synthesis toolchains.
     """
)

val slang3 = Slide(
  path = (image / "03-slang-3.png").string,
  delay = 0,
  text =
    s"""
     To support formal verification,
     Slang includes both developer-friendly contract and proof languages,
     which have full support within the development environment.
     """
)

val slang4 = Slide(
  path = (image / "03-slang-4.png").string,
  delay = 0,
  text =
    s"""
     To support automated verification of contracts and proofs,
     Slang is designed from the outset for program verification and other safety
     and security analyses.
     [250]
     Simplification of language features is key to reduce the developer's reasoning burden and formal analysis costs.
     [250]
     For example, we restrict where aliasing can be introduced to a single programming language
     construct, that is, method invocation, which is also the typical target boundary for
     compositional reasoning.
     [250]
     Thus, aliasing can be analyzed hand-in-hand with other program properties of interests.
     """
)

val logika1 = Slide(
  path = (image / "04-logika-1.png").string,
  delay = 0,
  text =
    s"""
     To support developer-friendly Slang verification,
     $logikaW provides code-level $ideW integrated verification of Slang's contract and proof languages.
     """
)

val logika2 = Slide(
  path = (image / "04-logika-2.png").string,
  delay = 0,
  text =
    s"""
     Verification is highly automated by using a suite of state-of-art $smtW solvers
     that work in the background to provide continuous delivery of program checking
     """
)

val logika3 = Slide(
  path = (image / "04-logika-3.png").string,
  delay = 0,
  text =
    s"""
     This continuous, always on, verification is enabled by a significant tool engineering effort.
     In particular, $logikaW is able to provide smart incremental checking that is triggered by editor
     actions.
     """
)

val logika4 = Slide(
  path = (image / "04-logika-4.png").string,
  delay = 0,
  text =
    s"""
     This incremental checking is key to scalability.
     [250]
     When updates are made in the editor, it enables $logikaW to re-check only the code changed.
     [250]
     Scalability is also enabled by a powerful server-based architecture that provides massive
     parallelization of the formal verification.
     [250]
     This provides a foundation for scalable cloud-based delivery of verification resources for on-demand
     servicing of verification needs.
     """
)

val logika5 = Slide(
  path = (image / "04-logika-5.png").string,
  delay = 0,
  text =
    s"""
     Finally, since we realize that not all verification can be automated,
     $logikaW provides what we call deep-dive gateways in both the verification
     tool and in the proof notations to allow expert-level engineers to
     drill down into verification details and to introduce
     manual proof engineering when needed.
     """
)

val logikaThemes1 = Slide(
  path = (image / "05-logika-themes-1.png").string,
  delay = 0,
  text =
    s"""
    We'll now provide a series of demos illustrating Logika Themes.
    """
)

val logikaThemes2 = Slide(
  path = (image / "05-logika-themes-2.png").string,
  delay = 0,
  text =
    s"""
    Let's start with these first three themes.
    Democratization of Formal Methods,
    Integration into Industrial Tools, and
    Continuous Delivery of Formal Verification.
    """
)

val demoLogika01 = Video(
  path = (video / "06-demo-logika-intro.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 0.0,
  end = 0.0,
  textOpt = Some(
   s"""
    We'll see how these are addressed by integrating Logika into $intellijW,
    the most widely used industrial $ideW for Scala development.
    [250]
    $intellijW provides extension points for customizing its Scala type checker, so we can adapt it to work nicely with Slang.
    """
  )
)

val demoLogika02 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = -3000,
  volume = 0.0,
  rate = 1.0,
  start = 15066.7,
  end = 24000.0,
  textOpt = Some(
    s"""
     Slang analysis engines, such as $logikaW, runs as a $sireumW micro service in the background.
     [250]
     Here, we have some example code with data structures inspired from an unmanned aerial vehicle mission control system.
     [250]
     The example declares an immutable Waypoint datatype that holds coordinate information.
     [250]
     A mission typically consists of a sequence of waypoints such as what is stored in S one, which is of mutable sequence type.
     [250]
     As $logikaW works, it decorates program editors to communicate its analysis feedback.
     """
  )
)

val demoLogika03 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 26500.0,
  end = 30000.0,
  textOpt = Some(
    s"""
     It decorates each statement with its precondition state claims that it computes,
     """
  )
)

val demoLogika04 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = -2000,
  volume = 0.0,
  rate = 1.5,
  start = 30000.0,
  end = 47000.0,
  textOpt = Some(
    s"""
     [${-2 * delay}]
     which aids program reasoning while also serving as auditable evidence.
     [250]
     The state claims are naturally represented at the Slang source level,
     [0]
     and as you can observe, the claims are intuitive as there is no heap object representation, pointers, or references.
     [250]
     This is the direct result of Slang language simplification, which both reduces our reasoning mental model burden
     and helps scale Slang analyses.
     """
  )
)

val demoLogika05 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 54500.0,
  end = 57500.0,
  textOpt = Some(
    s"""
     $logikaW also decorates the editors with verification condition checking results, in this case, by using $smtW query solving.
     [250]
     Each query is annotated with solving result, as well as its solving parameters, which can be configured by users.
     """
  )
)

val demoLogika06 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 63000.0,
  end = 69000.0,
  textOpt = Some(
    s"""
     Each sequence or array access is implicitly bound-checked to ensure that it does not produce runtime error or buffer overflow.
     """
  )
)

val demoLogika07 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 69000.0,
  end = 80000.0,
  textOpt = Some(
    s"""
     Suppose that we seed an out of bound access. $logikaW analysis in the background continuously give direct verification feedback upon code change.
     [250]
     We believe such seamless integration into typical development workflow is key to formal method success.
     """
  )
)

val demoLogika08 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 92000.0,
  end = 102000.0,
  textOpt = Some(
    s"""
     As issues are fixed, $logikaW re-verifies the code and can confirm that such issues have been properly addressed.
     [250]
     We like this line editor decoration feedback mechanism because it gives a sense of analysis coverage,
     which feels familiar to the line coverage information in testing.
     """
  )
)

val demoLogika09 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 103750.0,
  end = 118250.0,
  textOpt = Some(
    s"""
     Let us now start adding some explicit assertions to confirm our understanding of the program behaviors.
     [250]
     For example, we can assert that the first element of S two is a waypoint holding the coordinate one, two, and three, as assigned at line fourteen.
     [250]
     Obviously, such assertion should hold and it is confirmed by $logikaW as the feedback decoration does not indicate that there is an issue.
     """
  )
)

val demoLogika10 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 118250.0,
  end = 135000.0,
  textOpt = Some(
    s"""
     Suppose that we assert the same for the first element of S one.
     [250]
     This is where Slang differs from Scala or Java where a deep copy of S one was made at line eleven before assigning to S two.
     [250]
     Thus, the assertion is invalid.
     """
  )
)

val demoLogika11 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 142500.0,
  end = 153500.0,
  textOpt = Some(
    s"""
     We can confirm such behavior by running the program,
     by clicking the green play icon at the top of the program editor,
     and it will trigger code compilation.
     [250]
     Once it finishes, the resulting code is then run, which in this case, triggers an assertion error, as $logikaW has warned us.
     [250]
     This illustrates how one can test and prove their code in the same $sireumW verification environment.
     """
  )
)

val demoLogika12 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 161500.0,
  end = 173750.0,
  textOpt = Some(
    s"""
     Due to the deep copy, the value of S one should not be affected, and it is the same as what assigned at line ten.
     [250]
     We can ask $logikaW to confirm it for us by asserting it.
     [250]
     One might think that such deep copying might produce less than ideal performant code,
     however, in many cases, the performance differences do not matter as much as what we might have thought.
     [250]
     On cases where they do matter, there are effective programming patterns and principles that can be applied,
     which are discussed in the Slang Isola paper appeared last year.
     """
  )
)

val demoLogika13 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 2.0,
  start = 173750.0,
  end = 179500.0,
  textOpt = Some(
    s"""
     Let us now look at more interesting properties.
     """
  )
)

val demoLogika14 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 181000.0,
  end = 197500.0,
  textOpt = Some(
    s"""
     I am going to copy and paste some prepared code to save time.

     [250]
     You can observe that the added methods have some contract annotations.
     [250]
     Both inZone and W P diff are strictly pure methods, which do not make side effects.
     [250]
     Such methods can be directly used in contract specifications, as shown in move waypoint X,
     which has the typical pre and post conditions.
     [250]
     Move waypoint X itself is a pure method, which means that
     there is no observable side-effect from the outside of the method.
     [250]
     As can be observed, we leverage Scala syntax to express specification.
     The Contract specification at line 28 is implemented by using a Scala macro
     which is erased before code generation, thus,
     the specification does not affect the code runtime behaviors.
     [250]
     In the future, it is possible to introduce a runtime assertion checker tool
     that weaves in contracts as assertions for testing purposes, or dynamic enforcement.
     """
  )
)

val education = Slide(
  path = (image / "07-education.png").string,
  delay = 0,
  text =
    s"""
    Regarding democratization of formal methods, it is interesting to note that
    the first version of $logikaW, which was much less ambitious,
    was developed to support teaching of a required undergraduate course at Kansas State
    on logic and program verification.
     """
)

val educationWeb = Video(
  path = (video / "08-education-web.mp4").string,
  delay = -2000,
  volume = 0.0,
  rate = 1.00,
  start = 0.0,
  end = 0.0,
  textOpt = Some(
    s"""
     It has proven very fruitful. For the past five years, the tool has been used to teach
     over one thousand K-State undergraduates.
     [250]
     Moreover, $logikaW has been adopted by others, for example, to teach undergraduate and
     graduate courses at Aarhus University in Denmark.
     [250]
     The accompanying course notes are publicly available online.
     [250]
     Here you can observe the manual program proofs which we then switch students to automated
     verification via symbolic execution and SMT2 solving.
     [250]
     This teaching experience demonstrates that it is possible to lower the barrier of entry
     for proving program safety and security even to the undergraduate level,
     with proper training and good tool support.
     """
  )
)

val logikaThemes3 = Slide(
  path = (image / "09-logika-themes-incremental.png").string,
  delay = 0,
  text =
    s"""
    Now let's consider the theme of incremental checking by first discussing
    some of the details of the $sireumW code base.
    """
)

val codebase1 = Slide(
  path = (image / "10-codebase-1.png").string,
  delay = 0,
  text =
    s"""
    Up to this point, we’ve been demoing Slang and $logikaW on some small script files.
    [250]
    So you may be wondering, does all of this work “at scale”?
    [250]
    The answer is Yes!
    """
)

val codebase2 = Slide(
  path = (image / "10-codebase-2.png").string,
  delay = 0,
  text =
    s"""
    In addition to applying Slang and $logikaW with our industrial partners on various $dodW projects,
    we also validate the design and scalability of Slang tooling by applying them when developing the $sireumW code base itself,
    which includes Slang, $hamrW, and $logikaW.
    [250]
    The code base is around two hundred and ten thousand lines of code, with eighty five percent of the code base,
    or around one hundred and eighty thousand lines of code, is written in Slang.
    [250]
    So not only does that validate the effectiveness of Slang for coding large applications,
    """
)

val codebase3 = Slide(
  path = (image / "10-codebase-3.png").string,
  delay = -2000,
  text =
    s"""
    [-1500]
    it means that we can also apply $logikaW to verify portions of $sireumW,
    including our $hamrW code generation pipelines for $sel4W as well as the $logikaW implementation itself.
    """
)

val codebase4 = Slide(
  path = (image / "10-codebase-4.png").string,
  delay = 0,
  text =
    s"""
    This provides a pathway for eventually mechanizing the proofs of correctness
    of our own verification, analysis, and code generation tools.
    [250]
    We're currently applying these idea to $hamrW infrastructure code generated for $sel4W.
    """
)

val codebase5 = Slide(
  path = (image / "10-codebase-5.png").string,
  delay = 0,
  text =
    s"""
    We're now going to demonstrate that the same continuous integrated verification that worked for small programs
    also works when $logikaW is applied to this large code base.
    [250]
    This is possible due to our carefully engineered approach for incremental and focused checking.
    """
)

val demoOption1 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 3.0,
  start = 366000.0,
  end = 370000.0,
  textOpt = Some(
    s"""
     Let's look at the implementation of the option type.
     [250]
     Option is part of the Slang runtime library that is part of $sireumW.
     """
  )
)

val demoOption2 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 380000.0,
  end = 380500.0,
  textOpt = Some(
    s"""
     Here you can see that the Slang implementations include some very basic contracts.
     [250]
     For this example, the size of the contract and associated code is not important.
     """
  )
)

val demoOption3 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = -1000,
  volume = 0.0,
  rate = 1.0,
  start = 380500.0,
  end = 385000.0,
  textOpt = Some(
    s"""
     The main point is that $logikaW verification will be triggered by
     edits in the file to start the checking process.
     [250]
     Then, the $logikaW incremental analysis framework will use module dependency information for
     the entire code base and figure out a minimal amount of work to verify the body of this method.
     [250]
     You just saw a moment ago that $logikaW was able to quickly conclude its checking to find a contract violation in less than a second.
     """
  )
)

val demoOption4 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = -1000,
  volume = 0.0,
  rate = 1.0,
  start = 386250.0,
  end = 390000.0,
  textOpt = Some(
    s"""
     Then, when we correct the error, $logikaW can conclude almost immediately that method satisfies its contract.
     """
  )
)

val codebaseGraph = Slide(
  path = (image / "11-codebase-graph.png").string,
  delay = 0,
  text =
    s"""
     [1500]
     $logikaW incremental checking leverages project codebase modularity for scaling its analysis
     and optimizing user interactions.
     [250]
     Just like an incremental build tool, it understands the dependence relationships between modules
     as captured in the system's build specification.  For example, the modules and
     dependences reflected in the $sireumW code base build specification are diagrammed here.
     [250]
     Using this information, when a file is edited or a current point in the program
     is selected for verification, $logikaW can avoid examining code not needed for the
     verification of the current section of code.
     """
)

val codebaseIncremental1 = Video(
  path = (video / "12-codebase-incremental.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 0.0,
  end = 1700.0,
  useVideoDuration = T,
  textOpt = Some(
    s"""
     Let me describe how it works, intuitively.
     """
  )
)

val codebaseIncremental2 = Video(
  path = (video / "12-codebase-incremental.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 1700.0,
  end = 2000.0,
  textOpt = Some(
    s"""
     [750]
     When a particular file such as Option is analyzed
     """
  )
)

val codebaseIncremental3 = Video(
  path = (video / "12-codebase-incremental.mp4").string,
  delay = -250,
  volume = 0.0,
  rate = 1.0,
  start = 2000.0,
  end = 5000.0,
  textOpt = Some(
    s"""
     [${-2 * delay}]
     $logikaW starts at the root modules and works downward in the project module dependency graph.
     """
  )
)

val incremental1 = Slide(
  path = (image / "13-incremental-1.png").string,
  delay = -2500,
  text =
    s"""
     [${-2 * delay}]
     until it finds the module where the file resides.
     """
)

val incremental2 = Slide(
  path = (image / "13-incremental-2.png").string,
  delay = 0,
  text =
    s"""
     Along the way, $logikaW only lightly analyzes the relevant
     modules.
     [250]
     That is, $logikaW employs the Slang frontend to parse and
     outline class, field, and method type signatures for all
     files in the modules, without fully type checking method bodies.
     """
)

val incremental3 = Slide(
  path = (image / "13-incremental-3.png").string,
  delay = 0,
  text =
    s"""
     Only the Option file is fully type checked, which then
     verified.
     [250]
     In the context where user is editing a particular method,
     the process is further optimized by focusing full type
     checking and verification to that method.
     """
)

val incremental4 = Slide(
  path = (image / "13-incremental-4.png").string,
  delay = 0,
  text =
    s"""
     Furthermore, $logikaW aggressively caches intermediate
     analysis results to speed up subsequent analyses.
     [250]
     For example, module-level file type information is soundly
     cached by file fingerprinting.
     [250]
     $smtW queries are also cached to speed up re-verification.
     [250]
     We found these to be very effective, especially so for
     providing continuous verification in an $ideW.
     [250]
     For less capable machines, $logikaW offers ways to tone
     down its caching strategies.
     """
)

val hamrAbstraction1 = Slide(
  path = (image / "14-hamr-abstraction-1.png").string,
  delay = 0,
  text =
    s"""
     So let’s start making a stronger connection to $sel4W by returning to this diagram from the beginning of the talk.
     """
)

val hamrAbstraction2 = Slide(
  path = (image / "14-hamr-abstraction-2.png").string,
  delay = 0,
  text =
    s"""
     We now want to show a demo where we use $hamrW, with components written in Slang, which can then be translated to C.
     [250]
     Recall that if you wish, the Slang code can first be tested in multiple platforms, including JVM and natively in Linux.
     [250]
     Also, you have the option of compiling the C with the verified CompCert compiler, which guarantees that the produced binary
     behaviors faithfully reflect the C source's.
     """
)

val hamrAbstraction3 = Slide(
  path = (image / "14-hamr-abstraction-3.png").string,
  delay = 0,
  text =
    s"""
     Moreover, we can use the Slang Contracts and Logika verification to formally verify correctness properties of the
     application code.
     [250]
     However, the story doesn’t end there.  We can keep scaling up through the abstraction stack.
     """
)

val hamrAbstraction4 = Slide(
  path = (image / "14-hamr-abstraction-4.png").string,
  delay = -delay,
  text =
    s"""
     [-$delay]
     On the GUMBO project, we are developing contract language for $aadlW that integrates features from other contract languages such as
     AGREE and BLESS.   This gives us the ability to have formally verified designs, also supported by $logikaW verification.
     $hamrW is being extended to automatically translate GUMBO contracts down into Slang contracts so that $logikaW
     can automatically prove that component implementations conform to model-level specifications.
     """
)

val tempControl1 = Slide(
  path = (image / "15-temp-control-1.png").string,
  delay = 0,
  text =
    s"""
     Here’s the example system that we used in our Monday tutorial.
     [250]
     We have a temperature sensor component that sends temperature values to a temperature controller.
     The controller will compare the temperature against some set points provided by an operator
     to determine if it should send commands to turn off or turn on the fan.
     """
)

val tempControl2 = Slide(
  path = (image / "15-temp-control-2.png").string,
  delay = 0,
  text =
    s"""
    Using $hamrW code generation, the application code for each of these components will be automatically
    deployed to separate $camkesW components to ensure partitioning when deployed to $sel4W.
    """
)

val tempControl3 = Slide(
  path = (image / "15-temp-control-3.png").string,
  delay = 0,
  text =
    s"""
    Using the GUMBO contract language, we'd like to be able to capture some of the important control
    laws of the component.  For example, if we get an updated temperature, what command
    should we send to the fan to change its state?
    """
)

val gumbo1 = Slide(
  path = (image / "16-gumbo-1.png").string,
  delay = 0,
  text =
    s"""
     Here is the GUMBO contract prototype that specifies the
     temperature controller's behaviors.
     """
)

val gumbo2 = Slide(
  path = (image / "16-gumbo-2.png").string,
  delay = 0,
  text =
    s"""
     The example contract consists of several cases
     that reflect the different operating scenarios derived from
     the system requirements.
     [250]
     For example, the first requirement indicates that if the sensed
     temperature is less than the preset range, then the fan should
     be turned off.
     [250]
     In addition to contract cases with frame conditions illustrated
     here, GUMBO includes other specification constructs such as
     component state and port invariants that we do not have time to discuss in this presentation.
     """
)

val demoTempControl1 = Video(
  path = (video / "17-demo-temp-control.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 0.0,
  end = 333.0,
  textOpt = Some(
    s"""
     So, what you are seeing here on the screen is the application code that the user has written for the temp control component.
     [250]
     The code has been placed inside of a template generated by $hamrW that also includes
     a contract auto-generated from the gumbo specification in the $aadlW model.
     """
  )
)

val demoTempControl2 = Video(
  path = (video / "17-demo-temp-control.mp4").string,
  delay = -5000,
  volume = 0.0,
  rate = 1.0,
  start = 333.0,
  end = 3000.0,
  textOpt = Some(
    s"""
     $logikaW has already automatically checked that the code conforms to contract.
     """
  )
)

val demoTempControl3 = Video(
  path = (video / "17-demo-temp-control.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 6000.0,
  end = 10000.0,
  textOpt = Some(
    s"""
     If we introduce a bug in the code by sending out the wrong command to the fan,
     $logikaW is able to immediately detect that contract violation.
     """
  )
)

val demoTempControl4 = Video(
  path = (video / "17-demo-temp-control.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 10000.0,
  end = 14333.0,
  textOpt = Some(
    s"""
     A problem marker and a tool tip shows us the particular clause of the contract that has been violated.
     """
  )
)

val demoTempControl5 = Video(
  path = (video / "17-demo-temp-control.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 14500.0,
  end = 0.0,
  textOpt = Some(
    s"""
     When the bug is removed, $logikaW is able to immediately confirm that contract is satisfied.
     """
  )
)

val parallel0 = Slide(
  path = (image / "18-logika-themes-parallel.png").string,
  delay = 0,
  text =
    s"""
     Let's now consider the Parallelization and Server-based Deployment theme.
     """
)

val parallel1 = Slide(
  path = (image / "19-parallel-1.png").string,
  delay = 0,
  text =
    s"""
     One key observation is that, as $logikaW works over the
     project module dependency graph, modules that are at the same
     depth level can be verified independently in parallel.
     """
)

val parallel2 = Slide(
  path = (image / "19-parallel-2.png").string,
  delay = 0,
  text =
    s"""
     Moreover, $logikaW's reasoning is compositional, thus,
     each program unit such as a method, or even each contract case
     of a method, can be verified in parallel.
     """
)

val parallel3 = Slide(
  path = (image / "19-parallel-3.png").string,
  delay = 0,
  text =
    s"""
     In the future, it is also possible to verify all project modules
     using different computing nodes, for example,
     in a cloud infrastructure to provide continuous verification
     with on-demand scaling of resources.
     [250]
     In such setup, each computing node can also provide parallel
     verification.
     [250]
     We believe parallelization and distributed analyses hold
     a great promise to help tackle scalability issues in
     applying formal methods.
     """
)

val parallel4 = Slide(
  path = (image / "19-parallel-4.png").string,
  delay = 0,
  text =
    s"""
     It is especially so when considering the trend towards
     remote development using a thin client,
     or even a browser that only requires a minimal setup.
     """
)

val parallel5 = Slide(
  path = (image / "19-parallel-5.png").string,
  delay = 0,
  text =
    s"""
     Now, allow me to demonstrate with an i-pad as a thin client
     connected to a server with 80 cores.
     """
)

val demoLegion0 = Video(
  path = (video / "20-demo-logika-legion.mp4").string,
  delay = -1000,
  volume = 0.0,
  rate = 1.0,
  start = 0.0,
  end = 500.0,
  textOpt = Some(
    s"""
     Here is an i-pad with the Safari browser on the left-hand side.
     """
  )
)

val demoLegion1 = Video(
  path = (video / "20-demo-logika-legion.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 0.0,
  end = 2000.0,
  textOpt = Some(
    s"""
     The browser is connected to a headless instance of the $intellijW based
     $sireumW integrated verification environment, running on one of our research
     group's Linux servers at K-State, called legion.
     [250]
     That is, the headless $sireumW server in legion projects its graphical user
     interface through the usual web protocol, thus, any authenticated machine
     with a browser can be used to interact with it.
     """
  )
)

val demoLegion2 = Video(
  path = (video / "20-demo-logika-legion.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 2000.0,
  end = 4000.0,
  textOpt = Some(
    s"""
     This particular demo uses the building temperature control example generated
     by hammer, with gumbo contracts presented earlier already translated as Slang
     contracts.
     [250]
     On the right-hand side is a terminal connected to legion, which is used to
     display legion's C P U and memory loads using H top.
     """
  )
)

val demoLegion3 = Video(
  path = (video / "20-demo-logika-legion.mp4").string,
  delay = -1000,
  volume = 0.0,
  rate = 1.0,
  start = 9000.0,
  end = 36000.0,
  textOpt = Some(
    s"""
     As can be observed, legion has eighty cores with two terra-bytes ram.
     [250]
     Next, I will open the temperature controller component implementation, which will
     trigger $logikaW verification, and you can observer how $logikaW put legion's
     many cores to work.
     """
  )
)

val demoLegion4 = Video(
  path = (video / "20-demo-logika-legion.mp4").string,
  delay = -500,
  volume = 0.0,
  rate = 1.0,
  start = 36000.0,
  end = 49000.0,
  textOpt = None()
)

val demoLegion5 = Video(
  path = (video / "20-demo-logika-legion.mp4").string,
  delay = -500,
  volume = 0.0,
  rate = 1.0,
  start = 49000.0,
  end = 60000.0,
  textOpt = Some(
    s"""
     As can be observed, $logikaW parallel verification engine used as many cores as
     needed for analyzing large codebases.
     """
  )
)

val proofEngineering1 = Slide(
  path = (image / "21-proof-engineering-1.png").string,
  delay = 0,
  text =
    s"""
    Finally, for the proof-engineering theme
     """
)

val proofEngineering2 = Slide(
  path = (image / "21-proof-engineering-2.png").string,
  delay = -1000,
  text =
    s"""
    [-1000]
    we are not claiming to do anything significant from a theoretical point of view.
    [250]
    However, in practice,
    we believe our approach for supporting proof scripts and manual proving steps directly in Slang
    has some advantages.
    """
)

val demoProof1 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 2.0,
  start = 213000.0,
  end = 214000.0,
  textOpt = Some(
    s"""
     Here we see how we exploit Scala's syntax flexibility to also express proofs
     directly in the program.
     [250]
     Some of the proof steps illustrate how we use Slang pure methods
     to represent lemmas and theorems.
     """
  )
)

val demoProof2 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 2.0,
  start = 221500.0,
  end = 234000.0,
  textOpt = Some(
    s"""
     Because all the proof elements are first-class citizens in the programming language,
     $intellijW refactoring works for Slang proofs as well.
     [250]
     After the refactoring, $logikaW ree checks the proof to make sure that it is still admittable.
     [250]
     Each Slang proof step has to either be uniquely labeled or numbered.
     """
  )
)

val demoProof3 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = -delay,
  volume = 0.0,
  rate = 1.25,
  start = 245000.0,
  end = 256000.0,
  textOpt = Some(
    s"""
     [-$delay]
     The numbering does not have to be in order, which is sometimes handy.
     We do offer an automatic tool renumbering to tidy up Slang proof.
     """
  )
)

val demoProof4 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = 0,
  volume = 0.0,
  rate = 1.0,
  start = 261250.0,
  end = 272000.0,
  textOpt = Some(
    s"""
     Each proof step in Slang has to be justified, and the justification implementation
     should produce an understandable explanation on why it accepts the proof step's claim.
     [250]
     $logikaW provides an extensible facility to add and define justifications.
     """
  )
)

val demoProof5 = Video(
  path = (video / "06-demo-logika.mp4").string,
  delay = -delay,
  volume = 0.0,
  rate = 1.0,
  start = 273500.0,
  end = 278000.0,
  textOpt = Some(
    s"""
     [-$delay]
     The premise justification is actually a method signature
     declaration, whose implementation is provided via a $logikaW plug-in written in Slang.
     [250]
     Custom justifications that implement complex proof tactics can be defined using this extension mechanism.
     [250]
     Thus, to keep with our deep-dive gateway theme, while we advocate interactive theorem proving to be done directly in Slang so
     that we have continuity of user experience,
     custom justifications can be introduced to export $logikaW's verification conditions for expert users
     to other theorem prover's input language.
     """
  )
)

val conclusion = Slide(
  path = (image / "22-conclusion.png").string,
  delay = 1000,
  text =
    s"""
     [1000]
     In closing, in this talk, we have presented our envisioned approach using $logikaW, Slang,
     hammer, and GUMBO, for developing high assurance $sel4W applications.
     [250]
     All of these tools are still currently being actively developed.
     [250]
     $logikaW in particular, is in its early development phase,
     where we are still focusing on enlarging the coverage of
     Slang's rich language features that the automated verification
     engine can handle.
     """
)

val end = Slide(
  path = (image / "23-end.png").string,
  delay = 1000,
  text =
    s"""
     [1000]
     Thank you all for attending.
     """
)


val presentation = Presentation.empty +
  intro +
  vision1 + vision2 +
  vision3 + vision4 + vision5 + vision6 +
  vision7 + vision8 + vision9 + vision10 + vision11 +
  vision12 + vision13 + vision14 +
  slang1 + slang2 + slang3 + slang4 +
  logika1 + logika2 + logika3 + logika4 + logika5 +
  logikaThemes1 + logikaThemes2 +
  demoLogika01 + demoLogika02 + demoLogika03 + demoLogika04 + demoLogika05 + demoLogika06 + demoLogika07 +
  demoLogika08 + demoLogika09 + demoLogika10 + demoLogika11 + demoLogika12 + demoLogika13 + demoLogika14 +
  education + educationWeb +
  logikaThemes3 +
  codebase1 + codebase2 + codebase3 + codebase4 + codebase5 +
  demoOption1 + demoOption2 + demoOption3 + demoOption4 +
  codebaseGraph + codebaseIncremental1 + codebaseIncremental2 + codebaseIncremental3 +
  incremental1 + incremental2 + incremental3 + incremental4 +
  hamrAbstraction1 + hamrAbstraction2 + hamrAbstraction3 + hamrAbstraction4 +
  tempControl1 + tempControl2 + tempControl3 +
  gumbo1 + gumbo2 +
  demoTempControl1 + demoTempControl2 + demoTempControl3 + demoTempControl4 + demoTempControl5 +
  parallel0 + parallel1 + parallel2 + parallel3 + parallel4 + parallel5 +
  demoLegion0 + demoLegion1 + demoLegion2 + demoLegion3 + demoLegion4 + demoLegion5 +
  proofEngineering1 + proofEngineering2 +
  demoProof1 + demoProof2 + demoProof3 + demoProof4 + demoProof5 +
  conclusion +
  end

presentation(delay = 800, textDelay = 800).cli(Os.cliArgs)
