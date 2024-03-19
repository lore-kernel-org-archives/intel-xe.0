Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C47C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C2910F11F;
	Tue, 19 Mar 2024 17:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j/LarUta";
	dkim-atps=neutral
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61B110F11F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 17:07:44 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-513edc88d3cso2394645e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 10:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710868063; x=1711472863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUP3lm8k0t42vTnq21qNvuq6PdNqej2UHDOPUhqrtxw=;
 b=j/LarUtaF4Iv0po77B0nzK9LmxQ4y/8JhvJj3gWKPBGlYPgr8OMW6t2JNBvEw8MpjI
 JZLI2a+fSTO6Wlp5lAv+wWhnlOv2RESSdLVh3crvhYYchDOP+iYPAjEbPVflnoWLzyhf
 1wlB8u7D0MbBudwDI0z5+sdxu4O6DCk36GHS+989roKMfc/M9QNlnkcG1CG+XxB67Qob
 8qbfuekQ9WZIKF2xzNdOr2X4Ji4qpv2GrBOZBxPQz2JWdysvWJTEaDU8OClvMK/N7Rwe
 4Eprv2is6YDD5zJZJhqqoUVE2woHgm5FToO2J/s9m4floCQJqN/yFWlYV5U4EovuicJY
 PjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710868063; x=1711472863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sUP3lm8k0t42vTnq21qNvuq6PdNqej2UHDOPUhqrtxw=;
 b=X3WUEkE6rj4Sv9G3VeNbh3+e6m30vWgHvN86TSADZYYF1cSPjSDFy2eFlOa1mBfICK
 nl9oQ4AfCAnVJ+Vei4ABIwJz74zTOnQAd339shGipggqxCWHbFVkR03B1AglWMEcH6/+
 3QUXULxTD2SXVd4iKtytk8bbf1S//Cnww5wCDu5NK2yrJuQkt5zUsvD6DLclULdIpOBc
 kY2eo070Z3nceh+hXRyWkgRyp84WiR6OfIWIr0Lqa56HD4u9o9pm4rbe4IvtOrz1+WhW
 AzPvW1O0cfWIC/UMEeE0BKy4d/wOUAGSY/zSeRqsa2PCmG1yxbZkhLRW+Uh9p0oH5qCp
 owkQ==
X-Gm-Message-State: AOJu0Yy2f6wl9qphrUoBFd5ecNElAj3PihyNp8D6E+N6FFtviA7OSpnz
 UdHW+a3880rEAn/b+s+Hr5q85yatpqjFWq8ZNaVHA5Xbju1nmBo/9FRsy4SiZbOwog==
X-Google-Smtp-Source: AGHT+IFEU+fPyd7vaLlFvAdbClc/mwJX556OSAvykAQMxanvBHrSNYmWRwPQ48s38CDkFP4XF5d4Tg==
X-Received: by 2002:a05:6512:3ec:b0:513:3fbe:b0c8 with SMTP id
 n12-20020a05651203ec00b005133fbeb0c8mr9882042lfq.31.1710868062310; 
 Tue, 19 Mar 2024 10:07:42 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 q24-20020a05651232b800b00513dd120ecasm1406408lfe.252.2024.03.19.10.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 10:07:41 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/xe/display: Simplify DPT handling
Date: Tue, 19 Mar 2024 19:07:34 +0200
Message-Id: <20240319170734.156407-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319170734.156407-1-juhapekka.heikkila@gmail.com>
References: <20240319170734.156407-1-juhapekka.heikkila@gmail.com>
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

Don't undo structures on higher level but pass them all the way
to mapping functions.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 69 ++++++++++++--------------
 1 file changed, 31 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2d1259a884d6..71860198bf20 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -23,32 +23,32 @@ static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map *map,
 	*ofs += 8;
 }
 
-static u32 calc_src_idx_rotated(u32 base, u32 offset, u32 stride, u32 width,
-				u32 height, u32 row, u32 column)
+static u32 calc_src_idx_rotated(const struct intel_remapped_plane_info *plane,
+				u32 row, u32 column)
 {
-	return base + stride * (height - 1 - row) + column;
+	return plane->offset + plane->src_stride * (plane->height - 1 - row)
+		+ column;
 }
 
-static u32 calc_src_idx_remapped(u32 base, u32 offset, u32 src_stride,
-				 u32 width, u32 height, u32 row, u32 column)
+static u32 calc_src_idx_remapped(const struct intel_remapped_plane_info *plane,
+				 u32 row, u32 column)
 {
-	return base + offset + row * src_stride + column;
+	return plane->offset + row * plane->src_stride + column;
 }
 
 static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
-		      u32 bo_ofs, u32 width, u32 height, u32 src_stride,
-		      u32 dst_stride,
-		      u32 (*calc_src_idx)(u32, u32, u32, u32, u32, u32, u32))
+		      const struct intel_remapped_plane_info *plane,
+		      u32 (*calc_src_idx)(const struct intel_remapped_plane_info*,
+		      u32, u32))
 {
 	struct xe_device *xe = xe_bo_device(bo);
-	for (u32 row = 0; row < height; ++row) {
-		for (u32 column = 0; column < width; ++column) {
-			u32 src_idx = calc_src_idx(bo_ofs, 0, src_stride,
-						   width, height, row, column);
+	for (u32 row = 0; row < plane->height; ++row) {
+		for (u32 column = 0; column < plane->width; ++column) {
+			u32 src_idx = calc_src_idx(plane, row, column);
 			encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
 		}
-		*dpt_ofs += (dst_stride - (calc_src_idx == calc_src_idx_rotated
-			     ? height : width)) * 8;
+		*dpt_ofs += (plane->dst_stride - (calc_src_idx == calc_src_idx_rotated
+			     ? plane->height : plane->width)) * 8;
 	}
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
@@ -103,30 +103,23 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
 		}
-	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
-		const struct intel_remapped_info *remap_info = &view->remapped;
-		u32 i, dpt_ofs = 0;
-
-		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
-			write_dpt(bo, &dpt->vmap, &dpt_ofs,
-				  remap_info->plane[i].offset,
-				  remap_info->plane[i].width,
-				  remap_info->plane[i].height,
-				  remap_info->plane[i].src_stride,
-				  remap_info->plane[i].dst_stride,
-				  calc_src_idx_remapped);
-	} else {
-		const struct intel_rotation_info *rot_info = &view->rotated;
-		u32 i, dpt_ofs = 0;
+	} else  {
+		const struct intel_remapped_plane_info *plane;
+		u32 i, plane_count, dpt_ofs = 0;
+		u32 (*src_idx)(const struct intel_remapped_plane_info*, u32, u32);
+
+		if (view->type == I915_GTT_VIEW_REMAPPED) {
+			plane = view->remapped.plane;
+			plane_count = ARRAY_SIZE(view->remapped.plane);
+			src_idx = calc_src_idx_remapped;
+		} else {
+			plane = view->rotated.plane;
+			plane_count = ARRAY_SIZE(view->rotated.plane);
+			src_idx = calc_src_idx_rotated;
+		}
 
-		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
-			write_dpt(bo, &dpt->vmap, &dpt_ofs,
-				  rot_info->plane[i].offset,
-				  rot_info->plane[i].width,
-				  rot_info->plane[i].height,
-				  rot_info->plane[i].src_stride,
-				  rot_info->plane[i].dst_stride,
-				  calc_src_idx_rotated);
+		for (i = 0; i < plane_count; i++)
+			write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], src_idx);
 	}
 
 	vma->dpt = dpt;
-- 
2.25.1

