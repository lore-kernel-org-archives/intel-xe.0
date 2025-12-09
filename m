Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F79D3B997
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB05010E636;
	Tue,  9 Dec 2025 20:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/cw8f7J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88EC10E645
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765310913; x=1796846913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RY/b2gpCAHgw+MCTptL4nqyRezi/SJs3fqD3etEXiLM=;
 b=G/cw8f7JXQEFplSt1OYTm3S5N+s3pF4rueBG44ihcwEHT4zu26glmqPn
 npvUAzwDZewB96QdM3f+8uMIIJSgkKCB0MdGArqaB/yuafi6imRWzgE/L
 kIlrhj5G14H3vG/7Mcgky2m63kCOjZnvPa8MB4+xhV9kith8+KH2eg1vD
 RJNHZnXUHn98wbCsZVo33ZkgMCU74yRkzTIT4E73mI5OTmykamZ5zdZTk
 315l7pz8pD4HCGyDdDmG141EcmRE9Ne9+mv+CS/W8W16FZ55noHriK1Xm
 oHPYMf7+oGW6Snm+QCF18SDRG2yBcet2mY+EOx6NpafhDYwEYREYMprU+ Q==;
X-CSE-ConnectionGUID: Y1KAFTozSsuWRzoNbJjiig==
X-CSE-MsgGUID: rw/nnhdmQWeJh4BqzF9QEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67328713"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67328713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:08:33 -0800
X-CSE-ConnectionGUID: tqLWPAlETi+w0qFwobgmaQ==
X-CSE-MsgGUID: gVykct6iShWEh7gGr4M2MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="195563900"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa010.jf.intel.com with ESMTP; 09 Dec 2025 12:08:31 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v4 06/10] drm/xe: Suballocate BO for page reclaim
Date: Wed, 10 Dec 2025 04:08:22 +0800
Message-ID: <20251209200815.2570770-18-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209200815.2570770-12-brian3.nguyen@intel.com>
References: <20251209200815.2570770-12-brian3.nguyen@intel.com>
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

v2:
 - Removed page reclaim related variables from TLB fence. (Matthew B)
 - Allocate PRL bo size to num_entries. (Matthew B)
 - Move PRL bo allocation to tlb_inval run_job. (Matthew B)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h  |  7 +++++
 drivers/gpu/drm/xe/xe_page_reclaim.c  | 39 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h  |  6 +++++
 drivers/gpu/drm/xe/xe_tile.c          |  5 ++++
 drivers/gpu/drm/xe/xe_tlb_inval_job.c |  9 +++++++
 5 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3836c5ed1c72..155ea0800f1b 100644
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
index 63facea28213..50961307a557 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -13,6 +13,45 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_macros.h"
+#include "xe_sa.h"
+#include "xe_tlb_inval_types.h"
+
+/**
+ * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT BO
+ * @tlb_inval: TLB invalidation frontend associated with the request
+ * @prl: page reclaim list data that bo will copy from
+ * @fence: tlb invalidation fence that page reclaim action is paired to
+ *
+ * Suballocates a 4K BO out of the tile reclaim pool, copies the PRL CPU
+ * copy into the BO and queues the buffer for release when @fence signals.
+ *
+ * Return: struct drm_suballoc pointer on success or ERR_PTR on failure.
+ */
+struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
+						   struct xe_page_reclaim_list *prl,
+						   struct xe_tlb_inval_fence *fence)
+{
+	struct xe_gt *gt = container_of(tlb_inval, struct xe_gt, tlb_inval);
+	struct xe_tile *tile = gt_to_tile(gt);
+	/* (+1) for NULL page_reclaim_entry to indicate end of list */
+	int prl_size = min(prl->num_entries + 1, XE_PAGE_RECLAIM_MAX_ENTRIES) *
+		sizeof(struct xe_guc_page_reclaim_entry);
+	struct drm_suballoc *prl_sa;
+
+	/* Maximum size of PRL is 1 4K-page */
+	prl_sa = __xe_sa_bo_new(tile->mem.reclaim_pool,
+				prl_size, GFP_ATOMIC);
+	if (IS_ERR(prl_sa))
+		return prl_sa;
+
+	memcpy(xe_sa_bo_cpu_addr(prl_sa), prl->entries,
+	       prl_size);
+	xe_sa_bo_flush_write(prl_sa);
+	/* Queue up sa_bo_free on tlb invalidation fence signal */
+	xe_sa_bo_free(prl_sa, &fence->base);
+
+	return prl_sa;
+}
 
 /**
  * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
index 9255566d2066..b151f15e0b80 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -16,6 +16,9 @@
 #define XE_PAGE_RECLAIM_MAX_ENTRIES	512
 #define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
 
+struct xe_tlb_inval;
+struct xe_tlb_inval_fence;
+
 struct xe_guc_page_reclaim_entry {
 	u64 qw;
 /* valid reclaim entry bit */
@@ -41,6 +44,9 @@ struct xe_page_reclaim_list {
 #define XE_PAGE_RECLAIM_INVALID_LIST	-1
 };
 
+struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
+						   struct xe_page_reclaim_list *prl,
+						   struct xe_tlb_inval_fence *fence);
 void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
 void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl);
 int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
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
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 1ae0dec2cf31..dbd3171fff12 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -24,6 +24,8 @@ struct xe_tlb_inval_job {
 	struct xe_exec_queue *q;
 	/** @vm: VM which TLB invalidation is being issued for */
 	struct xe_vm *vm;
+	/** @prl: Embedded copy of page reclaim list */
+	struct xe_page_reclaim_list prl;
 	/** @refcount: ref count of this job */
 	struct kref refcount;
 	/**
@@ -47,6 +49,13 @@ static struct dma_fence *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
 		container_of(dep_job, typeof(*job), dep);
 	struct xe_tlb_inval_fence *ifence =
 		container_of(job->fence, typeof(*ifence), base);
+	struct drm_suballoc *prl_sa = NULL;
+
+	if (job->prl.entries) {
+		prl_sa = xe_page_reclaim_create_prl_bo(job->tlb_inval, &job->prl, ifence);
+		if (IS_ERR(prl_sa))
+			prl_sa = NULL; /* Indicate fall back PPC flush with NULL */
+	}
 
 	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
 			   job->end, job->vm->usm.asid);
-- 
2.52.0

