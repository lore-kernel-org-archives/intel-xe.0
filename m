Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A6FCA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 12:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA8610E32C;
	Tue,  2 Sep 2025 12:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XY1bT0in";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F74D10E6B9
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816882; x=1788352882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I2Y5Ph3ZPiddylUgkgvpgRxYs7Rlj62r8/TgEF266bw=;
 b=XY1bT0inBpFTyPjwyaiEbTr+e4w8eCV+weElGJw2wexoH53uUMwJwfnW
 IDmdQxpqIT5Cs9CK1zvEynoKJ3iTEgnRlZUkvjZcilSixYUh7PXQCEh2M
 EimN+Cqdd2KXizq2r5GEGuK2xiMB7q0hcqptXYVU8iEFV0jvjMIDovD8o
 yqjG3tVAC/fD4FN4Q9TNBxY8J1jIIoLPqQDuBGi8+kF00RA7IGvHjrHZN
 +pbvB4r701f1cdCkZRxcEUB2DoXOwQJFvfe2eWhZUr2FF4YvjD9rYKFuq
 rwME9mEqY8wD1Xdn8DdOYPWO4/pPJFxoCYFDFdHsSnMaaNjV+4+08swwm Q==;
X-CSE-ConnectionGUID: YTwHDgsmS/q69WuP6sKO2A==
X-CSE-MsgGUID: Pf1crAK8Ql+fnuN+Cv94iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59157339"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59157339"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:22 -0700
X-CSE-ConnectionGUID: Fei4zpwJRvmxjfkESVg0pg==
X-CSE-MsgGUID: G5qcdxC3THCWnMzhPM3g/w==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.33])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:21 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 13/13] drm/xe: Convert pinned suspend eviction for
 exhaustive eviction
Date: Tue,  2 Sep 2025 14:40:21 +0200
Message-ID: <20250902124021.70211-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
References: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pinned suspend eviction and preparation for eviction validates
system memory for eviction buffers. Do that under a
validation exclusive lock to avoid interfering with other
processes validating system graphics memory.

v2:
- Avoid gotos from within xe_validation_guard().
- Adapt to signature change of xe_validation_guard().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 184 +++++++++++++++++++++----------------
 1 file changed, 103 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 03494736a018..3eff9eac0db4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1139,43 +1139,47 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_bo *backup;
 	int ret = 0;
 
-	xe_bo_lock(bo, false);
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.exclusive = true}, ret) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		xe_assert(xe, !ret);
+		xe_assert(xe, !bo->backup_obj);
 
-	xe_assert(xe, !bo->backup_obj);
+		/*
+		 * Since this is called from the PM notifier we might have raced with
+		 * someone unpinning this after we dropped the pinned list lock and
+		 * grabbing the above bo lock.
+		 */
+		if (!xe_bo_is_pinned(bo))
+			break;
 
-	/*
-	 * Since this is called from the PM notifier we might have raced with
-	 * someone unpinning this after we dropped the pinned list lock and
-	 * grabbing the above bo lock.
-	 */
-	if (!xe_bo_is_pinned(bo))
-		goto out_unlock_bo;
+		if (!xe_bo_is_vram(bo))
+			break;
 
-	if (!xe_bo_is_vram(bo))
-		goto out_unlock_bo;
+		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
+			break;
 
-	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
-		goto out_unlock_bo;
+		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
+					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+					   XE_BO_FLAG_PINNED, &exec);
+		if (IS_ERR(backup)) {
+			drm_exec_retry_on_contention(&exec);
+			ret = PTR_ERR(backup);
+			xe_validation_retry_on_oom(&ctx, &ret);
+			break;
+		}
 
-	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
-				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				   XE_BO_FLAG_PINNED, exec);
-	if (IS_ERR(backup)) {
-		ret = PTR_ERR(backup);
-		goto out_unlock_bo;
+		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
+		ttm_bo_pin(&backup->ttm);
+		bo->backup_obj = backup;
 	}
 
