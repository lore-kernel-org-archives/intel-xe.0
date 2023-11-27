Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C44C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2692D10E3F1;
	Mon, 27 Nov 2023 19:10:07 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE6010E3F0
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:09:51 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50baa2a278bso3180084e87.0
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 11:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701112189; x=1701716989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CEGFMO9DnxCuPSxGI1GA0vjmPNgw/ELHaaqs2Tl/GKY=;
 b=LwiVhyD+6NxUfThI/lIsZZ31IB1WSlz/gNOS/h2WACreBv9Vl3SwdRzH6stoM9q39f
 6dxUEfTN+EzAX5nf3yEZIF4KSuBchC9BSBBR4tG4hB6nb+E389sSIzGLAZJi94L5qfA5
 ujE11PWnu9rfWYCFb4MSp8AS0zDKpS0QxaXFdHe5ykMRiNsaMoWU61fHSp+qz3PfwkUP
 AXnX9I6A9bJkueSl/VvqEErAYtjfqibRJucSPNiwp8HTBVeFUcG2zqNOMn24WSBgeOw+
 PZ/SzfVpKkW5cBr2o6NwarBVIoFzenB/C4hDMo/kpi/oRLmCHxqtffx97OaECS0hB+Zd
 CGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701112189; x=1701716989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEGFMO9DnxCuPSxGI1GA0vjmPNgw/ELHaaqs2Tl/GKY=;
 b=cRBK8O7ihb1Tn5mCYnnVWTBcXvPsh+SKuhw4NuoDSk7IeucrMRLshjJSD8tLnF6lKv
 8I0uUBnpO58uIigeHSlIGIijGJ2zZLe5iV9jvFBmVhq9c+5vkwl3seAFHkH4LSfgMy6L
 Zklpqd1YXz4NumwOncFaktYMbcGYDVUp1bdJemPMnoeGwgbXzXz8lFahVfno9kcO55dw
 3hNEMbycsC9HYlNWSy4rmiRoC66+SH8ztOuYC4nhWy0FyIIwoFhOFiqooMC3lIBSlPfR
 R5y9KuWEQB+hHVVm0a/Vqz1pMOrwZyLwtvv4htAIv4XhmkYUW0EQHBkUkQbHG4w/D3eF
 2XSA==
X-Gm-Message-State: AOJu0YwFyDROU1dh06A32i+wRmuIeyT7UFQ8+AtxZlnUPHxJ04ptnDVo
 NB67Ai1Voe2lzM5VXxbD0QsoUEJ0QIbW6fdD
X-Google-Smtp-Source: AGHT+IEZqM57wm6YtNL+Eu0Lz9vEa7aGg0K9ZcVaU/XHC29U5PBgacwYL0MM7v9gX9IqFtFXn1+gyA==
X-Received: by 2002:a05:6512:11eb:b0:509:4bb5:ff96 with SMTP id
 p11-20020a05651211eb00b005094bb5ff96mr6769605lfs.59.1701112189304; 
 Mon, 27 Nov 2023 11:09:49 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 eo27-20020a056512481b00b00507a0098424sm1573810lfb.109.2023.11.27.11.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:09:48 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 21:09:33 +0200
Message-Id: <20231127190935.3150610-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/i915/display: In intel_framebuffer_init
 switch to use intel_bo_to_drm_bo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are preparing for Xe driver. I915 and Xe object implementation are
differing. Use intel_bo_to_drm_bo instead of &obj->base.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231116150225.204233-3-juhapekka.heikkila@gmail.com
(cherry picked from commit 12b7142e679f8184b42de6750e44a4fc67ebc4e4)
---
 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 6102e04acb53..16c37a508552 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2155,7 +2155,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			}
 		}
 
-		fb->obj[i] = &obj->base;
+		fb->obj[i] = intel_bo_to_drm_bo(obj);
 	}
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
-- 
2.25.1

