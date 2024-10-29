Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64766D5B859
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 00:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1728110E58D;
	Tue, 29 Oct 2024 00:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEa8iny3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0063410E58B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 00:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730161919; x=1761697919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQY4B8orhWNVg89bSE1izWJjr2Qsev2rcQpQHUxXOFQ=;
 b=GEa8iny3v5ejy/UYQXKU83vzAEVVbJI/cCDHsL3fgtKUe6HSW/ga5e+c
 E+JVCz1rTrkUmiYyiVKxGwSI83kYWa3IHGvgFGHV9A1xg8jwCGBDXyrnM
 qp+lApZovCbi28WXTrbXcR7EjwzpvRt0KuYXdlAOwH4YE9poBANUAvD6k
 qYXR26LUwWT3/LR1SpfuTf/3E+bKGKsY73okeuPVOpxMa8mbHJ2vrTPem
 7g6KVb0qNWIhbrQlq64ZA8BomRFF/K6QX0VIMraCXiDbkaQg9grzMJCJN
 kIC7nIrLhfgVWWjlpGPfjJSdjfG8pPUherLlHAxz1fbk5MZFdtZb35whY Q==;
X-CSE-ConnectionGUID: 4oUP5yFuQa63QPghbdd07g==
X-CSE-MsgGUID: 0AzSogYKQHis4SXkon6HfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52337961"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52337961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 17:31:58 -0700
X-CSE-ConnectionGUID: WX76PxsETPynQo+jPfeKvQ==
X-CSE-MsgGUID: UY3pzbBMQouaCz7QWtbpsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="119244304"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 17:31:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, umesh.nerlige.ramappa@intel.com,
 riana.tauro@intel.com
Subject: [PATCH 2/3] drm/xe: Restore system memory GGTT mappings
Date: Mon, 28 Oct 2024 17:32:23 -0700
Message-Id: <20241029003224.2257439-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029003224.2257439-1-matthew.brost@intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
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

GGTT mappings reside on the device and this state is lost during suspend
/ d3cold thus this state must be restored resume regardless if the BO is
in system memory or VRAM.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_bo_evict.c |  1 -
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index bd747e53eb9b..6c8fd5ced2a2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -890,8 +890,8 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (WARN_ON(!xe_bo_is_pinned(bo)))
 		return -EINVAL;
 
-	if (WARN_ON(!xe_bo_is_vram(bo)))
-		return -EINVAL;
+	if (!xe_bo_is_vram(bo))
+		return 0;
 
 	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
 		ttm_bo_move_null(&bo->ttm, NULL);
@@ -946,6 +946,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		.interruptible = false,
 	};
 	struct ttm_resource *new_mem;
+	struct ttm_place *place = &(bo->placements[0]);
 	int ret;
 
 	xe_bo_assert_held(bo);
@@ -961,6 +962,9 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 			return -EINVAL;
 	}
 
+	if (!mem_type_is_vram(place->mem_type))
+		return 0;
+
 	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
 	if (ret)
 		return ret;
@@ -1814,7 +1818,10 @@ int xe_bo_pin(struct xe_bo *bo)
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
 				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
 			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
+		}
 
+		if (mem_type_is_vram(place->mem_type) ||
+		    bo->flags & XE_BO_FLAG_GGTT) {
 			spin_lock(&xe->pinned.lock);
 			list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
 			spin_unlock(&xe->pinned.lock);
@@ -1875,7 +1882,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
 		struct ttm_place *place = &(bo->placements[0]);
 
-		if (mem_type_is_vram(place->mem_type)) {
+		if (mem_type_is_vram(place->mem_type) ||
+		    bo->flags & XE_BO_FLAG_GGTT) {
 			spin_lock(&xe->pinned.lock);
 			xe_assert(xe, !list_empty(&bo->pinned_link));
 			list_del_init(&bo->pinned_link);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 541b49007d73..32043e1e5a86 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -159,7 +159,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		 * should setup the iosys map.
 		 */
 		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
-		xe_assert(xe, xe_bo_is_vram(bo));
 
 		xe_bo_put(bo);
 
-- 
2.34.1

