Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3370ECD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 12:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D6B10E2B6;
	Mon, 25 May 2026 12:24:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3E310E2B6;
 Mon, 25 May 2026 12:24:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_crtc_iteratio?=
 =?utf-8?q?n_cleanups_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 12:24:08 -0000
Message-ID: <177971184838.4765.2029111589299150254@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1778659089.git.jani.nikula@intel.com>
In-Reply-To: <cover.1778659089.git.jani.nikula@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: crtc iteration cleanups (rev3)
URL   : https://patchwork.freedesktop.org/series/165524/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3caa259a08acfdede8c124b68967995b2592a33a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed May 13 10:58:40 2026 +0300

    drm/i915/display: stop passing i to for_each_pipe_crtc_modeset_{enable, disable}()
    
    Refactor for_each_pipe_crtc_modeset_{enable,disable}() and their
    underlying for_each_crtc_in_masks{,_reverse}() helpers to utilize
    __UNIQUE_ID() to avoid having to pass the for loop variable to them.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 04d475020800d0a1033ca89a0d6d5fc638ddc65b drm-intel
57c119ddfb6d drm/{i915, xe}: move xe_display_flush_cleanup_work() to i915 display
2303f8d89582 drm/i915/display: switch from drm_for_each_crtc() to for_each_intel_crtc()
aa184a0bf543 drm/i915/display: always pass display->drm to for_each_intel_crtc*()
c03210d19f02 drm/i915/display: pass struct intel_display to all for_each_intel_crtc*() macros
-:400: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#400: FILE: drivers/gpu/drm/i915/display/intel_display.h:225:
+#define for_each_intel_crtc_in_pipe_mask(display, crtc, pipe_mask) \
+	for_each_intel_crtc((display), (crtc)) \
 		for_each_if((pipe_mask) & BIT((crtc)->pipe))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:400: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#400: FILE: drivers/gpu/drm/i915/display/intel_display.h:225:
+#define for_each_intel_crtc_in_pipe_mask(display, crtc, pipe_mask) \
+	for_each_intel_crtc((display), (crtc)) \
 		for_each_if((pipe_mask) & BIT((crtc)->pipe))

-:406: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#406: FILE: drivers/gpu/drm/i915/display/intel_display.h:229:
+#define for_each_intel_crtc_in_pipe_mask_reverse(display, crtc, pipe_mask) \
+	for_each_intel_crtc_reverse((display), (crtc)) \
 		for_each_if((pipe_mask) & BIT((crtc)->pipe))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:406: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#406: FILE: drivers/gpu/drm/i915/display/intel_display.h:229:
+#define for_each_intel_crtc_in_pipe_mask_reverse(display, crtc, pipe_mask) \
+	for_each_intel_crtc_reverse((display), (crtc)) \
 		for_each_if((pipe_mask) & BIT((crtc)->pipe))

