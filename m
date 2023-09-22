Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6FECD4F57
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 11:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B36A10E655;
	Fri, 22 Sep 2023 11:17:32 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB0D10E655
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 11:17:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5041bb9ce51so3263791e87.1
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 04:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695381447; x=1695986247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7sNr7tzE0eMHXnED6VeZ1Ic31a870DhnpLWxrqzl8UU=;
 b=kRQrxCCoTp9U9G8OcxOZPPV41BLiP9qX/+1duW5nVmzEQHMAYKL0fmnrg2h3f29b3z
 /7YnxqrIy0sTdmkdkqzEM7Uqs/PU4zOlU0jhrQA//HuIdCK+dGtrjGmliIht2KzCP9YA
 5Z7QcNMLpfCBa6o3ybpn+a243qDF41LPDGs3i6fB7mf0GJcmqlW4zN8w9logBILd7X91
 Nt+77cj2Sc85PgBb70+smmcsGldl65y7M3AaI8Fe2lasbKFjVEcfZN0mbhxTC1TBYqso
 ov3J97VcyDnF5LTPhiSQpHzoNWBg/q61coHLygFqfSQKSmPN7mG+gRR3ZQGFHZekOQ4G
 XrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695381447; x=1695986247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sNr7tzE0eMHXnED6VeZ1Ic31a870DhnpLWxrqzl8UU=;
 b=VpT6XBnAiRinwgfv+6a/DEVmngLRIKT3V+rYfOuC33T9iK+w8RHKQpPenb7dQNGyE6
 4Ypfqy5Fq6I5hAF03p5K0bYokOdKFi+JMORmCCH/GFLCOln9ZWySr7Tuub+f5ztCY9Dl
 LuxO9/s4JAZdYsvxkaVaTGTPbo4/JAC0Mcq5rH0rjvgnc4PUfIyyq6JMSe1JnsaRQiOh
 k4vHRatGvbkplWw0N0QBum/cTRFQwJ9dZ4xagEFPVnb5Khttl+MLRUZHgru6HI4VgAQ5
 XZ0DW0sk8+pdTGarYtZJCLEiOV3e0jJV3KwGDfHkn27wqLbW91pJAZ4kdXZ5ukz07ama
 s/9Q==
X-Gm-Message-State: AOJu0YxW+K5dA75ZeAzv8le3vtap9Gmg9fqYalM4R1d6e+9elf2pr6ZW
 nUeTYRdwQhgOCjR+lU8ZInhTSg53O6/8P/+Z
X-Google-Smtp-Source: AGHT+IHScDnJhidtyghGc6EG47V+OWp/En5nIxsT75ihY8rdQTxaS2a/S3WrF9tLWlgAB2obP+zpzA==
X-Received: by 2002:a19:651e:0:b0:500:903f:6084 with SMTP id
 z30-20020a19651e000000b00500903f6084mr6328506lfb.63.1695381447400; 
 Fri, 22 Sep 2023 04:17:27 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:1488:375a:eebd:d2f0])
 by smtp.gmail.com with ESMTPSA id
 r20-20020ac252b4000000b004fea1a2231dsm686502lfm.263.2023.09.22.04.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:17:26 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:17:21 +0300
Message-Id: <20230922111721.302657-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
References: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe/display: Don't try to use vram if not
 available
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
index 66b1a25cad53..d4bea9cb059d 100644
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

