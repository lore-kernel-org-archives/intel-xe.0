Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3870E81DFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 13:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D71510E4FD;
	Fri,  6 Oct 2023 13:45:53 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFE110E4EE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 13:45:49 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c038a1e2e6so25363861fa.2
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Oct 2023 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696599948; x=1697204748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=99yLP84bG8IVFotlF4Hkaz8wwwz014rolprTvbphPd0=;
 b=H3/gEjY3Cf70Vvc0mI8NDRl1IyTYrNa0UcWRO2fYrXIi/Aeb3dVHPzUqbCGRCTPBiA
 Me3yoywaFudLoZ/rmJsZ74QLjw6aFA0gfs8L/Thn01GFoL8jBhkNh/8CNcBnIYFpeTBC
 Sfgq7C274dPqZ+mq4xB8WlrDM/7FXtroVh7Iz17zsQ1Z0W4FWpvG8dxX84RgR0SqJoqL
 hrv6SYsGkyN+bNKMRVfMOfwUJn2Dx5YQhgfe6OA6ZELOzt0+n4MJYh8qCvk285jMWMdL
 tOfYn9iHQ21ueupgnufqOYEiPd2GxFolsNfi26RIYFHZ6sQArGRn9DyDk1itWW0Th+WD
 KrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599948; x=1697204748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=99yLP84bG8IVFotlF4Hkaz8wwwz014rolprTvbphPd0=;
 b=HR52THlaDoh5GzcFLds6fR+WiApnb4uD9XbGAT2KPP+uJYPXSp0v+b2BhwlLubi5BU
 cAfv2sphRSOQTNbQQp+fLEXHhdnhZKFf3Nnimp0tYtrk4PBxsKGW8D20T2NISr/7g5+g
 UpO/vrQStUs749CHG6UhWjdcn9npD3zilOfSQ62b0GSVkK1ra8VBNFFNjbNREN1Abhu0
 TYb4dNzEDyHW8WfGIg2iZ39BLaVmVBF/7E+7eNHx3il0Vss3F7z/6m/IS3peYWHzsYJ/
 /LCGdBXGxk3WeJqjhuJod5wAWNIsTyprvep+W/t/DgQJo8EHOwjTUn3J+78DVaPmLB1G
 ODIg==
X-Gm-Message-State: AOJu0YxrZpzXigOoKFkpC+9c3CLRzoI8JGpY+vZ4QNLrVE0bin6LHnsZ
 4TMJm9W5cFhU7RI/QfFIRPEiNYK6HhTHaQ==
X-Google-Smtp-Source: AGHT+IHQZgjU4gTEuJ87QlFS/6GGWeUc36QTWBxtzjgM6GMltVYlDNLmn+BGJY3O4XmnCS1UDDoo7g==
X-Received: by 2002:a2e:a283:0:b0:2be:54b4:ff87 with SMTP id
 k3-20020a2ea283000000b002be54b4ff87mr6371612lja.40.1696599947611; 
 Fri, 06 Oct 2023 06:45:47 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:a61b:a4af:7772:362f])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e3505000000b002bcbae4c21fsm794576ljz.50.2023.10.06.06.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:45:47 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:45:40 +0300
Message-Id: <20231006134540.332716-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
References: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 3/3] drm/xe/display: Don't try to use vram if
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
index e8e38091c8e6..c46fee304f92 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -96,11 +96,12 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
 				 XE_PAGE_SIZE);
 
-	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM0_BIT |
-				  XE_BO_CREATE_GGTT_BIT);
-	if (IS_ERR(dpt))
+	if (tile0->mem.vram.usable_size)
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

