Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17DCCA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 06:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7089A10E408;
	Wed, 17 Sep 2025 06:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vqsv6u85";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02C210E408
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 06:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758089935; x=1789625935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ihRYiMdZdWrUfFigSDout8UeHUzkOMbuoifBbiI/qDg=;
 b=Vqsv6u85H8RP7C3c3aAklHmOffEBLZFeCAsJ6tGcNKgzaF3CfmuwAvih
 brsQtDsfb/kmvhVsqcEHYOt0ppGaIg+HytCEO55wY4ZbNbxnJa1f0hQ3S
 oJkTa1YI4DJ9dBBmJBrcThGVEFWGKpEJinaFDVjwUbPaqh/lcGovjuAvD
 eSSPeQK+/WcC7ehE8tjCMea9pwQFko1jssEWTZ+WgvVIh17hUzWVloFL8
 ZZqApF2WP9XOUFYv8zh+BAmjfp+vagnCL29dVhc5yaCZ60gsCQ0w4U1c1
 MlC0+2cR4FwPXbldS+YV17HZbYcAK7A1+A8cNbk1DwQOz8qXTQ8792pmm Q==;
X-CSE-ConnectionGUID: T+lTe4aTQa6WCxUh5Ei2/w==
X-CSE-MsgGUID: tCZh8gtbTmCb+hOGQTi/UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64020523"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="64020523"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 23:18:54 -0700
X-CSE-ConnectionGUID: WBakAB5pSQOu4HFqlCtEpw==
X-CSE-MsgGUID: lZ51hDrqRrWkFlU7FNE/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="198833062"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 23:18:53 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe/migrate: Revamp PAT index selection for migrate PTEs
Date: Wed, 17 Sep 2025 11:46:21 +0530
Message-ID: <20250917061620.4145998-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Improve PAT index selection logic in xe_migrate.c to avoid unnecessary
coherency overhead when host-side memory is uncached (WC). Previously,
we defaulted to XE_CACHE_WB, which enforces 2-way coherency and may
trigger cacheline pulls from CPU even when host-side memory is never
dirty.

This change introduces xe_migrate_pick_pat_index() and its helper
xe_migrate_pick_pat_index_basic(), which evaluate bo->cpu_caching and
graphics version to choose a more optimal PAT index. For iGPUs with
WC host mappings, we now prefer XE_CACHE_NONE to skip coherency snoops.
For compressed PTEs on newer platforms (graphics_verx100 >= 2000),
we select XE_CACHE_NONE_COMPRESSION.

This avoids unnecessary cache traffic for uncached host mappings.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 46 +++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6fad5d469629..9114e9c0c910 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -104,6 +104,34 @@ static void xe_migrate_fini(void *arg)
 	xe_exec_queue_put(m->q);
 }
 
+static inline u16 xe_migrate_default_pat_index(struct xe_device *xe,
+					       struct xe_bo *bo)
+{
+	bool host_wc = !IS_DGFX(xe) && bo && (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WC);
+
+	if (GRAPHICS_VERx100(xe) >= 2000) {
+		if (host_wc)
+			return xe->pat.idx[XE_CACHE_NONE];
+		return xe->pat.idx[XE_CACHE_WB];
+	}
+
+	/* Legacy PAT selection */
+	if (host_wc)
+		return xe->pat.idx[XE_CACHE_NONE];
+
+	return xe->pat.idx[XE_CACHE_WB];
+}
+
+static inline u16 xe_migrate_pat_index(struct xe_device *xe,
+				       struct xe_bo *bo,
+				       bool is_comp_pte)
+{
+	if (GRAPHICS_VERx100(xe) >= 2000 && is_comp_pte)
+		return xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
+
+	return xe_migrate_default_pat_index(xe, bo);
+}
+
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 {
 	XE_WARN_ON(slot >= NUM_PT_SLOTS);
@@ -177,7 +205,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				 struct xe_vm *vm, struct drm_exec *exec)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+	u16 pat_index;
 	u8 id = tile->id;
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
 #define VRAM_IDENTITY_MAP_COUNT	2
@@ -205,6 +233,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	pat_index = xe_migrate_pat_index(xe, bo, false);
+
 	/* PT30 & PT31 reserved for 2M identity map */
 	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
 	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
@@ -583,13 +613,13 @@ static void emit_pte(struct xe_migrate *m,
 	u32 ptes;
 	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
+	struct xe_bo *bo = NULL;
+
+	if (res && res->bo)
+		bo = container_of(res->bo, struct xe_bo, ttm);
 
 	/* Indirect access needs compression enabled uncached PAT index */
-	if (GRAPHICS_VERx100(xe) >= 2000)
-		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
-					  xe->pat.idx[XE_CACHE_WB];
-	else
-		pat_index = xe->pat.idx[XE_CACHE_WB];
+	pat_index = xe_migrate_pat_index(xe, bo, is_comp_pte);
 
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
@@ -1537,7 +1567,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 
 	/* For sysmem PTE's, need to map them in our hole.. */
 	if (!IS_DGFX(xe)) {
-		u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+		u16 pat_index = xe_migrate_pat_index(xe, NULL, false);
 		u32 ptes, ofs;
 
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
@@ -1759,7 +1789,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct drm_pagemap_addr *sram_addr,
 				       u32 size)
 {
-	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u16 pat_index = xe_migrate_pat_index(tile_to_xe(m->tile), NULL, false);
 	u32 ptes;
 	int i = 0;
 
-- 
2.43.0

