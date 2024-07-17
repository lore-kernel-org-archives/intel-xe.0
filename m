Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD40C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26E610E8DF;
	Wed, 17 Jul 2024 05:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZhTF1Jz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EE010E925
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721193712; x=1752729712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F7UKVK3pFwHvshVS0y2eeggAnBZZhMWIJM4jKTPyG4o=;
 b=TZhTF1Jz47e8Nd9iWk6ZbKZSNStkMM7PxFmf9OMUO3i7DOTiYyACCZ81
 WKUgI/YNDbhZ6MM23Rn7KEydNd7QIzewf/S0KjCR53A18KV/K3+ZrGQPr
 xHcTFqtPH9jf/7j1iQclYVcYZJVScskCoZJPtU1O4XSJL3npv7lbJ3sm8
 Y5gaSF+cEPiNmI3Q2yNVt9PC2GGF49R+FiNOzK/qvtM2FFbMOIX6NWfjW
 eizmVZuaGWgrMVDcVub+uHpxAMtEiqdN0vZXgQCz5T+GL9qR2pl8GdEqQ
 XrbbseyFLM4OGy2B9g80MMjuyK2KrfPLuhpmV/sepyX6a4ZNw/jl1vVcB A==;
X-CSE-ConnectionGUID: T0eD95oFTH+XU7oMeTt3ow==
X-CSE-MsgGUID: 58WmPKdeSguHaK2oMVGHhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29281166"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="29281166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:51 -0700
X-CSE-ConnectionGUID: D8y+eJCAQi6M5pZgeQ2byA==
X-CSE-MsgGUID: Hu9tyCj+QHeW0EcKaiyB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="55124881"
Received: from dut1107bmgfrd.igk.intel.com ([10.211.177.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:50 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, matthew.brost@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 5/8] drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
Date: Wed, 17 Jul 2024 05:21:30 +0000
Message-Id: <c2884e97382547d6eaff716b4f7b6112b06470e5.1721193361.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721193361.git.akshata.jahagirdar@intel.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
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
index 746656dfc970..efd64af4f8cd 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -706,7 +706,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	u32 flush_flags = 0;
 
-	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
+	if (!copy_ccs && dst_is_indirect) {
 		/*
 		 * If the src is already in vram, then it should already
 		 * have been cleared by us, or has been populated by the
@@ -782,6 +782,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
+	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
@@ -808,7 +809,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
-		u32 flush_flags;
+		u32 flush_flags = 0;
 		u32 update_idx;
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
@@ -826,6 +827,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		src_L0 = min(src_L0, dst_L0);
 
 		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
 		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
@@ -846,7 +848,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
+			((xe_migrate_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
@@ -875,11 +877,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
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

