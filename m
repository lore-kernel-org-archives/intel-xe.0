Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781B8C4452D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225C010E9ED;
	Mon, 20 Jul 2026 16:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="gyuX92b9";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B621710E9E4;
 Mon, 20 Jul 2026 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564044;
 bh=mzi6cWVLEBT43NyHEtv0X8besFmDHztVCcBjVO5rpYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gyuX92b9i8jCxJw2LejGA803IPmP5Pi/SK0BXuPy/hZqkg9EeVAPfmy2g8VSf1aEV
 eDUbs9X4k5zsR4QMww+2s5Job+UU+Fc/sEGLlzh//D/6qxRUULhMdV981TEtjNBKLr
 3T++kwr+RSZxaBACrfpPJwwgGPGMkPwqpG00gYH+8B7L0qxVnLZa5umWKeDt05o9ya
 0xsnzmtZzAHNGP/jGKKjGJ35Tr5+aY3t6HNfpSVy+MhAIKsEXS9/T7HvnGyjVuGVif
 rfo0oTXUodx5p14kCY3ft/yzueOcNCF+g6seRkh0bsAXDZw+dVFpMOi2rUf3iXozom
 gSZI/GbFSvuBg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 08/11] drm/xe/migrate: Support copying between sysmem and
 stolen
Date: Mon, 20 Jul 2026 18:15:00 +0200
Message-ID: <20260720161451.384968-21-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
References: <20260720161451.384968-13-dev@lankhorst.se>
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

In order to copy out the stolen BO, we have to add some support to
xe_migrate_copy, since otherwise it tries to use the VRAM identity
mapping on integrated, which obviously doesn't do the right thing.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c84e14e86a823..b346e743025b7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -559,6 +559,7 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 
 #define PTE_UPDATE_FLAG_IS_VRAM		BIT(0)
 #define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
+#define PTE_UPDATE_FLAG_ALLOW_IDENTITY	BIT(2)
 
 static u32 pte_update_size(struct xe_migrate *m,
 			   u32 flags,
@@ -570,9 +571,10 @@ static u32 pte_update_size(struct xe_migrate *m,
 	u32 cmds = 0;
 	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
 	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
+	bool allow_identity = PTE_UPDATE_FLAG_ALLOW_IDENTITY & flags;
 
 	*L0_pt = pt_ofs;
-	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
+	if (is_vram && allow_identity && xe_migrate_allow_identity(*L0, cur)) {
 		/* Offset into identity map. */
 		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
 					      cur->start + vram_region_gpu_offset(res),
@@ -858,6 +860,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	return flush_flags;
 }
 
+static bool is_devmem(struct xe_bo *bo, struct ttm_resource *res)
+{
+	if (mem_type_is_vram(res->mem_type) || res->mem_type == XE_PL_STOLEN)
+		return true;
+
+	return false;
+}
+
 static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 					   struct xe_bo *src_bo,
 					   struct xe_bo *dst_bo,
@@ -878,8 +888,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 	int err;
 	bool src_is_pltt = src->mem_type == XE_PL_TT;
 	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
-	bool src_is_vram = mem_type_is_vram(src->mem_type);
-	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
+	bool src_is_vram = is_devmem(src_bo, src);
+	bool dst_is_vram = is_devmem(dst_bo, dst);
 	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
 	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
@@ -939,6 +949,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 
 		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
 		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
+		pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
 		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
@@ -946,6 +957,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 			dst_L0_ofs = src_L0_ofs;
 		} else {
 			pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+			pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
 			batch_size += pte_update_size(m, pte_flags, dst,
 						      &dst_it, &src_L0,
 						      &dst_L0_ofs, &dst_L0_pt,
@@ -972,13 +984,13 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 			goto err_sync;
 		}
 
-		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
+		if (src_is_vram && IS_DGFX(xe) && xe_migrate_allow_identity(src_L0, &src_it))
 			xe_res_next(&src_it, src_L0);
 		else
 			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs || use_comp_pat,
 				 &src_it, src_L0, src);
 
-		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
+		if (dst_is_vram && IS_DGFX(xe) && xe_migrate_allow_identity(src_L0, &dst_it))
 			xe_res_next(&dst_it, src_L0);
 		else if (!copy_only_ccs)
 			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
@@ -1386,7 +1398,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
 
 	while (size) {
-		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
+		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM | PTE_UPDATE_FLAG_ALLOW_IDENTITY;
 		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
@@ -1576,7 +1588,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct ttm_resource *dst,
 				   u32 clear_flags)
 {
-	bool clear_vram = mem_type_is_vram(dst->mem_type);
+	bool clear_vram = is_devmem(bo, dst);
 	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
 	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
 	struct xe_gt *gt = m->tile->primary_gt;
@@ -1616,6 +1628,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		/* Calculate final sizes and batch size.. */
 		pte_flags = clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+		pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
 		batch_size = 1 +
 			pte_update_size(m, pte_flags, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
@@ -1638,7 +1651,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		size -= clear_L0;
 		/* Preemption is enabled again by the ring ops. */
-		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
+		if (clear_vram && IS_DGFX(xe) && xe_migrate_allow_identity(clear_L0, &src_it)) {
 			xe_res_next(&src_it, clear_L0);
 		} else {
 			emit_pte(m, bb, clear_L0_pt, clear_vram,
-- 
2.53.0

