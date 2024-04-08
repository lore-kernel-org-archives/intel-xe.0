Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825AFC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 12:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253EB10F948;
	Mon,  8 Apr 2024 12:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZ6zNYuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3740010FDC2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712579694; x=1744115694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TzyjwNKuxieWJWgDLkXSXu/ONQ8UQ1rDobMMPr1kbY8=;
 b=gZ6zNYuf5KIV/EzPZ7RF7wrJDlwTPdMBtRIUlhIElCgbuMm/qXM6gd5U
 jEQYFBmzZN7A9Cx58vZn4Dq0tuvYROzVNa8RS/IJLcAUV47sLf0f68ujB
 pwnQwRKaG8xTiDEwWwW7fdGLsfd8z3buKBGNAEqcB7ffhe7onCaAg3mE1
 iwRvJgCMWwrA0MDB/TF95MZA4pQMau/lz4ri68EMQ2wd8WwJUG6/OBzas
 6o0J+1keDtfLv0EkmUHGIayvYhYRlJ+DBagdNtyU94OWZGbzxMkeilZSk
 OeIxL75g6Rs+SUzdPhiFbiYz/6yQ0WKMTc1+reeoFvMVs/8MYRAaapZ3/ g==;
X-CSE-ConnectionGUID: ObeeRkVHTXOikhKniQErcw==
X-CSE-MsgGUID: C+IIfLYMTMu4fOBZlR6W2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25301547"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="25301547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:34:54 -0700
X-CSE-ConnectionGUID: xDxCF5ybQFKL1W1xsJ3r1Q==
X-CSE-MsgGUID: /YUAk+pyT3OReyViYDhFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19828676"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2024 05:34:52 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/4] drm/xe: Simplify function return using
 drmm_add_action_or_reset()
Date: Mon,  8 Apr 2024 18:18:27 +0530
Message-Id: <20240408124830.591903-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408124830.591903-1-himal.prasad.ghimiray@intel.com>
References: <20240408124830.591903-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of assigning the value of drmm_add_action_or_reset() to err and
returning err in case of failure and 0 in case of success, simply return
the result of drmm_add_action_or_reset().

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c    | 6 +-----
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 7 +------
 drivers/gpu/drm/xe/xe_gt.c        | 6 +-----
 drivers/gpu/drm/xe/xe_guc_pc.c    | 6 +-----
 drivers/gpu/drm/xe/xe_hw_engine.c | 6 +-----
 5 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9083f5e02dd9..ce8d632cb961 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -588,11 +588,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
-	if (err)
-		return err;
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 
 err_fini_display:
 	xe_display_driver_remove(xe);
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 35e397b68dfc..1b908d238bd1 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -403,7 +403,6 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
 	void *csme;
-	int err;
 
 	csme = kzalloc(GSC_PROXY_CHANNEL_SIZE, GFP_KERNEL);
 	if (!csme)
@@ -424,11 +423,7 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	gsc->proxy.to_csme = csme;
 	gsc->proxy.from_csme = csme + GSC_PROXY_BUFFER_SIZE;
 
-	err = drmm_add_action_or_reset(&xe->drm, proxy_channel_free, gsc);
-	if (err)
-		return err;
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, proxy_channel_free, gsc);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cfa5da900461..2421a8d34324 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -560,11 +560,7 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
-	if (err)
-		return err;
-
-	return 0;
+	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 }
 
 static int do_gt_reset(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 521ae24f2314..509649d0e65e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -937,9 +937,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
-	if (err)
-		return err;
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a688bb2d96ce..455f375c1cbd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -550,11 +550,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
 		gt->usm.reserved_bcs_instance = hwe->instance;
 
-	err = drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
-	if (err)
-		return err;
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
 
 err_kernel_lrc:
 	xe_lrc_finish(&hwe->kernel_lrc);
-- 
2.25.1

