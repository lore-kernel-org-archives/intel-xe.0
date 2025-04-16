Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D69C369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 15:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DAC10E0A3;
	Wed, 16 Apr 2025 15:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdoOSg89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03C010E0A3
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744816170; x=1776352170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VKfG+NMYHLmDPRVbO9JZHAiZyKfTu7VacgFgNODdxBM=;
 b=EdoOSg89ztyZzRqY7BQklFvMjRdxpsCum/nngET+SOWAFsiFZCmBbhjP
 k3TTYSJPFwILpsgkiuWh/eTm8OBXvZZ3QZGXqF6XFFPK7FlnJdopX84fe
 BCvKS5Lzmp13vs/Q1JvweLr71qsmJRykfBLlf6fZE/b58szBZLl/pxJOi
 aZjG8W8+nPrswhYGm5oXCIPqnBGqmDjzLCIOXzJIRrA2Jj9NqJvrjvODJ
 AjUMx7LO52AED2UvXBLVer4zzdJ1gtCrxW8aPUXpwUtHv+Y2k8P5Gm5Zh
 1TYFu4+w/9tG/6eqdKel8NGaei5+WJIgUedGRtwcVJ1+AGh9Znm+rRwDq A==;
X-CSE-ConnectionGUID: 0O5mPleXQVaO2KuuIVITcw==
X-CSE-MsgGUID: 5qK4vtrXSw+JEVV0mpUJgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46383169"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46383169"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:09:29 -0700
X-CSE-ConnectionGUID: tQ9G5cF0R/iA//sMXyNZjQ==
X-CSE-MsgGUID: cawa5IlxSBO4VZ9JVObA0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135495909"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.11])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:09:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 2/3] drm/xe: share bo dma-resv with backup object
Date: Wed, 16 Apr 2025 16:09:16 +0100
Message-ID: <20250416150913.434369-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416150913.434369-5-matthew.auld@intel.com>
References: <20250416150913.434369-5-matthew.auld@intel.com>
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

We end up needing to grab both locks together anyway and keep them held
until we complete the copy or add the fence. Plus the backup_obj is
short lived and tied to the parent object, so seems reasonable to share
the same dma-resv. This will simplify the locking here, and in follow
up patches.

v2:
  - Hold reference to the parent bo to be sure the shared dma-resv can't
    go out of scope too soon. (Thomas)

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 28 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_bo_types.h |  2 ++
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c337790c81ae..79adaee5a0e9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1120,13 +1120,15 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
 		goto out_unlock_bo;
 
-	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size, ttm_bo_type_kernel,
-				     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				     XE_BO_FLAG_PINNED);
+	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
+					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+					XE_BO_FLAG_PINNED);
 	if (IS_ERR(backup)) {
 		ret = PTR_ERR(backup);
 		goto out_unlock_bo;
 	}
+	backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
 
 	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
 		struct xe_migrate *migrate;
@@ -1177,7 +1179,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 
 out_backup:
 	xe_bo_vunmap(backup);
-	xe_bo_unlock(backup);
 	if (ret)
 		xe_bo_put(backup);
 out_unlock_bo:
@@ -1212,17 +1213,12 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	if (!backup)
 		return 0;
 
-	xe_bo_lock(backup, false);
+	xe_bo_lock(bo, false);
 
 	ret = ttm_bo_validate(&backup->ttm, &backup->placement, &ctx);
 	if (ret)
 		goto out_backup;
 
-	if (WARN_ON(!dma_resv_trylock(bo->ttm.base.resv))) {
-		ret = -EBUSY;
-		goto out_backup;
-	}
-
 	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
 		struct xe_migrate *migrate;
 		struct dma_fence *fence;
@@ -1271,15 +1267,14 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 
 	bo->backup_obj = NULL;
 
+out_backup:
+	xe_bo_vunmap(backup);
+	if (!bo->backup_obj)
+		xe_bo_put(backup);
 out_unlock_bo:
 	if (unmap)
 		xe_bo_vunmap(bo);
 	xe_bo_unlock(bo);
-out_backup:
-	xe_bo_vunmap(backup);
-	xe_bo_unlock(backup);
-	if (!bo->backup_obj)
-		xe_bo_put(backup);
 	return ret;
 }
 
@@ -1532,6 +1527,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	if (bo->vm && xe_bo_is_user(bo))
 		xe_vm_put(bo->vm);
 
+	if (bo->parent_obj)
+		xe_bo_put(bo->parent_obj);
+
 	mutex_lock(&xe->mem_access.vram_userfault.lock);
 	if (!list_empty(&bo->vram_userfault_link))
 		list_del(&bo->vram_userfault_link);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 81396181aaea..eb5e83c5f233 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -30,6 +30,8 @@ struct xe_bo {
 	struct ttm_buffer_object ttm;
 	/** @backup_obj: The backup object when pinned and suspended (vram only) */
 	struct xe_bo *backup_obj;
+	/** @parent_obj: Ref to parent bo if this a backup_obj */
+	struct xe_bo *parent_obj;
 	/** @size: Size of this buffer object */
 	size_t size;
 	/** @flags: flags for this buffer object */
-- 
2.49.0

