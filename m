Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A0CE81E00
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 13:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8C810E4F7;
	Fri,  6 Oct 2023 13:45:51 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A5410E4EE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 13:45:49 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c012232792so26444681fa.0
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Oct 2023 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696599947; x=1697204747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRy5oW8zjI+9x/yJukPEJud42Wtu12QO3ZFhIsvzEz0=;
 b=TYr6pgc+RzYDNQm+unfgX/Xw6NLus4wMIrwoFaf/6IH00BVZfyvFBkw5+8wWSXbeJ/
 FdGEYpL6agu0lqju8czA6xPMfj3v5E9qSLmac2mNrM2AmZ0e3j3BrwXSbHmoraJnd2wQ
 /WJhXTA4WU9XXJUS5Kq3K3Av4WgIOlsYjCiBVELItoiORt+bg0dQf+vm6tcbrMEtUamm
 NXep8NRxgPd83kyY3qrwDFZJY4zb75pwNXHbKvw9g45zqUVshdK0IsY+1AO7jdip93ZM
 RzoulR9ZtQkhcB0ESwsgvM70dO/iicizXMl/dB7/mxSRLFDo3t0soeEVzoVD8Gj1FdT5
 L2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599947; x=1697204747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yRy5oW8zjI+9x/yJukPEJud42Wtu12QO3ZFhIsvzEz0=;
 b=izk+5qjQgK4nRFJZiXSQzhekyN3pUQHQAWqq9DUybYmhWXxQNU4RRur65007Oo0x79
 1o50wAwm7h3/Hh03nDBlt+6bgYrthO6YOAxw0ZV9QOmuGYK1P1MAWvg8CN6Em2KWM8oz
 pamXgZmTx7KA+WdxkPVygWw0XVW/3pK/+Z6KADJck3st4lybTSuUUbOtpVg1yM2Dlo6j
 NZpDUvTdIBdKjFwYPNnq4U4xpEdMKmq/xtkDczv6rJT68LSCOOlqDSbyRZu1xum0cNh6
 bOVqRmfdpaU+3slaW8eiCO5LOsjNiQeV5tbSnoAlJEJ7Wzc+Gu/+2kN/uLfAQzaSfXL0
 FPug==
X-Gm-Message-State: AOJu0YxVDLPrMzG22o6fh7yEsx0R5WQ+EUo2KCFicDWuUFLmMn287E/z
 qGNx2b/f4WCd94gQoUytNc6dXbjMjf92Tg==
X-Google-Smtp-Source: AGHT+IG22jkQ6nN0TK4aT9BwqOlbFpy5a4Bzt8RnUUZ8+rTUcEV+KHjBSQYhcqRJiyFnH6y1ljBvcA==
X-Received: by 2002:a05:651c:144:b0:2bc:d94f:ad04 with SMTP id
 c4-20020a05651c014400b002bcd94fad04mr7050964ljd.13.1696599946781; 
 Fri, 06 Oct 2023 06:45:46 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:a61b:a4af:7772:362f])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e3505000000b002bcbae4c21fsm794576ljz.50.2023.10.06.06.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:45:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:45:39 +0300
Message-Id: <20231006134540.332716-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
References: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/3] drm/xe/display: Enable remapped display
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

