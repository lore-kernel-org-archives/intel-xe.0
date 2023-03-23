Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119BDC6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 08:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB24610E46D;
	Thu, 23 Mar 2023 08:15:49 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2784310E46D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679559347; x=1711095347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PkTq3xVBrLCjZBY1KD6rfEKYQ1zao74eFr22Lzp7G3U=;
 b=SJzdOBhR73ty3M1ucez/tVwMAZbUfOmkXn3MSLHyaVirRSW/vM883F/9
 YcW9hpjb3t/8leQBoHe2NxztHctQDAIxgjUbBAvjRtH1VAds70VNZAb1T
 ZrdN9vmyqLr8aa3ExuUJS4EYC2FAh0nfQ9EZM5Hx21wom+/mnGfRa7X+y
 AD8/+phszih9NC3z+VwWwGzssebc82UqfscWRWVteiLr84EyunN2M4q8L
 GMCZbWmG7MNOcdfb0oRxAC5TyeVLwZpAUXxrEtlkFc6/RWJ37G338PT/3
 HElFtqAmC4l//Ja4uOLYkd0WTzf3z/5jPQL4wL8ieNSetpSXW0BILl0nf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327805641"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="327805641"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 01:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="856402715"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="856402715"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 01:15:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 23 Mar 2023 01:15:46 -0700
Message-Id: <20230323081546.1014414-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use BO's GT to determine dma_offset when
 programming PTEs
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++++
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 drivers/gpu/drm/xe/xe_pt.c | 4 +++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 764b3ca9fff7..8beb35aa6f15 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -79,6 +79,11 @@ mem_type_to_gt(struct xe_device *xe, u32 mem_type)
 	return xe_device_get_gt(xe, mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0));
 }
 
+struct xe_gt *xe_bo_to_gt(struct xe_bo *bo)
+{
+	return mem_type_to_gt(xe_bo_device(bo), bo->ttm.resource->mem_type);
+}
+
 static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
 			   u32 bo_flags, u32 *c)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index f4303810f213..f9abd8036417 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -105,6 +105,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
+struct xe_gt *xe_bo_to_gt(struct xe_bo *bo);
 
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a2e586ebd9a8..6dc31b030687 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -792,10 +792,12 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 	int ret;
 
 	if (is_vram) {
+		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
+
 		xe_walk.default_pte = GEN12_PPGTT_PTE_LM;
 		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
 			xe_walk.default_pte |= GEN12_USM_PPGTT_PTE_AE;
-		xe_walk.dma_offset = gt->mem.vram.io_start -
+		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
 			gt_to_xe(gt)->mem.vram.io_start;
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
-- 
2.34.1

