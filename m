Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CC0C41513
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DD010E439;
	Wed, 17 Jul 2024 21:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEcl6JKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C37E10E444
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721250624; x=1752786624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4JczkCuAiLGc/HhwnNkX7KdGQukOmBNBj4Au91Rcozk=;
 b=lEcl6JKIunoz35UASRcksJk31rYPdf+tPWQLcXwtO2U4iwcuTq3h/vO1
 9Nqi0+mG3mRvppb33amR06dL3HPPThem6+VcGyINE+mSVgDbJbn9uqibQ
 4OnRRLSqD/OgB1UNSd5GSfTjS1xa5z1ZF/GLWhy5VGykEABXRRc8LIIQT
 ogcrKNlSL6Fpa7F94DsuNIK1EvDi4WjI3BlliJwAwJ1EAaXtZMzY7PiDu
 pLQeGsCjc/khLP8QwskQ3qlLi74Cz0R2bQjyijlXrmXCpiiy63yuW71dP
 nhoJybDg2o9yC8IooCVHOiGwi6uuSmNyWV0MU/vpsUPZZAXwYD8anHC8X w==;
X-CSE-ConnectionGUID: f+PSK8ddSGqGUnnh3SqjDA==
X-CSE-MsgGUID: roek7GPRQ/uPHjAU3BhpEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12596208"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="12596208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:24 -0700
X-CSE-ConnectionGUID: 6S/kIYZkTKa5nvwDhlOMIQ==
X-CSE-MsgGUID: 8M6RsoB1TnCc2nu4K4BtjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50252663"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:21 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 5/7] drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
Date: Wed, 17 Jul 2024 21:10:06 +0000
Message-Id: <79b3a016e686a662ae68c32b5fc7f0f2ac8043e9.1721250309.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721250309.git.akshata.jahagirdar@intel.com>
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
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

During eviction (vram->sysmem), we use compressed -> uncompressed mapping.
During restore (sysmem->vram), we need to use mapping from
uncompressed -> uncompressed.
Handle logic for selecting the compressed identity map for eviction,
and selecting uncompressed map for restore operations.
v2: Move check of xe_migrate_ccs_emit() before calling
xe_migrate_ccs_copy(). (Nirmoy)

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c1c751952ce8..c007f68503d4 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -705,7 +705,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	u32 flush_flags = 0;
 
-	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
+	if (!copy_ccs && dst_is_indirect) {
 		/*
 		 * If the src is already in vram, then it should already
 		 * have been cleared by us, or has been populated by the
@@ -781,6 +781,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
+	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
@@ -807,7 +808,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
-		u32 flush_flags;
+		u32 flush_flags = 0;
 		u32 update_idx;
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
@@ -825,6 +826,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		src_L0 = min(src_L0, dst_L0);
 
 		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
 		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
@@ -845,7 +847,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
+			((xe_migrate_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
@@ -874,11 +876,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		if (!copy_only_ccs)
 			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
 
-		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
-						  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
-						  dst_L0_ofs,
-						  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
-						  src_L0, ccs_ofs, copy_ccs);
+		if (xe_migrate_needs_ccs_emit(xe))
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
+							  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
+							  dst_L0_ofs,
+							  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
+							  src_L0, ccs_ofs, copy_ccs);
 
 		job = xe_bb_create_migration_job(m->q, bb,
 						 xe_migrate_batch_base(m, usm),
-- 
2.34.1

