Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AA8CD8CB6
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 19:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BFE10E3D7;
	Tue, 10 Oct 2023 19:52:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6363E10E3D7;
 Tue, 10 Oct 2023 19:52:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 60DA1AADD7;
 Tue, 10 Oct 2023 19:52:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 10 Oct 2023 19:52:12 -0000
Message-ID: <169696753239.28099.10096157128027788044@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231010184151.91195-1-jose.souza@intel.com>
In-Reply-To: <20231010184151.91195-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5Bv3=2C1/3=5D_drm/xe=3A_Store_xe=5Fhe=5Feng?=
 =?utf-8?q?ine_in_xe=5Fhw=5Fengine=5Fsnapshot?=
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

Series: series starting with [v3,1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
URL   : https://patchwork.freedesktop.org/series/124920/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ad41c87b6962e5430cc24dbdc49fb9803ee46cb4
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Oct 10 11:41:51 2023 -0700

    drm/xe: Add INSTDONE registers to devcoredump
    
    This registers contains important information that can help with debug
    of GPU hangs.
    
    While at it also fixing the double line jump at the end of engine
    registers for CCS engines.
    
    v2:
    - print other INSTDONE registers
    
    v3:
    - add for_each_geometry/compute_dss()
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 37b2d042c23ae6a10055ea92101a15083d64c718 drm-intel
a49759c00 drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
091516308 drm/xe: Add misc functions to support read of specific DSS registers
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

-:163: WARNING:NEW_TYPEDEFS: do not add new typedefs
#163: FILE: drivers/gpu/drm/xe/xe_gt_types.h:31:
+typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];

total: 2 errors, 1 warnings, 12 checks, 111 lines checked
ad41c87b6 drm/xe: Add INSTDONE registers to devcoredump


