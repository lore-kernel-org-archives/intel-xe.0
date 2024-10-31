Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E56BE68955
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 11:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D1010E061;
	Thu, 31 Oct 2024 11:45:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448BA10E061;
 Thu, 31 Oct 2024 11:45:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_make_?=
 =?utf-8?q?all_i915=5Fdrv=2Eh_includes_explicit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 11:45:18 -0000
Message-ID: <173037511827.1378613.9206821895130720791@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730374470.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730374470.git.jani.nikula@intel.com>
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

Series: drm/i915/display: make all i915_drv.h includes explicit
URL   : https://patchwork.freedesktop.org/series/140765/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 02cf6ae51718c6d2a56c4db676a84c0fddbba79e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Oct 31 13:38:36 2024 +0200

    drm/i915/display: drop i915_drv.h include from intel_display_trace.h
    
    Finish the job of removing implicit dependencies on i915_drv.h via other
    includes in display code. Add a few missing explicit includes.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf drm-intel
ce15a4f38430 drm/i915/gvt: always pass struct intel_display * to register macros
-:448: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#448: FILE: drivers/gpu/drm/i915/gvt/handlers.c:1015:
+#define DSPSURF_TO_PIPE(display, offset) \
+	calc_index(offset, DSPSURF(display, PIPE_A), DSPSURF(display, PIPE_B), DSPSURF(display, PIPE_C))

-:449: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#449: FILE: drivers/gpu/drm/i915/gvt/handlers.c:1016:
+	calc_index(offset, DSPSURF(display, PIPE_A), DSPSURF(display, PIPE_B), DSPSURF(display, PIPE_C))

total: 0 errors, 1 warnings, 1 checks, 452 lines checked
45a3bf6b20e9 drm/i915: extract intel_uncore_trace.[ch]
-:117: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#117: 
new file mode 100644

-:150: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#150: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:16:
+TRACE_EVENT_CONDITION(i915_reg_rw,
+	TP_PROTO(bool write, i915_reg_t reg, u64 val, int len, bool trace),

-:156: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#156: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:22:
+	TP_STRUCT__entry(

-:163: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#163: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:29:
+	TP_fast_assign(

-:171: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#171: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:37:
+	TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
+		__entry->write ? "write" : "read",

-:181: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#181: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:47:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
                              ^

-:181: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#181: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:47:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
                                 ^

-:181: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#181: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:47:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
                                         ^

-:181: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#181: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:47:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
                                             ^

-:181: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#181: FILE: drivers/gpu/drm/i915/intel_uncore_trace.h:47:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
                                                 ^

total: 0 errors, 1 warnings, 9 checks, 137 lines checked
cc54cee78b1b drm/i915/display: add intel_display_conversion.c to hide stuff better
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

-:67: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:22:
+		 const struct drm_i915_private *: __i915_to_display((struct drm_i915_private *)(p)), \

-:67: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#67: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:22:
+		 const struct drm_i915_private *: __i915_to_display((struct drm_i915_private *)(p)), \
 		                               ^

-:67: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#67: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:22:
+		 const struct drm_i915_private *: __i915_to_display((struct drm_i915_private *)(p)), \
 		                                ^

-:68: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#68: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:23:
+		 struct drm_i915_private *: __i915_to_display((struct drm_i915_private *)(p)), \
 		                         ^

-:68: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#68: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:23:
+		 struct drm_i915_private *: __i915_to_display((struct drm_i915_private *)(p)), \
 		                          ^

total: 2 errors, 2 warnings, 2 checks, 44 lines checked
a28970934060 drm/i915/uncore: add to_intel_uncore() and use it
153a179e8b95 drm/i915/display: add struct drm_device to struct intel_display conversion function
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
[1] https://lore.kernel.org/r/7777ff70e2be0663de4398aa6f75f0c54146cbfc.1709727127.git.jani.nikula@intel.com

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
02cf6ae51718 drm/i915/display: drop i915_drv.h include from intel_display_trace.h


