Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B77C531DF
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 21:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64C710E118;
	Sat, 17 Aug 2024 21:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SP7UL8lJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0E110E118
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928638; x=1755464638;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mpfcbrXruaOwO0ijvQbquklER/BJtZMjrpehoDRsRbw=;
 b=SP7UL8lJZhJZw5reC+xWLNv6jQSwGy77zl/k1Hu0zVwSDuDNTvpNaKO5
 UVSI4vmcxR5MtEqhewZv5k/qX1/XTcGXx26jVGY4RqooxiMRMvk9inaly
 Amjxh8QYY90ye33s7x8AEhu2TgREf/G6KUo4LOicLSdIMQBLAHrlOFaJf
 XC81tyBVQ/5T+JSG5xb+lfHn5YEaZphqTtXh48hoq+Unojfzj85Ye/bCT
 k2Tyf18KTpztqb35GCbeqrPVL0j4bdWKLKqKet2MZF80bWhWQtUdwr5Ws
 NzWEed8zs8kUKd9/rExrJu5jW0uuFM2cfEgZfsfRAP63rI/dTuZOIMeR0 A==;
X-CSE-ConnectionGUID: pPlftg/1QrmVHhC+1WlKqQ==
X-CSE-MsgGUID: bzM+MELsRBeL28N4YOcF5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="33349066"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="33349066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:03:57 -0700
X-CSE-ConnectionGUID: TBxiYd6KTBG/Dvpt+5l9lg==
X-CSE-MsgGUID: cskUeFRcQQGj2A3YNRgShQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="59693835"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:03:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Invalidate media_gt TLBs
Date: Sat, 17 Aug 2024 14:04:51 -0700
Message-Id: <20240817210451.278887-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Testing on LNL has shown media TLBs need to be invalidated via the GuC,
update xe_vm_invalidate_vma appropriately.

Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 42 +++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6dd76f77b504..ac98973a90cc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3184,8 +3184,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
-	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
-	u32 tile_needs_invalidate = 0;
+	struct xe_gt *gt;
+	struct xe_gt_tlb_invalidation_fence
+		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	u32 gt_needs_invalidate = 0;
 	u8 id;
 	int ret = 0;
 
@@ -3211,29 +3213,45 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	}
 
 	for_each_tile(tile, xe, id) {
+		u32 fence_id = id * XE_MAX_TILES_PER_DEVICE;
+
 		if (xe_pt_zap_ptes(tile, vma)) {
 			xe_device_wmb(xe);
 			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
-							  &fence[id], true);
+							  &fence[fence_id],
+							  true);
 
-			/*
-			 * FIXME: We potentially need to invalidate multiple
-			 * GTs within the tile
-			 */
 			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
-							 &fence[id], vma);
+							 &fence[fence_id], vma);
+			if (ret < 0) {
+				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
+				goto wait;
+			}
+
+			gt_needs_invalidate |= BIT(fence_id);
+
+			if (!tile->media_gt)
+				continue;
+
+			++fence_id;
+			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
+							  &fence[fence_id],
+							  true);
+
+			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
+							 &fence[fence_id], vma);
 			if (ret < 0) {
-				xe_gt_tlb_invalidation_fence_fini(&fence[id]);
+				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
 				goto wait;
 			}
 
-			tile_needs_invalidate |= BIT(id);
+			gt_needs_invalidate |= BIT(fence_id);
 		}
 	}
 
 wait:
-	for_each_tile(tile, xe, id)
-		if (tile_needs_invalidate & BIT(id))
+	for_each_gt(gt, xe, id)
+		if (gt_needs_invalidate & BIT(id))
 			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
 
 	vma->tile_invalidated = vma->tile_mask;
-- 
2.34.1