-	backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
-	ttm_bo_pin(&backup->ttm);
-	bo->backup_obj = backup;
-
-out_unlock_bo:
-	xe_bo_unlock(bo);
 	return ret;
 }
 
@@ -1201,57 +1205,12 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
 	return 0;
 }
 
-/**
- * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
- * @bo: The buffer object to move.
- *
- * On successful completion, the object memory will be moved to system memory.
- *
- * This is needed to for special handling of pinned VRAM object during
- * suspend-resume.
- *
- * Return: 0 on success. Negative error code on failure.
- */
-int xe_bo_evict_pinned(struct xe_bo *bo)
+static int xe_bo_evict_pinned_copy(struct xe_bo *bo, struct xe_bo *backup)
 {
-	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
-	struct xe_bo *backup = bo->backup_obj;
-	bool backup_created = false;
+	struct xe_device *xe = xe_bo_device(bo);
 	bool unmap = false;
 	int ret = 0;
 
-	xe_bo_lock(bo, false);
-
-	if (WARN_ON(!bo->ttm.resource)) {
-		ret = -EINVAL;
-		goto out_unlock_bo;
-	}
-
-	if (WARN_ON(!xe_bo_is_pinned(bo))) {
-		ret = -EINVAL;
-		goto out_unlock_bo;
-	}
-
-	if (!xe_bo_is_vram(bo))
-		goto out_unlock_bo;
-
-	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
-		goto out_unlock_bo;
-
-	if (!backup) {
-		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
-					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-					   XE_BO_FLAG_PINNED, exec);
-		if (IS_ERR(backup)) {
-			ret = PTR_ERR(backup);
-			goto out_unlock_bo;
-		}
-		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
-		backup_created = true;
-	}
-
 	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
 		struct xe_migrate *migrate;
 		struct dma_fence *fence;
@@ -1289,7 +1248,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		if (iosys_map_is_null(&bo->vmap)) {
 			ret = xe_bo_vmap(bo);
 			if (ret)
-				goto out_backup;
+				goto out_vunmap;
 			unmap = true;
 		}
 
@@ -1299,15 +1258,78 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 
 	if (!bo->backup_obj)
 		bo->backup_obj = backup;
-
-out_backup:
+out_vunmap:
 	xe_bo_vunmap(backup);
-	if (ret && backup_created)
-		xe_bo_put(backup);
-out_unlock_bo:
+out_backup:
 	if (unmap)
 		xe_bo_vunmap(bo);
-	xe_bo_unlock(bo);
+
+	return ret;
+}
+
+/**
+ * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
+ * @bo: The buffer object to move.
+ *
+ * On successful completion, the object memory will be moved to system memory.
+ *
+ * This is needed to for special handling of pinned VRAM object during
+ * suspend-resume.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_bo_evict_pinned(struct xe_bo *bo)
+{
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *backup = bo->backup_obj;
+	bool backup_created = false;
+	int ret = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.exclusive = true}, ret) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		xe_assert(xe, !ret);
+
+		if (WARN_ON(!bo->ttm.resource)) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (WARN_ON(!xe_bo_is_pinned(bo))) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (!xe_bo_is_vram(bo))
+			break;
+
+		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
+			break;
+
+		if (!backup) {
+			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
+						   xe_bo_size(bo),
+						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+						   XE_BO_FLAG_PINNED, &exec);
+			if (IS_ERR(backup)) {
+				drm_exec_retry_on_contention(&exec);
+				ret = PTR_ERR(backup);
+				xe_validation_retry_on_oom(&ctx, &ret);
+				break;
+			}
+			backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
+			backup_created = true;
+		}
+
+		ret = xe_bo_evict_pinned_copy(bo, backup);
+	}
+
+	if (ret && backup_created)
+		xe_bo_put(backup);
+
 	return ret;
 }
 
-- 
2.50.1

