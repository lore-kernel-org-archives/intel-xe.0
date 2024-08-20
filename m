Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCDBC531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 15:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8810E357;
	Tue, 20 Aug 2024 15:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9v76M7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EAD10E357
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724169416; x=1755705416;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uH9QwRPBIT7029uAVEMxJVvYrAajlnFnkXaj+ubL9zc=;
 b=D9v76M7e6X3RLLF7aQrsd8eQ0Nrn1c6Pld0bfkkDXZVkt7A9xSIyUh5Z
 nn/3rUXS3MLO6UQH+G697o3aJntEKKQbOlVlWzqkCxKb5LHXUT8Mz4o9g
 rGWzjQKnB3Qh+2g3J1X4lSSrtea0c+A6IxgG1P4MoXy8oqrJm3k3BPORX
 E8yO3mrbz/1NRMWRIpMrFsVm0hWP8Cfb0tm3b8vdaN56Y/+SfjZR+ovFB
 VMie9kHBjfF1OtUELabPO6oZ7PpD8Xsi2WbchfbIkjSjp8brwdX/kI3RE
 U3qXFDhJbtq2DA8FMxEW+JPug8M/mzWGWiQ4F4OUv7VnommdqaGPtpRaB A==;
X-CSE-ConnectionGUID: jNYTOvzIQXu01hcEgOvMBA==
X-CSE-MsgGUID: Zs+LCYkIRISVJRvSa7i4Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22102183"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22102183"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 08:56:56 -0700
X-CSE-ConnectionGUID: Czx3FAeZTr2iZvHmGD9XcQ==
X-CSE-MsgGUID: OIwXm8TfQ6q9y+nhCkN8Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="61294064"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 08:56:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Invalidate media_gt TLBs
Date: Tue, 20 Aug 2024 08:57:48 -0700
Message-Id: <20240820155748.984581-1-matthew.brost@intel.com>
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

v2: Fix 2 tile case

Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1bfd0b6e955..d43200e67aca 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3158,8 +3158,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
-	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
-	u32 tile_needs_invalidate = 0;
+	struct xe_gt_tlb_invalidation_fence
+		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
 	u8 id;
 	int ret = 0;
 
@@ -3185,30 +3185,42 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
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
 			if (ret < 0) {
-				xe_gt_tlb_invalidation_fence_fini(&fence[id]);
+				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
 				goto wait;
 			}
 
-			tile_needs_invalidate |= BIT(id);
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
+			if (ret < 0) {
+				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
+				goto wait;
+			}
+			++fence_id;
 		}
 	}
 
 wait:
-	for_each_tile(tile, xe, id)
-		if (tile_needs_invalidate & BIT(id))
-			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+	for (id = 0; id < XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
 
 	vma->tile_invalidated = vma->tile_mask;
 
-- 
2.34.1

