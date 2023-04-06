Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D722C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 15:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0889C10EC1B;
	Thu,  6 Apr 2023 15:19:01 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF72810EC1B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680794338; x=1712330338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fg287WFRwoyESQ9biMpDNgkCh6yzHB4IlTVr+FjDCqE=;
 b=cFO8A8REu/icbHpqhfgTu4xJbp3L+tkyIGqY3Xp/OBiU2hv8M9k4NTJp
 hn+La1pMLqkWCiyFFYQN8Kz6BQlPtNLWkJi11hILXy7KYVgBW/J8WbhLS
 p3RKxY3IXhJS4W6aBfXgjubHetZjEEwc9CLBIxgT96IucXLNGYmoarSpg
 NOoC1gvmzkk3A0rrhFvuGnYIncG6ZqdoV6JcqWLf6b/0pDpdcctZX2AC7
 YwRRrewkl+Q6Sz/JFyRTf3wzFG6kiJgTw0YLKgtF9T579D5+pzdlZPEAM
 s5Q8F6PeCZmGqGvYEgDX+H6tFDqfsiMsjXqL+Fh6RglEyNZkc2IAyEdJI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344520638"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="344520638"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776511315"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776511315"
Received: from tpyra-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.243])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:18:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 16:18:45 +0100
Message-Id: <20230406151845.304035-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix suspend-resume for dgfx
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

This stopped working now that TTM treats moving a pinned object through
ttm_bo_validate() as an error, for the general case. Add some new
routines to handle the new special casing needed for suspend-resume.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 129 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |   3 +
 drivers/gpu/drm/xe/xe_bo_evict.c |   8 +-
 3 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5460e6fe3c1f..002250209116 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -696,6 +696,135 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 }
 
+/**
+ * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
+ * @bo: The buffer object to move.
+ *
+ * On successful completion, the object memory will be moved to sytem memory.
+ * This function blocks until the object has been fully moved.
+ *
+ * This is needed to for special handling of pinned VRAM object during
+ * suspend-resume.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_bo_evict_pinned(struct xe_bo *bo)
+{
+	struct ttm_place place = {
+		.mem_type = XE_PL_TT,
+	};
+	struct ttm_placement placement = {
+		.placement = &place,
+		.num_placement = 1,
+	};
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+	};
+	struct ttm_resource *new_mem;
+	int ret;
+
+	xe_bo_assert_held(bo);
+
+	if (WARN_ON(!bo->ttm.resource))
+		return -EINVAL;
+
+	if (WARN_ON(!xe_bo_is_pinned(bo)))
+		return -EINVAL;
+
+	if (WARN_ON(!xe_bo_is_vram(bo)))
+		return -EINVAL;
+
+	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
+	if (ret)
+		return ret;
+
+	if (!bo->ttm.ttm) {
+		bo->ttm.ttm = xe_ttm_tt_create(&bo->ttm, 0);
+		if (!bo->ttm.ttm) {
+			ret = -ENOMEM;
+			goto err_res_free;
+		}
+	}
+
+	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
+	if (ret)
+		goto err_res_free;
+
+	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
+	if (ret)
+		goto err_res_free;
+
+	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
+	if (ret)
+		goto err_res_free;
+
+	dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+			      false, MAX_SCHEDULE_TIMEOUT);
+
+	return 0;
+
+err_res_free:
+	ttm_resource_free(&bo->ttm, &new_mem);
+	return ret;
+}
+
+/**
+ * xe_bo_restore_pinned() - Restore a pinned VRAM object
+ * @bo: The buffer object to move.
+ *
+ * On successful completion, the object memory will be moved back to VRAM.
+ * This function blocks until the object has been fully moved.
+ *
+ * This is needed to for special handling of pinned VRAM object during
+ * suspend-resume.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_bo_restore_pinned(struct xe_bo *bo)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+	};
+	struct ttm_resource *new_mem;
+	int ret;
+
+	xe_bo_assert_held(bo);
+
+	if (WARN_ON(!bo->ttm.resource))
+		return -EINVAL;
+
+	if (WARN_ON(!xe_bo_is_pinned(bo)))
+		return -EINVAL;
+
+	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
+		return -EINVAL;
+
+	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
+	if (ret)
+		return ret;
+
+	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
+	if (ret)
+		goto err_res_free;
+
+	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
+	if (ret)
+		goto err_res_free;
+
+	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
+	if (ret)
+		goto err_res_free;
+
+	dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+			      false, MAX_SCHEDULE_TIMEOUT);
+
+	return 0;
+
+err_res_free:
+	ttm_resource_free(&bo->ttm, &new_mem);
+	return ret;
+}
+
 static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 				       unsigned long page_offset)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8f5a7ad10d09..3a6c6852be86 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -230,6 +230,9 @@ bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
 int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
 
+int xe_bo_evict_pinned(struct xe_bo *bo);
+int xe_bo_restore_pinned(struct xe_bo *bo);
+
 extern struct ttm_device_funcs xe_ttm_funcs;
 
 int xe_gem_create_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index bbf89a58cdf5..6642c5f52009 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -63,7 +63,7 @@ int xe_bo_evict_all(struct xe_device *xe)
 		spin_unlock(&xe->pinned.lock);
 
 		xe_bo_lock(bo, &ww, 0, false);
-		ret = xe_bo_evict(bo, true);
+		ret = xe_bo_evict_pinned(bo);
 		xe_bo_unlock(bo, &ww);
 		xe_bo_put(bo);
 		if (ret) {
@@ -97,7 +97,7 @@ int xe_bo_evict_all(struct xe_device *xe)
 		spin_unlock(&xe->pinned.lock);
 
 		xe_bo_lock(bo, &ww, 0, false);
-		ret = xe_bo_evict(bo, true);
+		ret = xe_bo_evict_pinned(bo);
 		xe_bo_unlock(bo, &ww);
 		xe_bo_put(bo);
 		if (ret)
@@ -141,7 +141,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		spin_unlock(&xe->pinned.lock);
 
 		xe_bo_lock(bo, &ww, 0, false);
-		ret = xe_bo_validate(bo, NULL, false);
+		ret = xe_bo_restore_pinned(bo);
 		xe_bo_unlock(bo, &ww);
 		if (ret) {
 			xe_bo_put(bo);
@@ -205,7 +205,7 @@ int xe_bo_restore_user(struct xe_device *xe)
 		spin_unlock(&xe->pinned.lock);
 
 		xe_bo_lock(bo, &ww, 0, false);
-		ret = xe_bo_validate(bo, NULL, false);
+		ret = xe_bo_restore_pinned(bo);
 		xe_bo_unlock(bo, &ww);
 		xe_bo_put(bo);
 		if (ret) {
-- 
2.39.2

