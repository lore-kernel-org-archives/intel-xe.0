Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163C5E70719
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 11:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09F510E65D;
	Fri, 22 Sep 2023 11:51:35 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFBC10E65B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 11:51:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50317080342so3477240e87.2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695383490; x=1695988290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ysd5SG7KtAev+0mH6WMW1YHGkhbY6sSXhZjqUeVLPfY=;
 b=JW+wmEbsr5rJLVdr2155NahJQBjNhlCV6bG+JMU69OQpoqqLz/P3TrGNCboJTyc6Fm
 G0NVCLLO7XYgilfHlG9uVij0dGjT0e8VsLSiP02hy62w5B9sDzn85tgIRFA3jKNyN5CF
 y48zL96MS26TwQaxk+LU2zn0kwPHauvsOMPp94YjOZIGD9WojVU5GXvEM+4oS0sHwPd2
 S8SfOxCnzEy/gwaCqae+xW3jSV36071Slk2VwNbYGRlVvGAM1rdo1AJThhe14metBUcf
 MuH9UxI3wbCNRc1nkulkOwucw3xPq/0q+DFDgZG+BByvmn8U4h4DOMdnofw3gGBbUA/m
 6MGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695383490; x=1695988290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysd5SG7KtAev+0mH6WMW1YHGkhbY6sSXhZjqUeVLPfY=;
 b=hkbtRaqwHNbCLQYcsUaE/0WgABGmG8+hM+BBWwGFEzvT1axZ1EaksoObyf61haJSHX
 PDj0ofroCTGU6N/tkfuNHlJoTKVGPAKp5h20tIGSGHy3QSCDmKysFVMakrkATSVWwTQP
 IOh0hUm0aZG+mcyJjBcRN7F9+zXVENyCeFD1M8fRkbGlmc4iSmsaHgYB3JUS9nLJNrqx
 vaj4Axx7TwLQ0qPi575vzhaH0IPkOeLdKNFROoVzYyl1dka3WFISAxOy9v5/ShtuWPLD
 f73Di+pjpBGE8awv0jhC9dP1y5/YrSNcNUIsH/CuO5F8HyXQ5d8TqeelgNY3PJwL/qUE
 YcHQ==
X-Gm-Message-State: AOJu0YwWmuE114ipxDd+qNixwJpZ8ApOOE9/DZzJDu3AHRzIA9I5CThd
 uwnK4I2xcV/LBBEIqekDB0V37KAE+fPMUvmb
X-Google-Smtp-Source: AGHT+IHY3zqpJGmehfK+khjw30IIv0QxDXhXTFD/gqlHr/CK0wVc+Uin3cabcbDYhX5WHl3UmZVduA==
X-Received: by 2002:ac2:4eca:0:b0:503:28cb:c073 with SMTP id
 p10-20020ac24eca000000b0050328cbc073mr6790910lfr.58.1695383489501; 
 Fri, 22 Sep 2023 04:51:29 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:a3c1:45a8:51d0:6c6a])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a195207000000b005009d5aaaedsm700508lfb.172.2023.09.22.04.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:51:29 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:51:21 +0300
Message-Id: <20230922115122.305107-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
References: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe/display: Enable remapped display
 page tables
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

Enable usage of remapped display page tables where needed.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index b64670a35588..ce52861a7dd4 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -76,6 +76,9 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
+	else if  (view->type == I915_GTT_VIEW_REMAPPED)
+		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
+				 XE_PAGE_SIZE);
 	else
 		/* display uses 4K tiles instead of bytes here, convert to entries.. */
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
@@ -104,6 +107,18 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		for (x = 0; x < size / XE_PAGE_SIZE; x++)
 			iosys_map_wr(&dpt->vmap, x * 8, u64,
 				     xe_ggtt_pte_encode(bo, x * XE_PAGE_SIZE));
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
@@ -220,12 +235,6 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
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

