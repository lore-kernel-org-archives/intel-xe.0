Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8D2C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 21:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A6D112042;
	Wed, 27 Mar 2024 21:07:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4019C112043;
 Wed, 27 Mar 2024 21:07:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_GuC_bas?=
 =?utf-8?q?ed_register_capture_for_error_capture_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Mar 2024 21:07:51 -0000
Message-ID: <171157367126.1060939.3794224488907227698@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240327204041.178879-1-zhanjun.dong@intel.com>
In-Reply-To: <20240327204041.178879-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev6)
URL   : https://patchwork.freedesktop.org/series/128077/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ea574c4b2d712bd0d2ca7cd4e9b522f296a27196
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Wed Mar 27 13:40:41 2024 -0700

    drm/xe/guc: Plumb GuC-capture into dev coredump
    
    Add xe_hw_engine_snapshot_from_capture to take snapshot from capture
    node list.
    Add data struct to map register to a snapshot field, although all
    field is mapped now, which means the offset could be optimized out,
    while in the future, depends on system configuration, the field might
    not be consecutive, keep the offset is reserved for future.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 07c774152cf8a034784b40978a77b5ee66e4779b drm-intel
a8e9f89ba528 drm/xe/guc: Update GuC ADS size for error capture
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
-:274: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#274: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:551:
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,

-:347: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#347: 
new file mode 100644

-:403: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ar' - possible side-effects?
#403: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:52:
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])

-:403: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'index' - possible side-effects?
#403: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:52:
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])

-:588: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#588: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:237:
+	if (!caplist) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");

-:628: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#628: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:277:
+	if (!null_header) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");

total: 0 errors, 4 warnings, 2 checks, 840 lines checked
3f0f0df39224 drm/xe/guc: Add XE_LP steered register lists
-:52: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#52: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:41:
+#define COMMON_BASE_ENGINE_INSTANCE \
+	{ RING_ESR(0),              0,      0, "ESR" }, \
+	{ RING_EMR(0),              0,      0, "EMR" }, \
+	{ RING_EIR(0),              0,      0, "EIR" }, \
+	{ RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
+	{ RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
+	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
+	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
+	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
+	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
+	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
+	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
+	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
+	{ RING_START(0),            0,      0, "START" }, \
+	{ RING_HEAD(0),             0,      0, "HEAD" }, \
+	{ RING_TAIL(0),             0,      0, "TAIL" }, \
+	{ RING_CTL(0),              0,      0, "CTL" }, \
+	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
+	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
+	{ RING_MODE(0),             0,      0, "GFX_MODE" }

-:112: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regslist' - possible side-effects?
#112: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:101:
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+		NULL, \
+	}

total: 1 errors, 0 warnings, 1 checks, 241 lines checked
92b7457968bd drm/xe/guc: Add capture size check in GuC log buffer
0688f53f39cf drm/xe/guc: Check sizing of guc_capture output
d25422eda787 drm/xe/guc: Extract GuC error capture lists
b3d38e52c1c1 drm/xe/guc: Pre-allocate output nodes for extraction
ea574c4b2d71 drm/xe/guc: Plumb GuC-capture into dev coredump


