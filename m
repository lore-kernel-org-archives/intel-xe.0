Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF31FC52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5428610EA56;
	Sat, 10 Aug 2024 01:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlU4lzFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35D410EA56
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PMt6o45OHPjr+oyuMJk+beKUa4BxX5cYyq45tBqre4M=;
 b=RlU4lzFRNty9jStMdKndwO2XoknkHtVsCT+bxsESUjwydELKRRYZJ0kU
 US8o6utiDHP7YHJOKL5JwsUPd1WJdt2JtXDLIg5z/xEDX/ckkG2SKRuRE
 /MZMk3TqrH4acuWXhKGXn2u8WH1BOh10ot40pLMm0x/w6WNuKFii0huuV
 vR5MH2r/M85uvwviCDrbUauQL5Sr3arbK5fxFsWJvqwG04jFkRJW3EK+d
 JPeZQusb4FDECsVDksokqkwI1SbItp/GC3wvZcrUqr9P5mIeIryoZFP2i
 m4E6zdWINsvlmayhnF6goOzOT5uaLUA77g268FXmHfelBsTg79jAG62Nv w==;
X-CSE-ConnectionGUID: MphztSSNRV6XtK8B9ICBHw==
X-CSE-MsgGUID: TqIWR6cfRmeHv7QPPi330Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420024"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420024"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: WZ7uebueSjOf4kU98hDcqw==
X-CSE-MsgGUID: j2smPHQlRkO4DyZRA92fug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813382"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/11] drm/xe/uc: Use managed bo for HuC and GSC objects
Date: Fri,  9 Aug 2024 18:55:35 -0700
Message-Id: <20240810015544.3443258-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Drmm actions are not the right ones to clean up BOs and we should use
devm instead. However, we can also instead just allocate the objects
using the managed_bo function, which will internally register the
correct cleanup call and therefore allows us to simplify the code.

While at it, switch to drmm_kzalloc for the GSC proxy allocation to
further simplify the cleanup.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c       | 12 +++--------
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 36 ++++++-------------------------
 drivers/gpu/drm/xe/xe_huc.c       | 19 +++++-----------
 3 files changed, 14 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 77ce44e845c5..8a9b3c50a588 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -450,11 +450,6 @@ static void free_resources(struct drm_device *drm, void *arg)
 		xe_exec_queue_put(gsc->q);
 		gsc->q = NULL;
 	}
-
-	if (gsc->private) {
-		xe_bo_unpin_map_no_vm(gsc->private);
-		gsc->private = NULL;
-	}
 }
 
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
@@ -474,10 +469,9 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 	if (!hwe)
 		return -ENODEV;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_STOLEN |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, SZ_4M,
+					  XE_BO_FLAG_STOLEN |
+					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index aa812a2bc3ed..8f880c44211d 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -376,27 +376,6 @@ static const struct component_ops xe_gsc_proxy_component_ops = {
 	.unbind = xe_gsc_proxy_component_unbind,
 };
 
-static void proxy_channel_free(struct drm_device *drm, void *arg)
-{
-	struct xe_gsc *gsc = arg;
-
-	if (!gsc->proxy.bo)
-		return;
-
-	if (gsc->proxy.to_csme) {
-		kfree(gsc->proxy.to_csme);
-		gsc->proxy.to_csme = NULL;
-		gsc->proxy.from_csme = NULL;
-	}
-
-	if (gsc->proxy.bo) {
-		iosys_map_clear(&gsc->proxy.to_gsc);
-		iosys_map_clear(&gsc->proxy.from_gsc);
-		xe_bo_unpin_map_no_vm(gsc->proxy.bo);
-		gsc->proxy.bo = NULL;
-	}
-}
-
 static int proxy_channel_alloc(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
@@ -405,18 +384,15 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	struct xe_bo *bo;
 	void *csme;
 
-	csme = kzalloc(GSC_PROXY_CHANNEL_SIZE, GFP_KERNEL);
+	csme = drmm_kzalloc(&xe->drm, GSC_PROXY_CHANNEL_SIZE, GFP_KERNEL);
 	if (!csme)
 		return -ENOMEM;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_PROXY_CHANNEL_SIZE,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT);
-	if (IS_ERR(bo)) {
-		kfree(csme);
+	bo = xe_managed_bo_create_pin_map(xe, tile, GSC_PROXY_CHANNEL_SIZE,
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT);
+	if (IS_ERR(bo))
 		return PTR_ERR(bo);
-	}
 
 	gsc->proxy.bo = bo;
 	gsc->proxy.to_gsc = IOSYS_MAP_INIT_OFFSET(&bo->vmap, 0);
@@ -424,7 +400,7 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	gsc->proxy.to_csme = csme;
 	gsc->proxy.from_csme = csme + GSC_PROXY_BUFFER_SIZE;
 
-	return drmm_add_action_or_reset(&xe->drm, proxy_channel_free, gsc);
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index bec4366e5513..f5459f97af23 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -43,14 +43,6 @@ huc_to_guc(struct xe_huc *huc)
 	return &container_of(huc, struct xe_uc, huc)->guc;
 }
 
-static void free_gsc_pkt(struct drm_device *drm, void *arg)
-{
-	struct xe_huc *huc = arg;
-
-	xe_bo_unpin_map_no_vm(huc->gsc_pkt);
-	huc->gsc_pkt = NULL;
-}
-
 #define PXP43_HUC_AUTH_INOUT_SIZE SZ_4K
 static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 {
@@ -59,17 +51,16 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 	struct xe_bo *bo;
 
 	/* we use a single object for both input and output */
-	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
-				  PXP43_HUC_AUTH_INOUT_SIZE * 2,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_managed_bo_create_pin_map(xe, gt_to_tile(gt),
+					  PXP43_HUC_AUTH_INOUT_SIZE * 2,
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
 	huc->gsc_pkt = bo;
 
-	return drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
+	return 0;
 }
 
 int xe_huc_init(struct xe_huc *huc)
-- 
2.34.1

