Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A732EC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 21:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B2110F821;
	Thu,  2 May 2024 21:31:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303AF10F821;
 Thu,  2 May 2024 21:31:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_GuC_bas?=
 =?utf-8?q?ed_register_capture_for_error_capture_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 21:31:40 -0000
Message-ID: <171468550019.1869305.7210440251112749398@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502205738.863369-1-zhanjun.dong@intel.com>
In-Reply-To: <20240502205738.863369-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev7)
URL   : https://patchwork.freedesktop.org/series/128077/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 12126a7d91c26f95eb9f51348a3a91f592021b02
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Thu May 2 13:57:38 2024 -0700

    drm/xe/guc: Plumb GuC-capture into dev coredump
    
    Add xe_hw_engine_snapshot_from_capture to take snapshot from capture
    node list.
    Add data struct to map register to a snapshot field, although all
    field is mapped now, which means the offset could be optimized out,
    while in the future, depends on system configuration, the field might
    not be consecutive, keep the offset is reserved for future.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 9bc56b5d5f4e38bd455b3bc78932b73af09a9b72 drm-intel
4fd8fc3d1fec drm/xe/guc: Prepare GuC register list and update ADS size for error capture
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
-:293: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#293: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:687:
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,

-:385: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#385: 
new file mode 100644

-:430: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#430: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:41:
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

-:490: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regslist' - possible side-effects?
#490: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:101:
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+		NULL, \
+	}

-:537: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ar' - possible side-effects?
#537: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:148:
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])

-:537: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'index' - possible side-effects?
#537: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:148:
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])

total: 1 errors, 2 warnings, 3 checks, 1068 lines checked
86aac9c80302 drm/xe/guc: Add capture size check in GuC log buffer
71181ab443f3 drm/xe/guc: Pre-allocate output nodes for extraction
42e45a5fa972 drm/xe/guc: Extract GuC error capture lists
12126a7d91c2 drm/xe/guc: Plumb GuC-capture into dev coredump


