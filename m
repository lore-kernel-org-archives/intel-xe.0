Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C18CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 23:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955CC10E509;
	Mon, 13 Oct 2025 23:30:24 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3DA10E509;
 Mon, 13 Oct 2025 23:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Allow_configfs_to_disable?=
 =?utf-8?q?_specific_GT_type=28s=29_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Oct 2025 23:30:22 -0000
Message-ID: <176039822269.7451.2342128263598218309@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

Series: Allow configfs to disable specific GT type(s) (rev5)
URL   : https://patchwork.freedesktop.org/series/154739/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d61979591f535d88f10c277284c25b054d4658bf
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Oct 13 13:10:06 2025 -0700

    drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs
    
    SR-IOV operation relies on the primary GT's GuC to operate (in both PF
    and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
    If the primary GT is disabled in PF mode, force the device back to
    native (non-sriov) mode.
    
    v2:
     - Move handling to xe_info_init().  (Michal)
    
    v3:
     - Just update the .has_sriov flag in xe_info_init_early().  (Michal)
    
    v4:
     - Drop unnecessary comment.  (Michal)
     - Flip condition order for consistency with other checks.  (Michal)
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch c917f7d11493984be9f381ca0a7667bd3e587ada drm-intel
76d771a77b99 drm/xe/huc: Adjust HuC check on primary GT
160ba9d7d20d drm/xe: Drop GT parameter to xe_display_irq_postinstall()
94b202536c60 drm/xe: Move 'va_bits' flag back to platform descriptor
24e84eed298e drm/xe: Move 'vm_max_level' flag back to platform descriptor
ddaaf0b61591 drm/xe: Move 'vram_flags' flag back to platform descriptor
433b948f539a drm/xe: Move 'has_flatccs' flag back to platform descriptor
36507f67b41d drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT
85cb6309c7be drm/xe: Move primary GT allocation from xe_tile_init_early to xe_tile_init
436ff4cc1559 drm/xe: Skip L2 / TDF cache flushes if primary GT is disabled
a683e43eade4 drm/xe/query: Report hwconfig size as 0 if primary GT is disabled
cc0953b32cdc drm/xe/pmu: Initialize PMU event types based on first available GT
227261b3895c drm/xe: Check for primary GT before looking up Wa_22019338487
2774ed19c00b drm/xe: Make display part of Wa_22019338487 a device workaround
5cabc5e5695a drm/xe/irq: Don't try to lookup engine masks for non-existent primary GT
e6b8796fe112 drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds
-:127: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#127: FILE: include/drm/intel/pciids.h:852:
+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
 	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \

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

-:127: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#127: FILE: include/drm/intel/pciids.h:852:
+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
 	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \

-:138: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#138: FILE: include/drm/intel/pciids.h:863:
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \

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

-:138: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#138: FILE: include/drm/intel/pciids.h:863:
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \

total: 2 errors, 0 warnings, 2 checks, 87 lines checked
3e87766ccea8 drm/xe/rtp: Pass xe_device parameter to FUNC matches
3e4719d86513 drm/xe: Bypass Wa_14018094691 when primary GT is disabled
087b862cf197 drm/xe: Correct lineage for Wa_22014953428 and only check with valid GT
ad84e03e845b drm/xe: Check that GT is not NULL before testing Wa_16023588340
161daafca9f9 drm/xe: Don't check BIOS-disabled FlatCCS if primary GT is disabled
aa154a02adea drm/xe: Break GT setup out of xe_info_init()
aebc193a406c drm/xe/configfs: Add attribute to disable GT types
-:171: WARNING:LINE_SPACING: Missing a blank line after declarations
#171: FILE: drivers/gpu/drm/xe/xe_configfs.c:401:
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 278 lines checked
d61979591f53 drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs


