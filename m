Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B5CC46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 22:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CCB10F071;
	Mon, 22 Jan 2024 22:17:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8462D10F071;
 Mon, 22 Jan 2024 22:17:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_GuC_bas?=
 =?utf-8?q?ed_register_capture_for_error_capture_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Mon, 22 Jan 2024 22:17:06 -0000
Message-ID: <170596182654.665201.6889301060123776152@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122212557.55929-1-zhanjun.dong@intel.com>
In-Reply-To: <20240122212557.55929-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev3)
URL   : https://patchwork.freedesktop.org/series/128077/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a40605f1e772c054f55774fa442d918f950a9c1d
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Mon Jan 22 13:25:57 2024 -0800

    drm/xe/guc: Plumb GuC-capture into dev coredump
    
    Add xe_hw_engine_snapshot_from_capture to take snapshot from capture
    node list.
    Add data struct to map register to a snapshot field, although all
    field is mapped now, which means the offset could be optimized out,
    while in the future, depends on system configuration, the field might
    not be consecutive, keep the offset is reserved for future.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c drm-intel
33117125c drm/xe/guc: Add register defines for GuC based register capture
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Add registers defines and list of registers for GuC based error state capture.

-:179: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#179: 
new file mode 100644

-:222: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#222: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:39:
+#define COMMON_XELP_BASE_GLOBAL \
+	{ FORCEWAKE_GT,		    0,      0, "FORCEWAKE" }, \
+	{ FAULT_TLB_DATA0,	    0,      0, "FAULT_TLB_DATA0" }, \
+	{ FAULT_TLB_DATA1,	    0,      0, "FAULT_TLB_DATA1" }, \
+	{ AUX_ERR_DBG,		    0,      0, "AUX_ERR_DBG" }, \
+	{ GAM_DONE,		    0,      0, "GAM_DONE" }, \
+	{ RING_FAULT_REG,	    0,      0, "FAULT_REG" }

-:230: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#230: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:47:
+#define COMMON_BASE_ENGINE_INSTANCE \
+	{ RING_PSMI_CTL(0),         0,      0, "RC PSMI" }, \
+	{ RING_ESR(0),              0,      0, "ESR" }, \
+	{ RING_EMR(0),              0,      0, "EMR" }, \
+	{ RING_EIR(0),              0,      0, "EIR" }, \
+	{ RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
+	{ RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
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
+	{ RING_PDP_LDW(0, 0),	    0,      0, "PDP0_LDW" }, \
+	{ RING_PDP_UDW(0, 0),	    0,      0, "PDP0_UDW" }, \
+	{ RING_PDP_LDW(0, 1),	    0,      0, "PDP1_LDW" }, \
+	{ RING_PDP_UDW(0, 1),	    0,      0, "PDP1_UDW" }, \
+	{ RING_PDP_LDW(0, 2),	    0,      0, "PDP2_LDW" }, \
+	{ RING_PDP_UDW(0, 2),	    0,      0, "PDP2_UDW" }, \
+	{ RING_PDP_LDW(0, 3),	    0,      0, "PDP3_LDW" }, \
+	{ RING_PDP_UDW(0, 3),	    0,      0, "PDP3_UDW" }

-:268: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#268: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:85:
+#define COMMON_XELP_BASE_RENDER \
+	{ SC_INSTDONE,		    0,      0, "SC_INSTDONE" }, \
+	{ SC_INSTDONE_EXTRA,	    0,      0, "SC_INSTDONE_EXTRA" }, \
+	{ SC_INSTDONE_EXTRA2,	    0,      0, "SC_INSTDONE_EXTRA2" }

-:273: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#273: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:90:
+#define COMMON_XELP_BASE_VEC \
+	{ SFC_DONE(0),		    0,      0, "SFC_DONE[0]" }, \
+	{ SFC_DONE(1),		    0,      0, "SFC_DONE[1]" }, \
+	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
+	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }

total: 4 errors, 2 warnings, 0 checks, 257 lines checked
c47c69550 drm/xe/guc: Expose dss per group for GuC error capture
-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ss_' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:119:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt_' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:119:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'group_' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:119:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:87: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'group_' may be better as '(group_)' to avoid precedence issues
#87: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:119:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'instance_' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:119:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:87: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'instance_' may be better as '(instance_)' to avoid precedence issues
#87: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:119:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

total: 0 errors, 0 warnings, 6 checks, 74 lines checked
331cd9df6 drm/xe/guc: Update GuC ADS size for error capture
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:249: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#249: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:561:
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,

-:367: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ar' - possible side-effects?
#367: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:116:
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])

-:367: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'index' - possible side-effects?
#367: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:116:
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])

-:559: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#559: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:330:
+	if (!caplist) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");

-:599: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#599: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:370:
+	if (!null_header) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");

-:644: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#644: 
new file mode 100644

total: 0 errors, 4 warnings, 2 checks, 816 lines checked
0be0860be drm/xe/guc: Add XE_LP steered register lists
-:69: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regslist' - possible side-effects?
#69: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:146:
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+		NULL, \
+	}

-:83: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:160:
+	MAKE_REGLIST(pre_xe_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),

-:87: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#87: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:164:
+	MAKE_REGLIST(pre_xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),

total: 0 errors, 2 warnings, 1 checks, 202 lines checked
00309b09d drm/xe/guc: Add capture size check in GuC log buffer
e2d048b98 drm/xe/guc: Check sizing of guc_capture output
7de947d46 drm/xe/guc: Extract GuC error capture lists on G2H notification
6a1871ac6 drm/xe/guc: Pre-allocate output nodes for extraction
a40605f1e drm/xe/guc: Plumb GuC-capture into dev coredump
-:38: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#38: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:269:
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_lo),	RING_EXECLIST_SQ_CONTENTS_LO(0)},

-:39: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#39: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:270:
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_hi),	RING_EXECLIST_SQ_CONTENTS_HI(0)},

total: 0 errors, 2 warnings, 0 checks, 328 lines checked


