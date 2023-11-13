Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DD6C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 19:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A0C10E408;
	Mon, 13 Nov 2023 19:56:47 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010B910E410
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 19:56:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so6607710e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 11:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699905404; x=1700510204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7cA3ceaXYweMWEOc9+k8MYniOpRrwKMPZQqqwRukBc=;
 b=Kgfw10IMP95rJ2FRehnaL1X09ipB1YoUaba8yFL+ezy50pX3BVZKlo7R78u/I22dpg
 8tpdOaccOYlEdvdgtjUizOg89nWmvkD/rAjUwqFJGSi1rflA92Vwbm2OYR9z0XfqJgVE
 TE5YOO0zjcmnynBT/VRvC8esWls96tvPoW+RsOHPUlpt0bL28u0pHR/Loygq9cbS4KZd
 r0x5XllbFScGdkvkt5W1dLAiwxhNSw9BCQ49yuuInra4hL1W5GZ4SA8TYCBJr1TmnjOX
 Z2MEwyPKSyrNBQh/nbzZDMOR96a8A82zi0STdLzYw++mTI6+GszLtDkt+71fc3b5llTp
 aqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699905404; x=1700510204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7cA3ceaXYweMWEOc9+k8MYniOpRrwKMPZQqqwRukBc=;
 b=wIxm7KPmCC+SZD26N0AEaOlTtTThDTt1iy2Rh6FWcinG8Akc/ab3R96MCW9vgSTlwE
 ihZ3B1CRRD03xjUAokWnitzsuT4rIF+Mouxh/ftsBcCGbsudHC2ZvWhiK7pTtD39zWtV
 t9WR3epqOXLwoR4mz7ogylxnUIXs5LBz2gnbqYf2nAhLjBAP8N8Zqf+jlk70sOq4KRnE
 SXh2hApKV2R9vuMQ1WwJjN5/afFEnv7bf5itmvAzNEawzgBRpCh/afC7yvIMzmFTSfA8
 3z+QZQAeFIa5ngQapGZtELGd+htqx521BcnUAc/XKtVpSW61QEuywFPopZYRhZtWzrG7
 HfLw==
X-Gm-Message-State: AOJu0YwQxqw4t6MnHPG7zxvlOitRE4ySi4i+jKXUUk2myHMz7Hid5CsS
 S8IX79C5Dyl+onJNmXi0G0+E7CrdlqVIKQ==
X-Google-Smtp-Source: AGHT+IHydgTxfsR1Ak3TvQtFYTgWJK0CzetohsH4Ik2PVPkVsSrR+wgHRXSZMrHemqW6dlYtV3UbTg==
X-Received: by 2002:a05:6512:3e05:b0:500:b7ed:105a with SMTP id
 i5-20020a0565123e0500b00500b7ed105amr6559143lfv.29.1699905403677; 
 Mon, 13 Nov 2023 11:56:43 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 t25-20020a195f19000000b00507d478c211sm1068710lfb.76.2023.11.13.11.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 11:56:43 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 21:56:33 +0200
Message-Id: <20231113195633.119188-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
References: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 6/6] FIXME: drm/i915: xe intel_fb.c
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

