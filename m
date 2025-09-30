Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2A6CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2F910E080;
	Tue, 30 Sep 2025 23:19:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765410E080;
 Tue, 30 Sep 2025 23:19:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Allow_configfs_to_disable?=
 =?utf-8?q?_specific_GT_type=28s=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Sep 2025 23:19:55 -0000
Message-ID: <175927439594.381168.18083624773447019778@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

Series: Allow configfs to disable specific GT type(s) (rev3)
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
commit e7286c68bfcb6eae1949c528a9e9f8a9d0b3ba7a
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Sep 30 15:56:40 2025 -0700

    drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs
    
    SR-IOV operation relies on the primary GT's GuC to operate (in both PF
    and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
    If the primary GT is disabled in PF mode, force the device back to
    native (non-sriov) mode.
    
    v2:
     - Move handling to xe_info_init().  (Michal)
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 23f8be57505c80e5b57dec249df8a3cc053eb947 drm-intel
f1e963961a7b drm/xe/huc: Adjust HuC check on primary GT
f676bef49564 drm/xe: Drop GT parameter to xe_display_irq_postinstall()
66d6a4c31894 drm/xe: Move 'va_bits' flag back to platform descriptor
37031cb534ba drm/xe: Move 'vm_max_level' flag back to platform descriptor
-:23: WARNING:TYPO_SPELLING: 'desciptor' may be misspelled - perhaps 'descriptor'?
#23: 
   desciptor.  (Lucas)
   ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 135 lines checked
62f00a63a307 drm/xe: Move 'vram_flags' flag back to platform descriptor
28db2ca57744 drm/xe: Move 'has_flatccs' flag back to platform descriptor
326ed08c3c6a drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT
-:94: WARNING:LINE_SPACING: Missing a blank line after declarations
#94: FILE: drivers/gpu/drm/xe/xe_pci.c:487:
+		struct xe_gt *gt = kzalloc(sizeof(*gt), GFP_KERNEL);
+		if (!gt)

total: 0 errors, 1 warnings, 0 checks, 146 lines checked
51d2864f8575 drm/xe: Move primary GT allocation from xe_tile_init_early to xe_tile_init
a915770225c3 drm/xe: Skip L2 / TDF cache flushes if primary GT is disabled
6c323e6e60d9 drm/xe/query: Report hwconfig size as 0 if primary GT is disabled
2d86fffe9600 drm/xe/pmu: Initialize PMU event types based on first available GT
92c2e2dc9dd2 drm/xe: Check for primary GT before looking up Wa_22019338487
fdadc16d3cb2 drm/xe: Make display part of Wa_22019338487 a device workaround
9acd082eb3f0 drm/xe/irq: Don't try to lookup engine masks for non-existent primary GT
f989add3acaa drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds
-:126: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#126: FILE: include/drm/intel/pciids.h:852:
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

-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#126: FILE: include/drm/intel/pciids.h:852:
+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
 	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \

-:137: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#137: FILE: include/drm/intel/pciids.h:863:
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

-:137: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#137: FILE: include/drm/intel/pciids.h:863:
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \

total: 2 errors, 0 warnings, 2 checks, 87 lines checked
109aa8e04979 drm/xe/rtp: Pass xe_device parameter to FUNC matches
2a2273d825c0 drm/xe: Bypass Wa_14018094691 when primary GT is disabled
5c9557b9bb69 drm/xe: Correct lineage for Wa_22014953428 and only check with valid GT
7f9546f4142a drm/xe: Check that GT is not NULL before testing Wa_16023588340
4e6d3a98f709 drm/xe: Don't check BIOS-disabled FlatCCS if primary GT is disabled
4e3fbf75822d drm/xe: Break GT setup out of xe_info_init()
488150a098fb drm/xe/configfs: Add attribute to disable GT types
e7286c68bfcb drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs


