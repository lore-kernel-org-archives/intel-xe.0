Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031E2C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 19:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25F710E410;
	Mon, 13 Nov 2023 19:56:48 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED68710E191
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 19:56:44 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-509c61e0cf4so5580510e87.2
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 11:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699905403; x=1700510203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hs4VrXO2nC6ozyZcocPOY1u2lyrgorO42G4X9LCj2Uw=;
 b=WZTpZ5fqJxDVAbF6xQx7jnkWmoUmypnu9wK2WE+F9xBaXKTQOsFz2wWCVE0vyZSxgN
 PF+rJ9SdDsWN4n0BhfTEyDeTaLKF2vHgx2iQN8EupspXz6/FGMljf5A/oJPqDIkMIJl/
 7rLvZIfCFlgr20Q9boFEFCY1E3D/Yvcf43Pn8Xdxp4SQIufubSxKj8rlw1XeLC4gS47+
 k7B1vYyQ3GYw8Yg4ydvuvtgZ/x4dBLGF1GxVcQtoH6s00RagGSpOTsQL135tA4X/d3hg
 JOXSBlufRSzT9lp7JYD8es4JJ9bC8HNHRW9xd4RECgQM6RXW9fArCGYbW18p60QY+ysx
 BpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699905403; x=1700510203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hs4VrXO2nC6ozyZcocPOY1u2lyrgorO42G4X9LCj2Uw=;
 b=ZDJmfHsTpddfrtoYNxFSMNxxq+rTsRzXKm8oXOtzWFNeSTLJHkMXHiGR3c46DD7NAJ
 JTwYXQR7EQzSzywGpGTr4DSEh8PlPslVqsuorynKp+fbgDzXp16ofzuMp99gry8+VDqM
 fz9zRnIVdWxPwtKGA46xXj3iDnpCRXs75GUv+rwP4zfsirPOAffxAP5su+4Kwzru2OUY
 ZX9hMB4ObQ7fSatKbHnx8g7AnE2LmYU7XmGiGUb1gDs6QRTmexcu0w0+Kd/HDVL4SFQO
 vAziOad3FXnWu1yb710wEidIfuxQKN8Ai96RzvKQAu5O8jHcgB1BgmM6jqKZVgT9ikUS
 gmhg==
X-Gm-Message-State: AOJu0Ywhsc9BktWB5EJ0yYYVWubLNsM+kTKuyqqWBlveL1MTihON6IxV
 PNAqUV/idA0sOBtgywCpUWvUACGiUZT7iA==
X-Google-Smtp-Source: AGHT+IGfqkR7EZzZ4nv4Ried1y3+2cfHYMovkYSnwQy6rsTLI4LYKGNxhFIVdEQUCexhRnN5eKLkmg==
X-Received: by 2002:ac2:4d05:0:b0:509:8d88:b770 with SMTP id
 r5-20020ac24d05000000b005098d88b770mr5356626lfi.39.1699905402705; 
 Mon, 13 Nov 2023 11:56:42 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 t25-20020a195f19000000b00507d478c211sm1068710lfb.76.2023.11.13.11.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 11:56:42 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 21:56:32 +0200
Message-Id: <20231113195633.119188-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
References: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 5/6] fixup! drm/xe/display: Implement display
 support
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

---
 drivers/gpu/drm/i915/display/intel_fb.c | 16 +++++++++++-----
 drivers/gpu/drm/xe/Makefile             |  2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c  | 14 ++++++++++++++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index a21b312bc54b..f7675284907f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1885,17 +1885,24 @@ int intel_plane_compute_gtt(struct intel_plane_state *plane_state)
 	return intel_plane_check_stride(plane_state);
 }
 
-static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
+static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 {
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 
-	drm_framebuffer_cleanup(fb);
-
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
+}
+
+static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
+{
+	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
+
+	drm_framebuffer_cleanup(fb);
 
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 
+	intel_user_framebuffer_destroy_vm(fb);
+
 	kfree(intel_fb);
 }
 
@@ -2166,8 +2173,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	return 0;
 
 err_free_dpt:
-	if (intel_fb_uses_dpt(fb))
-		intel_dpt_destroy(intel_fb->dpt_vm);
+	intel_user_framebuffer_destroy_vm(fb);
 err:
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 	return ret;
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a1a8847e2ba3..b82641dcca70 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -201,7 +201,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_dp_mst.o \
 	i915-display/intel_dpll.o \
 	i915-display/intel_dpll_mgr.o \
-	i915-display/intel_dpt.o \
+	i915-display/intel_dpt_common.o \
 	i915-display/intel_drrs.o \
 	i915-display/intel_dsb.o \
 	i915-display/intel_dsi.o \
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index ffd35a59f405..722c84a56607 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -368,3 +368,17 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 	__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
 	old_plane_state->ggtt_vma = NULL;
 }
+
+/*
+ * For Xe introduce dummy intel_dpt_create which just return NULL and
+ * intel_dpt_destroy which does nothing.
+ */
+struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
+{
+	return NULL;
+}
+
+void intel_dpt_destroy(struct i915_address_space *vm)
+{
+	return;
+}
\ No newline at end of file
-- 
2.25.1

