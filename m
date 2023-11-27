Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AE0C0755A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71A310E3F0;
	Mon, 27 Nov 2023 19:09:51 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537BD10E3CB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:09:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50baa3e5c00so3161636e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 11:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701112187; x=1701716987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhqfMfsYMuI4slX4gLulg8TVltflgEw2NRtSxPdWG+U=;
 b=ImySoZCMId10wqIzWicthNFHY2GyizUJrkSmRDNiquW95SbLS1aVLzujeIRoLb6z67
 eNroAa9Wl2EcWoeCmavht/OSDvFPKjKCO5AMR4/CExaIfB6HPWY3t0bhUIDZVJ2dyJ9b
 Qq30j7Le/8DeMTeTFFnD6YwSAH66GNzXyP8Mia/NeBnfvpJUY/27MysTXAxjFNrwVH9w
 SWU161kBE+rTqGAEd94MPCfHVMbHsGv/NIT/ze1ds64A9G74XtNMEE6OVvIqo9CWSzn0
 ka7uh7GuDCd1sy9/5YElOEaO+xFaFOvqxpOuwlcvZYwjqZTSVU7o+RfW7XrHyOxG1Gn0
 jV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701112187; x=1701716987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhqfMfsYMuI4slX4gLulg8TVltflgEw2NRtSxPdWG+U=;
 b=QJkjj5eWXHUVe56vecDiUErkaBNqE6jT4WscrN+mzfdxrUbm0Anfvyt+xaNFy+xwr1
 DcH5gfUqG72EvywByBJY3OLBW4KqG0UG52sO++pQFCR++rLdCtGZLrEIT1HikIWRMx9h
 O1AqszJrkyzt1jUlCAr3XGry8yLfUGIwT80beasmd405ZRY7I6PmwuzTM5rWcea0NIRx
 O5MeSOcoTP5EFBgAvrOJR5/On6L/OsmIuJyP1xad/EQygeSulCca2vGKrl+fVrW6J8gr
 NYQgD/GDehGqFO/jmmvGeYTPjkDgLwLGlMC7yfycldWzNZJRdqF9/qfSzGwN9i6n1J8P
 rJAQ==
X-Gm-Message-State: AOJu0YzQa//Yb2IBROg2ktBhsnwRozW6keeI5EALVhwbbhqIIUSlAxsO
 FrV+1RxkHm28ptJk123EWIlnV4ZwRjO7kAfd
X-Google-Smtp-Source: AGHT+IGTeI/2fJcvGRtYV3cRnMWJny0398rb29TZQFzM/VXjjsWQoMNCdRGP01GKRZmnv8IVZuCJqQ==
X-Received: by 2002:a05:6512:3c9:b0:501:bd43:3b9c with SMTP id
 w9-20020a05651203c900b00501bd433b9cmr7530850lfp.23.1701112186922; 
 Mon, 27 Nov 2023 11:09:46 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 eo27-20020a056512481b00b00507a0098424sm1573810lfb.109.2023.11.27.11.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:09:46 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 21:09:30 +0200
Message-Id: <20231127190935.3150610-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] Revert "drm/i915/display: In
 intel_framebuffer_init switch to use intel_bo_to_drm_bo"
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

This reverts commit 1c7037778222e8f91e416b8fce2b365593ecbd3c.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 16c37a508552..6102e04acb53 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2155,7 +2155,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			}
 		}
 
-		fb->obj[i] = intel_bo_to_drm_bo(obj);
+		fb->obj[i] = &obj->base;
 	}
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
-- 
2.25.1

