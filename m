Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC05CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 13:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC8610E4EF;
	Thu, 12 Oct 2023 13:52:25 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E57310E174
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 13:52:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-504b84d59cbso1421755e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697118737; x=1697723537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSB/BRfBtl93+VJlY8aqOsDhK2X84WQYnww8PRk1zPk=;
 b=f9SXqLb5mho7y6NsxhF89zpTxD84uIqd3cjjnspBdTLOdVtxhCUPb4xrkAYkIHv3Ip
 7baCOQekatdwI8cOZIDFK06lBqaStOgFz5o/wlMDi8a1ViwVhxiyaGTepdxRmseX50Br
 Kyy3fbgieA0KpOxme79LBhvVeK02EW/+QscLlwYlp48F57flc183PeIhgu96kMueiXM1
 YHNPMDwjKAvkEbt8sKV1sxdhrli4uLQS1nyhFRs1pDTW7RnadVnQfsZWXxptxcKsMMNx
 S4t8kqQrr/MhPbTuxiias6b2VbF5VMvlnqvOJNsWAvFtD0o7vpIW7hi2xPVnTtFsqn0K
 28cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697118737; x=1697723537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PSB/BRfBtl93+VJlY8aqOsDhK2X84WQYnww8PRk1zPk=;
 b=QoYCabAyFiYySs8ID6jeuEuoqw9R3wE4BovFLMKA/KDxhkdgnJMVhVWA1ovpIzcRna
 qsOIUQQrYtXMUmoljHMXbLYepCgFVrdtjCNjSGHK+AfqFjM/wuwCJL21SzK1oS/dbwVv
 PYDiNQV0XyZ5NVaLCymAo0VvhWfTKsJqhkBeaTaXv9agVSgeZeH3JYY7QrxsyGFK31NV
 jMBJDuaX1eN6Txhp4CCKHNx6xAuibc1WoRAt823fNjYptT09yktgQpNhlqfq5nXAc7NZ
 9JN5jcFYIL0nJuR+e7TQAa2lEI8oei+h6nL+1FHARRRMqdeKEhQAggkYOilP/xE4LwzO
 YhsA==
X-Gm-Message-State: AOJu0YzdwyyFUJOXkqkgjB58fxBMNZPGpsPGsNu/KooEKS8JLc9Jz6/Y
 PNyL90Rx34W6ZHWn56+thiPpBOZLZ0w4qQ==
X-Google-Smtp-Source: AGHT+IHtcJF8tXGSvabOSY/Z11a5JztkafG4jB6f5BpbouPVL1+gDQ8Ezc9P87Eo9D1rlAsNxHmdiA==
X-Received: by 2002:a05:6512:60f:b0:4fe:94a1:da84 with SMTP id
 b15-20020a056512060f00b004fe94a1da84mr19237537lfe.5.1697118737192; 
 Thu, 12 Oct 2023 06:52:17 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:35cf:7415:ccda:33ca])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a19ae11000000b004fb8a2b9485sm2826361lfc.248.2023.10.12.06.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 06:52:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 16:52:09 +0300
Message-Id: <20231012135209.403827-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
References: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 2/2] drm/xe/display: Add writing of remapped
 dpt
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

Xe need to use remapped display page table for tiled framebuffers
on anywhere else than DG2. Here add function to write such dpt and
enable usage of remapped display page tables where needed.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 52 +++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 89cf65c58191..ffd35a59f405 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -45,6 +45,37 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
+static void
+write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
+		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
+		   u32 dst_stride)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
+		= ggtt->pt_ops->pte_encode_bo;
+	u32 column, row;
+
+	for (row = 0; row < height; row++) {
+		u32 src_idx = src_stride * row + bo_ofs;
+
+		for (column = 0; column < width; column++) {
+			iosys_map_wr(map, *dpt_ofs, u64,
+				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+				     xe->pat.idx[XE_CACHE_WB]));
+
+			*dpt_ofs += 8;
+			src_idx++;
+		}
+
+		/* The DE ignores the PTEs for the padding tiles */
+		*dpt_ofs += (dst_stride - width) * 8;
+	}
+
+	/* Align to next page */
+	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
+}
+
 static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 			       const struct i915_gtt_view *view,
 			       struct i915_vma *vma)
@@ -57,6 +88,9 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
+	else if (view->type == I915_GTT_VIEW_REMAPPED)
+		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
+				 XE_PAGE_SIZE);
 	else
 		/* display uses 4K tiles instead of bytes here, convert to entries.. */
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
@@ -89,6 +123,18 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
 		}
+	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
+		const struct intel_remapped_info *remap_info = &view->remapped;
+		u32 i, dpt_ofs = 0;
+
+		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
+			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
+					   remap_info->plane[i].offset,
+					   remap_info->plane[i].width,
+					   remap_info->plane[i].height,
+					   remap_info->plane[i].src_stride,
+					   remap_info->plane[i].dst_stride);
+
 	} else {
 		const struct intel_rotation_info *rot_info = &view->rotated;
 		u32 i, dpt_ofs = 0;
@@ -212,12 +258,6 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	if (!vma)
 		return ERR_PTR(-ENODEV);
 
-	/* Remapped view is only required on ADL-P, which xe doesn't support. */
-	if (XE_WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
-		ret = -ENODEV;
-		goto err;
-	}
-
 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
 	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
 	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
-- 
2.25.1

