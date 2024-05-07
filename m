Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE15C25B5F
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 17:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BCB10F9EF;
	Tue,  7 May 2024 17:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aY1ydg8k";
	dkim-atps=neutral
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC8210F9EF
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 17:35:45 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51fb14816f6so4281091e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 07 May 2024 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715103343; x=1715708143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0LMnrGubJcfAhGmrHPwUAbUiFM8hfIIsFfdUpNhuKS0=;
 b=aY1ydg8kLe+Uo5ZWKfUDfdoEtbsLZr876qYKHpoQz3VadDW0MgInJ3Py7BdydAitXY
 iiSkoxQbFy1gwJja2CuDTbOTzKCZuIc0dYxDGqeblMSOJd4rcIk99VaXxHpsGfQEriCu
 jbzzrRfZY2M3tixlLYYKWb58arCY58Pnc2beFTxWQpmSnBFqYFV/Z3Hk/1B9OdZcJS95
 B/JEkjbecqsTFOld3Oiwzbn1lBr/5O4f4mMXP43ABUoycpI9j1VElI4Uh+9kR7SAEQQ8
 yPrj3gGhM3KhE9Cu+Ex4chzo6RyCqzNEygDcm1qzwB0T6jmXZCYHPQcH6QfO3o5GrL7k
 n4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715103343; x=1715708143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0LMnrGubJcfAhGmrHPwUAbUiFM8hfIIsFfdUpNhuKS0=;
 b=nAbndc4GevwpDZqZcnCpAzelsff/ccNxu0ouX79OnJwiQaEkfllHQ7YEZYwlz8WTfT
 1vcB9GVpCAI9I81i1AgZQloHRBbg7BaJs4C2VGmSUQbICx7B2HVLDyiFV/QAkCeZtAgS
 2lrsR5HHT8dZ+maeoguAWmbxDkMKF5INItXRlxFJfMcr2c43U8hcJeCH4xdjDyql9cY7
 a/iA+90IkQtetcs62RkI+IdwVtOyJYBJLUDG88P4R5bUr3RXJUBG5heNDQNcRxLU59i9
 kN1LxWUcgn24rOub2pJEpQfYCXv+9tvJNeGjrvlKDu6MbgTNQ7Bg/dyjaXYsC/Ndqz1K
 olCQ==
X-Gm-Message-State: AOJu0YyHTkASO1dMltMMDkPv58oyDNyZxcks8yX5j4DuMwh0w68LqVW2
 vcZZ7zBHpT+EOvOHdrSJnirOkTXYJny1fKypB7yNRkV3kILE27EooriJKwuL/P0IqA==
X-Google-Smtp-Source: AGHT+IEgtKlhRmDaQEgZdCJOHxbuCTFBUg162igEh/7rmxsoq3dOLP2W9DdlouyQAfB1ZExT/R6gvg==
X-Received: by 2002:a19:4314:0:b0:51a:a400:785e with SMTP id
 2adb3069b0e04-5217cc4ae2amr128142e87.43.1715103342333; 
 Tue, 07 May 2024 10:35:42 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z7-20020ac25de7000000b0051d54e7a40fsm2201709lfq.301.2024.05.07.10.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 10:35:41 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/xe/display: limit dpt creation to device where it's
 used
Date: Tue,  7 May 2024 20:35:40 +0300
Message-Id: <20240507173540.402185-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
References: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

If running on discrete graphics dpt cannot be used from system memory

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index bdb0dac5600e..b52eb15c150e 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -89,24 +89,26 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		plane_count = ARRAY_SIZE(view->rotated.plane);
 	}
 
-	if (IS_DGFX(xe))
+	if (IS_DGFX(xe)) {
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_FLAG_VRAM0 |
 					   XE_BO_FLAG_GGTT |
 					   XE_BO_FLAG_PAGETABLE);
-	else
+	} else {
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_FLAG_STOLEN |
 					   XE_BO_FLAG_GGTT |
 					   XE_BO_FLAG_PAGETABLE);
-	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-					   ttm_bo_type_kernel,
-					   XE_BO_FLAG_SYSTEM |
-					   XE_BO_FLAG_GGTT |
-					   XE_BO_FLAG_PAGETABLE);
+		if (IS_ERR(dpt))
+			dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
+						   ttm_bo_type_kernel,
+						   XE_BO_FLAG_SYSTEM |
+						   XE_BO_FLAG_GGTT |
+						   XE_BO_FLAG_PAGETABLE);
+	}
+
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
-- 
2.43.2

