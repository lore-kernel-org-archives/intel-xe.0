Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E47C4167D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 13:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B4210E033;
	Fri, 10 Nov 2023 13:29:15 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC4B10E033
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 13:29:13 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507cee17b00so2598489e87.2
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 05:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699622951; x=1700227751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7cA3ceaXYweMWEOc9+k8MYniOpRrwKMPZQqqwRukBc=;
 b=fZHKc9aiVxls+Y9io3sv27VHG9kipAkZG9+vLh4xEiU0uHmFK6r462RcZwiPFdRpth
 3r94LumWGuTr/q9hPEm0F2FjSWfvL8GT3w1ClKWSAIIZ96Me2WtsIWTrWRGEYgnFz2dc
 5+7BFlRWy6k4IP8NlReuMI9kwYj+NFBxpzr4Cg0tzYp197NNBt/eVy5yfjL9hp57OAcG
 AbDd83EpUaogY0BGhYuWE9d8zCoab58+49gko5GAIDuQv/VXAWF+FcNaPQm4Ey8d1g3x
 EA/CgN3/ab9Aj/NZEfT0Sz4j8wEYOJC7zFvxLmwxuxRNoA+rhPwnWcrGTttCroUhoOTO
 pzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699622951; x=1700227751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7cA3ceaXYweMWEOc9+k8MYniOpRrwKMPZQqqwRukBc=;
 b=BljLABwUQuZIc1bAVXG4K+JLrGTUCY2z7NUJOmYW4CbvgugndupTboBrWr3j3mf9tr
 iCvUnWJuRRUYX/giBp7ZtvJvNwioV/KJYBgdqBkPgbQFGjeiQ8E/uDn6jysEhAo8itMl
 J+eIT+XWEWG0NFH37jQgQ0OU9r88laGvya2mopJUthJT1xbBD1yBSfV4mXIG3cxiZ5iF
 TfNFWeO1u8BdgDWg5jq5ctVxhfAPSFWPt++2vvDh7Av6A1fjrTV1Etk+Bp+PYS1Q9cUH
 EiTf7mGLRw+YgB+XZSbplh5VLO6CX8E+xS+/usytHli1FYNo3LvrDTK5drcMqAzXB4my
 L96g==
X-Gm-Message-State: AOJu0YwFhOeTwVlhy6VfIVkef6I812nBponJWQ/YZ3INo2ytt3ltHdrP
 XAU9N91PStU+12+laDIMZvW1X6tf7xG/pA==
X-Google-Smtp-Source: AGHT+IFIzt2+IG3Uy49mMlfokzethSPAWrhI2TsAlfxcECBX4E/xzlBm1SbtrTL+LK4qjvnIetD+qA==
X-Received: by 2002:ac2:4adb:0:b0:509:8e3d:7cb0 with SMTP id
 m27-20020ac24adb000000b005098e3d7cb0mr3466421lfp.41.1699622950845; 
 Fri, 10 Nov 2023 05:29:10 -0800 (PST)
Received: from jheikkil-mobl1.. ([2001:998:22:0:dab1:ffff:74fa:defd])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056512128200b0050a6f98cffesm215621lfs.291.2023.11.10.05.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 05:29:10 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:29:04 +0200
Message-Id: <20231110132904.73357-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110132904.73357-1-juhapekka.heikkila@gmail.com>
References: <20231110132904.73357-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 3/3] FIXME: drm/i915: xe intel_fb.c
 framebuffer init and destroy xe changes
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

intel_framebuffer_init and intel_user_framebuffer_destroy_vm
xe changes.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f7675284907f..16c37a508552 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1891,6 +1891,17 @@ static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
+#ifndef I915
+	if (intel_fb_obj(fb)->flags & XE_BO_CREATE_PINNED_BIT) {
+		struct xe_bo *bo = intel_fb_obj(fb);
+
+		/* Unpin our kernel fb first */
+		xe_bo_lock(bo, false);
+		xe_bo_unpin(bo);
+		xe_bo_unlock(bo);
+	}
+	xe_bo_put(intel_fb_obj(fb));
+#endif
 }
 
 static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
@@ -2163,6 +2174,10 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 		intel_fb->dpt_vm = vm;
 	}
+#ifndef I915
+	/* Hold a reference to object while fb is alive */
+	xe_bo_get(obj);
+#endif
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
 	if (ret) {
-- 
2.25.1

