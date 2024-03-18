Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D8DC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 20:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916C210FFC2;
	Mon, 18 Mar 2024 20:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g4PnYZxU";
	dkim-atps=neutral
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D69E10FFC2
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 20:19:00 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso58057211fa.3
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 13:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710793138; x=1711397938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hGnswlhNmWTRCHQim1u85eL3yNRTW1EEi4RCt6+ynyo=;
 b=g4PnYZxUDXJSPZhBEQNnp1gF0XmPWvubSYp3bY8J43U8hJDpHXf0JQ3Gr2zjcfon+i
 wnjgBe1faPhFfAvVgxIMfoOBdk0/3L0TaypI8r9+Sl6Y738XV9X/LuGAk2TDQwKKDx19
 E8oQMKZljP3RH7tY/QCVlBhNPbhVj7otpDhSEjWmy/aw0ksidwtS9HEFE6kyUOC+qRzo
 hnfxAUJ/OnvTd4WmTeqEDx++IbD5RiEZE6s5UYd2U9qRNB5KRS6JDYs/L3Gu7yQi1dGG
 ZVh356N5QeOZS9t2zgtj0eDSfYctZvk2NRvJh9doUdwQkpgbTi88WTODo4boN1Vx4PMz
 Vvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710793138; x=1711397938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hGnswlhNmWTRCHQim1u85eL3yNRTW1EEi4RCt6+ynyo=;
 b=MXMaTjqJysE2OxUTDQ048U/lmbNazquSBQ4ObdxxRh7GGPNhGzBghQeGZDtG38XeXg
 3lT4obts6G4ZBfi3TZvcL94S5D3HD0qTwNuyKifT0rS0M+qRqJRy5hk2Uc2Gelok/L7p
 8ggAShFq3tYm9IbNrtu8A0YAFzUQX6WivSQuPd7XmwBh1nNzI2qrCKtZCOlmpOI8PWNe
 ERFn3UBJMS81+1iKdY+7A0Pq8MQps/a2tGCjvYe8YIWFQ+vneGIgdwYoSOIMDirEvjUk
 jvWlbgPbtjrCuIx7q90wy+81MYIuc/Vv9WViGOUOa0v1dZ9zTqeYugItmQ/ypvFjl49r
 b3PA==
X-Gm-Message-State: AOJu0YxpB//xKyDdHCY4o0iBNfaa5oELo4Ys07KKP1eNmzCguEUSTPTy
 YoK0mOB+8ZPGiaVRRg1gKZF15u395HO3pfQm2Zta45jTCTrFc1Lcku6DSNT53GU=
X-Google-Smtp-Source: AGHT+IGNm1/6eXuCPXhvBkE5BicwM6ypi7ChA/Z0IPdqzJc5RMD0yWxzgbpkNOUEgOOsR56v9ngvdA==
X-Received: by 2002:a2e:b5c8:0:b0:2d4:76c9:2573 with SMTP id
 g8-20020a2eb5c8000000b002d476c92573mr8530184ljn.18.1710793137763; 
 Mon, 18 Mar 2024 13:18:57 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 v23-20020a2e87d7000000b002d2b76dd76esm1606435ljj.57.2024.03.18.13.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 13:18:57 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/display: Mark dpt and related vma as uncached
Date: Mon, 18 Mar 2024 22:18:50 +0200
Message-Id: <20240318201850.127785-1-juhapekka.heikkila@gmail.com>
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

Mark dpt and related vma as uncached to avoid pipe faults on some devices.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..98592994c8d4 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -30,7 +30,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 
 		for (row = 0; row < height; row++) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_WB]);
+							      xe->pat.idx[XE_CACHE_NONE]);
 
 			iosys_map_wr(map, *dpt_ofs, u64, pte);
 			*dpt_ofs += 8;
@@ -62,7 +62,7 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 		for (column = 0; column < width; column++) {
 			iosys_map_wr(map, *dpt_ofs, u64,
 				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-				     xe->pat.idx[XE_CACHE_WB]));
+				     xe->pat.idx[XE_CACHE_NONE]));
 
 			*dpt_ofs += 8;
 			src_idx++;
@@ -119,7 +119,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_WB]);
+							      xe->pat.idx[XE_CACHE_NONE]);
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
 		}
@@ -165,7 +165,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 
 		for (row = 0; row < height; row++) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_WB]);
+							      xe->pat.idx[XE_CACHE_NONE]);
 
 			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
 			*ggtt_ofs += XE_PAGE_SIZE;
@@ -211,7 +211,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 
 		for (x = 0; x < size; x += XE_PAGE_SIZE) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
-							      xe->pat.idx[XE_CACHE_WB]);
+							      xe->pat.idx[XE_CACHE_NONE]);
 
 			xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
 		}
-- 
2.25.1

