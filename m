Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50031C3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 14:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0653D10E1F6;
	Tue, 13 May 2025 14:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QqY4WWec";
	dkim-atps=neutral
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340CA10E1F6
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 14:15:03 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-30aa3980af5so6780736a91.0
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747145702; x=1747750502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XGpEPjYHGwTFIzPBch3v+BWf4MpFKIlJtwVraGUJl6I=;
 b=QqY4WWec7VANMVyjw1FZwqUArIc6e2CVq2JF80ir7Iui1hl482GQM0btSrLsW2jW/j
 gBMNC2n8MSTN2+k0G+PWLU5j7gOIL/iPsf7oLtdDODIljbGbTF+a53XZdkylNs2tRdDr
 KX5x/WxeAJ0LiPUkK7DPZR+xUUM9jwIwaXIrTYoN0unB9ypj4lc+FbGuKmh0IMqIQ8jZ
 g25J+Kn19YMtHikeqU+431lD8RCxOwYM15LXIcUB4hc4PiN6srYxNk/1QItPGAmeDsrL
 HFEB31MfoyIdVM1+TcSXxKtdkyPKB37n46Dwz7qlo6UZwkJleKcIOCcnKT5wYfBjjeyG
 8dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747145702; x=1747750502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XGpEPjYHGwTFIzPBch3v+BWf4MpFKIlJtwVraGUJl6I=;
 b=p7DrrHaRlVl8ix1LY+GSutg7TJQRqPlnzHGCmsBgo4An4fyzo2E2nHRr/MDds7QkP4
 DgQqs66bfdXbe5eqYLULWLg/IvoHZ12FJ9bVpagPEXJ+ry18CZkzOo+a2Jn0bLTsLZgn
 JwHehDsNgAX4+jruCCvjFFkDPROBMFtY+XIzru2/erm6yjoIfy0poFNoRO/+/HSprUeJ
 C/Fcpll0qLgmjd4zXVfYyz4EC0bVaYnohty/bKMU9JiYuu2ZPGqIkK5Abnb61Gw6nt2z
 ER9QttXJQYYOrzkV94pPvWCWoBlmFVxTfivQ6RUov55KK1FDFdXfKSzoz2l9r5FBfvnu
 WRqg==
X-Gm-Message-State: AOJu0Yy/uqeFn031hK+GXfTIulyONyWp1/gC7XN+i7mCFu1t3dcMYtJT
 3k4rOvjYrzFF7pvMppHN4uDWfo+o6JvEC/GOLGqaflljYL988RQnY7W3yuE8
X-Gm-Gg: ASbGnctie4zhomQXHHnPYvrlx8mv34BYboMtwQFeiSU1yEMCCw9ELkGKC21wemA2TN4
 4vf/eA+HXZ+UAHTDWSa7rLjJ5v9FiRMDdaH6LyDP2Spd32pqYgC0OVP0HVb4zE3yz9sFtzoRxLQ
 d9Wr40eNwBHiNNCepEnc5zCmbymAX77oqrbTmDwdcP3G2g/cywKGmVvzMpIYAzvCt0WN635MS/O
 vts/cjuoIJan/4x5KOnrusU5dXMHco3SRZvBV4HfQ/ZmBA5+PjwryY/Knjbmrnh7FVKaeCI3XQS
 bcsQhA8hiPnsjOSekGBnqgYTV5ANdYfuSFSlmZ2lKpEKxOCRZ1y3BTsM
X-Google-Smtp-Source: AGHT+IGRkKK9LbRbSIpkDAAr3zGZeY9tZS6ZqpziiPp5Wid/+kecBuhcRzNQ7JYC9Uwowh8WCwnQkQ==
X-Received: by 2002:a17:90b:1e53:b0:2fe:a515:4a98 with SMTP id
 98e67ed59e1d1-30c3d64f393mr23461703a91.31.1747145702047; 
 Tue, 13 May 2025 07:15:02 -0700 (PDT)
Received: from localhost ([192.55.55.42]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad4d2f152sm10661799a91.19.2025.05.13.07.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:15:01 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Date: Tue, 13 May 2025 17:14:44 +0300
Message-ID: <20250513141445.79158-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
This also fixes bug where dpt could have been allocated from system
memory when on dgfx.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d918ae1c8061..540e5f31e655 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -79,6 +79,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
+static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
+				     struct xe_tile *tile0, u64 size,
+				     unsigned int alignment)
+{
+	struct xe_bo *dpt;
+
+	/*
+	 * If DGFX: try VRAM0 only
+	 */
+	if (IS_DGFX(xe)) {
+		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
+						      size, ~0ull,
+						      ttm_bo_type_kernel,
+						      XE_BO_FLAG_VRAM0 |
+						      XE_BO_FLAG_GGTT |
+						      XE_BO_FLAG_PAGETABLE,
+						      alignment);
+	} else {
+		/*
+		 * For IGFX: first try STOLEN. on fail try SYSTEM.
+		 */
+		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
+						      size, ~0ull,
+						      ttm_bo_type_kernel,
+						      XE_BO_FLAG_STOLEN |
+						      XE_BO_FLAG_GGTT |
+						      XE_BO_FLAG_PAGETABLE,
+						      alignment);
+		if (IS_ERR(dpt)) {
+			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
+							      size, ~0ull,
+							      ttm_bo_type_kernel,
+							      XE_BO_FLAG_SYSTEM |
+							      XE_BO_FLAG_GGTT |
+							      XE_BO_FLAG_PAGETABLE,
+							      alignment);
+		}
+	}
+	return dpt;
+}
+
 static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 			       const struct i915_gtt_view *view,
 			       struct i915_vma *vma,
@@ -101,30 +142,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
 				 XE_PAGE_SIZE);
 
-	if (IS_DGFX(xe))
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size, ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_VRAM0 |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
-	else
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_STOLEN |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
-	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_SYSTEM |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, alignment);
+
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
-- 
2.45.2

