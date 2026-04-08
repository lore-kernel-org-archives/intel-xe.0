Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E014610F995A
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 16:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F06410E69F;
	Wed,  8 Apr 2026 16:04:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C8E10E69F;
 Wed,  8 Apr 2026 16:04:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Make_sure_CRT?=
 =?utf-8?q?C_vs=2E_pipe_reordering_is_safe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 16:04:03 -0000
Message-ID: <177566424342.443324.12353587509125139557@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408155744.13326-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260408155744.13326-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Make sure CRTC vs. pipe reordering is safe
URL   : https://patchwork.freedesktop.org/series/164557/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0f49fc4203c81749f9ac6ff690aa9fa65526b98f
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Apr 8 18:57:44 2026 +0300

    drm/i915: Walk crtcs in pipe order
    
    Currently our crtcs are registered in pipe order, and thus
    all the for_intel_crtc*() iterators walk the crtcs in pipe
    order. There are a bunch of places that more or less depend
    on that. Eg. during plane updates and such we want joined
    pipes to be processed back-to-back to give a better chance
    of an atomic update across the whole set.
    
    When we start to register crtcs in a different order we don't
    want to change the order in which the pipes get handled.
    Decouple the for_each_intel_crtc*() iterators from the crtc
    registration order by using a separate list which will be
    sorted by the pipe rather than the crtc index.
    
    We could probably use a simple array or something, but that
    would require some kind of extra iterator variable for the
    macros, and thus would require a lot more changes. Using
    a linked list keeps the fallout minimal. We can look at
    using a more optimal data structure later.
    
    I also added this extra junk to the atomic state iterators:
    "(__i) = drm_crtc_index(&(crtc)->base), (void)(__i)"
    even though the macro itself no longer needs the "__i" iterator.
    This in case the "__i" is used by the caller, and to
    avoid compiler warnings if it's completely unused now.
    
    v2: Flip the pipe comparison (Jani)
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch f074368a55893ee121ba2920497b6c25e265d190 drm-intel
452ef075f37d drm/i915/joiner: Make joiner "nomodeset" state copy independent of pipe order
0f49fc4203c8 drm/i915: Walk crtcs in pipe order
-:118: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#118: FILE: drivers/gpu/drm/i915/display/intel_display.h:225:
+#define for_each_intel_crtc_in_pipe_mask(dev, crtc, pipe_mask) \
+	for_each_intel_crtc((dev), (crtc)) \
+		for_each_if((pipe_mask) & BIT((crtc)->pipe))

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

-:118: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#118: FILE: drivers/gpu/drm/i915/display/intel_display.h:225:
+#define for_each_intel_crtc_in_pipe_mask(dev, crtc, pipe_mask) \
+	for_each_intel_crtc((dev), (crtc)) \
+		for_each_if((pipe_mask) & BIT((crtc)->pipe))

-:127: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#127: FILE: drivers/gpu/drm/i915/display/intel_display.h:229:
+#define for_each_intel_crtc_in_pipe_mask_reverse(dev, crtc, pipe_mask) \
+	for_each_intel_crtc_reverse((dev), (crtc)) \
+		for_each_if((pipe_mask) & BIT((crtc)->pipe))

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

-:127: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#127: FILE: drivers/gpu/drm/i915/display/intel_display.h:229:
+#define for_each_intel_crtc_in_pipe_mask_reverse(dev, crtc, pipe_mask) \
+	for_each_intel_crtc_reverse((dev), (crtc)) \
+		for_each_if((pipe_mask) & BIT((crtc)->pipe))

-:175: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#175: FILE: drivers/gpu/drm/i915/display/intel_display.h:290:
+#define for_each_old_intel_crtc_in_state(__state, crtc, old_crtc_state, __i) \
+	for_each_intel_crtc((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc))))

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

-:175: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#175: FILE: drivers/gpu/drm/i915/display/intel_display.h:290:
+#define for_each_old_intel_crtc_in_state(__state, crtc, old_crtc_state, __i) \
+	for_each_intel_crtc((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc))))

-:175: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#175: FILE: drivers/gpu/drm/i915/display/intel_display.h:290:
+#define for_each_old_intel_crtc_in_state(__state, crtc, old_crtc_state, __i) \
+	for_each_intel_crtc((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc))))

-:175: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#175: FILE: drivers/gpu/drm/i915/display/intel_display.h:290:
+#define for_each_old_intel_crtc_in_state(__state, crtc, old_crtc_state, __i) \
+	for_each_intel_crtc((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc))))

-:180: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#180: FILE: drivers/gpu/drm/i915/display/intel_display.h:295:
+#define for_each_new_intel_crtc_in_state(__state, crtc, new_crtc_state, __i) \
+	for_each_intel_crtc((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

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

-:180: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#180: FILE: drivers/gpu/drm/i915/display/intel_display.h:295:
+#define for_each_new_intel_crtc_in_state(__state, crtc, new_crtc_state, __i) \
+	for_each_intel_crtc((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:180: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#180: FILE: drivers/gpu/drm/i915/display/intel_display.h:295:
+#define for_each_new_intel_crtc_in_state(__state, crtc, new_crtc_state, __i) \
+	for_each_intel_crtc((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:180: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#180: FILE: drivers/gpu/drm/i915/display/intel_display.h:295:
+#define for_each_new_intel_crtc_in_state(__state, crtc, new_crtc_state, __i) \
+	for_each_intel_crtc((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:185: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#185: FILE: drivers/gpu/drm/i915/display/intel_display.h:300:
+#define for_each_new_intel_crtc_in_state_reverse(__state, crtc, new_crtc_state, __i) \
+	for_each_intel_crtc_reverse((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

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

-:185: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#185: FILE: drivers/gpu/drm/i915/display/intel_display.h:300:
+#define for_each_new_intel_crtc_in_state_reverse(__state, crtc, new_crtc_state, __i) \
+	for_each_intel_crtc_reverse((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:185: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#185: FILE: drivers/gpu/drm/i915/display/intel_display.h:300:
+#define for_each_new_intel_crtc_in_state_reverse(__state, crtc, new_crtc_state, __i) \
+	for_each_intel_crtc_reverse((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:185: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#185: FILE: drivers/gpu/drm/i915/display/intel_display.h:300:
+#define for_each_new_intel_crtc_in_state_reverse(__state, crtc, new_crtc_state, __i) \
+	for_each_intel_crtc_reverse((__state)->base.dev, (crtc)) \
+		for_each_if(((__i) = drm_crtc_index(&(crtc)->base), (void)(__i), \
+			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))

-:200: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#200: FILE: drivers/gpu/drm/i915/display/intel_display.h:308:
+			     (old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \

-:213: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#213: FILE: drivers/gpu/drm/i915/display/intel_display.h:314:
+			     (old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \

total: 5 errors, 2 warnings, 11 checks, 193 lines checked


