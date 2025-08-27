Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09038CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 10:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D5110E073;
	Wed, 27 Aug 2025 10:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iux5wFkF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A70C10E073
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 10:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756289482; x=1787825482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BWFcJMdZuWVcvwCcMl6EKosfox0+fBOdfTFRbKGb/eo=;
 b=iux5wFkFrFiJRqwY+q07mGA8+CI1noa2N/N/RyLmT0aeWkaN6mjHYV04
 mmhS/Hx3ryUot9SzVUw1tVQNazh0UH1SryT5FbMyDQowyhiDTsKy/HV2P
 VzpSf2+FCJhvuLUVU0XjdGtqTInROKojfcwp6QxF/CmYX7CRSSGBgSl3T
 vislXdbNGQpYg80J2u36vkm4NNLs0o/959XEI02z8D1pGqF4dGNQ93nRR
 SNjgHNMyoHtWEhmA6SFnY3w4Z9ztn5NkjVu3ej0B4wZW1hblwP8HXUSUh
 kvtmclRL1PrrWBaZfQDnW5xA+c3ANMWmainMHzRl407Ki5DJK1rMzfHSG Q==;
X-CSE-ConnectionGUID: uCZY9KhnQ+q45JZLw77mSg==
X-CSE-MsgGUID: aXaVaHZxT62IF6bNP5qwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62377159"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62377159"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 03:11:21 -0700
X-CSE-ConnectionGUID: ehE/zN5eQ1yHkYq/sr1wtA==
X-CSE-MsgGUID: 6MC035MGRYSI1aw3ouBJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169711695"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 03:11:20 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe/migrate: Remove unneeded emit_pte() when copying CCS
 only
Date: Wed, 27 Aug 2025 15:40:33 +0530
Message-ID: <20250827101033.966580-1-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In xe_migrate_copy(), when copy_only_ccs is true, we only need two
emit_pte() calls—one for the BO and one for the raw CCS storage.
However, the current implementation issues three emit_pte() calls,
resulting in an unnecessary PTE programming job.

This fix removes the redundant emit_pte() call to avoid programming
the same PTEs twice and reducing overhead during CCS-only migration.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ddfad7506a82..9541a8fe4637 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -843,11 +843,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
 
-		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
-		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
-					      &dst_L0_ofs, &dst_L0_pt, 0,
-					      avail_pts, avail_pts);
-
 		if (copy_system_ccs) {
 			xe_assert(xe, type_device);
 			ccs_size = xe_device_ccs_bytes(xe, src_L0);
@@ -855,7 +850,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 						      &ccs_ofs, &ccs_pt, 0,
 						      2 * avail_pts,
 						      avail_pts);
+			dst_L0_ofs = src_L0_ofs;
 			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+		} else {
+			pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+			batch_size += pte_update_size(m, pte_flags, dst,
+					&dst_it, &src_L0,
+					&dst_L0_ofs, &dst_L0_pt,
+					0, avail_pts, avail_pts);
 		}
 
 		/* Add copy commands size here */
@@ -876,13 +878,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
 			xe_res_next(&dst_it, src_L0);
+		else if (copy_system_ccs)
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
 		else
 			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
 				 &dst_it, src_L0, dst);
 
-		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
-
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-- 
2.43.0

