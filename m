Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34804CA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 14:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E686F10EA7F;
	Thu,  4 Sep 2025 14:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5Ob7m4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9DD10EA78
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756997390; x=1788533390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k35jRGo4MAaSKOTHEwRW92xVxcfWSBdaxuKNB3HTkaQ=;
 b=V5Ob7m4/lL/rahvz51MpktdMTEI1zY1RM4uZcgkp93h4Bhun8DvN05c2
 kfhVmhgSJR2zJmZpfH6nSNRCFJtMNCzQG+mhDKOA4dTBqDLqCoagayuqM
 UBW/mpQtjedT/mQ7WVyTliZPZ3kCSwVTL2NnqsXYGNBF1OKJe/HIpw4Bo
 cdIavZdNZPbCkjnMOKTndjdx66NmNdHvjVAkyWQ59fOHS6BvJ400oBV6j
 q+NQoOMjsHsF4WnA12+fA+FESBE9W21kvc9EKwgXa04ECCqVqsVvhpj8B
 fcfxHqBhrPbKX0txGE+o/ixtsiK6Ka870cdhxaSIHjD3VjiSxIH+m+yYO Q==;
X-CSE-ConnectionGUID: 0xGDFB0gSjqJ5OxvWQ4QZA==
X-CSE-MsgGUID: A+tOSMExQRGQfp+BUBlpMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76790139"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="76790139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:49:49 -0700
X-CSE-ConnectionGUID: 1U6pAqxiSMe4oZMeBamjfg==
X-CSE-MsgGUID: a1exibKVQ2aCm+CpQkGc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171851049"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora) ([10.245.244.98])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:49:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 09/13] drm/xe: Rename ___xe_bo_create_locked()
Date: Thu,  4 Sep 2025 16:49:04 +0200
Message-ID: <20250904144908.14303-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
References: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
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

Don't start external function names with underscores.
Rename to xe_bo_init_locked().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 39 ++++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_bo.h      | 10 ++++-----
 drivers/gpu/drm/xe/xe_dma_buf.c |  6 ++---
 3 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0f355bc00d9e..f07acf969b2e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1161,10 +1161,10 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
 		goto out_unlock_bo;
 
-	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
-					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-					XE_BO_FLAG_PINNED, exec);
+	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
+				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				   XE_BO_FLAG_PINNED, exec);
 	if (IS_ERR(backup)) {
 		ret = PTR_ERR(backup);
 		goto out_unlock_bo;
@@ -1240,11 +1240,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		goto out_unlock_bo;
 
 	if (!backup) {
-		backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv,
-						NULL, xe_bo_size(bo),
-						DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-						XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-						XE_BO_FLAG_PINNED, exec);
+		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
+					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+					   XE_BO_FLAG_PINNED, exec);
 		if (IS_ERR(backup)) {
 			ret = PTR_ERR(backup);
 			goto out_unlock_bo;
@@ -2045,7 +2044,7 @@ void xe_bo_free(struct xe_bo *bo)
 }
 
 /**
- * ___xe_bo_create_locked() - Initialize or create an xe_bo.
+ * xe_bo_init_locked() - Initialize or create an xe_bo.
  * @xe: The xe device.
  * @bo: An already allocated buffer object or NULL
  * if the function should allocate a new one.
@@ -2065,11 +2064,11 @@ void xe_bo_free(struct xe_bo *bo)
  *
  * Return: The buffer object on success. Negative error pointer on failure.
  */
-struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				     struct xe_tile *tile, struct dma_resv *resv,
-				     struct ttm_lru_bulk_move *bulk, size_t size,
-				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags, struct drm_exec *exec)
+struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
+				struct xe_tile *tile, struct dma_resv *resv,
+				struct ttm_lru_bulk_move *bulk, size_t size,
+				u16 cpu_caching, enum ttm_bo_type type,
+				u32 flags, struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -2261,11 +2260,11 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
-	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
-				    vm && !xe_vm_in_fault_mode(vm) &&
-				    flags & XE_BO_FLAG_USER ?
-				    &vm->lru_bulk_move : NULL, size,
-				    cpu_caching, type, flags, exec);
+	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
+			       vm && !xe_vm_in_fault_mode(vm) &&
+			       flags & XE_BO_FLAG_USER ?
+			       &vm->lru_bulk_move : NULL, size,
+			       cpu_caching, type, flags, exec);
 	if (IS_ERR(bo))
 		return bo;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8a057d39f0a8..13f3ef9fab6e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -89,11 +89,11 @@ struct sg_table;
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
-struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				     struct xe_tile *tile, struct dma_resv *resv,
-				     struct ttm_lru_bulk_move *bulk, size_t size,
-				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags, struct drm_exec *exec);
+struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
+				struct xe_tile *tile, struct dma_resv *resv,
+				struct ttm_lru_bulk_move *bulk, size_t size,
+				u16 cpu_caching, enum ttm_bo_type type,
+				u32 flags, struct drm_exec *exec);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_tile *tile, struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 8d8e5f7345b6..90fbdec31b58 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -238,9 +238,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 		if (ret)
 			break;
 
-		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
-					    0, /* Will require 1way or 2way for vm_bind */
-					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
+		bo = xe_bo_init_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+				       0, /* Will require 1way or 2way for vm_bind */
+				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
 		drm_exec_retry_on_contention(&exec);
 		if (IS_ERR(bo)) {
 			ret = PTR_ERR(bo);
-- 
2.50.1

