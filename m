Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73798C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 14:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CA410E0DB;
	Fri, 10 Nov 2023 14:45:51 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2F10E0C9
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 14:45:47 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507bd64814fso2966537e87.1
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699627546; x=1700232346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7cA3ceaXYweMWEOc9+k8MYniOpRrwKMPZQqqwRukBc=;
 b=UxRIrfmrr6wsG5SrsAWPZhQ0u2xvJ6k2j0v0xvHFNhbOdIS46lpqslL75JF5cyjxT1
 +m55avRnoGBODMREbTpM5XdTHiH3WT8bdNLTyhXA9FQHd5W1ZXFGXDDNwqcl0yI6VWl7
 ceMZ70dvibSHkr5Io4hq045hM+Ak5qh406vMYqzkDHAIuHb86TbQlbtZwTnts4foBmaw
 pMucwU29o2nkQua0ylR0HH8hbDqMsNwx4hWLIPyQpHLSUz2IDrSHXHnJ5aC7Z/ceuZMH
 U728V6tVYezdZjhE0iDP+UyK7PIKUMnDsc/xOYD6OahAqDBvBm9HxHS2Nm4gSscuNyZK
 QamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699627546; x=1700232346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7cA3ceaXYweMWEOc9+k8MYniOpRrwKMPZQqqwRukBc=;
 b=eI59CTd+e1lxYrdHGlJpGEe2ZDk0aycylkUolyx4PGOAuuvLU6UcaJB7n4weEWi2LO
 0D6jyr2UA8YTPX+PZS/77R/qqGJq2dTzIwRijRCts6timil9pKbNEU54Dq8Hrz5fhqzl
 NUXFS39WPZ6c0BVsMgamAnJYbSXpwiXYHZOWITNgTMAljS6idhk8USVqD7wswFva2njD
 R++xy0utA2uy8vD8vXdMRqSlBvtRhtobC3hjnDmHtNXblmWpEjSbgVJ7Cw8+fcvsAcqW
 BQJ3k9LdFLmnVhVQc0LBXWXCom8pEXJVOzLCcedYaN8HKEZDUbSUVEdMySYCdPy225R2
 4hGw==
X-Gm-Message-State: AOJu0YzZ1M4RbvkAX74LrfrLR86AdYiGM+VpTDZrV1iPBlfe+R/zYFAp
 CEIwPjBzBXbXfB9fdATlkettVRljYzs+0g==
X-Google-Smtp-Source: AGHT+IFd+26XNpu+DWmHrRDpkgaHtcT3ODOEVeBlRIdGcFYQoUmHZ1R/Ngel7gTXgH13wRakXNp4sA==
X-Received: by 2002:a05:6512:925:b0:50a:6f8a:6461 with SMTP id
 f5-20020a056512092500b0050a6f8a6461mr1780676lft.58.1699627545853; 
 Fri, 10 Nov 2023 06:45:45 -0800 (PST)
Received: from jheikkil-mobl1.. ([2001:998:22:0:c7cb:24:1577:4029])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a195f55000000b005095614210dsm1441547lfj.241.2023.11.10.06.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 06:45:45 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 16:45:36 +0200
Message-Id: <20231110144536.76914-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110144536.76914-1-juhapekka.heikkila@gmail.com>
References: <20231110144536.76914-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 6/6] FIXME: drm/i915: xe intel_fb.c
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

