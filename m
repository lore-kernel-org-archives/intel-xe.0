Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C3C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE50010E416;
	Mon, 11 Dec 2023 13:34:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5958C10E406
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301670; x=1733837670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DdW3wglplWWy5VGybT2AT7SW6rTV4FpJMzKBp1uDAm4=;
 b=SwehAUm0vVndzz/Ol+0w4LmJP90MiY3zyamFk7RPzT5tx90HYTSvd9Y7
 Re4Wo2D7KfvD32tfnCEpQFWjrBkabPVeuZFoiUAcpdUXT5ISsSzwkU8vX
 8EoAXACQQZmLDDh7pR9guPMZWKuB90mC+SWCJPaVZa/AkO9nvI5GioEVO
 e6S1NrB2VdaYidT0z+T+T6S/H7upXMKYhk8GSdALHT2J+uMY17HqQX3EB
 nDYTn4pfcSpB2Yww4pzj6Au6HoBjBpjWzzyr3UjH/k2hN0RU3bvL1ulBJ
 t44EIDBfdNLuwAxccluUfSyOjb9idDm9ASuxh6pUBgU0b6VdO4wC/41Or g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461126596"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="461126596"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:33:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="722788063"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722788063"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 05:33:43 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 06/10] drm/xe/xe2: Update chunk size for each iteration of
 ccs copy
Date: Mon, 11 Dec 2023 19:11:19 +0530
Message-Id: <20231211134123.1645793-7-himal.prasad.ghimiray@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In xe2 platform XY_CTRL_SURF_COPY_BLT can handle ccs copy for
max of 1024 main surface pages.

v2:
 - Use better logic to determine chunk size (Matt/Thomas)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1016e2591737..9698986eab06 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -65,9 +65,15 @@ struct xe_migrate {
 };
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
+#define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
+
+#define MAX_MEM_TRANSFER_PER_PASS(_xe) ((!IS_DGFX(_xe) && GRAPHICS_VER(_xe) >= 20 && \
+					 xe_device_has_flat_ccs(_xe)) ? \
+					 MAX_CCS_LIMITED_TRANSFER : MAX_PREEMPTDISABLE_TRANSFER)
 #define NUM_KERNEL_PDE 17
 #define NUM_PT_SLOTS 32
-#define NUM_PT_PER_BLIT (MAX_PREEMPTDISABLE_TRANSFER / SZ_2M)
+#define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
+#define NUM_PT_PER_BLIT(_xe) (MAX_MEM_TRANSFER_PER_PASS(_xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE)
 
 /**
  * xe_tile_migrate_engine() - Get this tile's migrate engine.
@@ -366,14 +372,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	return m;
 }
 
-static u64 xe_migrate_res_sizes(struct xe_res_cursor *cur)
+static u64 xe_migrate_res_sizes(struct xe_device *xe, struct xe_res_cursor *cur)
 {
 	/*
 	 * For VRAM we use identity mapped pages so we are limited to current
 	 * cursor size. For system we program the pages ourselves so we have no
 	 * such limitation.
 	 */
-	return min_t(u64, MAX_PREEMPTDISABLE_TRANSFER,
+	return min_t(u64, MAX_MEM_TRANSFER_PER_PASS(xe),
 		     mem_type_is_vram(cur->mem_type) ? cur->size :
 		     cur->remaining);
 }
@@ -672,10 +678,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		u32 update_idx;
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
+
 		bool usm = xe->info.has_usm;
+		u32 avail_pts = NUM_PT_PER_BLIT(xe);
 
-		src_L0 = xe_migrate_res_sizes(&src_it);
-		dst_L0 = xe_migrate_res_sizes(&dst_it);
+		src_L0 = xe_migrate_res_sizes(xe, &src_it);
+		dst_L0 = xe_migrate_res_sizes(xe, &dst_it);
 
 		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
 			pass++, src_L0, dst_L0);
@@ -684,18 +692,18 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
-					      NUM_PT_PER_BLIT);
+					      avail_pts);
 
 		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
 					      &dst_L0_ofs, &dst_L0_pt, 0,
-					      NUM_PT_PER_BLIT, NUM_PT_PER_BLIT);
+					      avail_pts, avail_pts);
 
 		if (copy_system_ccs) {
 			ccs_size = xe_device_ccs_bytes(xe, src_L0);
 			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
 						      &ccs_ofs, &ccs_pt, 0,
-						      2 * NUM_PT_PER_BLIT,
-						      NUM_PT_PER_BLIT);
+						      2 * avail_pts,
+						      avail_pts);
 		}
 
 		/* Add copy commands size here */
@@ -922,9 +930,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
 		u32 batch_size, update_idx;
+
 		bool usm = xe->info.has_usm;
+		u32 avail_pts = NUM_PT_PER_BLIT(xe);
+
+		clear_L0 = xe_migrate_res_sizes(xe, &src_it);
 
-		clear_L0 = xe_migrate_res_sizes(&src_it);
 		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
 
 		/* Calculate final sizes and batch size.. */
@@ -932,7 +943,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 			pte_update_size(m, clear_vram, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
 					emit_clear_cmd_len(gt), 0,
-					NUM_PT_PER_BLIT);
+					avail_pts);
 		if (xe_device_has_flat_ccs(xe) && clear_vram)
 			batch_size += EMIT_COPY_CCS_DW;
 
-- 
2.25.1

