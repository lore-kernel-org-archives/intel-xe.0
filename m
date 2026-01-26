Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F102CF65FF
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 12:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2302110E21E;
	Mon, 26 Jan 2026 12:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="WbalJRIM";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B506310E414
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769431930;
 bh=gs8CueRCbaoeZTDPavlA9uEYM3WuVlf/Dr+wFnjVqI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WbalJRIMfEbUjgXlmHfIDNthUw5UJsFB0HISeAmDtjOcDkpa4/IXN0JeYHUIxQKzt
 /MeJp4yi4eAWLklDpf4a2pkTfNPMa8C+1BwnUCKf3M+mxUooksCp2CBOcV6GkJG9k9
 blOXX0QXNPqaN3dnpf0oiuRpEuIXKilD4qkdVCj44fn8r1MG+JNIGKsrOHeQP0eN/P
 f5ExVeS+ffEukOAX7HuKq7GD257mgD2XGKVKhrI/CQfG/cKYJ+rNXSjZPZsi3YhOgw
 c5gPEaxjaVazEtr9Pa8+Fo31APaqhEb8ruQFH4r6bx+fM+UHzTyokApdj26kI1+W04
 1TE9bB34qwmZg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 1/3] drm/xe: Force page fault
Date: Mon, 26 Jan 2026 13:52:05 +0100
Message-ID: <20260126125207.1119351-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126125207.1119351-1-dev@lankhorst.se>
References: <20260126125207.1119351-1-dev@lankhorst.se>
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

In order to support ATS, the PTE's marked as inaccessible should
explicitly have the FORCE_PAGE_FAULT flag set.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
 drivers/gpu/drm/xe/xe_migrate.c       |  3 +++
 drivers/gpu/drm/xe/xe_pt.c            | 36 +++++++++++++++------------
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 4d83461e538b1..b680932e3a3e0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -34,5 +34,6 @@
 
 #define XE_PAGE_PRESENT			BIT_ULL(0)
 #define XE_PAGE_RW			BIT_ULL(1)
+#define XE_PAGE_FORCE_FAULT             BIT_ULL(2)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6e202428aac2f..cbcac57b2c760 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -215,6 +215,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	for (i = 0; i < xe_bo_size(bo); i += 8)
+		xe_map_wr(xe, &bo->vmap, i, u64, XE_PAGE_FORCE_FAULT);
+
 	/* PT30 & PT31 reserved for 2M identity map */
 	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
 	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6703a70492275..d2d272af51ae0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -66,7 +66,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 	u8 id = tile->id;
 
 	if (!xe_vm_has_scratch(vm))
-		return 0;
+		return XE_PAGE_FORCE_FAULT;
 
 	if (level > MAX_HUGEPTE_LEVEL)
 		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
@@ -167,17 +167,9 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 	u64 empty;
 	int i;
 
-	if (!xe_vm_has_scratch(vm)) {
-		/*
-		 * FIXME: Some memory is allocated already allocated to zero?
-		 * Find out which memory that is and avoid this memset...
-		 */
-		xe_map_memset(vm->xe, map, 0, 0, SZ_4K);
-	} else {
-		empty = __xe_pt_empty_pte(tile, vm, pt->level);
-		for (i = 0; i < XE_PDES; i++)
-			xe_pt_write(vm->xe, map, i, empty);
-	}
+	empty = __xe_pt_empty_pte(tile, vm, pt->level);
+	for (i = 0; i < XE_PDES; i++)
+		xe_pt_write(vm->xe, map, i, empty);
 }
 
 /**
@@ -539,7 +531,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
 		if (xe_walk->clear_pt) {
-			pte = 0;
+			pte = XE_PAGE_FORCE_FAULT;
 		} else {
 			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
 							 xe_res_dma(curs) +
@@ -873,9 +865,21 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	 */
 	if (xe_pt_nonshared_offsets(addr, next, --level, walk, action, &offset,
 				    &end_offset)) {
-		xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
-			      offset * sizeof(u64), 0,
-			      (end_offset - offset) * sizeof(u64));
+		struct iosys_map *map = &xe_child->bo->vmap;
+		struct xe_device *xe = tile_to_xe(xe_walk->tile);
+
+		/*
+		 * Write only the low dword in 32-bit case to avoid potential
+		 * issues with the high dword being non-atomically written first
+		 * resulting in an out-of-bounds address with the present
+		 * bit set.
+		 */
+		for (; offset < end_offset; offset++) {
+			if (IS_ENABLED(CONFIG_64BIT))
+				xe_map_wr(xe, map, offset * sizeof(u64), u64, XE_PAGE_FORCE_FAULT);
+			else
+				xe_map_wr(xe, map, offset * sizeof(u64), u32, XE_PAGE_FORCE_FAULT);
+		}
 		xe_walk->needs_invalidate = true;
 	}
 
-- 
2.51.0

