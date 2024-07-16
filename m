Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DFBC3DA61
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 22:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDFE10E902;
	Tue, 16 Jul 2024 22:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJiGH0Th";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B145110E8FD
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 22:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721170465; x=1752706465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YmzahVmGxbgImM63vCJdEXYXXXJEtCnGVRUUTsXg8Pc=;
 b=cJiGH0Thj+o/Refqsar5B87Dz2LnVBjeboc1Ce844jrzCWhQW72/+dy8
 /9fOFYU67JBNUyb8bQAwfLDYTOng0xjKhTxqZK/r4p0j6MIcaNAeqd8JE
 mur1TTLRtPY8Sdme1eMlmj4caEa+8OXHKM5x5hvkr9c1Pdleoj/NZXmph
 1mJlc889ygQhDzofl3PCghnny+ZsIie+yVlne67EWeRo1hjtxcBqdxruA
 UfCxOxiM2AL7FjF7GmhbWZ435i7fQL/ArxAMdBuR0oZ/uRTiWV3XPvJpt
 p+hF1/W8rSwiWceA71Wewb7WoqXmWFFX8Rku7saviTlAx9dmp/eNOrnvB w==;
X-CSE-ConnectionGUID: N4uUloxsRymY5ng04HwOLw==
X-CSE-MsgGUID: lvniBb/gQPqGwOlMj17dWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22457142"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="22457142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:54:25 -0700
X-CSE-ConnectionGUID: b7exfEANSlO+SUmsnKAN9Q==
X-CSE-MsgGUID: 8Q+sFLojQ2uX2VkKRzAEaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50765860"
Received: from unknown (HELO DUT1107BMGFRD.igk.intel.com) ([10.211.177.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:54:23 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 5/8] drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
Date: Tue, 16 Jul 2024 22:54:06 +0000
Message-Id: <b19600d1ae661599f17884b288b1ea00fba9bb8c.1721170212.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721170212.git.akshata.jahagirdar@intel.com>
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
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
 drivers/gpu/drm/xe/xe_migrate.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 601c9e790dae..b28724caec10 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -697,7 +697,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	u32 flush_flags = 0;
 
-	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
+	if (!copy_ccs && dst_is_indirect) {
 		/*
 		 * If the src is already in vram, then it should already
 		 * have been cleared by us, or has been populated by the
@@ -773,6 +773,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
+	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
@@ -799,7 +800,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
-		u32 flush_flags;
+		u32 flush_flags = 0;
 		u32 update_idx;
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
@@ -815,7 +816,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
+		batch_size += pte_update_size(m, src_is_vram, use_comp_pat, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
 
@@ -834,7 +835,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
+			((xe_migrate_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
@@ -863,11 +864,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
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

