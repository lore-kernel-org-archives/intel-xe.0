Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DA1D767F4
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4375C10E903;
	Thu, 31 Oct 2024 18:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSdbelMp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685C810E903
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398950; x=1761934950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xvtmm2UzPPyoZfpFOugXOLSYIyWempTqY5jIGCkuBU8=;
 b=nSdbelMp1iBX8PTLy42S8sUsn/BVASbKgABXfdNhuff4B6PYAbIsCr3O
 1a+9Aj9T0NYJNUlg2bVWUjWnss7TDF7f+wUWgbWnFO0m7kutiE3z8OWMw
 GofjbJn91sSPXfkpwFnU/U2Ngz9mRLBYnpLG4BWki7ouqmweuCoyi64X5
 e9zJkgGDJEffupOrdE9Cf+SKcI02c0TW+4Z0MGydDwGAkkD/tWDuhDXrM
 q1GhvimEUnp7JeYFOnXJr3KtNSkOBGFOJ5pdaeK9kaAcFcCCo2CCXEdgJ
 2IE2jtjl20qI8RylPbmrjaPrsBpUGUolZT4KDOsPpcAfETYO4VqQht2rR w==;
X-CSE-ConnectionGUID: 2C4voY3xQAqwM8/Nap9fGw==
X-CSE-MsgGUID: MU3pbBxoS/Caghp8BMpPmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30272095"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="30272095"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:22:29 -0700
X-CSE-ConnectionGUID: pWUgaojfRXW2rX/s1IAjbA==
X-CSE-MsgGUID: 8P4/tbPuRGa0LV6NfPwDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82383011"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:22:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	riana.tauro@intel.com
Subject: [PATCH v2] drm/xe: Restore system memory GGTT mappings
Date: Thu, 31 Oct 2024 11:22:57 -0700
Message-Id: <20241031182257.2949579-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_bo_evict.c |  1 -
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..d79d8ef5c7d5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -888,8 +888,8 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (WARN_ON(!xe_bo_is_pinned(bo)))
 		return -EINVAL;
 
-	if (WARN_ON(!xe_bo_is_vram(bo)))
-		return -EINVAL;
+	if (!xe_bo_is_vram(bo))
+		return 0;
 
 	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
 	if (ret)
@@ -939,6 +939,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		.interruptible = false,
 	};
 	struct ttm_resource *new_mem;
+	struct ttm_place *place = &(bo->placements[0]);
 	int ret;
 
 	xe_bo_assert_held(bo);
@@ -952,6 +953,9 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
 		return -EINVAL;
 
+	if (!mem_type_is_vram(place->mem_type))
+		return 0;
+
 	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
 	if (ret)
 		return ret;
@@ -1804,7 +1808,10 @@ int xe_bo_pin(struct xe_bo *bo)
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
 				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
 			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
+		}
 
+		if (mem_type_is_vram(place->mem_type) ||
+		    bo->flags & XE_BO_FLAG_GGTT) {
 			spin_lock(&xe->pinned.lock);
 			list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
 			spin_unlock(&xe->pinned.lock);
@@ -1865,7 +1872,8 @@ void xe_bo_unpin(struct xe_bo *bo)
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

