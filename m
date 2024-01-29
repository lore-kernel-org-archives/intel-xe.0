Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A9DC47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 18:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7C810EA0F;
	Mon, 29 Jan 2024 18:21:46 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD5210EA0F;
 Mon, 29 Jan 2024 18:21:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/6=5D_drm/xe=3A_Add_functions_to_convert_regular_address_to_?=
 =?utf-8?q?canonical_address_and_back?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 29 Jan 2024 18:21:45 -0000
Message-ID: <170655250524.806672.7359790737664401903@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129181742.183694-1-jose.souza@intel.com>
In-Reply-To: <20240129181742.183694-1-jose.souza@intel.com>
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

Series: series starting with [v3,1/6] drm/xe: Add functions to convert regular address to canonical address and back
URL   : https://patchwork.freedesktop.org/series/129278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a55171d176b5d6d5c4d61f8e3f385455693704fb
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Mon Jan 29 10:17:42 2024 -0800

    drm/xe: Add INSTDONE registers to devcoredump
    
    This registers contains important information that can help with debug
    of GPU hangs.
    
    While at it also fixing the double line jump at the end of engine
    registers for CCS engines.
    
    v2:
    - print other INSTDONE registers
    
    v3:
    - add for_each_geometry/compute_dss()
    
    v4:
    - print one slice_common_instdone per glice in DG2+
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6 drm-intel
f39e71ed5 drm/xe: Add functions to convert regular address to canonical address and back
b0693d3ba drm/xe: Add batch buffer addresses to devcoredump
aa144d2a3 drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
44864cb89 drm/xe: Add misc functions to support read of specific DSS registers
-:131: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#131: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:41:
+#define for_each_geometry_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_geometry_dss(gt, dss))

-:131: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#131: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:41:
+#define for_each_geometry_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_geometry_dss(gt, dss))

-:131: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss' - possible side-effects?
#131: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:41:
+#define for_each_geometry_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_geometry_dss(gt, dss))

-:131: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'grp' - possible side-effects?
#131: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:41:
+#define for_each_geometry_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_geometry_dss(gt, dss))

-:131: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'grp' may be better as '(grp)' to avoid precedence issues
#131: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:41:
+#define for_each_geometry_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_geometry_dss(gt, dss))

-:131: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'inst' - possible side-effects?
#131: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:41:
+#define for_each_geometry_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_geometry_dss(gt, dss))

-:131: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'inst' may be better as '(inst)' to avoid precedence issues
#131: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:41:
+#define for_each_geometry_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_geometry_dss(gt, dss))

-:144: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#144: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:54:
+#define for_each_compute_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_compute_dss(gt, dss))

-:144: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#144: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:54:
+#define for_each_compute_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_compute_dss(gt, dss))

-:144: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss' - possible side-effects?
#144: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:54:
+#define for_each_compute_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_compute_dss(gt, dss))

-:144: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'grp' - possible side-effects?
#144: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:54:
+#define for_each_compute_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_compute_dss(gt, dss))

-:144: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'grp' may be better as '(grp)' to avoid precedence issues
#144: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:54:
+#define for_each_compute_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_compute_dss(gt, dss))

-:144: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'inst' - possible side-effects?
#144: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:54:
+#define for_each_compute_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_compute_dss(gt, dss))

-:144: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'inst' may be better as '(inst)' to avoid precedence issues
#144: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:54:
+#define for_each_compute_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_compute_dss(gt, dss))

-:175: WARNING:NEW_TYPEDEFS: do not add new typedefs
#175: FILE: drivers/gpu/drm/xe/xe_gt_types.h:31:
+typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];

total: 2 errors, 1 warnings, 12 checks, 118 lines checked
7117d6ac6 drm/xe: Move XE_MAX_EU_FUSE_BITS to xe_gt_types.h
a55171d17 drm/xe: Add INSTDONE registers to devcoredump
-:124: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#124: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:769:
+				xe_gt_mcr_unicast_read(gt, DG2_SLICE_COMMON_INSTDONE, group, instance);

-:126: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#126: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:771:
+				xe_gt_mcr_unicast_read(gt, DG2_SLICE_COMMON_INSTDONE_EXTRA, group, instance);

-:128: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#128: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:773:
+				xe_gt_mcr_unicast_read(gt, DG2_SLICE_COMMON_INSTDONE_EXTRA2, group, instance);

-:220: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#220: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:915:
+			drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
+					snapshot->reg.instdone.slice_common[dss]);

-:222: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#222: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:917:
+			drm_printf(p, "\tSC_EXTRA_INSTDONE[%u]: 0x%08x\n", dss,
+					snapshot->reg.instdone.slice_common_extra[dss]);

-:224: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#224: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:919:
+			drm_printf(p, "\tSC_EXTRA2_INSTDONE[%u]: 0x%08x\n", dss,
+					snapshot->reg.instdone.slice_common_extra2[dss]);

total: 0 errors, 3 warnings, 3 checks, 233 lines checked


