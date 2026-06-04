Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85556CD6E6D
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 13:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAE111A0AB;
	Thu,  4 Jun 2026 13:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="o222syOp";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9F811A0AB
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780580701;
 bh=s6+Q0KDtOXDQxxGyBJ0mzhx5oo8nPjv5QdgsEzlr9fo=;
 h=From:To:Cc:Subject:Date:From;
 b=o222syOpoEZnYk7o6TuBouIhnI43O0IpRKxqa5MfPcNxOnBuJRYn+yeXXVBalivKl
 4rVc81e/10G3UCNR8kqtASi5vlBrdrZqJT2Fi1Zp8m+P0OkoJmHgfDPHKlrhQfv1TA
 kYDYt93OwfFTjOjCwT8h/VuMfnT5zD4hcr6evc62JerVGG2F78GVwc6iQqSNaVE8jn
 bvHSC65J9KL6mmKXpC797ioYJnhqCs0wKJPwrEKncmvgX3JeBvYKj6I8RW3tsR/de/
 58dwjzPBWJq95YFFD3eqe+wIATZvbOTckFwRLwK54w5WVKtX6ns2twBKmXulLWcUU0
 DTdRS6+xu6w4w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm/xe/ggtt: clear reserved areas at init runtime for !VFs
Date: Thu,  4 Jun 2026 15:45:01 +0200
Message-ID: <20260604134501.17302-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
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

When initialising GGTT, we never clear the part below wopcm,
or above GUC_GGTT_TOP.

Add a member to &xe_ggtt that holds the full GGTT size, and clear
both reserved areas during xe_ggtt_initial_clear.

Since by design those areas are reserved, do not check the
assertions for those areas.

Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 52 +++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477fc..cb54984e0c35e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -115,6 +115,8 @@ struct xe_ggtt {
 	u64 start;
 	/** @size: Total usable size of this GGTT */
 	u64 size;
+	/** @entire_size: complete size of the accessible GGTT, reserved regions inclusive */
+	u64 entire_size;
 	/**
 	 * @flags: Flags for this GGTT.
 	 * Acceptable flags:
@@ -235,11 +237,16 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 	return ggtt->size;
 }
 
-static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
+static void xe_ggtt_addr_checks(struct xe_ggtt *ggtt, u64 addr, u64 size)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, !(size & (XE_PAGE_SIZE - 1)));
+	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
+	xe_tile_assert(ggtt->tile, addr + size <= addr->start + ggtt->size);
+}
 
+static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
+{
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
 
@@ -251,13 +258,12 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
-	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_ggtt_addr_checks(ggtt, addr, XE_PAGE_SIZE);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
 
-static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size, bool out_of_range)
 {
 	u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), XE_CACHE_WB);
 	u64 end = start + size - 1;
@@ -265,6 +271,9 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 
 	xe_tile_assert(ggtt->tile, start < end);
 
+	if (!out_of_range)
+		xe_ggtt_addr_checks(ggtt, start, size);
+
 	if (ggtt->scratch)
 		scratch_pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
 			      ggtt->pt_ops->pte_encode_flags(ggtt->scratch,
@@ -396,6 +405,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
 	int err;
 
+	xe_tile_err(ggtt->tile, "wopcm size: %llx\n", wopcm);
 	if (!IS_SRIOV_VF(xe)) {
 		if (GRAPHICS_VERx100(xe) >= 1250)
 			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
@@ -406,7 +416,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 			return -ENOMEM;
 		}
 		ggtt_start = wopcm;
-		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
+		ggtt->entire_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE;
+		ggtt_size = ggtt->entire_size - ggtt_start;
 	} else {
 		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
 		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
@@ -417,6 +428,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 				    ggtt_start, ggtt_start + ggtt_size - 1);
 			return -ERANGE;
 		}
+		ggtt->entire_size = ggtt_size;
 	}
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
@@ -459,7 +471,19 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
-		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
+		xe_ggtt_clear(ggtt, ggtt->start + start, end - start, false);
+
+	if (!IS_SRIOV_VF(tile_to_xe(ggtt->tile))) {
+		start = ggtt->start;
+		end = ggtt->start + ggtt->size;
+
+		/* Clear reserved areas */
+		if (ggtt->entire_size > end)
+			xe_ggtt_clear(ggtt, end, ggtt->entire_size - end, true);
+
+		if (start)
+			xe_ggtt_clear(ggtt, 0, start, true);
+	}
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
@@ -478,7 +502,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 	mutex_lock(&ggtt->lock);
 	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
 	if (bound)
-		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
+		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node), false);
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
 	if (bound && node->invalidate_on_remove)
@@ -700,17 +724,23 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 		xe_assert(xe_bo_device(bo), bo->ttm.ttm);
 
 		for (xe_res_first_sg(xe_bo_sg(bo), 0, xe_bo_size(bo), &cur);
-		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
+		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE)) {
+			xe_ggtt_addr_checks(ggtt, end - cur.remaining, XE_PAGE_SIZE);
+
 			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
 						   pte | xe_res_dma(&cur));
+		}
 	} else {
 		/* Prepend GPU offset */
 		pte |= vram_region_gpu_offset(bo->ttm.resource);
 
 		for (xe_res_first(bo->ttm.resource, 0, xe_bo_size(bo), &cur);
-		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
+		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE)) {
+			xe_ggtt_addr_checks(ggtt, end - cur.remaining, XE_PAGE_SIZE);
+
 			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
 						   pte + cur.start);
+		}
 	}
 }
 
@@ -769,6 +799,8 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 	if (ret)
 		goto err_unlock;
 
+	xe_ggtt_addr_checks(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
+
 	if (transform)
 		transform(ggtt, node, pte_flags, ggtt->pt_ops->ggtt_set_pte, arg);
 	else
-- 
2.53.0

