Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4A5C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 16:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726AE10E0FB;
	Thu, 23 Mar 2023 16:27:23 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D40B10E0FB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679588841; x=1711124841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4gHY0qDIEdhfFYOayVe7ClP0aLghPvx/nibbdlYyvRw=;
 b=mC8yNkuMQKkcu8tNOCSjlQlbjDBGU+zq0vy8qNV/Aygz+eSK86nfeN8g
 pTDN7GpN+sNAbwX6lF0egh2bFeJpzOCj6RgA696K3xuL2NP29IC2mfRAi
 MErSLZdbMKV7NJ30n/MJmpTxxWvkNJxHGoEYJBIuDADpZGRIt7ZRemV7X
 TAofJq7GlZHLHXOd7rrVPhKTAtG1zR0d3CVAmD64wg3MEe5eHmGN/+zB7
 iRucgM19d1ECUUaeqcWfoj1dT0c9dimXInELquVdndZkTKadFVKYrb3Ek
 q3HbJJyHM8uyc+hea7uiyUx9tmwhTrcxoSyppsiuW8NUwx1gU9BlSUVW+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323408779"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="323408779"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 09:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1011881539"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="1011881539"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 09:27:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 23 Mar 2023 09:27:25 -0700
Message-Id: <20230323162725.1100545-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Use BO's GT to determine dma_offset
 when programming PTEs
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

Rather than using the passed in GT, use the BO's GT determine dma_offset
when programming PTEs as these two GT's could differ (i.e. mapping a BO
from a remote GT). The BO's GT is correct GT to use as this where BO
resides, while the passed in GT is where the mapping is created.

v2:
  (Thomas)      - Kernel doc, extra new line
  (CI)          - Rebase to tip

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_bo.h |  2 ++
 drivers/gpu/drm/xe/xe_pt.c |  4 +++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ab9cd9286f77..3ccc59a372aa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -79,6 +79,19 @@ mem_type_to_gt(struct xe_device *xe, u32 mem_type)
 	return xe_device_get_gt(xe, mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0));
 }
 
+/**
+ * xe_bo_to_gt - Get a GT from a BO's memory location
+ * @bo: The buffer object
+ *
+ * Get a GT from a BO's memory location, should be called on BOs in VRAM only.
+ *
+ * Return: xe_gt object which is closest to the BO
+ */
+struct xe_gt *xe_bo_to_gt(struct xe_bo *bo)
+{
+	return mem_type_to_gt(xe_bo_device(bo), bo->ttm.resource->mem_type);
+}
+
 static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
 			   u32 bo_flags, u32 *c)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index f841e74cd417..486703815949 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -105,6 +105,8 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
 
+struct xe_gt *xe_bo_to_gt(struct xe_bo *bo);
+
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
 	return container_of(bo, struct xe_bo, ttm);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index dfd97b0ec42a..6b2943efcdbc 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -759,10 +759,12 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 	int ret;
 
 	if (is_vram) {
+		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
+
 		xe_walk.default_pte = GEN12_PPGTT_PTE_LM;
 		if (vma && vma->use_atomic_access_pte_bit)
 			xe_walk.default_pte |= GEN12_USM_PPGTT_PTE_AE;
-		xe_walk.dma_offset = gt->mem.vram.io_start -
+		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
 			gt_to_xe(gt)->mem.vram.io_start;
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
-- 
2.34.1

