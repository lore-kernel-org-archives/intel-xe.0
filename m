Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8E6CDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 13:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAA010E4E8;
	Thu, 12 Oct 2023 13:52:21 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB2E10E174
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 13:52:18 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-504427aae4fso2563392e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697118737; x=1697723537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrBsj4Yl5p1NcDT/Q8gPNQVAFzlK59sCq3cTVWQX9q4=;
 b=ZSxIQFbPZTsjnFSNTygjKzl+HZ9JCLynhj3PZdG5m8UBU9aR4Vm4DEnIEQbgoCylgQ
 epXrdS7NbzaJ3cQjaDaJWmL1GpWn+D6y0HabLzw+9l49QS3ufg/K98s4UhhlZ2pyVKx1
 olEOYYMv/zLR4W4eFuTtG8GJxYrrR/naBtaPw//pEdSD/kIROI+bq54WA8EzLluRLvvX
 LDqq9OgyAQcpzXzMPOCYKXeQRgLqvNl8HU5QjtBGIuXmkflFVAwyOiiXP291VUgTTky0
 yFRiGcdjxoPt+B8DFUN+m76h30hhFftm6nNhXyBWW9eulgcnUeSKw37QQwdMdWKUfQqU
 QUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697118737; x=1697723537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrBsj4Yl5p1NcDT/Q8gPNQVAFzlK59sCq3cTVWQX9q4=;
 b=NXcwWMWypuNI45NsCArZ9acCnFUfubbJrljPGxPLiZmJ983Ma/k3i4u0CVycb5n/gA
 fnzuDzhzb6ZAQ1hL9+LHGKDLOXl8AIRi6QDHLoUPCFou/98/y0GDCfo+u+kDwb/bx9fo
 HUTFXnLvzA3caTlnXNTuYfhOwlN9WATiPwrqgS0YasS/aq9ly9UIdZuEZeUUe43Xoqs/
 yGUj4n++YT/sA63A8BN5HVHSC6AqbKHD+gAN6AkA6DneIOwK5hk8QxejGZQqlBAiTXg8
 Z4xFj+bzGyjr//bDTw1h/hDRq2s+XEeACRWPCLlMDtWxY3GnP6vDkQj20AXMrb3rw66v
 0OxQ==
X-Gm-Message-State: AOJu0YybjPOYg2rpcI08vyCtdtvLVVoLKW3clVgmMWsRq2FXqdrxLRyc
 GuQeBcixSTM/d5YVPvchG5ecLlOZcZgtjg==
X-Google-Smtp-Source: AGHT+IG4XV28mRZNcKTOKhLFNAqXynrexL5vJ+wH/KKSi3fYHrEPQ/HCuc9zm96cB9tTHkpFjARkig==
X-Received: by 2002:a05:6512:12cb:b0:500:7bf0:2b91 with SMTP id
 p11-20020a05651212cb00b005007bf02b91mr14576914lfg.13.1697118736342; 
 Thu, 12 Oct 2023 06:52:16 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:35cf:7415:ccda:33ca])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a19ae11000000b004fb8a2b9485sm2826361lfc.248.2023.10.12.06.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 06:52:15 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 16:52:08 +0300
Message-Id: <20231012135209.403827-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
References: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 1/2] drm/xe/display: Don't try to use vram if
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
index 2c36e5032433..89cf65c58191 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -62,11 +62,12 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
 				 XE_PAGE_SIZE);
 
-	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM0_BIT |
-				  XE_BO_CREATE_GGTT_BIT);
-	if (IS_ERR(dpt))
+	if (IS_DGFX(xe))
+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
+					   ttm_bo_type_kernel,
+					   XE_BO_CREATE_VRAM0_BIT |
+					   XE_BO_CREATE_GGTT_BIT);
+	else
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_STOLEN_BIT |
-- 
2.25.1

