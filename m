Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9BFC04FF6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 18:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD7C10F93A;
	Tue, 16 Apr 2024 18:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGZIayrF";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D253110F66B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 18:14:19 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so5841686e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 11:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713291257; x=1713896057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=li2fdtPkSzAXPoFgkykXkO0BBT/nD2a5gki4bwqqkew=;
 b=PGZIayrFBD53Zn2QaH+9sOTCczd3iaz89KMw/GgyT1RmoKotp/bXjve33sNsTiZZDp
 AB+YoFpGhpA1yoTzYtZ/cd6oeSlsxUO1lifL2XSHCgSFEFjgZDyzpr20X810Im0Wh3SP
 +xjcMPFmEPT5UKTMemExst0D0vfYWISes5LxWobzSGVmkPG1V+wg5AoTdV5iglE+rpKZ
 VG/3fbA73N4jSjfa2nbZGn5xRw5PhK05yD7/B62uYPnZKiRUnv7LnK2XgwdMI0ZHQnMz
 nxJKcGSLxArizR9o0l46pCVY4Eq7T2fyMur+kag8fUapr0VxstIRDhRMMvfXHPfpqr2V
 ia7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713291257; x=1713896057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=li2fdtPkSzAXPoFgkykXkO0BBT/nD2a5gki4bwqqkew=;
 b=Q6KydoBWZ9J8LVhmSWOHUIaqLKsWK3/APxNkOFH08M0h8bJ+a/XRFqJCxkCLK8qgky
 c0bYywvt6PVpUFvMdr1xW/5hVQfISRxzCyrn0yxoitKZI7+/j4z7RLRiTKgBgv2KJpio
 H24KvI7dA7NUxATfF0MHpvW5chWbR+7IUW2g6Px4U4zPvD7BPp76COE6dZ9XLAt4gCYW
 PQaBLa6hXZMssPYm/QNvhvqsQezcJA6s6U8KXtYGxWX/ULtDZgdT20X/P7Dk3+GufS02
 rxmLihN5iVgvT0KYCJ8NXzYAnJbbruSLLoxiT1bY4TQ5UY7tWy6u4i02Q0RRvgyexPeF
 BbXA==
X-Gm-Message-State: AOJu0Yy5AlR/lhgkAyKdbnQ/hMB5vKjJ7faSGQUBE3YpjIyl4QzLF0fq
 kYHx6zRgaBbZd4YvCgCRRVQc+Ug8VaqtBB/y7Qi/Zhdh5DD8zqSsmhoKcavcrXHPUQ==
X-Google-Smtp-Source: AGHT+IEBt+d2pKkGlFnRqKVrAi7Ond05m7hAj2WidX0v3mosV4udZxbthBM+acJACn+kf35aNwLP2w==
X-Received: by 2002:a05:6512:a88:b0:515:a8e0:bf3c with SMTP id
 m8-20020a0565120a8800b00515a8e0bf3cmr13020269lfu.32.1713291256986; 
 Tue, 16 Apr 2024 11:14:16 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 h21-20020ac25975000000b00513ed62b64dsm1675141lfp.301.2024.04.16.11.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 11:14:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 1/2] drm/xe/display: Unify DPT mapping
Date: Tue, 16 Apr 2024 21:14:05 +0300
Message-Id: <20240416181406.124125-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Unify writing of rotated, remapped and straight DPTs

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++----------------
 1 file changed, 51 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3a584bc3a0a3..5382d76e8cb9 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -13,66 +13,44 @@
 
 #include <drm/ttm/ttm_bo.h>
 
-static void
-write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
-		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
+static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map *map,
+				 u32 *ofs, u32 src_idx, struct xe_device *xe)
 {
-	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-	u32 column, row;
-
-	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
-	 * by writing dpt/ggtt in a different order?
-	 */
-
-	for (column = 0; column < width; column++) {
-		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
-
-		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
-
-			iosys_map_wr(map, *dpt_ofs, u64, pte);
-			*dpt_ofs += 8;
-			src_idx -= src_stride;
-		}
-
-		/* The DE ignores the PTEs for the padding tiles */
-		*dpt_ofs += (dst_stride - height) * 8;
-	}
-
-	/* Align to next page */
-	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
+	u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+					      xe->pat.idx[XE_CACHE_NONE]);
+	iosys_map_wr(map, *ofs, u64, pte);
+	*ofs += 8;
 }
 
