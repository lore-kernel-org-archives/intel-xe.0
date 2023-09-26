Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD3FE7F140
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CB410E461;
	Tue, 26 Sep 2023 22:36:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD5310E457
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 22:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695767786; x=1727303786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5x15auSjh9y4P8e0E+vnfQzODIPJ73/A1iC6AXCL6XI=;
 b=K/BQ74HVYNLI52fszL3i1pjhobP1vLGhuL/hjGhDBSMBETUw4oxn0mZ/
 pCE0CIpF3R0rDC2U4L/rBD/hiacXZ+totXFD2fC1HUPuUlbgbw8NrHXre
 STxXeKpUAc6858/+25Lx7oYnL0MpMPcXE97y5HPeHOUPteg5YTq21RluP
 s5LhuA6Xv30rFN/o+hhA6RAqJqU58RuhNb0Q7bJRupnoldhpDwyvf/Arx
 mPHLpS5JMJh6iz7OtIYeuq8MG8F6RCNL5aDS0oMveysxdiddynAdWhtxu
 GZrhheMnLA/nHb2q3IW+YS8aL5MAkViBlcrF0xV+tVvGECGOSUDsrCd1j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412597216"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412597216"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752343392"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="752343392"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 15:36:30 -0700
Message-Id: <20230926223631.2807873-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926223631.2807873-1-lucas.demarchi@intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/11] drm/xe: Use vfunc for ggtt pte encoding
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use 2 different functions for encoding the ggtt's pte, assigning them
during initialization. Main difference is that before Xe-LPG, the pte
didn't have the cache bits.

v2: Re-use xelp_ggtt_pte_encode_bo() for the common part with
    xelpg_ggtt_pte_encode_bo() (Matt Roper)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 53 ++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h       |  1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h |  9 +++++
 3 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 54baaffc7235..99b54794917e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,16 +20,15 @@
 #include "xe_mmio.h"
 #include "xe_wopcm.h"
 
-/* FIXME: Common file, preferably auto-gen */
-#define MTL_GGTT_PTE_PAT0	BIT_ULL(52)
-#define MTL_GGTT_PTE_PAT1	BIT_ULL(53)
+#define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
+#define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
 
 /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
 #define GUC_GGTT_TOP	0xFEE00000
 
-u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
+static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
+				   enum xe_cache_level cache)
 {
-	struct xe_device *xe = xe_bo_device(bo);
 	u64 pte;
 
 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
@@ -38,11 +37,25 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_GGTT_PTE_DM;
 
-	/* FIXME: vfunc + pass in caching rules */
-	if (xe->info.platform == XE_METEORLAKE) {
-		pte |= MTL_GGTT_PTE_PAT0;
-		pte |= MTL_GGTT_PTE_PAT1;
-	}
+	return pte;
+}
+
+static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
+				    enum xe_cache_level cache)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	u32 pat_index = xe->pat.idx[cache];
+	u64 pte;
+
+	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, cache);
+
+	xe_assert(xe, pat_index <= 3);
+
+	if (pat_index & BIT(0))
+		pte |= XELPG_GGTT_PTE_PAT0;
+
+	if (pat_index & BIT(1))
+		pte |= XELPG_GGTT_PTE_PAT1;
 
 	return pte;
 }
@@ -72,7 +85,8 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	xe_tile_assert(ggtt->tile, start < end);
 
 	if (ggtt->scratch)
-		scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
+		scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0,
+							  XE_CACHE_WB);
 	else
 		scratch_pte = 0;
 
@@ -102,6 +116,14 @@ static void primelockdep(struct xe_ggtt *ggtt)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+static const struct xe_ggtt_pt_ops xelp_pt_ops = {
+	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
+};
+
+static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
+	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
+};
+
 int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -146,6 +168,11 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 	if (ggtt->size > GUC_GGTT_TOP)
 		ggtt->size = GUC_GGTT_TOP;
 
+	if (GRAPHICS_VERx100(xe) >= 1270)
+		ggtt->pt_ops = &xelpg_pt_ops;
+	else
+		ggtt->pt_ops = &xelp_pt_ops;
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -260,7 +287,7 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
 {
 	u64 addr, scratch_pte;
 
-	scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
+	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, XE_CACHE_WB);
 
 	printk("%sGlobal GTT:", prefix);
 	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
@@ -301,7 +328,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	u64 offset, pte;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
-		pte = xe_ggtt_pte_encode(bo, offset);
+		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, XE_CACHE_WB);
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 205a6d058bbd..3faa3c6d0375 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -10,7 +10,6 @@
 
 struct drm_printer;
 
-u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset);
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
 int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt);
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d34b3e733945..486016ea5b67 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -8,9 +8,16 @@
 
 #include <drm/drm_mm.h>
 
+#include "xe_pt_types.h"
+
 struct xe_bo;
 struct xe_gt;
 
+struct xe_ggtt_pt_ops {
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
+			     enum xe_cache_level cache);
+};
+
 struct xe_ggtt {
 	struct xe_tile *tile;
 
@@ -25,6 +32,8 @@ struct xe_ggtt {
 
 	u64 __iomem *gsm;
 
+	const struct xe_ggtt_pt_ops *pt_ops;
+
 	struct drm_mm mm;
 };
 
-- 
2.40.1

