Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48633CEBF93
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1031A10E474;
	Tue, 18 Nov 2025 09:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URcs9RDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B6E10E46C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456769; x=1794992769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AD6Nx7ruNrYZk0JfFx4PobD4A0PXPKFMxPXJyd0vADY=;
 b=URcs9RDgbWqDjjpk5UCFg9/FjgdwPYeXRAixUJp6dK6VlbZjnwqmf9dR
 4xCbh5jCL0kozDILTLDS9TUoTntnNym6NBPsuMsQrX9gYWRHbZk6YJowC
 YXb8305dnunSZ6tG7aRbMiXlTBghJ2OCBXF4Erc4zAeWF5CR6vvtxkptf
 rEgLmkhNILL/Wc1uZ4moA8rcLx9uSv5rpAARMDJLISHDBptwqqBFov/cc
 wf6oJnNnzLwF8kw+fCODZTANdiO3NipMse8AhxD70hSa7E340z2MqILdI
 1Aqq4d+DyRrz2uR9hJEoCTB4r6KIv8RhaYSW47YC4IOeYuRXV6OrlHHu3 A==;
X-CSE-ConnectionGUID: pfnDei12RCSZZ3ZjK6Y7qw==
X-CSE-MsgGUID: V2/Qrdm9R5acF1QmJTZIpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097785"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:06:09 -0800
X-CSE-ConnectionGUID: bj8JgMFdQVaUO/0isP1CNA==
X-CSE-MsgGUID: ceRptGfYROmnEUtBW1LuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500871"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:06:07 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 07/11] drm/xe: Suballocate BO for page reclaim
Date: Tue, 18 Nov 2025 17:05:48 +0800
Message-ID: <20251118090552.246243-8-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
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

Page reclamation feature needs the PRL to be suballocated into a
GGTT-mapped BO. On allocation failure, fallback to default tlb
invalidation with full PPC flush.

PRL's BO allocation is managed in separate pool to ensure 4K alignment
for proper GGTT address.

With BO, pass into TLB invalidation backend and modify fence to
accomadate accordingly.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h    |  7 ++++++
 drivers/gpu/drm/xe/xe_page_reclaim.c    | 33 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h    |  4 +++
 drivers/gpu/drm/xe/xe_tile.c            |  5 ++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 18 ++++++++++++--
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  5 ++++
 6 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 268c8e28601a..057df3f9dc1d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -184,6 +184,13 @@ struct xe_tile {
 		 * Media GT shares a pool with its primary GT.
 		 */
 		struct xe_sa_manager *kernel_bb_pool;
+
+		/**
+		 * @mem.reclaim_pool: Pool for PRLs allocated.
+		 *
+		 * Only main GT has page reclaim list allocations.
+		 */
+		struct xe_sa_manager *reclaim_pool;
 	} mem;
 
 	/** @sriov: tile level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index a0d15efff58c..801a7f1731c0 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -13,6 +13,39 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_macros.h"
+#include "xe_sa.h"
+#include "xe_tlb_inval_types.h"
+
+/**
+ * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT BO
+ * @tlb_inval: TLB invalidation frontend associated with the request
+ * @fence: Fence carrying the PRL metadata
+ *
+ * Suballocates a 4K BO out of the tile reclaim pool, copies the PRL CPU
+ * copy into the BO and queues the buffer for release when @fence signals.
+ *
+ * Return: 0 on success or -ENOMEM if the suballocation fails.
+ */
+int xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval, struct xe_tlb_inval_fence *fence)
+{
+	struct xe_gt *gt = container_of(tlb_inval, struct xe_gt, tlb_inval);
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	/* Maximum size of PRL is 1 4K-page */
+	fence->prl_sa = __xe_sa_bo_new(tile->mem.reclaim_pool,
+				       XE_PAGE_RECLAIM_LIST_MAX_SIZE, GFP_ATOMIC);
+	if (IS_ERR(fence->prl_sa))
+		return -ENOMEM;
+
+	memcpy(xe_sa_bo_cpu_addr(fence->prl_sa), fence->reclaim_entries,
+	       XE_PAGE_RECLAIM_LIST_MAX_SIZE);
+	xe_sa_bo_flush_write(fence->prl_sa);
+
+	/* Queue up sa_bo_free on fence signal */
+	xe_sa_bo_free(fence->prl_sa, &fence->base);
+
+	return 0;
+}
 
 /**
  * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
index d066d7d97f79..f82b4d0865e0 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -15,6 +15,9 @@
 #define XE_PAGE_RECLAIM_MAX_ENTRIES	512
 #define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
 
+struct xe_tlb_inval;
+struct xe_tlb_inval_fence;
+
 struct xe_guc_page_reclaim_entry {
 	u32 valid:1;
 	u32 reclamation_size:6;
@@ -32,6 +35,7 @@ struct xe_page_reclaim_list {
 #define XE_PAGE_RECLAIM_INVALID_LIST	-1
 };
 
+int xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval, struct xe_tlb_inval_fence *fence);
 void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
 int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
 static inline void xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries)
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 4f4f9a5c43af..63c060c2ea5c 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -209,6 +209,11 @@ int xe_tile_init(struct xe_tile *tile)
 	if (IS_ERR(tile->mem.kernel_bb_pool))
 		return PTR_ERR(tile->mem.kernel_bb_pool);
 
+	/* Optimistically anticipate at most 256 TLB fences with PRL */
+	tile->mem.reclaim_pool = xe_sa_bo_manager_init(tile, SZ_1M, XE_PAGE_RECLAIM_LIST_MAX_SIZE);
+	if (IS_ERR(tile->mem.reclaim_pool))
+		return PTR_ERR(tile->mem.reclaim_pool);
+
 	return 0;
 }
 void xe_tile_migrate_wait(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index de275759743c..67a047521165 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -15,6 +15,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_tlb_inval.h"
 #include "xe_mmio.h"
+#include "xe_page_reclaim.h"
 #include "xe_pm.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace.h"
@@ -326,8 +327,19 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
 		       u32 asid, bool flush_cache)
 {
-	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
-				  start, end, asid, flush_cache);
+	int err;
+
+	if (fence->reclaim_entries) {
+		err = xe_page_reclaim_create_prl_bo(tlb_inval, fence);
+		if (err) {
+			flush_cache = true;
+			fence->prl_sa = NULL;
+		}
+	}
+	err = xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
+				 start, end, asid, flush_cache);
+
+	return err;
 }
 
 /**
@@ -461,4 +473,6 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 		dma_fence_get(&fence->base);
 	fence->tlb_inval = tlb_inval;
 	fence->flush_cache = true;
+	fence->reclaim_entries = NULL;
+	fence->prl_sa = NULL;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index c3c3943fb07e..7cf741e6a0c7 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -9,6 +9,7 @@
 #include <linux/workqueue.h>
 #include <linux/dma-fence.h>
 
+struct xe_guc_page_reclaim_entry;
 struct xe_tlb_inval;
 
 /** struct xe_tlb_inval_ops - TLB invalidation ops (backend) */
@@ -129,6 +130,10 @@ struct xe_tlb_inval_fence {
 	ktime_t inval_time;
 	/** @flush_cache: bool for PPC flush, default is true */
 	bool flush_cache;
+	/** @reclaim_entries: list of pages to reclaim */
+	struct xe_guc_page_reclaim_entry *reclaim_entries;
+	/** @prl_sa: BO allocation for page reclaim list */
+	struct drm_suballoc *prl_sa;
 };
 
 #endif
-- 
2.51.2

