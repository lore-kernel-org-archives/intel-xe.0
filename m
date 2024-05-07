Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC4CC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 17:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB9310F6C7;
	Tue,  7 May 2024 17:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T0J1qvrb";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F341F10F6C7
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 17:35:43 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51f3761c96aso4443779e87.3
 for <intel-xe@lists.freedesktop.org>; Tue, 07 May 2024 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715103342; x=1715708142; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SWYnIsjtsTYLO05+RXirZDTPE7/7GMsTt/qh6Ig2NmQ=;
 b=T0J1qvrbE7TLPfAF0iw1+e2Run9/6su4qiunM1g/JmgmPSvu5TOg8lZV/UZqzCVmH1
 w0hZefX+iLlyFsf9js3c4rrnSeKQPvsBXpFKD56bYFyDllte0A6tX8awCt11MnV3eZ3j
 g3DhdQqTQBeD4AdzyM8rmJTo+q9cEcHCC2zUd5MFxXtiFndxqbvuKTg+t4VVLtxltc4w
 3Q/O98O6YJ6X/W5QUKT9U/Kx1PRgz18bSeQSVhNPYTKs9FDmtrYb9tKzPwK4aUzhLYrx
 Qm4/jgnsGPrH3tlmcbV6JCMn5RyvUoEu1Z1i3nIgO90wkn/CDvjccx19GtUdsECTqP4Q
 SJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715103342; x=1715708142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SWYnIsjtsTYLO05+RXirZDTPE7/7GMsTt/qh6Ig2NmQ=;
 b=M9d3Cx4YdpsayxuIfrct5OeDPshWnhj5DwvLKG5230FkDAT+2h0GJRQck05dNtJrH5
 yPeaQkttbPom0sjy+bG9Y5Up4PJKxQ/PovDYlpwIplmszmw+2MsGQSLNn8mfIN7AxMOo
 Qw6cjvfn4ozEivbXqJ7Y5D9oMleFxP079d7M0J281C6MlUUBZGq+9T+mgv8cpAMNBggw
 3sJZ3hm9WjNG9j6RydWPpt7/bLqeA5MkDfboKWmsI8qmehWMUNcfZ1LtmglsEePYJ+T/
 hgd7TFbKSjO6Hi8YfAWi9kG1NOrDRx3JJGvrZZkEd7WPEciRXIqKE1kiZZktAw+x+AFG
 xb8A==
X-Gm-Message-State: AOJu0Yws28XEmPsXfpQNMSkhnfbLtDvQABbPCZd3Mcb9mpOz97cFNIl6
 3/LGJo3vWabwfYjCxyeYBsfCKv8xMgu+KuEi1fOjeH5icxrQyhFlWE8++7aXqMS9WA==
X-Google-Smtp-Source: AGHT+IEp2zGcvM1KyMkUYols7knK8+IR19hD/D/f+jmwBVhzkGK9gv9ee3jqeQh2WAwWrfRWfN7C/w==
X-Received: by 2002:ac2:5976:0:b0:51d:34bb:3c6c with SMTP id
 2adb3069b0e04-5217c66b396mr140071e87.31.1715103341239; 
 Tue, 07 May 2024 10:35:41 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z7-20020ac25de7000000b0051d54e7a40fsm2201709lfq.301.2024.05.07.10.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 10:35:40 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 1/2] drm/xe/display: Unify DPT mapping
Date: Tue,  7 May 2024 20:35:39 +0300
Message-Id: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
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
index 3e1ae37c4c8b..bdb0dac5600e 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -14,66 +14,44 @@
 
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
 
@@ -83,19 +61,33 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
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
@@ -118,39 +110,8 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
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
2.43.2

