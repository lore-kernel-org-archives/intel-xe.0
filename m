Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC3DC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C5510E9DC;
	Thu, 11 Jul 2024 09:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlfRuKHu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE5E10E9D2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689539; x=1752225539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rtGaBVmX50Zmw5GrqZSQy9ekFMtX7Jx5cClJix+PziA=;
 b=IlfRuKHuyQzcPSoERofOxA7z7uksgM7TCkNXc7GnkHx2ar9ClcKZ/+HI
 DJ/Mv96tkaUhxCun5vKsiBqjj4RAHqb4lYTMW2JPo2jtQS3ADWUp2ObFZ
 iczzmryi/rxiHs+bK/55/7Q1avdarBFv5YGdAc+nvjl5P1vD6fvWsi8xy
 BVdTjtTXHxp0bvlRLvR/bm+6QuSzmOHDEpop9YZAVBDpUinetrparSWCn
 BYefW07KOtbACSdyHAl3QFhvnRs7f2BRbmiO1rU7XNVe8EkBuvDkSTnp5
 4dnxVThXO7lmewBzhkfG1jvr9cTzqO0aUflZD5Jylxf6EWMPHb3tvYxEI w==;
X-CSE-ConnectionGUID: TL2zuLesSWWZcKE4/cyCkA==
X-CSE-MsgGUID: HgEyKR+1SJy6NBEhS64P0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17671942"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17671942"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:33 -0700
X-CSE-ConnectionGUID: 4BIr/SXERjSc05NGOg3nhA==
X-CSE-MsgGUID: N+540HNgSoCWlI8Gwu2XHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="79210101"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:32 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.auld@intel.com,
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 4/6] drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
Date: Thu, 11 Jul 2024 09:18:17 +0000
Message-Id: <4c5165d6352f58371ef3452704c542e1a21284ed.1720689220.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720689220.git.akshata.jahagirdar@intel.com>
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
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

During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.
During restore (sysmem->vram), we need the mapping from uncompressed -> uncompressed.
Handle logic for selecting the compressed identity map for eviction,
and selecting uncompressed map for restore operations.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a3d6d3113ac2..96f747cd949d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -690,7 +690,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	u32 flush_flags = 0;
 
-	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
+	if (xe_device_needs_ccs_emit(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
 		/*
 		 * If the src is already in vram, then it should already
 		 * have been cleared by us, or has been populated by the
@@ -766,6 +766,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
+	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
@@ -808,7 +809,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
+		batch_size += pte_update_size(m, src_is_vram, use_comp_pat, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
 
@@ -827,7 +828,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
+			((xe_device_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
-- 
2.34.1

