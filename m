Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01D3606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 06:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB1A10E574;
	Fri, 23 Oct 2026 06:14:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B254810E574;
 Fri, 23 Oct 2026 06:14:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Capture_additio?=
 =?utf-8?q?nal_HW_register_state_in_devcoredump_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Oct 2026 06:14:46 -0000
Message-ID: <179273608672.60204.16511682514139365058@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Capture additional HW register state in devcoredump (rev6)
URL   : https://patchwork.freedesktop.org/series/172150/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3e857f8281fcf2cb47471e1eb2fdc8ee937725e8
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Date:   Fri Oct 23 11:35:54 2026 +0530

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
    
    v5:(Sashiko)
    - Keep RING_EXECLIST_* in COMMON_BASE_ENGINE_INSTANCE
    - Drop XE_BCS_RCS_ENGINE_INSTANCE
    - BCS_SWCTRL only on xe3p_blt_inst_regs
    - CS_DEBUG_MODE1/CS_CHICKEN1/CS_PREEMPTION_STATUS only on xe3p_rc_inst_regs
    
    Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
+ /mt/dim checkpatch 2b2e3642e6d2095bbaae7b552da1c5ad164047a5 drm-intel
940dfdd22208 drm/xe/devcoredump: Capture GT fuse registers in devcoredump
51412ba19bfd drm/xe/devcoredump: Add GuC register snapshot to devcoredump
d236bc8580c0 drm/xe/guc: Print register addresses in capture snapshot output
fc82b5d067d6 drm/xe: dump GAM page fault report registers in devcoredump
91ea80f9bbf0 drm/xe/guc: add TDL, SLICE gfx registers to capture list
4774661c01ca drm/xe: capture L3 node status registers in devcoredump
3e857f8281fc drm/xe/guc: capture additional engine state registers
-:130: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#130: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:153:
+#define XE3P_CS_DEBUG_INSTANCE \
+	{ RESET_CTRL(0),		REG_32BIT,	0,	0,	0,	"RESET_CTRL"}, \
+	{ RING_CSBEFSM3(0),		REG_32BIT,	0,	0,	0,	"RING_CSBEFSM3"}, \
+	{ RING_CSFESM(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM"}, \
+	{ RING_CSFESM2(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM2"}, \
+	{ RING_CSFESM3(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM3"}, \
+	{ RING_CSPWRFSM(0),		REG_32BIT,	0,	0,	0,	"RING_CSPWRFSM"}, \
+	{ RING_CSBEFSM(0),		REG_32BIT,	0,	0,	0,	"RING_CSBEFSM"}, \
+	{ RING_CSFE_GLB_CHICKEN3(0),	REG_32BIT,	0,	0,	0,	"RING_CSFE_GLB_CHICKEN3"}, \
+	{ RING_PSMI_CTL(0),		REG_32BIT,	0,	0,	0,	"RING_PSMI_CTL"}, \
+	{ RING_INSTPS(0),		REG_32BIT,	0,	0,	0,	"RING_INSTPS"}, \
+	{ RING_BB_ADDR_DIFF(0),		REG_32BIT,	0,	0,	0,	"RING_BB_ADDR_DIFF"}, \
+	{ RING_BB_STATE(0),		REG_32BIT,	0,	0,	0,	"RING_BB_STATE"}

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

-:138: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#138: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:161:
+	{ RING_CSFE_GLB_CHICKEN3(0),	REG_32BIT,	0,	0,	0,	"RING_CSFE_GLB_CHICKEN3"}, \

-:141: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#141: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:164:
+	{ RING_BB_ADDR_DIFF(0),		REG_32BIT,	0,	0,	0,	"RING_BB_ADDR_DIFF"}, \

-:149: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#149: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:172:
+#define XE3P_RC_CS_PREEMPT_INSTANCE \
+	{ CS_DEBUG_MODE1(0),		REG_32BIT,	0,	0,	0,	"CS_DEBUG_MODE1"}, \
+	{ CS_CHICKEN1(0),		REG_32BIT,	0,	0,	0,	"CS_CHICKEN1"}, \
+	{ CS_PREEMPTION_STATUS(0),	REG_32BIT,	0,	0,	0,	"CS_PREEMPTION_STATUS"}

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

-:152: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#152: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:175:
+	{ CS_PREEMPTION_STATUS(0),	REG_32BIT,	0,	0,	0,	"CS_PREEMPTION_STATUS"}

total: 2 errors, 3 warnings, 0 checks, 185 lines checked


