Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5241CD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DB2112747;
	Mon,  8 Apr 2024 16:00:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E946411274B;
 Mon,  8 Apr 2024 16:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/3=5D_drm/xe=3A_Store_xe=5Fhe=5Fengine_in_xe=5Fhw=5Fengine?=
 =?utf-8?q?=5Fsnapshot_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 16:00:29 -0000
Message-ID: <171259202995.1285949.8720868792343961987@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405182326.72157-1-jose.souza@intel.com>
In-Reply-To: <20240405182326.72157-1-jose.souza@intel.com>
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

Series: series starting with [v6,1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot (rev2)
URL   : https://patchwork.freedesktop.org/series/132095/
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
commit 10cc0928aaf888880c8fa17d1e8b284df6dab748
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Fri Apr 5 11:23:26 2024 -0700

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
    
    v5:
    - rename registers prefix from DG2 to XEHPG (Zhanjun)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Zhanjun Dong <zhanjun.dong@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch a533b51ca017728c1228432e8e1e9aba4fd65b02 drm-intel
a82ca845117d drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
8480e1d57a05 drm/xe: Add helpers to loop over geometry and compute DSS
-:39: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#39: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:51:
+#define for_each_geometry_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_geometry_dss(gt, dss))

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss' - possible side-effects?
#39: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:51:
+#define for_each_geometry_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_geometry_dss(gt, dss))

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#39: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:51:
+#define for_each_geometry_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_geometry_dss(gt, dss))

-:51: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#51: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:63:
+#define for_each_compute_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_compute_dss(gt, dss))

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss' - possible side-effects?
#51: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:63:
+#define for_each_compute_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_compute_dss(gt, dss))

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#51: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:63:
+#define for_each_compute_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_compute_dss(gt, dss))

total: 2 errors, 0 warnings, 4 checks, 48 lines checked
10cc0928aaf8 drm/xe: Add INSTDONE registers to devcoredump
-:130: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#130: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:806:
+				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA, group, instance);

-:132: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#132: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:808:
+				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA2, group, instance);

total: 0 errors, 2 warnings, 0 checks, 239 lines checked


