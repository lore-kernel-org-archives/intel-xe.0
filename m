Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88155C04AAB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 11:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B0810E65C;
	Fri, 22 Sep 2023 11:51:35 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C57510E65C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 11:51:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50336768615so3559827e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695383491; x=1695988291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWfN+OhZ+oUZxPefTfmu3uhtj+eVN/+QFyAk58GPkjk=;
 b=DRJIyvL75gLuyfsIMV/ru/zkJ77C2QMwm/XRGVvp+0tdG7zuq+2G6XiVCm3BwalJfU
 168Lg1qxOhHdvwdGBHD8yH4ReayCFyyqiQDqTM2vehkteulkJVGst52+0mB72ZLPBUAd
 ld5txiP1zdg9q/pBvx+QWM5vaI+8gCBSEB7Rlh8iA0jgHnuWj1IWZkFUG+PjplATQ8ha
 kZ2LoD2UcyZSyc3nDS9oBqCYHxtbB6XrMSMoSuRcXJbv5r4+MS7dtIqCE8RzolavdKXY
 Dc/k1oVnQP8LyGrB4S5/4VcP4lPXCt7BNEZKITb7h+8JFy55ZvZZB9ybs5m2H/FGBHls
 3qQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695383491; x=1695988291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWfN+OhZ+oUZxPefTfmu3uhtj+eVN/+QFyAk58GPkjk=;
 b=KUx+vJ/QyRMFb1+f+7y5axFOjoBHJt5Cd+zMWtqaARgoce+RTpQKGm1ZV4OAqw3Q85
 7QNILDRyKlYWhyKK03Vb7fSd3A7pkX0n65Olr2t8uL36QoWZXXm8B/VbA2u6HDkmjonK
 kd9ls9ytgO9g8zu3wX32018YYj7Z1FnlzVSV7YcwyAJAfwvLuPFpVD+lHfAuvHmUwZ/p
 1aGVKxnyAVR+2GrupmnaAJ4P9SDzSAmxSWwGJ0QCdIhb4AqCgp1ep9O8VbjUYAsZbTGU
 CMNT0vzxevBbxXAgg3rjnjJCRHGTBP5BXJ3u+fAA0aJB3JIaO8n3NagE4EJoKAzEBcEn
 wU9g==
X-Gm-Message-State: AOJu0YxHW6fu0eenNLhKmcD/RJ2Um936fGyJRqDBOulh3TfNJFcRUWLs
 gvc8/X4zPaEzo5DuuUdi080ys8Y1KUNbQkw1
X-Google-Smtp-Source: AGHT+IHJ3BBYMsevB4cWnxlfaYtDNAn/wldbn2Z3Xnc8G2B2RmvwBBPIHQGI/VDIKK2NzaMusjx0TA==
X-Received: by 2002:a05:6512:32b1:b0:501:bdde:5a49 with SMTP id
 q17-20020a05651232b100b00501bdde5a49mr7475168lfe.15.1695383490931; 
 Fri, 22 Sep 2023 04:51:30 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:a3c1:45a8:51d0:6c6a])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a195207000000b005009d5aaaedsm700508lfb.172.2023.09.22.04.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:51:29 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:51:22 +0300
Message-Id: <20230922115122.305107-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
References: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe/display: Don't try to use vram if
 not available
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

Trying to get bo from vram when vram not available will cause
WARN_ON() hence avoid touching vram if not available.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index ce52861a7dd4..3f2957a5efd3 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -71,7 +71,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 {
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
-	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
+	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt = ERR_PTR(-EINVAL);
 	u32 dpt_size, size = bo->ttm.base.size;
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
@@ -84,10 +84,11 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
 				 XE_PAGE_SIZE);
 
-	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM0_BIT |
-				  XE_BO_CREATE_GGTT_BIT);
+	if (tile0->mem.vram.usable_size)
+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
+					   ttm_bo_type_kernel,
+					   XE_BO_CREATE_VRAM0_BIT |
+					   XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
-- 
2.25.1

