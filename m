Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A01BC531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 15:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A76A10E35A;
	Tue, 20 Aug 2024 15:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKgCaxYr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7909C10E3FF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724169533; x=1755705533;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PzdgNzJjMvqNwXdHNleJb8SzabpR4Ln0qb+X1fsFYDA=;
 b=RKgCaxYrQRtPr+/yc8eAAN+Z4rHSjiAxPa0N1Ai/FXI/PEiStnJ1jvgz
 OvNTfJM1aoyPOHVgaB/RvLY0RZRxpPL/BkKPT1/BKI8wbbZoTNjpgzWeI
 VBqaKfmENVQ5yd5EDP34mnHI2CcyZBk1SB3O1EwwOVyqcAXVDGU+NHJ4X
 X6xhNMssYRgk2hfrV4Yy4HhBDIJ8ijgD5b+Ab9mxfkN/6LkVKXgFKXsfP
 jZia+xXUCKs/ron8zEYd34qY0bXAA44UZchZwZK/oSGSmtfrP8s9Mz2rf
 2zSfBBou8mdMbnUWQw9HtKjUdAYdTm0+2mAUnG7GaX8bHnp3bpHYVaFSc w==;
X-CSE-ConnectionGUID: lUBgKeL0SDieUT5GMDOIgg==
X-CSE-MsgGUID: Ch+w4jP4RnSGWxxm0JiKyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22335920"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22335920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 08:58:52 -0700
X-CSE-ConnectionGUID: r3wWgeavSnioXZtb3iMvRg==
X-CSE-MsgGUID: kK8+KAscRyOvIVKPUjj0+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65466545"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 08:58:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe: Invalidate media_gt TLBs
Date: Tue, 20 Aug 2024 08:59:47 -0700
Message-Id: <20240820155947.984672-1-matthew.brost@intel.com>
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
v3: Include missing local changm

Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1bfd0b6e955..86fd144034e3 100644
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
+			++fence_id;
+
+			if (!tile->media_gt)
+				continue;
+
+			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
+							  &fence[fence_id],
+							  true);
 
-			tile_needs_invalidate |= BIT(id);
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

