//
//  VMLogUtility.h
//  TerminalColorLog_Objc
//
//  Created by Velmurugan on 16/04/16.
//  Copyright © 2016 Velmurugan. All rights reserved.
//

#import <Foundation/Foundation.h>
//Reference Link: http://misc.flogisoft.com/bash/tip_colors_and_formatting

/*!
 @abstract Special Log format for terminal.
 @discussion Special Log format for terminal. Un support format will be rejected . So don't expected expected output.<br>
 <br>
 Format Support :<br>
 ==============<br>
 <br> 1) &lt;b&gt; Text to become bold &lt;/b&gt;
 <br> 2) &lt;d&gt; Dim the text &lt;/d&gt;
 <br> 3) &lt;u&gt; Underline the text &lt;/u&gt;
 <br> 4) &lt;bl&gt; Blink the text &lt;/bl&gt;
 <br>
 <br>
 Forground color Support : <br>
 ======================<br>
 &lt;fg:colorType&gt; Text to display in color. &lt;/fg&gt; <br>
 <br>
 Color type support: <br>
 1) Default<br>
 2) black  (default color)<br>
 3) red <br>
 4) green <br>
 6) yellow <br>
 7) blue <br>
 8) magenta <br>
 9) cyan <br>
 10) lightgray <br>
 11) darkgray <br>
 12) lightred <br>
 13) lightgreen <br>
 14) lightyellow <br>
 15) lightblue <br>
 16) lightmagenta <br>
 17) white <br>
 <br>
 Example:<br>
 =======<br>
 &lt;fg:green&gt; Text to display in green color. &lt;/fg&gt; <br>
 
 
 
 <br>
 <br>
 Background color Support : <br>
 ======================<br>
 &lt;bg:colorType> Text to display in color. &lt;/bg> <br>
 <br>
 Color type support: <br>
 1) Default<br>
 2) black  (default color)<br>
 3) red <br>
 4) green <br>
 6) yellow <br>
 7) blue <br>
 8) magenta <br>
 9) cyan <br>
 10) lightgray <br>
 11) darkgray <br>
 12) lightred <br>
 13) lightgreen <br>
 14) lightyellow <br>
 15) lightblue <br>
 16) lightmagenta <br>
 17) white <br>
 <br>
 Example:<br>
 =======<br>
 &lt;bg:green&gt; Text to display in green color. &lt;/bg&gt; <br>
 */
void alog(NSString *attributedMessage);

/*!
 Make a warning log.
 @param warningMessage warning message to display.
 */
void wlog(NSString *warningMessage);

/*!
 Make a error log.
 @param errorMessage error message to display.
 */
void elog(NSString *errorMessage);

/*!
 Make a Information log.
 @param informationMessage Information message to display.
 */
void ilog(NSString *informationMessage);

/*!
 Make a Success log.
 @param successMessage Success message to display.
 */
void slog(NSString *successMessage);
