Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0921EC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95E010F653;
	Thu,  3 Sep 2026 14:54:42 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F6510F653;
 Thu,  3 Sep 2026 14:54:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Capture_additio?=
 =?utf-8?q?nal_HW_register_state_in_devcoredump_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 14:54:41 -0000
Message-ID: <178844728186.119019.13072310408628467341@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
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

Series: drm/xe: Capture additional HW register state in devcoredump (rev3)
URL   : https://patchwork.freedesktop.org/series/172150/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5ed1c7f318f7b9052289b1c94ca3ee557c912c4
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Date:   Thu Sep 3 19:48:34 2026 +0530

    drm/xe/guc: capture additional engine state registers
    
    Add a wider set of engine state registers to GuC error capture to improve
    post-mortem debugging of engine hangs and reset-related failures.
    
    Define the missing register offsets in xe_engine_regs.h and include them in
    the GuC capture list. The additional registers cover reset state, front-end
    and back-end FSM state, power state, batch buffer state, instruction state,
    preemption status, and related chicken/debug controls.
    
    This provides more complete engine context in capture dumps, which should
    help root-cause analysis when investigating GuC-reported engine failures.
    
    v3:(Sashiko)
    - Move FF_SLICE_CS_CHICKEN1/2 out of COMMON_BASE_ENGINE_INSTANCE
    - Add XE3P_RC_SLICE_INSTANCE and include it only in xe3p_rc_inst_regs[]
    - Add XE_BCS_RCS_ENGINE_INSTANCE for registers shared only by
      BCS/RCS paths
    - Include XE_BCS_RCS_ENGINE_INSTANCE only in
      xe_blt_inst_regs[] and xe3p_rc_inst_regs[]
    - Keep COMMON_BASE_ENGINE_INSTANCE limited to registers
      valid across all engine classes
    
    Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
+ /mt/dim checkpatch 76a34199970d93cfb3ed5dbbd745c23b6f0cff34 drm-intel
c08137418f3e drm/xe/devcoredump: Capture GT fuse registers in devcoredump
2a3811255451 drm/xe/devcoredump: Add GuC register snapshot to devcoredump
952e3a5bb435 drm/xe/guc: Print register addresses in capture snapshot output
d65976365811 drm/xe: dump GAM page fault report registers in devcoredump
10a7cea5c603 drm/xe/guc: add TDL, SLICE gfx registers to capture list
e1f1a334ac59 drm/xe: capture L3 node status registers in devcoredump
a5ed1c7f318f drm/xe/guc: capture additional engine state registers
-:137: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#137: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:149:
+#define XE3P_RC_SLICE_INSTANCE \
+	{ FF_SLICE_CS_CHICKEN1(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN1"}, \
+	{ FF_SLICE_CS_CHICKEN2(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN2"}

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

-:141: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#141: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:153:
+#define XE_BCS_RCS_ENGINE_INSTANCE \
+	{ RING_EXECLIST_STATUS_LO(0), REG_64BIT_LOW_DW, 0, 0, 0, NULL}, \
+	{ RING_EXECLIST_STATUS_HI(0), REG_64BIT_HI_DW, 0, 0, 0, "RING_EXECLIST_STATUS"}, \
+	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0, 0, 0, NULL}, \
+	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0, 0, 0, "RING_EXECLIST_SQ_CONTENTS"}, \
+	{ RESET_CTRL(0), REG_32BIT, 0, 0, 0, "RESET_CTRL"}, \
+	{ RING_CSBEFSM3(0), REG_32BIT, 0, 0, 0, "RING_CSBEFSM3"}, \
+	{ RING_CSFESM(0), REG_32BIT, 0, 0, 0, "RING_CSFESM"}, \
+	{ RING_CSFESM2(0), REG_32BIT, 0, 0, 0, "RING_CSFESM2"}, \
+	{ RING_CSFESM3(0), REG_32BIT, 0, 0, 0, "RING_CSFESM3"}, \
+	{ RING_CSPWRFSM(0), REG_32BIT, 0, 0, 0, "RING_CSPWRFSM"}, \
+	{ RING_CSBEFSM(0), REG_32BIT, 0, 0, 0, "RING_CSBEFSM"}, \
+	{ BCS_SWCTRL(0), REG_32BIT, 0, 0, 0, "BCS_SWCTRL"}, \
+	{ RING_CSFE_GLB_CHICKEN3(0), REG_32BIT, 0, 0, 0, "RING_CSFE_GLB_CHICKEN3"}, \
+	{ RING_PSMI_CTL(0), REG_32BIT, 0, 0, 0, "RING_PSMI_CTL"}, \
+	{ RING_INSTPS(0), REG_32BIT, 0, 0, 0, "RING_INSTPS"}, \
+	{ RING_BB_ADDR_DIFF(0), REG_32BIT, 0, 0, 0, "RING_BB_ADDR_DIFF"}, \
+	{ RING_BB_STATE(0), REG_32BIT, 0, 0, 0, "RING_BB_STATE"}, \
+	{ CS_DEBUG_MODE1(0), REG_32BIT, 0, 0, 0, "CS_DEBUG_MODE1"}, \
+	{ CS_CHICKEN1(0), REG_32BIT, 0, 0, 0, "CS_CHICKEN1"}, \
+	{ CS_PREEMPTION_STATUS(0), REG_32BIT, 0, 0, 0, "CS_PREEMPTION_STATUS"}

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

total: 2 errors, 0 warnings, 0 checks, 135 lines checked


