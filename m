Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003B5CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 16:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD04510E1A6;
	Fri, 29 Aug 2025 16:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5O6luex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD2210E1A6
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756486081; x=1788022081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gDDdf6gwXHVR+1Kp2D0WPFHxEYSr7WH6Jf9OFGM4Mm8=;
 b=F5O6luexZpNHxj+3nkmweHYHykIQAPlT3djVvnFb6q5SfV997rCG0CJE
 i1M6aBxFUBg0wkAwC9Qelyx4buyCXf6ZZyEXy6fOIfMwk16oJGi8t0xoy
 ByBXe/otGs+ub9VNhLCfq93raB8kDmpvhM7kO5wPp0WbGqkRJ003bQ6ut
 wQ8mt0QVHxxixYhACp5AcM3pszaWaoz/s77IUNhyUVKxNW17lLajwruOH
 PM44gk33FttBAqECUO8/LbGSFxfAMfjbB2+/VWJW1Tx8yNNDNSGJjKYka
 2pTF1UfvyAn5vE4jCDmOx3kIs4qjT6c8Us2wazrHUDA1VRUUTjB1mmSIy w==;
X-CSE-ConnectionGUID: 3JCE1lcjQfed88MHXaKu5Q==
X-CSE-MsgGUID: /MtgtDcUQK6dsY5HGDjMlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="46344533"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="46344533"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 09:48:00 -0700
X-CSE-ConnectionGUID: BqnGFEViRbKnbo8Nm1pNQw==
X-CSE-MsgGUID: aRP0B6n0R8G0N0xTpCocAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169679567"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.240])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 09:48:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: improve dma-resv handling for backup object
Date: Fri, 29 Aug 2025 17:47:16 +0100
Message-ID: <20250829164715.720735-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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

Since the dma-resv is shared we don't need to reserve and add a fence
slot fence twice, plus no need to loop through the dependencies.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 13 +------------
 drivers/gpu/drm/xe/xe_migrate.c |  2 +-
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4faf15d5fa6d..49911247f6cb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1260,14 +1260,11 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		else
 			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
 
+		xe_assert(xe, bo->ttm.base.resv == backup->ttm.base.resv);
 		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
 		if (ret)
 			goto out_backup;
 
-		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
-		if (ret)
-			goto out_backup;
-
 		fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
 					backup->ttm.resource, false);
 		if (IS_ERR(fence)) {
@@ -1277,8 +1274,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 
 		dma_resv_add_fence(bo->ttm.base.resv, fence,
 				   DMA_RESV_USAGE_KERNEL);
-		dma_resv_add_fence(backup->ttm.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	} else {
 		ret = xe_bo_vmap(backup);
@@ -1356,10 +1351,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		if (ret)
 			goto out_unlock_bo;
 
-		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
-		if (ret)
-			goto out_unlock_bo;
-
 		fence = xe_migrate_copy(migrate, backup, bo,
 					backup->ttm.resource, bo->ttm.resource,
 					false);
@@ -1370,8 +1361,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 
 		dma_resv_add_fence(bo->ttm.base.resv, fence,
 				   DMA_RESV_USAGE_KERNEL);
-		dma_resv_add_fence(backup->ttm.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	} else {
 		ret = xe_bo_vmap(backup);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9643442ef101..861d9d0633d1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -908,7 +908,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		if (!fence) {
 			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
 						    DMA_RESV_USAGE_BOOKKEEP);
-			if (!err && src_bo != dst_bo)
+			if (!err && src_bo->ttm.base.resv != dst_bo->ttm.base.resv)
 				err = xe_sched_job_add_deps(job, dst_bo->ttm.base.resv,
 							    DMA_RESV_USAGE_BOOKKEEP);
 			if (err)
-- 
2.51.0

