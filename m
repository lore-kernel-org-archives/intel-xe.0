Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B1FC44510
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6ECF10EFCF;
	Wed, 15 Jul 2026 11:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="O0q2kEPI";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB34E10EFC3;
 Wed, 15 Jul 2026 11:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784113509;
 bh=M4118sCtzF0TKAWBOI/0RGOW+RtUnQrhgULc6L1L9gk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O0q2kEPI+TFsJOQiOtWEFi/iUzVeOkguPZ6WZcDT2ui4i6oPz4rpkRWdYvAfZ5ljr
 zfuqh8uSHYPt0i6X6NTKWznVH79eIBFWhKcH0kzxvn22moeGE0Lk63S0k7sGSNQnbT
 uE79y3adBTxtX1ujZEvcWQwJMuZAxPzO3pHVEB7pc4MK0xDDgnbimWkbZWpU5R017x
 cXq95ppkBRcUaYczz+rFmfXzMSDZbDfJnHTwH2thM8HjzzKcKSwlv37BMfhV/ZWG15
 z28jul9KVF9Ezu4V3C9NAptUmPCFw+pk33XaM4Hi3nGV5FBvoY9dec54kjmUfj+YmU
 qQG6aKX9KX+zA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 3/6] drm/xe/display: Reserve the original GGTT space before
 creating a bo
Date: Wed, 15 Jul 2026 13:05:54 +0200
Message-ID: <20260715110557.2172095-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715110557.2172095-1-dev@lankhorst.se>
References: <20260715110557.2172095-1-dev@lankhorst.se>
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

Annotate the original area of the framebuffer as reserved in the GGTT
before creating a new GGTT entry. This allows us to remove the
range restrictions of GGTT in xe_bo_create_pin_map_at_novm().

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b73036d03..f49dda8e28255 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -37,6 +37,25 @@ static bool need_pte_local(struct xe_device *xe)
 	return IS_DGFX(xe) || has_lmembar(xe);
 }
 
+static struct xe_ggtt_node *reserve_original_node(struct xe_ggtt *ggtt, u32 base, u32 size, u64 page_size)
+{
+	u64 ggtt_start = xe_ggtt_start(ggtt), ggtt_end = ggtt_start + xe_ggtt_size(ggtt);
+
+	/* Completely truncated? */
+	if (base + size <= ggtt_start || base >= ggtt_end)
+		return NULL;
+
+	/* Partially truncated? */
+	if (base <= ggtt_start) {
+		size -= ggtt_start - base;
+		base = ggtt_start;
+	} else if (base + size >= ggtt_end) {
+		size = ggtt_end - base;
+	}
+
+	return xe_ggtt_insert_node_at(ggtt, size, page_size, base, base + size);
+}
+
 static struct xe_bo *
 initial_plane_bo(struct xe_device *xe,
 		 struct intel_initial_plane_config *plane_config)
@@ -46,6 +65,7 @@ initial_plane_bo(struct xe_device *xe,
 	resource_size_t phys_base;
 	u32 base, size, flags;
 	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	struct xe_ggtt_node *original_ggtt_node;
 
 	if (plane_config->size == 0)
 		return NULL;
@@ -111,8 +131,15 @@ initial_plane_bo(struct xe_device *xe,
 		}
 	}
 
+	original_ggtt_node = reserve_original_node(tile0->mem.ggtt, base, size, page_size);
+	if (IS_ERR(original_ggtt_node))
+		return NULL;
+
 	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
 					  ttm_bo_type_kernel, flags, 0, false);
+	if (original_ggtt_node)
+		xe_ggtt_node_remove_noclear(original_ggtt_node);
+
 	if (IS_ERR(bo)) {
 		drm_dbg_kms(&xe->drm,
 			    "Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
-- 
2.53.0

