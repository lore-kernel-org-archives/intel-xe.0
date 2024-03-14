Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351C0C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 16:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C9B10FBC8;
	Thu, 14 Mar 2024 16:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IhzdfvSg";
	dkim-atps=neutral
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4E110FBD1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 16:21:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-513a08f2263so1500957e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 09:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710433260; x=1711038060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hCaPjJorEor7EzO6ayckaa4t/8vSnrEU/d4Sb6c5w/s=;
 b=IhzdfvSgvaDz+MVaBTSDq4zBIK25amhC9Dew5O1bgvNuwCpXDothAJsLfodI5lAwaR
 ewYGvc7G0hI7ob0YSeyAwnxJ/FsnOiHJNRyAi2Kip8hXsLiAHKjpwKX4PkN/DbZ+Ri+f
 Mzid0pRTdjyo8crQN9B9hOqb09B5ScLI46M4xfxUDGJ2YFRbpY0TYmkGZMNtHnQ/v/SC
 hpLCPgWaZxnigSiM3efqlj2DWG+o32YsZiv5acHKN9btHASDeORVF/J8YYj61SRo0Pj3
 TiaxI7jg16w0nWFducNoWkZsdOs5J+ChrtEN7I0KeYri20Jp8asxEEpn/GEBPO9UPirH
 9oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710433260; x=1711038060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hCaPjJorEor7EzO6ayckaa4t/8vSnrEU/d4Sb6c5w/s=;
 b=BbOGFRWrhr1DBA/+94iSqXXF2+2dW/mj/PO3rMlmuondNhBan5a/f191H8pDwuCLcE
 OKCMjUuOT02FvAUuf7OrddeF9H4zq3uHRFijxyXday+eQck4to9GKPuIlPC1E4UgC/5k
 3WEAYRbU98KEauIB51X0RRtPozuDFCswBExbqT9diHsU5H3PRrh6kus6j4qpCMZgEk/L
 /otDyuQILu6dsoJFxNwv6Fq3u4HoiI5uEOzY5vjMvBwP2Hu3wbT8jHBBEzywXiBdHfJJ
 5Hlo8x16DNAHB0kUzF9+C2YwXcZs13EWcV2k7iwvlbzz/Vo+mRIU5GtlXJpEbHhYN2NO
 AE/Q==
X-Gm-Message-State: AOJu0YyPAdg4POhAGflDpVeET/tAA2+/HQEz5wo4JOQqqSDTnSRsV0eN
 S2FDlEGlehiV9QzxCsgQ3n2bsE2Z1M0Y5yqjsA+8dxoAbpoyMExm8bYVL7EhtF4=
X-Google-Smtp-Source: AGHT+IFBO1jg673w81Fcl1+a0cnIg9vSEZ0MbpLErDCFetZddVSqj0YOO3STg1N5gJcI0jXlPGD/3Q==
X-Received: by 2002:a19:434d:0:b0:512:dfa1:6a1c with SMTP id
 m13-20020a19434d000000b00512dfa16a1cmr1520405lfj.10.1710433260168; 
 Thu, 14 Mar 2024 09:21:00 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:c8aa:c259:a2d9:6f75])
 by smtp.gmail.com with ESMTPSA id
 a19-20020ac25e73000000b005135bd71d6fsm327628lfr.276.2024.03.14.09.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 09:20:59 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH] drm/xe/display: mark dpt as uncached
Date: Thu, 14 Mar 2024 18:20:54 +0200
Message-Id: <20240314162054.75751-1-juhapekka.heikkila@gmail.com>
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

make dpt as uncached to avoid pipe faults on some devices

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

