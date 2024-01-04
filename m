Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE54C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 03:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027E110E2EF;
	Thu,  4 Jan 2024 03:14:36 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B1D10E2EE;
 Thu,  4 Jan 2024 03:14:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_GuC_bas?=
 =?utf-8?q?ed_register_capture_for_error_capture?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Date: Thu, 04 Jan 2024 03:14:34 -0000
Message-ID: <170433807486.151.14864319434675722884@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231229220345.1396456-1-zhanjun.dong@intel.com>
In-Reply-To: <20231229220345.1396456-1-zhanjun.dong@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/guc: Add GuC based register capture for error capture
URL   : https://patchwork.freedesktop.org/series/128077/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 694b83acd753be52f017c15d41ae08d6322e1d25
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Fri Dec 29 14:03:45 2023 -0800

    drm/xe/guc: Add GuC based register capture for error capture
    
    Port GuC based register capture for error capture from i915 to Xe.
    
    There are 3 parts in this commit:
    . Prepare for capture registers
        There is a bo create at guc ads init time, that is very early
        and engine map is not ready, make it hard to calculate the
        capture buffer size, new function created for worst case size
        caluation. Other than that, this part basically follows the i915
        design.
    . Process capture notification message
        Basically follows i915 design
    . Sysfs command process.
        Xe switched to devcoredump, adopted command line process with
        captured list.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
694b83acd drm/xe/guc: Add GuC based register capture for error capture
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:605: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#605: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:518:
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,

-:714: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#714: 
new file mode 100644

-:760: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#760: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:42:
+#define COMMON_GEN8BASE_GLOBAL \
+	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
+	{ DONE_REG,                 0,      0, "DONE_REG" }, \
+	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }

-:765: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#765: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:47:
+#define GEN8_GLOBAL \
+	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
+	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }

-:769: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#769: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:51:
+#define COMMON_GEN12BASE_GLOBAL \
+	{ GEN12_FAULT_TLB_DATA0,    0,      0, "GEN12_FAULT_TLB_DATA0" }, \
+	{ GEN12_FAULT_TLB_DATA1,    0,      0, "GEN12_FAULT_TLB_DATA1" }, \
+	{ GEN12_AUX_ERR_DBG,        0,      0, "AUX_ERR_DBG" }, \
+	{ GEN12_GAM_DONE,           0,      0, "GAM_DONE" }, \
+	{ GEN12_RING_FAULT_REG,     0,      0, "FAULT_REG" }

-:779: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#779: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:61:
+#define COMMON_BASE_ENGINE_INSTANCE \
+	{ RING_PSMI_CTL(0),         0,      0, "RC PSMI" }, \
+	{ RING_ESR(0),              0,      0, "ESR" }, \
+	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
+	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
+	{ RING_IPEIR(0),            0,      0, "IPEIR" }, \
+	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
+	{ RING_INSTPS(0),           0,      0, "INSTPS" }, \
+	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
+	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
+	{ RING_BBSTATE(0),          0,      0, "BB_STATE" }, \
+	{ CCID(0),                  0,      0, "CCID" }, \
+	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
+	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
+	{ INSTPM(0),                0,      0, "INSTPM" }, \
+	{ RING_INSTDONE(0),         0,      0, "INSTDONE" }, \
+	{ RING_NOPID(0),            0,      0, "RING_NOPID" }, \
+	{ RING_START(0),            0,      0, "START" }, \
+	{ RING_HEAD(0),             0,      0, "HEAD" }, \
+	{ RING_TAIL(0),             0,      0, "TAIL" }, \
+	{ RING_CTL(0),              0,      0, "CTL" }, \
+	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
+	{ RING_CONTEXT_CONTROL(0),  0,      0, "RING_CONTEXT_CONTROL" }, \
+	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
+	{ RING_MODE(0),             0,      0, "GFX_MODE" }, \
+	{ GEN8_RING_PDP_LDW(0, 0),  0,      0, "PDP0_LDW" }, \
+	{ GEN8_RING_PDP_UDW(0, 0),  0,      0, "PDP0_UDW" }, \
+	{ GEN8_RING_PDP_LDW(0, 1),  0,      0, "PDP1_LDW" }, \
+	{ GEN8_RING_PDP_UDW(0, 1),  0,      0, "PDP1_UDW" }, \
+	{ GEN8_RING_PDP_LDW(0, 2),  0,      0, "PDP2_LDW" }, \
+	{ GEN8_RING_PDP_UDW(0, 2),  0,      0, "PDP2_UDW" }, \
+	{ GEN8_RING_PDP_LDW(0, 3),  0,      0, "PDP3_LDW" }, \
+	{ GEN8_RING_PDP_UDW(0, 3),  0,      0, "PDP3_UDW" }

-:819: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#819: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:101:
+#define COMMON_GEN12BASE_RENDER \
+	{ GEN12_SC_INSTDONE_EXTRA,  0,      0, "GEN12_SC_INSTDONE_EXTRA" }, \
+	{ GEN12_SC_INSTDONE_EXTRA2, 0,      0, "GEN12_SC_INSTDONE_EXTRA2" }

-:823: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#823: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:105:
+#define COMMON_GEN12BASE_VEC \
+	{ GEN12_SFC_DONE(0),        0,      0, "SFC_DONE[0]" }, \
+	{ GEN12_SFC_DONE(1),        0,      0, "SFC_DONE[1]" }, \
+	{ GEN12_SFC_DONE(2),        0,      0, "SFC_DONE[2]" }, \
+	{ GEN12_SFC_DONE(3),        0,      0, "SFC_DONE[3]" }

-:894: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regslist' - possible side-effects?
#894: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:176:
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+		NULL, \
+	}

-:945: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#945: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:227:
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_lo),	RING_EXECLIST_SQ_CONTENTS_LO(0)},

-:946: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#946: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:228:
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_hi),	RING_EXECLIST_SQ_CONTENTS_HI(0)},

-:1092: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt_' - possible side-effects?
#1092: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:374:
+#define _HAS_SS(ss_, gt_, group_, instance_) ( \
+	GRAPHICS_VERx100(gt_to_xe(gt_)) >= 1250 ? \
+		xe_sseu_has_subslice(gt_, 0, ss_) : \
+		xe_sseu_has_subslice(gt_, group_, instance_))

-:1101: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ss_' - possible side-effects?
#1101: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:383:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_SS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:1101: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt_' - possible side-effects?
#1101: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:383:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_SS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:1101: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'group_' - possible side-effects?
#1101: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:383:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_SS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:1101: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'group_' may be better as '(group_)' to avoid precedence issues
#1101: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:383:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_SS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:1101: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'instance_' - possible side-effects?
#1101: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:383:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_SS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:1101: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'instance_' may be better as '(instance_)' to avoid precedence issues
#1101: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:383:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_SS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:1373: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#1373: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:655:
+	if (!caplist) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");

-:1413: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#1413: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:695:
+	if (!null_header) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");

total: 6 errors, 6 warnings, 8 checks, 3126 lines checked


