Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD00606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=KZnQNlw2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250C310F797;
	Tue, 17 Nov 2026 14:29:43 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8125D10F798;
 Tue, 17 Nov 2026 14:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794925769;
 bh=jcSlj3Y7LgaV5hdx0L8fbaX98oeE5ltVxEn3uBvEUBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KZnQNlw2VoT9T9qiURhnW0tcxKkBcSQ1Zn/a/RB0YkBbjH0FBLjpX+Zl08YNvATA+
 KSExIGiBruG8t6arWPIiGw2SIp2kXpmRoBTvNxiL9YsptBvhawh8bx3A8JfsKzg67I
 EpPDKLEP7v44OgTpLWIPi/OfIwk3RN3dMgP7oBVNYa5RJs2oIgwtSj+MoFVh06E7Zz
 TEHqCiabxZ+3ZFDbZig95qWj7VUvl+NyrnLyolIoDX0lgnG+mB21ZnNGnTIoUwqeRK
 lzXeU1xdSmGy5iy3j7c9VSVIxyLn/xGyF4dysKL/2uK1hQeuU9zCZvwLVLaKLDna8Q
 UgHZjDsv7oIAA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 2/5] drm/xe/migrate: Support copying between sysmem and
 stolen
Date: Tue, 17 Nov 2026 15:30:41 +0100
Message-ID: <20261117143038.479557-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117143038.479557-7-dev@lankhorst.se>
References: <20261117143038.479557-7-dev@lankhorst.se>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In order to copy out the stolen BO, we have to add some support to
xe_migrate_copy, since otherwise it tries to use the VRAM identity
mapping on integrated, which obviously doesn't do the right thing.

For debugging and completeness, allow clears in stolen memory as well.
This makes it silghtly easier to test that the copy is correctly done.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c | 54 ++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 102c96d6cea9a..d7a8d8ecffe63 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -44,6 +44,7 @@
 #include "xe_svm.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
+#include "xe_ttm_stolen_mgr.h"
 #include "xe_validation.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
@@ -943,6 +944,10 @@ static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_cursor *cur)
 
 static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 {
+	/* Stolen is not mapped into identity mapping */
+	if (cur->mem_type == XE_PL_STOLEN)
+		return false;
+
 	/* If the chunk is not fragmented, allow identity map. */
 	return cur->size >= size;
 }
@@ -1024,26 +1029,23 @@ static void emit_pte(struct xe_migrate *m,
 
 		while (chunk--) {
 			u64 addr, flags = 0;
-			bool devmem = false;
 
 			addr = xe_res_dma(cur) & PAGE_MASK;
-			if (is_vram) {
-				if (vm->flags & XE_VM_FLAG_64K) {
-					u64 va = cur_ofs * XE_PAGE_SIZE / 8;
+			/* Stolen sysmem also needs gpu offset */
+			addr += vram_region_gpu_offset(res);
 
-					xe_assert(xe, (va & (SZ_64K - 1)) ==
-						  (addr & (SZ_64K - 1)));
+			if (is_vram && vm->flags & XE_VM_FLAG_64K) {
+				u64 va = cur_ofs * XE_PAGE_SIZE / 8;
 
-					flags |= XE_PTE_PS64;
-				}
+				xe_assert(xe, (va & (SZ_64K - 1)) ==
+					  (addr & (SZ_64K - 1)));
 
-				addr += vram_region_gpu_offset(res);
-				devmem = true;
+				flags |= XE_PTE_PS64;
 			}
 
 			addr = vm->pt_ops->pte_encode_addr(m->tile->xe,
 							   addr, pat_index,
-							   0, devmem, flags);
+							   0, is_vram, flags);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
@@ -1248,6 +1250,24 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	return flush_flags;
 }
 
+static bool is_devmem(struct xe_bo *bo, struct ttm_resource *res)
+{
+	if (mem_type_is_vram(res->mem_type))
+		return true;
+
+	/*
+	 * Stolen is only device memory on newer platforms.
+	 *
+	 * On older platforms where stolen is mapped to GGTT,
+	 * it is mapped as system memory.
+	 */
+	if (res->mem_type != XE_PL_STOLEN ||
+	    xe_ttm_stolen_cpu_access_needs_ggtt(xe_bo_device(bo)))
+		return false;
+
+	return true;
+}
+
 static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 					   struct xe_bo *src_bo,
 					   struct xe_bo *dst_bo,
@@ -1268,8 +1288,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
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
@@ -1292,11 +1312,11 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 	if (src_bo != dst_bo && XE_WARN_ON(xe_bo_size(src_bo) != xe_bo_size(dst_bo)))
 		return ERR_PTR(-EINVAL);
 
-	if (!src_is_vram)
+	if (!src_is_vram && src->mem_type != XE_PL_STOLEN)
 		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
 	else
 		xe_res_first(src, 0, size, &src_it);
-	if (!dst_is_vram)
+	if (!dst_is_vram && dst->mem_type != XE_PL_STOLEN)
 		xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &dst_it);
 	else
 		xe_res_first(dst, 0, size, &dst_it);
@@ -1969,7 +1989,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct ttm_resource *dst,
 				   u32 clear_flags)
 {
-	bool clear_vram = mem_type_is_vram(dst->mem_type);
+	bool clear_vram = is_devmem(bo, dst);
 	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
 	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
 	struct xe_gt *gt = m->tile->primary_gt;
@@ -1987,7 +2007,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
 		clear_only_system_ccs = true;
 
-	if (!clear_vram)
+	if (!clear_vram && dst->mem_type != XE_PL_STOLEN)
 		xe_res_first_sg(xe_bo_sg(bo), 0, xe_bo_size(bo), &src_it);
 	else
 		xe_res_first(src, 0, xe_bo_size(bo), &src_it);
-- 
2.55.0

