Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D368CC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 19:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9070210E1AF;
	Tue, 21 Jul 2026 19:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="PF7DnmFq";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9EC10E10A;
 Tue, 21 Jul 2026 19:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784661884;
 bh=HNp83KGVhlodKF6lgvlf3bCEsTDEAY8pZTSSU67ZRrc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PF7DnmFqJ6PpoPkQTgEMBkNVhXl848W45Jl1rZe9IwklAe63ceoNXc1SU4VOuklMA
 P9Q+NZ4UU616srH+zFRxl0BkgBOdWJQubxgVeftO4ZEgpKNzBmPnzjVaBp9BlNe47t
 26Owvc3EAfxD6EDQUOxvZStxgvT8hddJyD66s0y6pjjEWRhkI/YSbEGGLsr20fRjBj
 A2HUteFrnDJqHIc8hZ8fp4kNQ4BVUEi6wko768Vl/zgwEwaqvPHQfKG0A8qwpCm6gS
 uLeBFQKpQfbGXJ1D39bGODgR2ZfsMkGQswKJW6Mzf0EfjJ8d9FSbj5Z/OX5iwp7iFh
 c9H1VxHx++ojw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe/migrate: Support copying between sysmem and stolen
Date: Tue, 21 Jul 2026 21:25:41 +0200
Message-ID: <20260721192540.115548-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721142610.93804-9-dev@lankhorst.se>
References: <20260721142610.93804-9-dev@lankhorst.se>
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
 drivers/gpu/drm/xe/xe_migrate.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4366c41bd3254..505d105472fca 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -574,6 +574,10 @@ static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_cursor *cur)
 
 static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 {
+	/* Stolen only used by integrated, no VRAM or identity map there */
+	if (cur->mem_type == XE_PL_STOLEN)
+		return false;
+
 	/* If the chunk is not fragmented, allow identity map. */
 	return cur->size >= size;
 }
@@ -879,6 +883,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	return flush_flags;
 }
 
+static bool is_devmem(u32 mem_type)
+{
+	if (mem_type_is_vram(mem_type) || mem_type == XE_PL_STOLEN)
+		return true;
+
+	return false;
+}
+
 static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 					   struct xe_bo *src_bo,
 					   struct xe_bo *dst_bo,
@@ -899,8 +911,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
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
@@ -1597,7 +1609,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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

