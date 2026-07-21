Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413DFC44532
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 14:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EF710EA51;
	Tue, 21 Jul 2026 14:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="d9IHIAx5";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077B410EA2E;
 Tue, 21 Jul 2026 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784643917;
 bh=1eKkYyoiwVAi75G0NBBFAzrkXjM9Yy8KlKj5YYJYw8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d9IHIAx570xmeJHSOv2kSkSeV74+4f4V25UQpp6eiGCzMjP0vKAPk2jKvl5aR0Whi
 Nss8RL5cub2tuiX9cgNMZcuwB8L4N7gjPelwGY3Rl6pjQbdsEXpR14srhf2n6PbRWb
 4opriVkZ+9PbNApzkYzW9hQsAHBCO/j8oc51gXOSMPc+1G0PN++U2/UV6dT94uPSQ2
 bDj1Qhig+XD7+6/bF3EAJS1xitEtGRXdMxRH2k2YGRhsoz24wyp6W9ilhE+fhdQMfQ
 hKJoQ4nmq04CCawv/6jMvCFFAxoVbxKmghTyDJe9zq1dNd7Ff77uZy7MO9rDffFhj+
 dwcvimyRzTuIg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 2/5] drm/xe/migrate: Support copying between sysmem and
 stolen
Date: Tue, 21 Jul 2026 16:26:13 +0200
Message-ID: <20260721142610.93804-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721142610.93804-7-dev@lankhorst.se>
References: <20260721142610.93804-7-dev@lankhorst.se>
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

Stolen memory is used on integrated devices to hold the
firmware framebuffer. In the next commit we want to copy
the framebuffer to normal system memory.

This requires treating stolen memory mostly as VRAM, but
without access to the identity mapping.

On discrete the identity mapping can be used, but we never
need to copy there, so just prohibit identity map on stolen.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4366c41bd3254..c05c64d5e196b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -518,14 +518,13 @@ int xe_migrate_init(struct xe_migrate *m)
 	if (err)
 		return err;
 
+	/* Somewhat arbitrary to avoid a huge amount of blits */
+	m->min_chunk_size = SZ_64K;
 	if (IS_DGFX(xe)) {
 		if (xe_migrate_needs_ccs_emit(xe))
 			/* min chunk size corresponds to 4K of CCS Metadata */
 			m->min_chunk_size = SZ_4K * SZ_64K /
 				xe_device_ccs_bytes(xe, SZ_64K);
-		else
-			/* Somewhat arbitrary to avoid a huge amount of blits */
-			m->min_chunk_size = SZ_64K;
 		m->min_chunk_size = roundup_pow_of_two(m->min_chunk_size);
 		drm_dbg(&xe->drm, "Migrate min chunk size is 0x%08llx\n",
 			(unsigned long long)m->min_chunk_size);
@@ -547,12 +546,20 @@ static u64 max_mem_transfer_per_pass(struct xe_device *xe)
 	return MAX_PREEMPTDISABLE_TRANSFER;
 }
 
+static bool is_devmem(u32 mem_type)
+{
+	if (mem_type_is_vram(mem_type) || mem_type == XE_PL_STOLEN)
+		return true;
+
+	return false;
+}
+
 static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_cursor *cur)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
 	u64 size = min_t(u64, max_mem_transfer_per_pass(xe), cur->remaining);
 
-	if (mem_type_is_vram(cur->mem_type)) {
+	if (is_devmem(cur->mem_type)) {
 		/*
 		 * VRAM we want to blit in chunks with sizes aligned to
 		 * min_chunk_size in order for the offset to CCS metadata to be
@@ -574,6 +581,10 @@ static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_cursor *cur)
 
 static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 {
+	/* Stolen only used by integrated, no VRAM or identity map there */
+	if (cur->mem_type == XE_PL_STOLEN)
+		return false;
+
 	/* If the chunk is not fragmented, allow identity map. */
 	return cur->size >= size;
 }
@@ -899,8 +910,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 	int err;
 	bool src_is_pltt = src->mem_type == XE_PL_TT;
 	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
-	bool src_is_vram = mem_type_is_vram(src->mem_type);
-	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
+	bool src_is_vram = is_devmem(src->mem_type);
+	bool dst_is_vram = is_devmem(dst->mem_type);
 	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
 	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
@@ -1597,7 +1608,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct ttm_resource *dst,
 				   u32 clear_flags)
 {
-	bool clear_vram = mem_type_is_vram(dst->mem_type);
+	bool clear_vram = is_devmem(dst->mem_type);
 	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
 	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
 	struct xe_gt *gt = m->tile->primary_gt;
-- 
2.53.0

