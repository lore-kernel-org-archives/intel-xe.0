Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40FFC001DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 19:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2C110E3BE;
	Tue, 18 Jul 2023 19:39:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66D10E3BE
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689709196; x=1721245196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qxcHinq1P9XluyUol8oE+2jceNlhQ5cg4ZZEhwXTwuQ=;
 b=ij/zVhCI+IR710QWq/aKn3Ze7OXmvBRxhIZGOEl52OkbSzG7Q0IzkwdL
 s6AleWUSCuGeNrZOsa9tF5o8quxs0UgUUktkjaIuuAd5cXYlIg4T5aAOc
 AD7gCiTS9yX295geBBr/wa+jwyMZo7C7Lsvk01fxyTvQLMyrM5mjrLhp2
 uHgkeU9KJ9Xa+vZ1qzQj4dU2bi5DBx9BkfXhXBVA97J/25nNNOMijvWMg
 KXno+PcNYceBqlMiG6VjYRsvFsBxwa1JEEV/Iwc1vB0LBaYAQRTIAOQdU
 uQoTbRiCtaLDiCPDC0ASBdw8+szPRLItzMkPsVCzi2x9UG5tmp3SqCygn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="368941492"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="368941492"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 12:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717726727"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="717726727"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 12:39:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 12:39:23 -0700
Message-Id: <20230718193924.3084759-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Normalize XE_VM_FLAG* names
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rename XE_VM_FLAGS_64K to XE_VM_FLAG_64K to follow the other names and
s/GT/TILE/ that got missed in commit 4e6715bd2a5e ("drm/xe: Move
migration from GT to tile").

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 8 ++++----
 drivers/gpu/drm/xe/xe_pt.c            | 4 ++--
 drivers/gpu/drm/xe/xe_vm.c            | 6 +++---
 drivers/gpu/drm/xe/xe_vm_types.h      | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index aedfb3dd559e..30e5fdf6ca63 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
 		  0xdeaddeadbeefbeef);
 	expected = xe_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0);
-	if (m->eng->vm->flags & XE_VM_FLAGS_64K)
+	if (m->eng->vm->flags & XE_VM_FLAG_64K)
 		expected |= XE_PTE_PS64;
 	if (xe_bo_is_vram(pt))
 		xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f17de52b51f9..2bb7d524af24 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -201,7 +201,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
 
-		if (vm->flags & XE_VM_FLAGS_64K)
+		if (vm->flags & XE_VM_FLAG_64K)
 			i += 16;
 		else
 			i += 1;
@@ -213,7 +213,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		/* Write out batch too */
 		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
 		for (i = 0; i < batch->size;
-		     i += vm->flags & XE_VM_FLAGS_64K ? XE_64K_PAGE_SIZE :
+		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
 		     XE_PAGE_SIZE) {
 			entry = xe_pte_encode(NULL, batch, i,
 					      XE_CACHE_WB, 0);
@@ -239,7 +239,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	for (level = 1; level < num_level; level++) {
 		u32 flags = 0;
 
-		if (vm->flags & XE_VM_FLAGS_64K && level == 1)
+		if (vm->flags & XE_VM_FLAG_64K && level == 1)
 			flags = XE_PDE_64K;
 
 		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
@@ -462,7 +462,7 @@ static void emit_pte(struct xe_migrate *m,
 			addr = xe_res_dma(cur) & PAGE_MASK;
 			if (is_vram) {
 				/* Is this a 64K PTE entry? */
-				if ((m->eng->vm->flags & XE_VM_FLAGS_64K) &&
+				if ((m->eng->vm->flags & XE_VM_FLAG_64K) &&
 				    !(cur_ofs & (16 * 8 - 1))) {
 					XE_WARN_ON(!IS_ALIGNED(addr, SZ_64K));
 					addr |= XE_PTE_PS64;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 00855681c0d5..851ea7c01b91 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -341,7 +341,7 @@ int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
 	 * platforms where 64K pages are needed for VRAM.
 	 */
 	flags = XE_BO_CREATE_PINNED_BIT;
-	if (vm->flags & XE_VM_FLAGS_64K)
+	if (vm->flags & XE_VM_FLAG_64K)
 		flags |= XE_BO_CREATE_SYSTEM_BIT;
 	else
 		flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
@@ -761,7 +761,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.va_curs_start = xe_vma_start(vma),
 		.vma = vma,
 		.wupd.entries = entries,
-		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) && is_vram,
+		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_vram,
 	};
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 91f11dfe9460..97f2c882050b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1244,11 +1244,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	drm_gpuva_manager_init(&vm->mgr, "Xe VM", 0, vm->size, 0, 0,
 			       &gpuva_ops, 0);
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
-		vm->flags |= XE_VM_FLAGS_64K;
+		vm->flags |= XE_VM_FLAG_64K;
 
 	for_each_tile(tile, xe, id) {
 		if (flags & XE_VM_FLAG_MIGRATION &&
-		    tile->id != XE_VM_FLAG_GT_ID(flags))
+		    tile->id != XE_VM_FLAG_TILE_ID(flags))
 			continue;
 
 		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
@@ -2128,7 +2128,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 {
 	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
-		XE_VM_FLAG_GT_ID(vm->flags) : 0;
+		XE_VM_FLAG_TILE_ID(vm->flags) : 0;
 
 	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
 	return &vm->pt_root[idx]->bo->ttm;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index edb3c99a9c81..223b8f84c546 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -143,14 +143,14 @@ struct xe_vm {
 	 * @flags: flags for this VM, statically setup a creation time aside
 	 * from XE_VM_FLAG_BANNED which requires vm->lock to set / read safely
 	 */
-#define XE_VM_FLAGS_64K			BIT(0)
+#define XE_VM_FLAG_64K			BIT(0)
 #define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
 #define XE_VM_FLAG_ASYNC_BIND_OPS	BIT(2)
 #define XE_VM_FLAG_MIGRATION		BIT(3)
 #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
 #define XE_VM_FLAG_FAULT_MODE		BIT(5)
 #define XE_VM_FLAG_BANNED		BIT(6)
-#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 7) & 0x3)
+#define XE_VM_FLAG_TILE_ID(flags)	(((flags) >> 7) & 0x3)
 #define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
 	unsigned long flags;
 
-- 
2.40.1

