Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3FCC369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 16:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7A710EA04;
	Thu, 10 Apr 2025 16:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fy5vvA2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBEB10EA0E
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302082; x=1775838082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hHzfE1L467DV8vRgXM4WybeCBI6BSOBlKIAc7TCFPjQ=;
 b=fy5vvA2ksZSHuriNZOo9LgcjUboNXX0Fjkop7gk7r0+hW8UoQnZGONEw
 1WkBL1AsFg039xCDJqU4CDg3mDR6JC2OnJSn81F294lmGWd0HKa9cL5q2
 C1ZBbwfstF68+O1BcxJwb20tGKX8/YYA0giWdF3+f3nDIbS2jY6hnjjMC
 zlyIkiQ6DFj0HGE+xYFtm4fSKXeO8L+djGCVqXbGoLZ2zO6dHkHz8a1qP
 tpzcv4SOifsxMwQI2BTIXq1dLH1Y0ZvD+aka0z/xvdoJEkJo/iPXjwDcf
 PFzTPpeBcUrCaLJ9PIBvUv9KTZfw4zft9TM8BDeDAerkfxzK/G6KX3D5J A==;
X-CSE-ConnectionGUID: 0PB6NPDHRuOoywD41VwrXA==
X-CSE-MsgGUID: CAaBe9EkSUK/QVr+wLFQRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45733766"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45733766"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:21:22 -0700
X-CSE-ConnectionGUID: 6+Mq6hy5Q1GFu27cr+JRcQ==
X-CSE-MsgGUID: BQIHa5HaQ16ZBTVgyRqa6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129490554"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.125])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:21:21 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/3] drm/xe: share bo dma-resv with backup object
Date: Thu, 10 Apr 2025 17:20:19 +0100
Message-ID: <20250410162016.158474-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410162016.158474-5-matthew.auld@intel.com>
References: <20250410162016.158474-5-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c337790c81ae..3eab6352d9dc 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1120,9 +1120,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
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
@@ -1177,7 +1178,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 
 out_backup:
 	xe_bo_vunmap(backup);
-	xe_bo_unlock(backup);
 	if (ret)
 		xe_bo_put(backup);
 out_unlock_bo:
@@ -1212,17 +1212,12 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
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
@@ -1271,15 +1266,14 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 
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
 
-- 
2.49.0

