Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4442E92727
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9972410E485;
	Thu,  5 Oct 2023 18:34:14 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7699E10E482
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:34:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5031ccf004cso1635298e87.2
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Oct 2023 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696530849; x=1697135649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rCUE0T4VFTxwnDQZ3cvgUpXEy7lxMAwr+mSEWUdgWw=;
 b=RxqVRgnf+1WubMa7nJh3S7y2VJqJxgoLEg0qITvBmf7MztEbOYBTkbpm/qt/Hhdod2
 sdkJ/liMeCbLu47zkYQWA32zJ3GJ47mBN43i0g+XDzeDPbQ17raHY9wXNsJ6sE/HtXEh
 jd3ltaUb61UMuxWgSLALQ1a8grANwHDuxKTJq6q14MCqUJd6DFWK9wTQS/74creOnpmz
 aTnFcbaNUE2+QuEOH/6YHz41WonCDMAPo8SSJ3sSbhLghHK2VdGgsUt+CGVXSkLDBLGg
 jjqUKzkhQJiXPBotMcpWSnoy6hNCQOWwlFLWbJ/GUm6yGypZ7EZ4zMPYW2UJnckIxuaA
 1ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696530849; x=1697135649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rCUE0T4VFTxwnDQZ3cvgUpXEy7lxMAwr+mSEWUdgWw=;
 b=Fkv3FqPTUJEfVzTp6jHpMYKD391F3NOb3RwwZSBIbvONngyvDfoKXO15v/hlGuzfNF
 9VgK/PHcgE/XY/TDFZ36083IPXasUBU4Jz/wnplS96MQfU+cnSCraIm27CnfFJaqoZoq
 4BTPJ/cURmW2eK1wibKUMbn0w38lcrdVqXXNB0p/YXO+BJdL9wFECRMZ/VpVSdD4QdYS
 Q4HR8ccCXxOphd9KrHp8hIpV/wU9JDAXLKzHpvvX8CWIRzFE7q0hiPuWM1EVXAykiYRz
 rKl0k8nFP1iNMJ2AcsqHN+atsIs/VQFkmJyiiY8Rnx/V4mS0hsZWTtMyI4XViSV6KojZ
 AsQA==
X-Gm-Message-State: AOJu0YzMq4MzVR2lN3dmva94OEgdiPNAvbasmJowLtxFEfDp7aGD3GNR
 etfgNhUmGYG7Q2RHmcldFRyaYrTAzOqUWP3S
X-Google-Smtp-Source: AGHT+IHDZMzUcejuf6jJpZAsm8/uo0LfchFzInwC0odz7APg/bcIKZQ/C3xWme+McN8PANhpD9rg5Q==
X-Received: by 2002:ac2:5f64:0:b0:4fe:347d:7c4b with SMTP id
 c4-20020ac25f64000000b004fe347d7c4bmr5180911lfc.7.1696530849309; 
 Thu, 05 Oct 2023 11:34:09 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004fe0ab60530sm393967lfm.49.2023.10.05.11.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 11:34:08 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 21:34:04 +0300
Message-Id: <20231005183404.324835-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
References: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] drm/xe/display: Don't try to use vram if
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
index e8e38091c8e6..a79c2416579f 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -83,7 +83,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_ggtt *ggtt = tile0->mem.ggtt;
-	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
+	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt = ERR_PTR(-EINVAL);
 	u32 dpt_size, size = bo->ttm.base.size;
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
@@ -96,10 +96,11 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
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

