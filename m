Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9911C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 16:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A251710E3E1;
	Tue, 20 Aug 2024 16:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHtXFLLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D821E10E412
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724169636; x=1755705636;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j4+iu72jJcWcS4vxE0IWRSrGFqml6G6GwYDReABA93Y=;
 b=HHtXFLLRP0d0fPaKLcX2365Ecg+sfOJ9MNQFfGhPlByHr2vZdMcQSQYL
 w6JrPG+CTF/EWIcsf4f9TET8Flz41AncvP44MpS7Ctj2OTQi9Y1T9EQHM
 5FOvOQNUbzUm5dwN7lGmOUKK048xWuBgClm0DtG4xIE+gFtvQq2MS1Bdf
 sH0Rh4viVWQtcriZMmTx/0LkH96+hDZETTkdZXGZCAeN4+meRjA0VAHMl
 CvFV9Biftz4Zrh+E5nNE5KY+qFKdPOrW2VPQY+TVugrJFf3dcpQsbkg/M
 T8Zp48xKCEQ6NhmOw8amQaCjxupJOD4KeJXf+7UhrHjkhnCxT18/UkAW9 Q==;
X-CSE-ConnectionGUID: SbqIY1pVTQK3W00aipYqZQ==
X-CSE-MsgGUID: tNiXfJNQRsKtUVbH4Pt3WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22365008"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22365008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:00:36 -0700
X-CSE-ConnectionGUID: SoZTCe2wRbOx67/L3LHy/A==
X-CSE-MsgGUID: fZLoJVEUStOpAae718UAaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60616131"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:00:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4] drm/xe: Invalidate media_gt TLBs
Date: Tue, 20 Aug 2024 09:01:29 -0700
Message-Id: <20240820160129.986889-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1bfd0b6e955..4cc13eddb6b3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3158,9 +3158,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
-	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
-	u32 tile_needs_invalidate = 0;
+	struct xe_gt_tlb_invalidation_fence
+		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
 	u8 id;
+	u32 fence_id = 0;
 	int ret = 0;
 
 	xe_assert(xe, !xe_vma_is_null(vma));
@@ -3188,27 +3189,37 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
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
 
-			tile_needs_invalidate |= BIT(id);
+			if (!tile->media_gt)
+				continue;
+
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
+	for (id = 0; id < fence_id; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
 
 	vma->tile_invalidated = vma->tile_mask;
 
-- 
2.34.1

