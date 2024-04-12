Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFAAC04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 07:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D339210F365;
	Fri, 12 Apr 2024 07:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn1xDmBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E279710E009
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712908141; x=1744444141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxCR3cF4dFQGXpIhHhGhzCRBUgnC75Wp7lftmPl1zEs=;
 b=dn1xDmBQnkgQbVaVhq64IyHS8hYQNuGOjxyT1DvDGwxCBMCYAANqOtNx
 e6+sosF3aRnaLkQoWv7sXz0nqQgb7HGbbD7iDxiPf57Z/Y04sQJY0o9Ou
 vNnuhnP2MKB1wpy47SvxWGoSZwcY0K8IgoCnUPV3R+M3JVNZcm6uljqOB
 JrJghVmwf9zjs8KhwgmPnb/BnTslzS2KWk3SFAiMNcmobrH2YAHEBpDu7
 OLdsfIfYNhZ43s2Hm3D1q9Negt7RHTAAs/RjRmVeTVh4QcO/nbJJF3e5U
 B6MVw08L8kgPv3kvSwIHEcSL6dxiSsiR74bw2Xqljff32ZkoMzJFAw82L A==;
X-CSE-ConnectionGUID: U3Xd6iAGTb6PloOm/SFa8g==
X-CSE-MsgGUID: tnblCoQDSlOToZzOd6SnSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11317206"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11317206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 00:49:01 -0700
X-CSE-ConnectionGUID: rox2VMiqTw2dt341PpyrWQ==
X-CSE-MsgGUID: a5+jG4L6Tdevzpym6swMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21220719"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 00:49:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 1/7] drm/xe: Simplify function return using
 drmm_add_action_or_reset()
Date: Fri, 12 Apr 2024 13:32:39 +0530
Message-Id: <20240412080245.1044902-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
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

-v2:
cleanup in xe_display too.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 8 +-------
 drivers/gpu/drm/xe/xe_device.c          | 6 +-----
 drivers/gpu/drm/xe/xe_gsc_proxy.c       | 7 +------
 drivers/gpu/drm/xe/xe_gt.c              | 6 +-----
 drivers/gpu/drm/xe/xe_guc_pc.c          | 6 +-----
 drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +-----
 6 files changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 6ec375c1c4b6..63b27fbcdaca 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -101,8 +101,6 @@ static void display_destroy(struct drm_device *dev, void *dummy)
  */
 int xe_display_create(struct xe_device *xe)
 {
-	int err;
-
 	spin_lock_init(&xe->display.fb_tracking.lock);
 
 	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
@@ -110,11 +108,7 @@ int xe_display_create(struct xe_device *xe)
 	drmm_mutex_init(&xe->drm, &xe->sb_lock);
 	xe->enabled_irq_mask = ~0;
 
-	err = drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
-	if (err)
-		return err;
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
 }
 
 static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d85a2ba0a057..57a8e5c145c3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -655,11 +655,7 @@ int xe_device_probe(struct xe_device *xe)
 
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

