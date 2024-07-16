Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB798C3DA4B
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 01:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA85610E35E;
	Tue, 16 Jul 2024 01:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4xEzAcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EF410E35E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 01:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721091689; x=1752627689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nfUTymaUklgmgT0Xr9BkLhxhJb0/nmY1ssrdxCFQXSg=;
 b=S4xEzAcjC9RjercrKaKcb6qWu/etu/VsGXwxCMa1QTC74VzaARl1NdZS
 N1q8G31LTVhM+RMMpdNr9ybXjrzVCqW/NNe8qmVRcaLLN2e/3JfUk2LQe
 duP3b99mx5/AxJpI/BHAzd49tbhL/LhHcID1eSaR+IwtdM1wYuNQpOBl9
 Q5jfn4qOjUbAELh7WwlPRnjDOV/Iw507exM+Dj5HtFML6DzhOENEgiR8s
 z8zPj8f70muumvIghHk2dXRc/g1GRVkE5CrdMGvh3nkQRWxqNcQmV/HO6
 VlUKjZVVXBwQTujcMXDqT/0nWSNZWMLD+oq7c4Rmdsu0D+EyIl3f0nI1q Q==;
X-CSE-ConnectionGUID: 7jw8Aj9FRFGfZWvBCuV6Nw==
X-CSE-MsgGUID: oh1oqKHHSXW58GqMLrCC5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18618355"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18618355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:29 -0700
X-CSE-ConnectionGUID: TyeFWALfT9C7HjTMhB9edw==
X-CSE-MsgGUID: GjLdKISOTX6VXPUZv3THdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49874269"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:27 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 4/7] drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
Date: Tue, 16 Jul 2024 01:01:08 +0000
Message-Id: <8cc2414e1634ebc86dcf90726b8787d0e7839c37.1721091282.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721091282.git.akshata.jahagirdar@intel.com>
References: <cover.1721091282.git.akshata.jahagirdar@intel.com>
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

From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>

During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.
During restore (sysmem->vram), we need the mapping from uncompressed -> uncompressed.
Handle logic for selecting the compressed identity map for eviction,
and selecting uncompressed map for restore operations.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 53d3c044d30e..2cb10437f289 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -691,7 +691,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	u32 flush_flags = 0;
 
-	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
+	if (xe_migrate_needs_ccs_emit(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
 		/*
 		 * If the src is already in vram, then it should already
 		 * have been cleared by us, or has been populated by the
@@ -767,6 +767,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
+	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
@@ -809,7 +810,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
+		batch_size += pte_update_size(m, src_is_vram, use_comp_pat, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
 
@@ -828,7 +829,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
+			((xe_migrate_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
-- 
2.34.1

