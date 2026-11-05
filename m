Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB635606A328
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=hRtBPvs5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673D710EC60;
	Thu,  5 Nov 2026 16:13:58 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548DC10EAF7
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1793895229;
 bh=nqU41+FERfN23l3ZV5g7oDhXWiNErLZ/KhuLM56mD1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hRtBPvs5riV3pdc+GA3E+Z+ufOQKeKbdf6GgVMIdGXH6TUenv47+Ignxm1r77m8b6
 kXPSxdvvDgOPvTsPEu/WgKL12F38oStk+MkCB3L/K5bLIVrZs364FWvMIeIBSyp27c
 DQcsCNVKTPCbDkWNJhzdYvGGIKFZh/v+PJcmTa1I8Uc94s3wdv2GjqjPxVJThr+/i0
 +e8rLio9BNpO5/4o9H1Uzv1MnRPcBgut0OUPBkfIItSE+Vb8B75vFHP7ztDQv7bz/P
 m2m3AhzWOXBpJMHYVX8V4Fploz4aUWS1I26r3QhONtqwir8J5qZGAimB185inj2AQT
 SJ19aD+qz0H4g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>, Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v4 2/5] drm/xe/migrate: Support copying between sysmem and
 stolen
Date: Thu,  5 Nov 2026 17:14:47 +0100
Message-ID: <20261105161444.593259-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105161444.593259-7-dev@lankhorst.se>
References: <20261105161444.593259-7-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In order to copy out the stolen BO, we have to add some support to
xe_migrate_copy, since otherwise it tries to use the VRAM identity
mapping on integrated, which obviously doesn't do the right thing.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 19c37eb315893..027a2c9a0a286 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -907,6 +907,7 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 
 #define PTE_UPDATE_FLAG_IS_VRAM		BIT(0)
 #define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
+#define PTE_UPDATE_FLAG_ALLOW_IDENTITY	BIT(2)
 
 static u32 pte_update_size(struct xe_migrate *m,
 			   u32 flags,
@@ -918,9 +919,10 @@ static u32 pte_update_size(struct xe_migrate *m,
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
@@ -1206,6 +1208,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
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
@@ -1226,8 +1236,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
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
@@ -1287,6 +1297,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 
 		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
 		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
+		pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
 		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
@@ -1294,6 +1305,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 			dst_L0_ofs = src_L0_ofs;
 		} else {
 			pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+			pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
 			batch_size += pte_update_size(m, pte_flags, dst,
 						      &dst_it, &src_L0,
 						      &dst_L0_ofs, &dst_L0_pt,
@@ -1320,13 +1332,13 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
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
@@ -1739,7 +1751,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
 
 	while (size) {
-		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
+		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM | PTE_UPDATE_FLAG_ALLOW_IDENTITY;
 		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
@@ -1927,7 +1939,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct ttm_resource *dst,
 				   u32 clear_flags)
 {
-	bool clear_vram = mem_type_is_vram(dst->mem_type);
+	bool clear_vram = is_devmem(bo, dst);
 	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
 	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
 	struct xe_gt *gt = m->tile->primary_gt;
@@ -1967,6 +1979,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		/* Calculate final sizes and batch size.. */
 		pte_flags = clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+		pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
 		batch_size = 1 +
 			pte_update_size(m, pte_flags, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
@@ -1989,7 +2002,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		size -= clear_L0;
 		/* Preemption is enabled again by the ring ops. */
-		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
+		if (clear_vram && IS_DGFX(xe) && xe_migrate_allow_identity(clear_L0, &src_it)) {
 			xe_res_next(&src_it, clear_L0);
 		} else {
 			emit_pte(m, bb, clear_L0_pt, clear_vram,
-- 
2.55.0

