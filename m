Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860C6C27C54
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 00:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9D910E1A4;
	Fri,  7 Jun 2024 00:12:55 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63C010E1A4;
 Fri,  7 Jun 2024 00:12:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_GuC_bas?=
 =?utf-8?q?ed_register_capture_for_error_capture_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 00:12:53 -0000
Message-ID: <171771917380.24191.13905786860885343218@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
In-Reply-To: <20240607000719.1012422-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev9)
URL   : https://patchwork.freedesktop.org/series/128077/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 17808d3b49ecb1f0a11f6eb09543edd0c97a20bc
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Thu Jun 6 17:07:19 2024 -0700

    drm/xe/guc: Extract GuC capture lists to register snapshot
    
    Upon the G2H Notify-Err-Capture event, parse through the
    GuC Log Buffer (error-capture-subregion) and generate one or
    more capture-nodes. A single node represents a single "engine-
    instance-capture-dump" and contains at least 3 register lists:
    global, engine-class and engine-instance. An internal link
    list is maintained to store one or more nodes.
    Because the link-list node generation happen before the call
    to devcoredump, duplicate global and engine-class register
    lists for each engine-instance register dump if we find
    dependent-engine resets in a engine-capture-group.
    When xe_devcoredump calls into snapshot_from_capture_engine,
    we detach the matching node (guc-id, LRCA, etc) from the link list
    above and attach it to snapshot_regs structure when have
    matching LRCA/guc-id/engine-instance.
    
    To avoid dynamically allocate the output nodes during gt reset,
    pre-allocate a fixed number of empty nodes up front (at the
    time of ADS registration) that we can consume from or return to
    an internal cached list of nodes.
    Add guc capture data structure definition.
    
    Add xe_hw_engine_snapshot_from_capture to take snapshot from capture
    node list.
    Move snapshot register struct out of engine snapshot struct.
    Add offset in snapshot register to register definition list at
    xe_guc_capture.c.
    Snapshot could be split into global, engine class, engine instance
    and steering register zone, few macros defined to separate zones.
    Support combines 2 32bit registers as a 64bit register in snapshot,
    perform endian convert if needed.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch ed13bc296bbebf04f8a7dabadf2d9f44cc6b5462 drm-intel
6b651e28699e drm/xe/guc: Prepare GuC register list and update ADS size for error capture
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
-:295: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#295: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:690:
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,

-:387: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#387: 
new file mode 100644

-:432: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#432: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:41:
+#define COMMON_BASE_ENGINE_INSTANCE \
+	{ RING_ESR(0),              0,      0}, \
+	{ RING_EMR(0),              0,      0}, \
+	{ RING_EIR(0),              0,      0}, \
+	{ RING_EXECLIST_STATUS_HI(0), 0,    0}, \
+	{ RING_EXECLIST_STATUS_LO(0), 0,    0}, \
+	{ RING_DMA_FADD(0),         0,      0}, \
+	{ RING_DMA_FADD_UDW(0),     0,      0}, \
+	{ RING_IPEHR(0),            0,      0}, \
+	{ RING_BBADDR(0),           0,      0}, \
+	{ RING_BBADDR_UDW(0),       0,      0}, \
+	{ RING_ACTHD(0),            0,      0}, \
+	{ RING_ACTHD_UDW(0),        0,      0}, \
+	{ RING_START(0),            0,      0}, \
+	{ RING_HEAD(0),             0,      0}, \
+	{ RING_TAIL(0),             0,      0}, \
+	{ RING_CTL(0),              0,      0}, \
+	{ RING_MI_MODE(0),          0,      0}, \
+	{ RING_HWS_PGA(0),          0,      0}, \
+	{ RING_MODE(0),             0,      0}

-:492: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regslist' - possible side-effects?
#492: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:101:
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+	}

-:538: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ar' - possible side-effects?
#538: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:147:
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])

-:538: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'index' - possible side-effects?
#538: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:147:
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])

total: 1 errors, 2 warnings, 3 checks, 915 lines checked
aeca579ef624 drm/xe/guc: Add XE_LP steered register lists
98b12441983d drm/xe/guc: Add capture size check in GuC log buffer
17808d3b49ec drm/xe/guc: Extract GuC capture lists to register snapshot
-:256: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#256: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:109:
+#define XELP_DIRECT_READ_VEC_CLASS \
+	{ SFC_DONE(0),				0,	0, "SFC_DONE[0]", \
+	  offsetof(struct snapshot_regs, sfc_done_0)	}, \
+	{ SFC_DONE(1),				0,	0, "SFC_DONE[1]", \
+	  offsetof(struct snapshot_regs, sfc_done_1)	}, \
+	{ SFC_DONE(2),				0,	0, "SFC_DONE[2]", \
+	  offsetof(struct snapshot_regs, sfc_done_2)	}, \
+	{ SFC_DONE(3),				0,	0, "SFC_DONE[3]", \
+	  offsetof(struct snapshot_regs, sfc_done_3)	}

total: 1 errors, 0 warnings, 0 checks, 1761 lines checked


