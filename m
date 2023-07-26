Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A6FC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C011A10E49E;
	Wed, 26 Jul 2023 16:10:15 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E33410E4A0
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387799; x=1721923799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUh07eqkmQ+tcQoPpsqfBswiYcjqxN3bxcHwOnHzNZc=;
 b=LF7nEiC33zcufuQR1nMHYFglNb8aDF5ebtoEQuFIkoCR9nSfDRPBx9F4
 IiFtLLnowG+IWpipdBfw/ThXgjZhehrPtolKvCK83so7fAJpX2geT+Obl
 n+pDQfQO8iOYmjSZSU4bxXCq2sus7YxaOKRohD2G9AvjTIKiJ6e44SLZa
 vDY1IBrQkA9/s+1mJ01fxlmJeWUgmD1bv4ZH7GprW665VJFnO9GaZxxYk
 m6OnF6kSuRWuEn4y9Oi7Qenr8Ahl1qecU5VVjL5jdtFi94QsBi3ZGevSl
 phC8pOK3uj1YYgegu2qdjE+iHaEbcMj8bdOwSV00NpcR+jNgKmeMAslpC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994900"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994900"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279368"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279368"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:04 -0700
Message-Id: <20230726160708.3967790-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/10] drm/xe: Set PTE_DM bit for stolen on MTL
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Integrated graphics 1270 and beyond should set the PTE_LM bit in the PTE
when it's stolen memory. Add a new function, xe_bo_is_stolen_devmem(),
and use it when encoding the PTE.

In some places in the spec the PTE bit is called "Local Memory",
abbreviated as LM, and in others it's called "Device Memory" (DM). Since
we moved away from "Local Memory" and preferred the "vram" terminology,
also rename the macros as DM to follow the name of the new function.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h      |  5 +++--
 drivers/gpu/drm/xe/xe_ggtt.c    |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_pt.c      | 13 +++++++------
 5 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 29813271cc4c..a34a9248ed5c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -80,6 +80,21 @@ bool xe_bo_is_stolen(struct xe_bo *bo)
 	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
 }
 
+/**
+ * xe_bo_is_stolen_devmem - check if BO is of stolen type accessed via PCI BAR
+ * @bo: The BO
+ *
+ * The stolen memory is accessed through the PCI BAR for both DGFX and some
+ * integrated platforms that have a dedicated bit in the PTE for devmem (DM).
+ *
+ * Returns: true if it's stolen memory accessed via PCI BAR, false otherwise.
+ */
+bool xe_bo_is_stolen_devmem(struct xe_bo *bo)
+{
+	return xe_bo_is_stolen(bo) &&
+		GRAPHICS_VERx100(xe_bo_device(bo)) >= 1270;
+}
+
 static bool xe_bo_is_user(struct xe_bo *bo)
 {
 	return bo->flags & XE_BO_CREATE_USER_BIT;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 894ea0deb34b..b29750a47d23 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -58,9 +58,9 @@
 #define XE_PDPE_PS_1G			BIT_ULL(7)
 #define XE_PDE_IPS_64K			BIT_ULL(11)
 
-#define XE_GGTT_PTE_LM			BIT_ULL(1)
+#define XE_GGTT_PTE_DM			BIT_ULL(1)
 #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
-#define XE_PPGTT_PTE_LM			BIT_ULL(11)
+#define XE_PPGTT_PTE_DM			BIT_ULL(11)
 #define XE_PDE_64K			BIT_ULL(6)
 #define XE_PTE_PS64			BIT_ULL(8)
 #define XE_PTE_NULL			BIT_ULL(9)
@@ -230,6 +230,7 @@ void xe_bo_vunmap(struct xe_bo *bo);
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
+bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
 uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f57dd8703d93..9b6bff724613 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -35,8 +35,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pte |= XE_PAGE_PRESENT;
 
-	if (xe_bo_is_vram(bo))
-		pte |= XE_GGTT_PTE_LM;
+	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
+		pte |= XE_GGTT_PTE_DM;
 
 	/* FIXME: vfunc + pass in caching rules */
 	if (xe->info.platform == XE_METEORLAKE) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2a4b22c3a024..aad76a6a8094 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -258,7 +258,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
 		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
-			XE_PPGTT_PTE_LM | XE_PDPE_PS_1G;
+			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
 
 		/*
 		 * Use 1GB pages, it shouldn't matter the physical amount of
@@ -463,7 +463,7 @@ static void emit_pte(struct xe_migrate *m,
 				}
 
 				addr += vram_region_gpu_offset(bo->ttm.resource);
-				addr |= XE_PPGTT_PTE_LM;
+				addr |= XE_PPGTT_PTE_DM;
 			}
 			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
 			bb->cs[bb->len++] = lower_32_bits(addr);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 38ccc96c4584..debfe6860c28 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -127,8 +127,8 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
 	u64 pte;
 
 	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
-	if (xe_bo_is_vram(bo))
-		pte |= XE_PPGTT_PTE_LM;
+	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
+		pte |= XE_PPGTT_PTE_DM;
 
 	return __pte_encode(pte, cache, NULL, pt_level);
 }
@@ -714,7 +714,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
-	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
+	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
+		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
 		.base = {
@@ -728,13 +729,13 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.va_curs_start = xe_vma_start(vma),
 		.vma = vma,
 		.wupd.entries = entries,
-		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_vram,
+		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
 	};
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
-	if (is_vram) {
-		xe_walk.default_pte = XE_PPGTT_PTE_LM;
+	if (is_devmem) {
+		xe_walk.default_pte = XE_PPGTT_PTE_DM;
 		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
-- 
2.40.1

