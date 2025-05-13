Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9A6C3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 14:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB4C10E209;
	Tue, 13 May 2025 14:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CM412imN";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA9310E209
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 14:15:06 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-74068f95d9fso5324856b3a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747145706; x=1747750506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PP/S/xNpELFTyMNi1hMNkKNeY2nwKUi1hbd1+b+oX6Q=;
 b=CM412imN6QUdnGnjOVNDchiXXk2ZJsxaE2bjJvCTp1VgpP9PsmK6NAXwTx0ZGakph3
 2qTqPZ3jaZTWwfvpu2Kun0BoPOcP556Z0dv/eAWGstLx+aUK/DRV3CYmHJh9hT98JEuE
 EUig9LcdO87I6D5Gwp1wO8wiGt/aMG5PBC4Qyfk8PuMoDddX/nENQlaVlWONikC77RE3
 O8fxUXt1pZUnOio4Oe7Fi/zkJ5I7hSqnHAeidK0fP+MuWCFOmLhx777qINGoeHnVyCsh
 QALYyMhZwrC+RO2iaH3G6VfdFMtfQCEDcIg/mVWqPsDyzh5irhtH9MjVhN0zW9CbybcE
 hBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747145706; x=1747750506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PP/S/xNpELFTyMNi1hMNkKNeY2nwKUi1hbd1+b+oX6Q=;
 b=Zc4m0IVdGNNHrM+nnyAYdmhpN2gqCc+ys+lNL34qh9CMFEM0rD0i/X+gWYvl9SAVBB
 kgprPZjk2MWrbTWB8ae+DXoal1tr++X5tQTDkXTn+kmwE5aqYAsuGUizO/uXhT1y5MmP
 Ky7aiVMPN6oCrwuLhLQ5Om+TGLMUFWBQvr+pYkM1imsLB/gZW7FSqjFZqTxy/631KhdY
 a4Hk4INalKjLLcB538SXDCCxxDePYR51E7+pgFnFFSiYAkZLzexfjcd1Kq89ZZAdONs2
 hxJcq9jFnGPiWhTBnCzAuwr+Vg9DY+ZVHbg+0ZyBqVwK3+17Zd70djrSQCesD5/LOlQH
 kwPQ==
X-Gm-Message-State: AOJu0YyFcLC1IEFPtQijlxoDw1HOhQVanwe/KLnB4WyFRLrS6JNVJPjA
 W+jFmH7mKlHYnkLiV8EfmRMUAZZeRXxtYsIl13VZEgfOKvQ3FDTR6wVlUOZg
X-Gm-Gg: ASbGncuj3apFKMn0nE2WWrCtYhAArLRG6s3F9AKjsXf998rMHcemzsr4w5jkRtAC0If
 bnZ+O3nAVDohz8mIGcglxR8+q9HdaleMFWJc4ZYOZR/PeSJ8T4Q4lFmB1rZrZflfl5h/p/Hbg/O
 vrAr9MYtjXYc3JGNZSCTiIMcCCeyHS03EYakNxWLuJP1JEtAgC5LEjQAlhcZT6pWy4SAVhb4FrU
 e5S1joC8APLxGv+A62ugDhpIyXobeVh03EdeqXGdGTrTec80SLXtE29ETOEqPl3MGeoglag4agT
 9163O+DYRmYu6yEhQDVv/Z+HguEzxnUOtMKJ3kC5xpVEjQbEJhORkZWH
X-Google-Smtp-Source: AGHT+IEQa1sdQR/Whj5uHFjgPJvqsJ+1aLnfHlAH+5j3DgZp3hjk9iLMl8hyvwm1DOC26dpBl8CdMg==
X-Received: by 2002:a05:6a00:3e28:b0:736:51ab:7aed with SMTP id
 d2e1a72fcca58-7423c040e1fmr22413771b3a.16.1747145705964; 
 Tue, 13 May 2025 07:15:05 -0700 (PDT)
Received: from localhost ([192.55.55.42]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a8efa2sm7791247b3a.165.2025.05.13.07.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:15:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/xe/display: Unify display page table mapping
Date: Tue, 13 May 2025 17:14:45 +0300
Message-ID: <20250513141445.79158-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513141445.79158-1-juhapekka.heikkila@gmail.com>
References: <20250513141445.79158-1-juhapekka.heikkila@gmail.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++----------------
 1 file changed, 48 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 540e5f31e655..68c9916b4a95 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -16,66 +16,44 @@
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
 
@@ -127,59 +105,36 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
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
 
 	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, alignment);
 
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

