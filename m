Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EC4CD6E5D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 11:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175E10E732;
	Wed, 11 Oct 2023 11:54:24 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1AC10E732
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 11:54:20 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5044dd5b561so8216053e87.1
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 04:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697025258; x=1697630058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Q317Q83ZO0qdyg1W8wnbBzCy0xiC014jhMj1OvhYuc=;
 b=dNuRQJxBPfGUcb6ElfhVfQg7yXyKix6k9oksiyF/wvK2hmBKB8fuluvlPcrYlyjjiw
 69bWxKMlhjESiU1+7cA45/+TyniKuTuRRhf4FAziEzzf7wuosjWM6WQbAO7mu0UznjEd
 apDDFGC43mirOLj58869SzM47U2jgtJgduiUa6b2Sat1RiqHjnwX3WN/2jDlgEaBLHBM
 4Np3BdF5qkfCGefcHIx9vsK10zzWLze7z4kTUAkerBLbY9Fe1qzyDGJsxEzbGoF1//R4
 nFSEOibYFzL4SKa8xc/gzjT1QewSmjmv0lZNBIs16Aa17UjcOucc4MVINHINBU3KPCpQ
 qR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697025258; x=1697630058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Q317Q83ZO0qdyg1W8wnbBzCy0xiC014jhMj1OvhYuc=;
 b=l5bS9DYnoctXyGNCeJVg0Aj7Yr0XBBUjCBY+ZYOHqz01dz1WoV19gERkGiGV+R0sNl
 oDPRnG6FzpSL6iampodus4Cxiszz/6VYOnZ2QVN/fjD2lP+Ya4eAeuBTsxSMdcsS2cDN
 w1qw3SqYLKXISyqZeBoxVQQ2diIzz4vASxa1ufGm7STN8VA0h/apOKsukSRK8Su+fU7I
 ENmcNe5VLGwORAQQDC2QLZKTIXV8+Cx6vWH7tS4l5nMuffMNtT6XyEh5FUm40jB+AkQa
 vEe48rnVia7J8F7zkFacFGp6yYRFREHxC/JOmccUnm10D/+VUrbmZTG6Fo3BVJA0Czpn
 duXg==
X-Gm-Message-State: AOJu0Yx5SbNpDXXRJHcMxXlqBID+X1hHvn1Hd2HiFKCKXfICYLfmtCz8
 +IMisfvzE9AE0SZiRKA472t8gzrHXIzeb0Ht
X-Google-Smtp-Source: AGHT+IHiRdKjZU6kUxy2QACMw12bZALaI7H8EXgvrxq4aMNC2O0DmJWPZ4qDgIE7URfSNIhJSb7ziQ==
X-Received: by 2002:a05:6512:32a8:b0:505:98a8:fa36 with SMTP id
 q8-20020a05651232a800b0050598a8fa36mr16757453lfe.22.1697025257845; 
 Wed, 11 Oct 2023 04:54:17 -0700 (PDT)
Received: from jheikkil-mobl1.home (77-105-100-22.lpok.fi. [77.105.100.22])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac24d01000000b005042ae2baf8sm2234752lfi.258.2023.10.11.04.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 04:54:17 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:54:11 +0300
Message-Id: <20231011115411.401900-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011115411.401900-1-juhapekka.heikkila@gmail.com>
References: <20231011115411.401900-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/2] drm/xe/display: Add writing of remapped
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
index 68cd406b8104..0490b19d2d9a 100644
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
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
+			     enum xe_cache_level cache) = ggtt->pt_ops->pte_encode_bo;
+	u32 column, row;
+
+	for (row = 0; row < height; row++) {
+		u32 src_idx = src_stride * row + bo_ofs;
+
+		for (column = 0; column < width; column++) {
+			iosys_map_wr(map, *dpt_ofs, u64,
+				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+				     XE_CACHE_WB));
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
@@ -210,12 +256,6 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
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

