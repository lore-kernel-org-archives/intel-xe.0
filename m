Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBC4C02183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 18:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD0410E460;
	Tue, 14 Jan 2025 18:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UAq+uQYr";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DE910E460
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 18:00:14 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-218c8aca5f1so125412705ad.0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 10:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736877554; x=1737482354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKFiwvMHWHKGeIgBE9hiXoIl9g6YNQE6qtWo6yMbBek=;
 b=UAq+uQYrdeT1+Qq0kXg8xBncPf+YpLt09Xh1b7sJ8UqSo0BQSB3tImBJSf+cQTZ52O
 J8hCLDfMJu0XbQ7j3Y5skRdwB6+I26K2nX5dyZoplCrQNsFML2J56b1oMLUHEc/K2k1y
 471YmqBlwK8fByqDmDBAEx9ykBP/nJu+fNAZvt+1JYEOvpwhx3jVBhG2tNwCfyagp1ae
 iixit4xC9Ok1Nux0fQmDtxKnDv9LyNS+63kdFssQ3bhNHbn6VmTGrysVDgs8PUvlDzlB
 pNc/ki1UnECY9G6ysyjyPJ/OpCT76iO7x+2nfur6oYl17wjdHcxQs0hlRJSak/k3f2xA
 w8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736877554; x=1737482354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKFiwvMHWHKGeIgBE9hiXoIl9g6YNQE6qtWo6yMbBek=;
 b=RXHAqCB2UxrcL8BtVoAZ2rmI4uS0EocLYI0qKzWmd7yPrUWhO2hpVKPVL0/8urJ/q0
 Ey6qbkGwcDcj9cfT5L1v8zZLMwVk6b8FRIG4Ren/eM0H5iVXF0JtPGIK77Psly3RBYEa
 zhPC5qwBH/8T+nw+PXyYESnrjucRpmlSVTvm+POIIOauvXcY0hGsaScAHMou6c2henWw
 Bwc0rOHimqNcwFzp1ZEdfLnY60khZpVUuYVgiwHnq4XR+esII9SJZc8TUok2jbTx/psy
 tG/7AY+nQbj/gKusLXyYp6RSOue5LI87p235bqLiPh65LCf4t1e60P73dGj9B/AnzV/3
 s4+w==
X-Gm-Message-State: AOJu0YxvtRiCmoEBu6ZSTUi8tqEYGPja4gRtvDL1ucSmKMmBJf2iVWqx
 QPRH/AKcbzYBDz18iuZpRqjxUHUmWGcZobXO0ny3qLmsJLvMGIvYBKWuAcXg
X-Gm-Gg: ASbGnctB6eU++FxZsGRngSJ0hmedRYcP/dNOnrOfAMHXC+oMKSrZPxuJ1wS12XsB6ZZ
 QawsgBhF0DMXrnt7JyOQTnt7SV4i3TcGjew0fvX6sGwxYOySDZwQCe4U1zAlOtJK5d3jp8iyR9V
 cGk3kV1hDE3JmzZ6fvRPd5pWZ2HKAGgsaKsdYnS4OCTIrUIrWyactWRRjBdh1+xsqKHxl0FzYkX
 cf8jqFjqAcdyMu5dDlgIzZYz8vHNx9/L9zhpbdRU4ZgVfHZhWFpnzLwyiOsLw==
X-Google-Smtp-Source: AGHT+IG2DJe3Q+Dcl3hZguZAk2t7VMv4oehpj3wBLIY4fCYk83L6RwiNMivQoblgUx6iqZA3id624w==
X-Received: by 2002:a17:903:120b:b0:216:3e87:c9fc with SMTP id
 d9443c01a7336-21a83f48c19mr379055835ad.5.1736877553638; 
 Tue, 14 Jan 2025 09:59:13 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f217b38sm69473385ad.145.2025.01.14.09.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 09:59:13 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/xe/display: Unify display page table mapping
Date: Tue, 14 Jan 2025 20:04:03 +0200
Message-ID: <20250114180403.896587-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
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

Unify writing of remapped and straight DPTs. Take out writing of
rotated DPT since Xe doesn't support any platform that does
90 degree rotated framebuffers.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++----------------
 1 file changed, 48 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index c28885316986..70322f28eee5 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -14,66 +14,44 @@
 #include "xe_ggtt.h"
 #include "xe_pm.h"
 
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
+	const u32 dpt_even = (plane->dst_stride - plane->width) * 8;
+	const u32 dest_width = plane->width;
+	const u32 dest_height = plane->height;
+	u32 src_idx;
+
+	for (u32 row = 0; row < dest_height; ++row) {
+		for (u32 column = 0; column < dest_width; ++column) {
+			switch (type) {
+			case I915_GTT_VIEW_NORMAL:
+				src_idx = plane->offset + column;
+				break;
+			case I915_GTT_VIEW_REMAPPED:
+				src_idx = plane->offset +
+					row * plane->src_stride + column;
+				break;
+			default:
+				WARN(1, "Unsupported GTT view type: %d", type);
+				return;
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
 
@@ -125,59 +103,36 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 {
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
-	struct xe_ggtt *ggtt = tile0->mem.ggtt;
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
+	const struct intel_remapped_plane_info *plane;
+	u32 i, plane_count, dpt_ofs = 0;
+	struct intel_remapped_plane_info normal_plane;
 
-	if (view->type == I915_GTT_VIEW_NORMAL)
+	if (view->type == I915_GTT_VIEW_NORMAL) {
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
-	else if (view->type == I915_GTT_VIEW_REMAPPED)
-		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
-				 XE_PAGE_SIZE);
-	else
-		/* display uses 4K tiles instead of bytes here, convert to entries.. */
-		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
+		normal_plane.offset = 0;
+		normal_plane.width = size / XE_PAGE_SIZE;
+		normal_plane.height = 1;
+		normal_plane.src_stride = size / XE_PAGE_SIZE;
+		normal_plane.dst_stride = size / XE_PAGE_SIZE;
+		plane = &normal_plane;
+		plane_count = 1;
+	} else {
+		dpt_size = ALIGN(intel_remapped_info_size(&view->remapped) * 8,
 				 XE_PAGE_SIZE);
+		plane = view->remapped.plane;
+		plane_count = ARRAY_SIZE(view->remapped.plane);
+	}
 
 	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
 
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
 	vma->node = dpt->ggtt_node[tile0->id];
-- 
2.45.2

