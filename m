Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E76C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 16:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2910EB2C;
	Thu, 20 Jun 2024 16:21:58 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA55610EB2C;
 Thu, 20 Jun 2024 16:21:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_GuC_bas?=
 =?utf-8?q?ed_register_capture_for_error_capture_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jun 2024 16:21:56 -0000
Message-ID: <171890051669.127478.7454975624447968521@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620160811.2774704-1-zhanjun.dong@intel.com>
In-Reply-To: <20240620160811.2774704-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev10)
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
commit 7f21b54950f67936ceb50b3097df6c346782ab28
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Thu Jun 20 09:08:11 2024 -0700

    drm/xe/guc: Plumb GuC-capture into dev coredump
    
    Add xe_hw_engine_snapshot_from_capture to take snapshot from captured
    node list.
    Add pre-capture by read from hw engine if GuC capture data is not ready,
    the pre-captured data will be refereshed if GuC capture is ready at later
    time.
    Add data struct to map captured register value to a snapshot field.
    Add register name to register list.
    Provide xe_guc_capture_get_reg_desc_list to get the register dscriptor
    list.
    Add function to check if capture is ready for a job.
    Sort out snapshot registers into types of global, class, instance and
    direct read.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 29f1cbee5f8da5427bb17ce634426571def7d128 drm-intel
59b0ab0909de drm/xe/guc: Prepare GuC register list and update ADS size for error capture
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
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

-:440: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#440: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:42:
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

-:500: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regslist' - possible side-effects?
#500: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:102:
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+	}

total: 1 errors, 1 warnings, 1 checks, 933 lines checked
371b2fab77fe drm/xe/guc: Add XE_LP steered register lists
6d9e87a9364b drm/xe/guc: Add capture size check in GuC log buffer
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 443 lines checked
d56cee6ca84b drm/xe/guc: Extract GuC error capture lists
7f21b54950f6 drm/xe/guc: Plumb GuC-capture into dev coredump
-:251: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#251: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:115:
+#define XELP_DIRECT_READ_VEC \
+	{ SFC_DONE(0),				0,	0, "SFC_DONE[0]", \
+	  offsetof(struct snapshot_regs, sfc_done_0)	}, \
+	{ SFC_DONE(1),				0,	0, "SFC_DONE[1]", \
+	  offsetof(struct snapshot_regs, sfc_done_1)	}, \
+	{ SFC_DONE(2),				0,	0, "SFC_DONE[2]", \
+	  offsetof(struct snapshot_regs, sfc_done_2)	}, \
+	{ SFC_DONE(3),				0,	0, "SFC_DONE[3]", \
+	  offsetof(struct snapshot_regs, sfc_done_3)	}

total: 1 errors, 0 warnings, 0 checks, 1043 lines checked


