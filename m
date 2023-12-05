Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50607C10DCE
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2267B10E635;
	Tue,  5 Dec 2023 21:34:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA9110E622
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701812040; x=1733348040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8s0frjgTfb56NU9sBEbT+rgSADoEtgpXhYIIQgeL0Q=;
 b=EzhZ8tuTCYL7mVTVllv1DoSvbqKbvGc9E7yiMiozYXPzILu7uYR902vI
 qr6rK1wGH7thXiGW+g1Kfh7mDWfVjMNoLVu0DRgpTLVDmERX6+7L2TitQ
 Yic4+7/TCMvaPZr7a22QM2W/tJtyjee9S1waW4rr0p55PRaxpHEblFmMx
 NZ8ysZKyCK2CJEwrp+EmUUlBeSi2kz26H4cKi/zVApqK1qrtvMnW4y5db
 FAXaDawr7vRbLdv1eeMCsGyj29B75FwRSUxxMcxVMRSb+enMGO3MuVxRX
 s2+D5KURSyrI4nECTm+QT3qPtqicq5ilYEHi5lcVhKx3xY56r0HU2nHl7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378983016"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="378983016"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889079439"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="889079439"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 13:33:58 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 03:11:31 +0530
Message-Id: <20231205214135.958847-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
References: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/9] drm/xe/xe2: Update chunk size for each
 iteration of ccs copy
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

In xe2 platform XY_CTRL_SURF_COPY_BLT can handle ccs copy for
max of 1024 main surface pages.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 34 ++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b4dd1b6d78f0..98dca906a023 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -672,11 +672,24 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		u32 update_idx;
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
+
 		bool usm = xe->info.supports_usm;
+		u32 avail_pts = NUM_PT_PER_BLIT;
 
 		src_L0 = xe_migrate_res_sizes(&src_it);
 		dst_L0 = xe_migrate_res_sizes(&dst_it);
 
+		/* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
+		 * pages. Hence limit the processing size to SZ_4M per
+		 * iteration.
+		 */
+		if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
+			src_L0 = min_t(u64, src_L0, SZ_4M);
+			dst_L0 = min_t(u64, dst_L0, SZ_4M);
+
+			avail_pts = SZ_4M / SZ_2M;
+		}
+
 		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
 			pass++, src_L0, dst_L0);
 
@@ -684,18 +697,18 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
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
@@ -923,8 +936,19 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		struct xe_bb *bb;
 		u32 batch_size, update_idx;
 		bool usm = xe->info.supports_usm;
+		u32 avail_pts = NUM_PT_PER_BLIT;
 
 		clear_L0 = xe_migrate_res_sizes(&src_it);
+
+		/* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
+		 * pages. Hence limit the processing size to SZ_4M per
+		 * iteration.
+		 */
+		if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
+			clear_L0 = min_t(u64, clear_L0, SZ_4M);
+			avail_pts = SZ_4M / SZ_2M;
+		}
+
 		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
 
 		/* Calculate final sizes and batch size.. */
@@ -932,7 +956,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 			pte_update_size(m, clear_vram, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
 					emit_clear_cmd_len(gt), 0,
-					NUM_PT_PER_BLIT);
+					avail_pts);
 		if (xe_device_has_flat_ccs(xe) && clear_vram)
 			batch_size += EMIT_COPY_CCS_DW;
 
-- 
2.25.1

