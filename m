Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868F9C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559A610E406;
	Mon, 11 Dec 2023 13:34:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B1510E406
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301672; x=1733837672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oQPYipOzFcex/pvVKr7s3vQMQYNa+V2Ml1bHGm5XOYc=;
 b=mzXTSVXvqmrD9Vz9Aa98eALqo4LzgMgjCjrsxF4S/mcNOTFB5j8LsLlv
 sXtrvZ9sm0iPZIpEEA94XCZOj10DZADIWREvqJps+YmfP2ZXNFQrgrQHL
 uArdyQ2QLn+5/RdWu4Za9N8RrN1W6RC1XwupoMLIUM7uyyWxjywUq1pOy
 k8gWj9wSeilnQfLvcpgtgfW8wsW/+lB6pz+fc1P4tAYFzZSVyLVEYz97Z
 XcVB8nhzEGJZbxHewEjjOn7gAvyOi4bBHqYNmsM+cGvojLEZeYss8fWRZ
 J5G4RfPQcYnirLQ0QSZ4W0j0nqfPZRs+oSHxi1lb1CklbOCxdJHIJk0gD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461126624"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="461126624"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722788067"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722788067"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 05:33:45 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 07/10] drm/xe/xe2: Update emit_pte to use compression
 enabled PAT index
Date: Mon, 11 Dec 2023 19:11:20 +0530
Message-Id: <20231211134123.1645793-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
References: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For indirect accessed buffer use compression enabled PAT index.

v2:
 - Fix parameter name.

v3:
 - use a relevant define instead of fix number.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 21 +++++++++++++++------
 drivers/gpu/drm/xe/xe_pat.c           |  1 +
 drivers/gpu/drm/xe/xe_pt_types.h      |  1 +
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 47fcd6e6b777..d6c23441632a 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -330,7 +330,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	else
 		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
 
-	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
+	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
 		 &src_it, XE_PAGE_SIZE, pt);
 
 	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9698986eab06..1ecf2274c7ba 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -422,15 +422,24 @@ static u32 pte_update_size(struct xe_migrate *m,
 
 static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
-		     bool is_vram,
+		     bool is_vram, bool is_comp_pte,
 		     struct xe_res_cursor *cur,
 		     u32 size, struct xe_bo *bo)
 {
-	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	struct xe_device *xe = tile_to_xe(m->tile);
+
+	u16 pat_index;
 	u32 ptes;
 	u64 ofs = at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
 
+	/* Indirect access needs compression enabled uncached PAT index */
+	if (GRAPHICS_VERx100(xe) >= 2000)
+		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
+					  xe->pat.idx[XE_CACHE_NONE];
+	else
+		pat_index = xe->pat.idx[XE_CACHE_WB];
+
 	/*
 	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
 	 * we're only emitting VRAM PTEs during sanity tests, so when
@@ -717,19 +726,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		if (!src_is_vram)
-			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
+			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
 				 src_bo);
 		else
 			xe_res_next(&src_it, src_L0);
 
 		if (!dst_is_vram)
-			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
+			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
 				 dst_bo);
 		else
 			xe_res_next(&dst_it, src_L0);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src_bo);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -962,7 +971,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
-			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
+			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
 				 bo);
 		} else {
 			xe_res_next(&src_it, clear_L0);
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 1892ff81086f..1ff6bc79e7d4 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -387,6 +387,7 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_NONE] = 3;
 		xe->pat.idx[XE_CACHE_WT] = 15;
 		xe->pat.idx[XE_CACHE_WB] = 2;
+		xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = 12; /*Applicable on xe2 and beyond */
 	} else if (xe->info.platform == XE_METEORLAKE) {
 		xe->pat.ops = &xelpg_pat_ops;
 		xe->pat.table = xelpg_pat_table;
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 82cbf1ef8e57..cee70cb0f014 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -18,6 +18,7 @@ enum xe_cache_level {
 	XE_CACHE_NONE,
 	XE_CACHE_WT,
 	XE_CACHE_WB,
+	XE_CACHE_NONE_COMPRESSION, /*UC + COH_NONE + COMPRESSION */
 	__XE_CACHE_LEVEL_COUNT,
 };
 
-- 
2.25.1

