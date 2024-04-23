Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034CAC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 19:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD40F1135D6;
	Tue, 23 Apr 2024 19:09:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FD61135D6;
 Tue, 23 Apr 2024 19:09:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/3=5D_drm/xe=3A_Store_xe=5Fhe=5Fengine_in_xe=5Fhw=5Fengine?=
 =?utf-8?q?=5Fsnapshot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 19:09:32 -0000
Message-ID: <171389937203.1607644.12661458495227424923@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423160626.77110-1-jose.souza@intel.com>
In-Reply-To: <20240423160626.77110-1-jose.souza@intel.com>
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

Series: series starting with [CI,1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
URL   : https://patchwork.freedesktop.org/series/132782/
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
commit 71d70dfa9d8406fea8b856cb58378e7845e42fe5
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Apr 23 09:05:50 2024 -0700

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
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch e1dc9638bb47a28181fee1a9a180445ca2a8b9cf drm-intel
c1fd3bdd4c63 drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
28fd4cb72ddf drm/xe: Add helpers to loop over geometry and compute DSS
-:40: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#40: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:51:
+#define for_each_geometry_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_geometry_dss(gt, dss))

-:40: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss' - possible side-effects?
#40: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:51:
+#define for_each_geometry_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_geometry_dss(gt, dss))

-:40: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#40: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:51:
+#define for_each_geometry_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_geometry_dss(gt, dss))

-:52: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#52: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:63:
+#define for_each_compute_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_compute_dss(gt, dss))

-:52: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss' - possible side-effects?
#52: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:63:
+#define for_each_compute_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_compute_dss(gt, dss))

-:52: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#52: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:63:
+#define for_each_compute_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_compute_dss(gt, dss))

total: 2 errors, 0 warnings, 4 checks, 48 lines checked
71d70dfa9d84 drm/xe: Add INSTDONE registers to devcoredump
-:131: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#131: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:802:
+				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA, group, instance);

-:133: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#133: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:804:
+				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA2, group, instance);

total: 0 errors, 2 warnings, 0 checks, 239 lines checked


