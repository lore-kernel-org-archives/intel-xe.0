Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE37C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 02:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C3A10E498;
	Tue, 20 Aug 2024 02:17:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659CA10E498;
 Tue, 20 Aug 2024 02:17:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_GuC_bas?=
 =?utf-8?q?ed_register_capture_for_error_capture_=28rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 02:17:44 -0000
Message-ID: <172412026441.697970.4852381087635471866@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
In-Reply-To: <20240820021142.436536-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev16)
URL   : https://patchwork.freedesktop.org/series/128077/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 386b19f76e0dda9e97fbe275267228118ec005b8
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Mon Aug 19 19:11:42 2024 -0700

    drm/xe/guc: Plumb GuC-capture into dev coredump
    
    Add pre-capture by read from hw engine if GuC capture data is not ready,
    the pre-captured data will be refereshed if GuC capture is ready at later
    time.
    Provide xe_guc_capture_get_reg_desc_list to get the register dscriptor
    list.
    GuC support limited register ranges to be captured, add type of direct
    read to read these registers by host.
    Add function to check if capture is ready for a job.
    Print out snapshot registers by types of global, class, instance and
    direct read.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 4d24271792fac837e728f7bb6237a94ee46cc76e drm-intel
ce91250fde52 drm/xe/guc: Prepare GuC register list and update ADS size for error capture
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

-:545: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#545: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:52:
+#define COMMON_BASE_ENGINE_INSTANCE \
+	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	"HWSTAM"}, \
+	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	"RING_HWS_PGA"}, \
+	{ RING_HEAD(0),			REG_32BIT,	0,	0,	"RING_HEAD"}, \
+	{ RING_TAIL(0),			REG_32BIT,	0,	0,	"RING_TAIL"}, \
+	{ RING_CTL(0),			REG_32BIT,	0,	0,	"RING_CTL"}, \
+	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	"RING_MI_MODE"}, \
+	{ RING_MODE(0),			REG_32BIT,	0,	0,	"RING_MODE"}, \
+	{ RING_ESR(0),			REG_32BIT,	0,	0,	"RING_ESR"}, \
+	{ RING_EMR(0),			REG_32BIT,	0,	0,	"RING_EMR"}, \
+	{ RING_EIR(0),			REG_32BIT,	0,	0,	"RING_EIR"}, \
+	{ RING_IMR(0),			REG_32BIT,	0,	0,	"RING_IMR"}, \
+	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	"IPEHR"}, \
+	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	"RING_INSTDONE"}, \
+	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	"INDIRECT_RING_STATE"}, \
+	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
+	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"ACTHD"}, \
+	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
+	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_BBADDR"}, \
+	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
+	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_START"}, \
+	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
+	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_DMA_FADD"}, \
+	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	NULL}, \
+	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_STATUS"}, \
+	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	NULL}, \
+	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_SQ_CONTENTS"}

-:576: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#576: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:83:
+#define COMMON_XELP_RC_CLASS_INSTDONE \
+	{ SC_INSTDONE,			REG_32BIT,	0,	0,	"SC_INSTDONE"}, \
+	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA"}, \
+	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA2"}

-:631: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'regslist' - possible side-effects?
#631: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:138:
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class \
+	}

total: 2 errors, 1 warnings, 1 checks, 1104 lines checked
616ffac67cbd drm/xe/guc: Add XE_LP steered register lists
572defbe8089 drm/xe/guc: Add capture size check in GuC log buffer
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 224 lines checked
cac92ff7c748 drm/xe/guc: Extract GuC error capture lists
bdcc79fb02ca drm/xe/guc: Move xe_lrc_snapshot to header file
60063e5a9954 drm/xe/guc: Add dss conversion from group/instance ID
386b19f76e0d drm/xe/guc: Plumb GuC-capture into dev coredump
-:150: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#150: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:147:
+#define XELP_VEC_DIRECT_READ \
+	{ SFC_DONE(0),			0,	0,	0,	"SFC_DONE[0]"}, \
+	{ SFC_DONE(1),			0,	0,	0,	"SFC_DONE[1]"}, \
+	{ SFC_DONE(2),			0,	0,	0,	"SFC_DONE[2]"}, \
+	{ SFC_DONE(3),			0,	0,	0,	"SFC_DONE[3]"}

total: 1 errors, 0 warnings, 0 checks, 1073 lines checked


