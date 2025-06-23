Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8210C77B7C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 14:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993D910E3CA;
	Mon, 23 Jun 2025 14:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKXrli8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000D10E3CC
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750689852; x=1782225852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnr6XaJviKx5tnCyvacNeFonldQMMCMPJZfRHzzfEto=;
 b=PKXrli8KmZNjTn0LFUkEvf73JVrVFBGnuzSHX18IEhLppxi3LtkXamMV
 kESpNHJemcwqVS+Y/0ji8D3nhfBLkGN7crJe1jctao1QZ1Uru4N23Odk7
 zhneShpNZAc0QWgU+WFhcCLd64ykzstqikxTiIfRczDwLq6W8LCY+ucf5
 c47M3pBkf6aCDBf1iqxf/hOvY4Iujm7+2O6ZSo1n1giJzHS5ttsWpZ4MV
 fc8TqA9KogJmxcgNPfbINoPqFUtj9IoN0LlOyaNXUMIVMryjOjalKtw9d
 JAzxU+x4FdbudOeu46xndRdWFT9WAYXcupFeAetVOrSsU8QAFUqoDKEfm Q==;
X-CSE-ConnectionGUID: X8fZf+wZSSuGKktZUiavuw==
X-CSE-MsgGUID: AFK7rKO4SI68JL22w/vMLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52837057"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52837057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:44:11 -0700
X-CSE-ConnectionGUID: tk0rT1AhSUmUtTlkADVbjw==
X-CSE-MsgGUID: OBWq891YTESdzOrN0n8y/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182661939"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:44:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 2/4] drm/xe: Drop BO argument from xe_migrate_clear
Date: Mon, 23 Jun 2025 07:45:46 -0700
Message-Id: <20250623144548.2388268-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623144548.2388268-1-matthew.brost@intel.com>
References: <20250623144548.2388268-1-matthew.brost@intel.com>
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

xe_migrate_clear() can be called when a BO's reference count is zero. As
a result, having a BO passed to xe_migrate_clear() can lead to unsafe
behavior (e.g. attempting to take a BO reference). Avoid this issue by
removing the BO from xe_migrate_clear()'s argument list.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      |  6 +++++-
 drivers/gpu/drm/xe/xe_migrate.c | 21 ++++++++++++---------
 drivers/gpu/drm/xe/xe_migrate.h |  8 ++++++--
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..c93381fa4858 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -908,6 +908,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	if (move_lacks_source) {
+		struct sg_table *sgt = mem_type_is_vram(new_mem->mem_type) ?
+			NULL : xe_bo_sg(bo);
 		u32 flags = 0;
 
 		if (mem_type_is_vram(new_mem->mem_type))
@@ -915,7 +917,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		else if (handle_system_ccs)
 			flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
 
-		fence = xe_migrate_clear(migrate, bo, new_mem, flags);
+		fence = xe_migrate_clear(migrate, new_mem, ttm_bo->base.resv,
+					 sgt, bo->size, flags,
+					 &bo->ccs_cleared);
 	} else {
 		fence = xe_migrate_copy(migrate, bo, bo, old_mem, new_mem,
 					handle_system_ccs);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..18030f9613ae 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1039,23 +1039,27 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 /**
  * xe_migrate_clear() - Copy content of TTM resources.
  * @m: The migration context.
- * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
+ * @resv: dma-resv for the TTM resource to be cleared
+ * @sgt: Scatter gather table if @dst is not in VRAM, NULL otherwise
+ * @size: Size of the TTM resource to be cleared.
  * @clear_flags: flags to specify which data to clear: CCS, BO, or both.
+ * @ccs_cleared: CCS has been cleared, passed by reference, set in this function
  *
  * Clear the contents of @dst to zero when XE_MIGRATE_CLEAR_FLAG_BO_DATA is set.
  * On flat CCS devices, the CCS metadata is cleared to zero with XE_MIGRATE_CLEAR_FLAG_CCS_DATA.
  * Set XE_MIGRATE_CLEAR_FLAG_FULL to clear bo as well as CCS metadata.
- * TODO: Eliminate the @bo argument.
  *
  * Return: Pointer to a dma_fence representing the last clear batch, or
  * an error pointer on failure. If there is a failure, any clear operation
  * started by the function call has been synced.
  */
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
-				   struct xe_bo *bo,
 				   struct ttm_resource *dst,
-				   u32 clear_flags)
+				   struct dma_resv *resv,
+				   struct sg_table *sgt,
+				   u64 size, u32 clear_flags,
+				   bool *ccs_cleared)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
 	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
@@ -1064,7 +1068,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	struct xe_device *xe = gt_to_xe(gt);
 	bool clear_only_system_ccs = false;
 	struct dma_fence *fence = NULL;
-	u64 size = bo->size;
 	struct xe_res_cursor src_it;
 	struct ttm_resource *src = dst;
 	int err;
@@ -1076,9 +1079,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		clear_only_system_ccs = true;
 
 	if (!clear_vram)
-		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
+		xe_res_first_sg(sgt, 0, size, &src_it);
 	else
-		xe_res_first(src, 0, bo->size, &src_it);
+		xe_res_first(src, 0, size, &src_it);
 
 	while (size) {
 		u64 clear_L0_ofs;
@@ -1153,7 +1156,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 			 * fences, which are always tracked as
 			 * DMA_RESV_USAGE_KERNEL.
 			 */
-			err = xe_sched_job_add_deps(job, bo->ttm.base.resv,
+			err = xe_sched_job_add_deps(job, resv,
 						    DMA_RESV_USAGE_KERNEL);
 			if (err)
 				goto err_job;
@@ -1188,7 +1191,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	}
 
 	if (clear_ccs)
-		bo->ccs_cleared = true;
+		*ccs_cleared = true;
 
 	return fence;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index fb9839c1bae0..04b3cd86ba90 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -9,7 +9,9 @@
 #include <linux/types.h>
 
 struct dma_fence;
+struct dma_resv;
 struct iosys_map;
+struct sg_table;
 struct ttm_resource;
 
 struct xe_bo;
@@ -121,9 +123,11 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
 					XE_MIGRATE_CLEAR_FLAG_CCS_DATA)
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
-				   struct xe_bo *bo,
 				   struct ttm_resource *dst,
-				   u32 clear_flags);
+				   struct dma_resv *resv,
+				   struct sg_table *sgt,
+				   u64 size, u32 clear_flags,
+				   bool *ccs_cleared);
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
-- 
2.34.1

