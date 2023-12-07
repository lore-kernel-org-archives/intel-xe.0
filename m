Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBD3C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 09:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB1510E1B4;
	Thu,  7 Dec 2023 09:11:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7755310E1B5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940312; x=1733476312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8s0frjgTfb56NU9sBEbT+rgSADoEtgpXhYIIQgeL0Q=;
 b=aT68uR1h3D4i3GlTZ9SiBlX2F8k2GES+vKV/CpkX5W7tsFLF0VXUDM8w
 YVVJyHUjDiRAGI4rs9vbk9FTh8PsbPyvCEgUav3j/bJUVBLvnYNf1Sc07
 wRVj1auoPA+jYas+EUVzYG6MVv/SXHveMfOQTX9+AM5dOkF8tZkudlqwW
 nLFtxHP+ZXGhJ5D7BGfPk3c2fLTbKlgawOG1gjdNKxnyrI2FOsA/yvBPP
 WKcWnpFAqbgZOqlk93LvSpIUWqNApi3DPjRwF6ntY+LXpjV1gz2nntKX7
 g+crRVynHutVk25WLsEyR/+klj6LPg2unZxJmE2IWYHUdmrTuAQEVkW36 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391373987"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391373987"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895067857"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895067857"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 01:11:45 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 14:49:18 +0530
Message-Id: <20231207091922.1224800-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 5/9] drm/xe/xe2: Update chunk size for each
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

