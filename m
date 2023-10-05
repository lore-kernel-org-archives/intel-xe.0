Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEB1E92725
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F6F10E482;
	Thu,  5 Oct 2023 18:34:12 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BC910E480
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:34:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-503056c8195so1735055e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Oct 2023 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696530848; x=1697135648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRy5oW8zjI+9x/yJukPEJud42Wtu12QO3ZFhIsvzEz0=;
 b=ZA+VtpbyJ0HHVat7+aQsRMpwZT0VUSlsd6B9s9UC6HAkeeyEcVKMdzRep/X6DErxHq
 mbHLp7qmtETJBexqyGY9QK19JZOoIxGusfYl426nS6VHqJqz35rPx3ka7mAy85D3A/lq
 J68KR8JCk5mWJf+RF0xiUr2nnXF4p3WiFXlMBbpIIwUduWw7uYgwLvgEZSr1iZdLXHkG
 4iyi/1LqgVG7iqQIWfGMBJidHuo92PwcJxGDL8uEfmynRihRGKvxtrKY5SB8WJ+TDgdd
 OrkW8hBXsHesfB1HjFzwWDeeCoVaRPmZeZwiKKB6lvpXNDQldgHvqbzs/0Ot7ACJsGm5
 FM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696530848; x=1697135648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yRy5oW8zjI+9x/yJukPEJud42Wtu12QO3ZFhIsvzEz0=;
 b=uJX3WZDixe7yYbilTRjWXmyTQOgQlvh7OiC5VqiWNZM6Fy27MYva5ijkqSeUbPMx6h
 GWFg2qodPrbgYYUbI76nE4VWDP9cvBxRXdDCoRjvKaee6g8m5OqTTX2drIXZVea2D/4X
 4s7QzzT5X6WERYiV8YYnTKfOQmwhXyrydWirPNHEXxuj8iWHHQxGwJyibOR2p/UwdC9Q
 TmnGWbX4fYeV+tk+pp+7msGMYiipK8uXjZTVLdPewZ2ysWBgx6RPT6L6vWGZd3k/HG4g
 EjfSdEIhQanmKf6vob1oWRs01kcVoB/7szbbjs1KRDuCJny/8XFIX2KzAFFcYZ7EQyMx
 woRw==
X-Gm-Message-State: AOJu0YziJm4yGCLVLwcDYP5xNB/jyGAevq/iwgWmtANBgisdb4IxbHYd
 yEJYzq1N3pHhxZHc61HKGLW9X4PqhikZAx5m
X-Google-Smtp-Source: AGHT+IFFcrtIEv6t35mgE3J0Dy1EMtafULBPmEco/pBL0CWRsr1nLI5TF8vTTT4W9PSTsNaMTH/jWQ==
X-Received: by 2002:a05:6512:2009:b0:502:ff3b:7670 with SMTP id
 a9-20020a056512200900b00502ff3b7670mr4417035lfb.4.1696530848376; 
 Thu, 05 Oct 2023 11:34:08 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004fe0ab60530sm393967lfm.49.2023.10.05.11.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 11:34:07 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 21:34:03 +0300
Message-Id: <20231005183404.324835-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
References: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe/display: Enable remapped display
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
index 8a1cb6c28eb0..e8e38091c8e6 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -88,6 +88,9 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
+	else if  (view->type == I915_GTT_VIEW_REMAPPED)
+		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
+				 XE_PAGE_SIZE);
 	else
 		/* display uses 4K tiles instead of bytes here, convert to entries.. */
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
@@ -119,6 +122,18 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
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
@@ -240,12 +255,6 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
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

