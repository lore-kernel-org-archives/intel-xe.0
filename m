Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE597C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 18:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1F210F66B;
	Tue, 16 Apr 2024 18:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="miJW/C0o";
	dkim-atps=neutral
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F402610F93A
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 18:14:19 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51935589486so698391e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 11:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713291258; x=1713896058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wi5LVmCxe15hEowGrAzzS2v0zSFH3CVSsWfioI9YQiE=;
 b=miJW/C0o+Vmwz+akWYAsTKk11XfiLXiIQLNu3lESjfPetwx/4ZdFbyDCc1z3rpH6sq
 KAwlB0q8cgcPDd7QwhN539BvoyykYpBQXJ4AY7na6r9HSlMJ7dLNoMfhIDgII0ge/2y8
 RMYftCUhc+FZOhnH2vQGK8SWEVxDO8drjUDIMhsdR3O178co4bgnSeVlzHf9Surfl9A/
 oaNgUDtQ5Vl2keL2KdOa8LVDMvvAdFK2jqWKSOU5vQndXVK/Ibz8SRaoaXo9Y4UXrexz
 vd7Sa/V8ESiaxhq0G4uwY8m7RulgP4fNpq3htofVaAo0uxlDr/iSuJ5L1br3wvwIfmJU
 AiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713291258; x=1713896058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wi5LVmCxe15hEowGrAzzS2v0zSFH3CVSsWfioI9YQiE=;
 b=GHFHFvN1xvWxC36Sl5ec1M3rNyu8jMaezmNdTv6CNVI5B1q+XSqeUyt7ETBknwEOG8
 PIXDoqPtxYAcMj8kF7PudzqDhORp6jq/RdQyHEAvU3av9UPEEWYLKyVzidYveHEN/rQo
 BbAdR9zLalIWzQcB/uNE870bchwz2Fa9Ee8NLm6TXH3RhQKkaO5S8SEcT5tK4VSO0++N
 8msjn33Z6EQGXZJNQstl79D4KbYC0I/OfXPznBZa3IyjhzvZ2WlLkPhfPatk/4BBB/Ts
 aNfYwtAH1WB2AzCsEWuJVa8qDs2bjqV+ohFI7nB0sp5+Ya08lwRVYlDmMJ1Q83PhlVXO
 2O0A==
X-Gm-Message-State: AOJu0YwqGRPa+sxhpVvmAoVXYkFcQvn5MoMmA33HeEuz2seVwc1a0Gq6
 vg83+yRdbyhgm/+AgDGj9t/ydCEsnThjb038xIxwhS5UNZC5DgWmaPUfl7BEmtUzHA==
X-Google-Smtp-Source: AGHT+IERiAYzZtzKmbL3TZhgVcvqFIbOkCEplPNZQICJa4KIgsNoCWBwNVEpaYTjGe/I9krP1HIReg==
X-Received: by 2002:ac2:4c47:0:b0:518:b0fd:bf50 with SMTP id
 o7-20020ac24c47000000b00518b0fdbf50mr8399160lfk.68.1713291257675; 
 Tue, 16 Apr 2024 11:14:17 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 h21-20020ac25975000000b00513ed62b64dsm1675141lfp.301.2024.04.16.11.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 11:14:17 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/xe/display: limit dpt creation to device where it's
 used
Date: Tue, 16 Apr 2024 21:14:06 +0300
Message-Id: <20240416181406.124125-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416181406.124125-1-juhapekka.heikkila@gmail.com>
References: <20240416181406.124125-1-juhapekka.heikkila@gmail.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 5382d76e8cb9..a091d149a607 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -94,18 +94,20 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 					   XE_BO_FLAG_VRAM0 |
 					   XE_BO_FLAG_GGTT |
 					   XE_BO_FLAG_PAGETABLE);
-	else
+	else {
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
2.25.1

