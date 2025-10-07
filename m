Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E726CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40B110E715;
	Tue,  7 Oct 2025 20:56:15 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818B210E715;
 Tue,  7 Oct 2025 20:56:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Allow_configfs_to_disable?=
 =?utf-8?q?_specific_GT_type=28s=29_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Oct 2025 20:56:14 -0000
Message-ID: <175987057449.15058.13495983039215751170@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

Series: Allow configfs to disable specific GT type(s) (rev4)
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
commit 1f64849d96a039296e0f69cbd0d68fd70c161136
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Oct 7 13:48:53 2025 -0700

    drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs
    
    SR-IOV operation relies on the primary GT's GuC to operate (in both PF
    and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
    If the primary GT is disabled in PF mode, force the device back to
    native (non-sriov) mode.
    
    v2:
     - Move handling to xe_info_init().  (Michal)
    
    v3:
     - Just update the .has_sriov flag in xe_info_init_early().  (Michal)
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 679a7939422e7585cce7bf5d3350fc522e765343 drm-intel
0273e1c91fcd drm/xe/huc: Adjust HuC check on primary GT
2cb16cb539d7 drm/xe: Drop GT parameter to xe_display_irq_postinstall()
7d34eb011e3e drm/xe: Move 'va_bits' flag back to platform descriptor
7d8f5e70c8b3 drm/xe: Move 'vm_max_level' flag back to platform descriptor
c2c7a9b05548 drm/xe: Move 'vram_flags' flag back to platform descriptor
2d8849c6aaed drm/xe: Move 'has_flatccs' flag back to platform descriptor
ab1c933a19d9 drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT
007545972d7e drm/xe: Move primary GT allocation from xe_tile_init_early to xe_tile_init
8e4c53d27faa drm/xe: Skip L2 / TDF cache flushes if primary GT is disabled
5b1a41b0cc3b drm/xe/query: Report hwconfig size as 0 if primary GT is disabled
96156b82870f drm/xe/pmu: Initialize PMU event types based on first available GT
d01a32713dd8 drm/xe: Check for primary GT before looking up Wa_22019338487
063c8597003b drm/xe: Make display part of Wa_22019338487 a device workaround
3d4d34fed764 drm/xe/irq: Don't try to lookup engine masks for non-existent primary GT
3367d1c221b0 drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds
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
35758afda2c2 drm/xe/rtp: Pass xe_device parameter to FUNC matches
e63bc24c7a29 drm/xe: Bypass Wa_14018094691 when primary GT is disabled
052371c69236 drm/xe: Correct lineage for Wa_22014953428 and only check with valid GT
240ab73f50a8 drm/xe: Check that GT is not NULL before testing Wa_16023588340
e68ea622e853 drm/xe: Don't check BIOS-disabled FlatCCS if primary GT is disabled
9714b82a09e6 drm/xe: Break GT setup out of xe_info_init()
fa0bed53a630 drm/xe/configfs: Add attribute to disable GT types
-:160: WARNING:LINE_SPACING: Missing a blank line after declarations
#160: FILE: drivers/gpu/drm/xe/xe_configfs.c:362:
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 273 lines checked
1f64849d96a0 drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs


