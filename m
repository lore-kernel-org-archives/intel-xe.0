Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB76C41513
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865C710E9E0;
	Thu, 11 Jul 2024 09:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGsRnD23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2413910E9D9
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689613; x=1752225613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rtGaBVmX50Zmw5GrqZSQy9ekFMtX7Jx5cClJix+PziA=;
 b=aGsRnD237pIoQXB6JzktvVh1Cno9owLP0v2dP2SWqHS2vkLRU4tVZsMz
 jurZNJXpAEsTwm+/3bVHNyczOW0l+JBGRjI/CWbIgxfvC5rH5YmT3xICd
 5Qo5JhmkHvxE6MZp3yiG83a6ONlc2qT/ghOvdHL3bGA5lc466cc79DQm1
 JESnjMxNvCCCy42t7MS6p+JaKDSlnjGXKYnjIHcEwne//am7aJRhg0dGQ
 Y+l4eKi65yG0hNankcqRfmKZZGexsBHiy9f9kAdReqTQEUJ+jHlyPWn2Q
 48XF3m5tise6m9j81ZwzYCrDnlCvZTFpn/YoKZcHCDhAIqtEt1x6w4nWq A==;
X-CSE-ConnectionGUID: LzZi5qdfTpGQaU7IgbWHFQ==
X-CSE-MsgGUID: 2HBhdaMUTDW+RBt3jNTNTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12495924"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="12495924"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:20:13 -0700
X-CSE-ConnectionGUID: /ryNW8BSRRC4DoL2XetgIg==
X-CSE-MsgGUID: eDdG4Cc0Tuyl+ibYjUYr3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48470885"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:20:12 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 4/6] drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
Date: Thu, 11 Jul 2024 09:20:00 +0000
Message-ID: <4c5165d6352f58371ef3452704c542e1a21284ed.1720689220.git.akshata.jahagirdar@intel.com>
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
Message-ID: <20240711092000.jBSKrqGXHe_-EiArLM8C6j8P01Rn4fWbrTJOwVLxO6A@z>

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

