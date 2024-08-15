Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B994DC52D7D
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 23:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B9610E551;
	Thu, 15 Aug 2024 23:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMal8BiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9218A10E551
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723763159; x=1755299159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0TyEl1dYyjgtuN6otxyCRPqE54yzg+R0adBhnE8qJLA=;
 b=HMal8BiAYFEuX9sc6Ihp/YWEcRirUZ53dxtO3Un9g8yLz49mOsk2ZjJ4
 8XmvUzdBkvLYAXdkZqGqYgWlVMOUh2nGzUvdtDNSQ4foc4Gw+Dw9rJKIL
 5cgMfUs/7tCeDXNQ3g95WuXYl0NtB8Y32HTGJKH0p0rUwX0z7FlzeLX2b
 F4QY3CeAV+Xt7M57BTWJO+KtcZxCJNeSqPlxOUGcUaeA2eBHXZmGEBnN0
 nr9kF+lK8icAb2hueIYAft4ZO9t8tSYo9J6KAk2btJN8iyfXkfcsjJRDU
 M8Q2B4sEBmRjtL9ZHSAlS2wzv5RBxvsPQ47fk/AafPHQaf38ZhTaFyKpA A==;
X-CSE-ConnectionGUID: k4cBSEwnR+io/cqIKmneEA==
X-CSE-MsgGUID: XG4hrOfKRuq8zXnOGDmeiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21687157"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="21687157"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 16:05:58 -0700
X-CSE-ConnectionGUID: xsyfxOlnQWKlNR/dhdlFMQ==
X-CSE-MsgGUID: wITHTvgHS76XulD2VqDT1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="63686113"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 16:05:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI 1/3] drm/xe/uc: Use managed bo for HuC and GSC objects
Date: Thu, 15 Aug 2024 16:05:39 -0700
Message-ID: <20240815230541.3828206-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c       | 12 +++--------
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 36 ++++++-------------------------
 drivers/gpu/drm/xe/xe_huc.c       | 19 +++++-----------
 3 files changed, 14 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 77ce44e845c5f..8a9b3c50a588e 100644
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
index 28e6a7a1d2822..2d6ea8c014451 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -371,27 +371,6 @@ static const struct component_ops xe_gsc_proxy_component_ops = {
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
@@ -400,18 +379,15 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
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
@@ -419,7 +395,7 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	gsc->proxy.to_csme = csme;
 	gsc->proxy.from_csme = csme + GSC_PROXY_BUFFER_SIZE;
 
-	return drmm_add_action_or_reset(&xe->drm, proxy_channel_free, gsc);
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index bec4366e55138..f5459f97af23f 100644
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
2.43.0

