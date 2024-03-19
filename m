Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C48C54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB70E10FBEF;
	Tue, 19 Mar 2024 17:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tb+Sm4M4";
	dkim-atps=neutral
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFD710F11F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 17:07:44 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-513d247e3c4so71069e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710868062; x=1711472862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RKhpVqNu1EsK6gZUYiCxl+5OVnAybLhRUb33HFXenq4=;
 b=Tb+Sm4M4i+g3edGVjVMCors58CWBrgg080DY5Yw1WhuceChuxjN7k9d4kclABXVo7J
 GDrJ2r12F9eCL8438JWfW96nA180Fy8X2w/XP6Wah+XSrOGG/4DKbXhqJmQgqHwO8+Xo
 aTb7yE68QL4auHIZvUsLEhGrpAe+l7d1LPpCKgr1bcE1RTHVolWPAf8EZFgor9KN+pd7
 ILUX9X11Ugw1XJvPkN4vLPhOsCWWFxin4t2rI2outOdcQrfPDYj2PPW/7ouPm8uBBwKV
 Fcgl65lSzrFXzG9/TVt0r9hJLaMTGQ/gka13D82qJjVIYvkkmMFZjcqRmHI54Z03iEZ6
 fjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710868062; x=1711472862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RKhpVqNu1EsK6gZUYiCxl+5OVnAybLhRUb33HFXenq4=;
 b=My3iuSA2712H4vFxRL4atIKUybMab+0dUhxulNIFJHkzfxXyrztjiBOrOEOZ8WO0mM
 4vrDq8pZJ6QLXh6zdz5rPmUyJ2DxBfD/CnkzeVs9+KlBpkMhOiqMxNur/Thc5WH+X6ID
 Gbhp1asKMKSaZ3b+DG7yBg9Jfzu8OdwBjbFZ9QQL9AQAB+M9G6v10HjGz5O13XgP9FqA
 vOMJAqPEK5//q3O88Ab+IbICEoeJAEdI/ahfPJ47V3P69B6iqp/vc43EjoQEw2aYNztY
 +nndKItkitweqf8+6teUhbvYuRNduJpRgsK7tl6KhPJG99Gwhwz5h8IDyJwV9E0n4iQQ
 nryw==
X-Gm-Message-State: AOJu0YzPm9nYpdeMY1Zm7EK8YE3YaZJhj/YPFSzGUpOpJW8YSU0JM9oC
 Efh286AOxLMvFsog6FJhXAE0+B2XuuSMepza43/jYD9rUZA8l91VI681muLtua68Hg==
X-Google-Smtp-Source: AGHT+IFUWuVGKvw+t/q01t+Auw8EXp/+KM/pZG5f8UfLvdsTnN/NaPdm6XgKQ9zoI/X48t0BoIn48w==
X-Received: by 2002:a19:2d4b:0:b0:513:d4d7:1233 with SMTP id
 t11-20020a192d4b000000b00513d4d71233mr1177371lft.10.1710868061450; 
 Tue, 19 Mar 2024 10:07:41 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 q24-20020a05651232b800b00513dd120ecasm1406408lfe.252.2024.03.19.10.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 10:07:41 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 1/2] drm/xe/display: Unify DPT mappings
Date: Tue, 19 Mar 2024 19:07:33 +0200
Message-Id: <20240319170734.156407-1-juhapekka.heikkila@gmail.com>
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

Unify writing of rotated and remapped DPTs

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 104 ++++++++++---------------
 1 file changed, 41 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2eb622510186..2d1259a884d6 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -13,66 +13,43 @@
 
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
+	u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+					      xe->pat.idx[XE_CACHE_NONE]);
+	iosys_map_wr(map, *ofs, u64, pte);
+	*ofs += 8;
+}
 
-		/* The DE ignores the PTEs for the padding tiles */
-		*dpt_ofs += (dst_stride - height) * 8;
-	}
+static u32 calc_src_idx_rotated(u32 base, u32 offset, u32 stride, u32 width,
+				u32 height, u32 row, u32 column)
+{
+	return base + stride * (height - 1 - row) + column;
+}
 
-	/* Align to next page */
-	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
+static u32 calc_src_idx_remapped(u32 base, u32 offset, u32 src_stride,
+				 u32 width, u32 height, u32 row, u32 column)
+{
+	return base + offset + row * src_stride + column;
 }
 
-static void
-write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
-		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
-		   u32 dst_stride)
+static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
+		      u32 bo_ofs, u32 width, u32 height, u32 src_stride,
+		      u32 dst_stride,
+		      u32 (*calc_src_idx)(u32, u32, u32, u32, u32, u32, u32))
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
+	for (u32 row = 0; row < height; ++row) {
+		for (u32 column = 0; column < width; ++column) {
+			u32 src_idx = calc_src_idx(bo_ofs, 0, src_stride,
+						   width, height, row, column);
+			encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
 		}
-
-		/* The DE ignores the PTEs for the padding tiles */
-		*dpt_ofs += (dst_stride - width) * 8;
+		*dpt_ofs += (dst_stride - (calc_src_idx == calc_src_idx_rotated
+			     ? height : width)) * 8;
 	}
-
-	/* Align to next page */
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
@@ -131,24 +108,25 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		u32 i, dpt_ofs = 0;
 
 		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
-			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
-					   remap_info->plane[i].offset,
-					   remap_info->plane[i].width,
-					   remap_info->plane[i].height,
-					   remap_info->plane[i].src_stride,
-					   remap_info->plane[i].dst_stride);
-
+			write_dpt(bo, &dpt->vmap, &dpt_ofs,
+				  remap_info->plane[i].offset,
+				  remap_info->plane[i].width,
+				  remap_info->plane[i].height,
+				  remap_info->plane[i].src_stride,
+				  remap_info->plane[i].dst_stride,
+				  calc_src_idx_remapped);
 	} else {
 		const struct intel_rotation_info *rot_info = &view->rotated;
 		u32 i, dpt_ofs = 0;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
-			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
-					  rot_info->plane[i].offset,
-					  rot_info->plane[i].width,
-					  rot_info->plane[i].height,
-					  rot_info->plane[i].src_stride,
-					  rot_info->plane[i].dst_stride);
+			write_dpt(bo, &dpt->vmap, &dpt_ofs,
+				  rot_info->plane[i].offset,
+				  rot_info->plane[i].width,
+				  rot_info->plane[i].height,
+				  rot_info->plane[i].src_stride,
+				  rot_info->plane[i].dst_stride,
+				  calc_src_idx_rotated);
 	}
 
 	vma->dpt = dpt;
-- 
2.25.1