-static void
-write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
-		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
-		   u32 dst_stride)
+static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
+		      const struct intel_remapped_plane_info *plane,
+		      enum i915_gtt_view_type type)
 {
 	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
-		= ggtt->pt_ops->pte_encode_bo;
-	u32 column, row;
-
-	for (row = 0; row < height; row++) {
-		u32 src_idx = src_stride * row + bo_ofs;
-
-		for (column = 0; column < width; column++) {
-			iosys_map_wr(map, *dpt_ofs, u64,
-				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-				     xe->pat.idx[XE_CACHE_NONE]));
-
-			*dpt_ofs += 8;
-			src_idx++;
+	const u32 dpt_even = (plane->dst_stride - (type == I915_GTT_VIEW_ROTATED
+			      ? plane->height : plane->width)) * 8;
+	u32 src_idx;
+
+	for (u32 row = 0; row < plane->height; ++row) {
+		for (u32 column = 0; column < plane->width; ++column) {
+			switch (type) {
+			case I915_GTT_VIEW_NORMAL:
+				src_idx = plane->offset + column;
+				break;
+			case I915_GTT_VIEW_REMAPPED:
+				src_idx = plane->offset +
+					row * plane->src_stride + column;
+				break;
+			case I915_GTT_VIEW_ROTATED:
+				src_idx = plane->offset + plane->src_stride *
+					(plane->height - 1 - row) + column;
+				break;
+			}
+			encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
 		}
-
-		/* The DE ignores the PTEs for the padding tiles */
-		*dpt_ofs += (dst_stride - width) * 8;
+		*dpt_ofs += dpt_even;
 	}
-
-	/* Align to next page */
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
@@ -82,19 +60,33 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 {
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
-	struct xe_ggtt *ggtt = tile0->mem.ggtt;
 	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
+	const struct intel_remapped_plane_info *plane;
+	u32 i, plane_count, dpt_ofs = 0;
+	struct intel_remapped_plane_info normal_plane;
 
-	if (view->type == I915_GTT_VIEW_NORMAL)
+	if (view->type == I915_GTT_VIEW_NORMAL) {
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
-	else if (view->type == I915_GTT_VIEW_REMAPPED)
-		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
+		normal_plane.offset = 0;
+		normal_plane.width = size / XE_PAGE_SIZE;
+		normal_plane.height = 1;
+		normal_plane.src_stride = size / XE_PAGE_SIZE;
+		normal_plane.dst_stride = size / XE_PAGE_SIZE;
+		plane = &normal_plane;
+		plane_count = 1;
+	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
+		dpt_size = ALIGN(intel_remapped_info_size(&view->remapped) * 8,
 				 XE_PAGE_SIZE);
-	else
+		plane = view->remapped.plane;
+		plane_count = ARRAY_SIZE(view->remapped.plane);
+	} else {
 		/* display uses 4K tiles instead of bytes here, convert to entries.. */
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
 				 XE_PAGE_SIZE);
+		plane = view->rotated.plane;
+		plane_count = ARRAY_SIZE(view->rotated.plane);
+	}
 
 	if (IS_DGFX(xe))
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
@@ -117,39 +109,8 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
-	if (view->type == I915_GTT_VIEW_NORMAL) {
-		u32 x;
-
-		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
-
-			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
-		}
-	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
-		const struct intel_remapped_info *remap_info = &view->remapped;
-		u32 i, dpt_ofs = 0;
-
-		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
-			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
-					   remap_info->plane[i].offset,
-					   remap_info->plane[i].width,
-					   remap_info->plane[i].height,
-					   remap_info->plane[i].src_stride,
-					   remap_info->plane[i].dst_stride);
-
-	} else {
-		const struct intel_rotation_info *rot_info = &view->rotated;
-		u32 i, dpt_ofs = 0;
-
-		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
-			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
-					  rot_info->plane[i].offset,
-					  rot_info->plane[i].width,
-					  rot_info->plane[i].height,
-					  rot_info->plane[i].src_stride,
-					  rot_info->plane[i].dst_stride);
-	}
+	for (i = 0; i < plane_count; i++)
+		write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], view->type);
 
 	vma->dpt = dpt;
 	vma->node = dpt->ggtt_node;
-- 
2.25.1

