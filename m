Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20D6CD6E60
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 11:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A386C10E734;
	Wed, 11 Oct 2023 11:54:21 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C12B10E72A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 11:54:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50437c618b4so8545957e87.2
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697025257; x=1697630057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8czP+8K5Z0HI9Aap4NmxjzpTi+BVwWYYQK1QnQFEt1U=;
 b=hxxU4bmtzyaBZtXowBx/jpFKmpkMIvDXBVXn172gJ78Lk5Ns86hBQWPp4NX2yyRzwv
 w7MH6617tHyl2YXvABKNEm5b5U0ZtSCXVFq0bpLtxD/Vkap75X0vU0jhmr8vQnqwUlKX
 zzDw/Tpp9PBIyXOZfe97Iq4Z7+xhpOWTT0Xhe8bQvIuxFeGPU9BEKhuVazAsXTvZuKOc
 aA7N97kXMQkpejI/WMXtVzi+jjgCcudn54IL5GMlhgHTX1ekXVMz4sQ6mMNo8aTufmVN
 PkTGUWZwB3lDv7ba/1k1+qo2N3YliN8U525nMN74TJc+v9J5KPgM1oZ1ov/DkEOC/+Ry
 3dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697025257; x=1697630057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8czP+8K5Z0HI9Aap4NmxjzpTi+BVwWYYQK1QnQFEt1U=;
 b=VSYivRLbyVk6XqobDwYQ703SQ8jqYg3f+404ZXtzyVOdkFpGdRbswW7sQ4kjokxHTE
 cOg0tFV3GQKU8sXpg4x4EWLpDoz/NcivTk873y4/aZLBaccNA0fpEE3pXE+XOfgsw8LR
 L0Dqe4TnqlaIHTsWF1o0IEg4EmCtt3r6txCdrrC619rXcbCcux3K5z6isd1xhnUX8kPN
 Kxozvv7JI58Y++TCDneq7CIv0pK607P4QR2cVis1rQNv3UtF5rft8mh+xC2dDAgQwuq8
 pAj/WhhHDjEOxwRGrHCPZiaYiNf1+1laOw90STdlpXUk3poU6czofSO6LP1GHsBne+NJ
 JDPQ==
X-Gm-Message-State: AOJu0YxWCU3mgdyHsQukUddBplAQRs4MX6q0vuCZG0DhAYwgaKaaaNWQ
 S6dR59zurSDTwXvoyXTn+ihxYtRJSo1OQg==
X-Google-Smtp-Source: AGHT+IG1wzLaabyUFj+76TcdE4qxoc7f+Du3Ee/dp9AZURfya8E/2mUZ6Y602Irjkvd7KZoWGJ69gQ==
X-Received: by 2002:a05:6512:a91:b0:500:bf33:3add with SMTP id
 m17-20020a0565120a9100b00500bf333addmr22772698lfu.47.1697025256749; 
 Wed, 11 Oct 2023 04:54:16 -0700 (PDT)
Received: from jheikkil-mobl1.home (77-105-100-22.lpok.fi. [77.105.100.22])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac24d01000000b005042ae2baf8sm2234752lfi.258.2023.10.11.04.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 04:54:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:54:10 +0300
Message-Id: <20231011115411.401900-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011115411.401900-1-juhapekka.heikkila@gmail.com>
References: <20231011115411.401900-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/2] drm/xe/display: Don't try to use vram if
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
index b7a04fba3585..68cd406b8104 100644
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