-:498: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (27, 35)
#498: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:87:
+			   for_each_intel_crtc(display, it__) {
 				   __entry->frame[it__->pipe] = intel_crtc_get_vblank_counter(it__);

-:507: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (27, 35)
#507: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:117:
+			   for_each_intel_crtc(display, it__) {
 				   __entry->frame[it__->pipe] = intel_crtc_get_vblank_counter(it__);

-:516: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (27, 35)
#516: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:247:
+			   for_each_intel_crtc(display, crtc) {
 				   __entry->frame[crtc->pipe] = intel_crtc_get_vblank_counter(crtc);

total: 2 errors, 3 warnings, 2 checks, 786 lines checked
bbf9b4c6e78f drm/i915/display: stop passing i to for_each_*_intel_crtc_in_state() macros
-:493: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#493: FILE: drivers/gpu/drm/i915/display/intel_display.c:7048:
+		for_each_oldnew_intel_crtc_in_state_reverse(state, crtc, old_crtc_state, new_crtc_state) {

-:653: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#653: FILE: drivers/gpu/drm/i915/display/intel_display.h:290:
+#define for_each_old_intel_crtc_in_state(__state, crtc, old_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:653: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#653: FILE: drivers/gpu/drm/i915/display/intel_display.h:290:
+#define for_each_old_intel_crtc_in_state(__state, crtc, old_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)))

-:653: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#653: FILE: drivers/gpu/drm/i915/display/intel_display.h:290:
+#define for_each_old_intel_crtc_in_state(__state, crtc, old_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)))

-:660: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#660: FILE: drivers/gpu/drm/i915/display/intel_display.h:294:
+#define for_each_new_intel_crtc_in_state(__state, crtc, new_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if((new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc)))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:660: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#660: FILE: drivers/gpu/drm/i915/display/intel_display.h:294:
+#define for_each_new_intel_crtc_in_state(__state, crtc, new_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if((new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc)))

-:660: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#660: FILE: drivers/gpu/drm/i915/display/intel_display.h:294:
+#define for_each_new_intel_crtc_in_state(__state, crtc, new_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if((new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc)))

-:667: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#667: FILE: drivers/gpu/drm/i915/display/intel_display.h:298:
+#define for_each_new_intel_crtc_in_state_reverse(__state, crtc, new_crtc_state) \
 	for_each_intel_crtc_reverse(to_intel_display(__state), (crtc)) \
+		for_each_if((new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc)))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:667: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#667: FILE: drivers/gpu/drm/i915/display/intel_display.h:298:
+#define for_each_new_intel_crtc_in_state_reverse(__state, crtc, new_crtc_state) \
 	for_each_intel_crtc_reverse(to_intel_display(__state), (crtc)) \
+		for_each_if((new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc)))

-:667: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#667: FILE: drivers/gpu/drm/i915/display/intel_display.h:298:
+#define for_each_new_intel_crtc_in_state_reverse(__state, crtc, new_crtc_state) \
 	for_each_intel_crtc_reverse(to_intel_display(__state), (crtc)) \
+		for_each_if((new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc)))

-:674: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#674: FILE: drivers/gpu/drm/i915/display/intel_display.h:302:
+#define for_each_oldnew_intel_crtc_in_state(__state, crtc, old_crtc_state, new_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \
 			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:674: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#674: FILE: drivers/gpu/drm/i915/display/intel_display.h:302:
+#define for_each_oldnew_intel_crtc_in_state(__state, crtc, old_crtc_state, new_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \
 			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:674: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#674: FILE: drivers/gpu/drm/i915/display/intel_display.h:302:
+#define for_each_oldnew_intel_crtc_in_state(__state, crtc, old_crtc_state, new_crtc_state) \
 	for_each_intel_crtc(to_intel_display(__state), (crtc)) \
+		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \
 			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:678: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#678: FILE: drivers/gpu/drm/i915/display/intel_display.h:304:
+		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \

-:682: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#682: FILE: drivers/gpu/drm/i915/display/intel_display.h:307:
+#define for_each_oldnew_intel_crtc_in_state_reverse(__state, crtc, old_crtc_state, new_crtc_state) \
 	for_each_intel_crtc_reverse(to_intel_display(__state), (crtc)) \
+		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \
 			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:682: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#682: FILE: drivers/gpu/drm/i915/display/intel_display.h:307:
+#define for_each_oldnew_intel_crtc_in_state_reverse(__state, crtc, old_crtc_state, new_crtc_state) \
 	for_each_intel_crtc_reverse(to_intel_display(__state), (crtc)) \
+		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \
 			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:682: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#682: FILE: drivers/gpu/drm/i915/display/intel_display.h:307:
+#define for_each_oldnew_intel_crtc_in_state_reverse(__state, crtc, old_crtc_state, new_crtc_state) \
 	for_each_intel_crtc_reverse(to_intel_display(__state), (crtc)) \
+		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \
 			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:686: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#686: FILE: drivers/gpu/drm/i915/display/intel_display.h:309:
+		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \

total: 5 errors, 3 warnings, 10 checks, 745 lines checked
3caa259a08ac drm/i915/display: stop passing i to for_each_pipe_crtc_modeset_{enable, disable}()
-:129: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#129: FILE: drivers/gpu/drm/i915/display/intel_display.h:328:
+#define __for_each_crtc_in_masks(display, crtc, first_pipes, second_pipes, i) \
+	for (int (i) = 0; \
 	     (i) < (I915_MAX_PIPES * 2) && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
 	     (i)++) \
 		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:129: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#129: FILE: drivers/gpu/drm/i915/display/intel_display.h:328:
+#define __for_each_crtc_in_masks(display, crtc, first_pipes, second_pipes, i) \
+	for (int (i) = 0; \
 	     (i) < (I915_MAX_PIPES * 2) && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
 	     (i)++) \
 		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:137: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#137: FILE: drivers/gpu/drm/i915/display/intel_display.h:334:
+#define __for_each_crtc_in_masks_reverse(display, crtc, first_pipes, second_pipes, i) \
+	for (int (i) = (I915_MAX_PIPES * 2 - 1); \
 	     (i) >= 0 && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
 	     (i)--) \
 		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:137: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#137: FILE: drivers/gpu/drm/i915/display/intel_display.h:334:
+#define __for_each_crtc_in_masks_reverse(display, crtc, first_pipes, second_pipes, i) \
+	for (int (i) = (I915_MAX_PIPES * 2 - 1); \
 	     (i) >= 0 && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
 	     (i)--) \
 		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:154: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#154: FILE: drivers/gpu/drm/i915/display/intel_display.h:340:
+#define for_each_pipe_crtc_modeset_disable(display, crtc, crtc_state) \
+	__for_each_crtc_in_masks(display, crtc, \
+				 _intel_modeset_primary_pipes(crtc_state), \
+				 _intel_modeset_secondary_pipes(crtc_state), \
+				 __UNIQUE_ID(i))

-:160: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#160: FILE: drivers/gpu/drm/i915/display/intel_display.h:346:
+#define for_each_pipe_crtc_modeset_enable(display, crtc, crtc_state) \
+	__for_each_crtc_in_masks_reverse(display, crtc,			\
+					 _intel_modeset_primary_pipes(crtc_state), \
+					 _intel_modeset_secondary_pipes(crtc_state), \
+					 __UNIQUE_ID(i))

total: 0 errors, 0 warnings, 6 checks, 167 lines checked


