Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B00C07524
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 19:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFC410E415;
	Mon, 13 Nov 2023 19:56:47 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6D210E40E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 19:56:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5098e423ba2so6927840e87.2
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 11:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699905402; x=1700510202; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtQAQPYIW0ogaNADhrkOIwtnuVnYJgO4ZX8oGJpuckM=;
 b=OcDsi7NK5kkwgyBccPUdAchuMHC08NSUWkxYsuUk38fRqb3NLzekW6dAHAUNWuRXpL
 bNWKm1xZWHnqbE4jK4YmY8/T2RNREV+mOU5bq221cxNWPS97oCqjgn8HYwF9yRjJCVpq
 wAH6rdBmas47o5McC20c0SYUim/52B8rOlM5OSWA4EvQpYess4HSyttzsy9Fj5jG7aSU
 AM1p5cpEFAamG/mzRJQJaHa9chG3/EujpiVWZ2/MpbfhdYgQhOxcO/DcBfnTwTeW8PVA
 Kzbmf2pwnBRLgmf/0QWtYhDtC7NiXhPxiWwPnBw0L4QUl71zdElQDFTxDVMHrjTgRS4V
 1VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699905402; x=1700510202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtQAQPYIW0ogaNADhrkOIwtnuVnYJgO4ZX8oGJpuckM=;
 b=n1ciujrAsqnq8Si9VzJp+I9a00+uGw/YYPtkm6MeJsNYasps+6hsaWViyH0pbXd6Cr
 Zn14qtNZQ+K3C6DvcoBFcbrVFZowqHoVuvO4fU/1sPvaa241Jdvom2Q23OZuQPaL5VfT
 6RQnnS7BBAHt/qu/WUFuQHWZPMxYHINjCDTPwi1XUeys6Jdm8kNIjHiKDbnFgRwxlbgM
 3fieYr5uRNiYPSl3CK3xElWtpcQVdc04e5hMq+19qX654Jzy7D92fzJftnvwlgf63hoN
 uu7QPlyCBz/2CFrST9qrdQiS6JD8HWVatWTKpCURA2eAIxGmG6GfM9iAP7LsJTXS0lF2
 Fb/g==
X-Gm-Message-State: AOJu0YxWzdFeE23zdfNqTysvmgV1jK54msvmyxkSOWg49UdeDuoxe0XF
 pVvJGy/BC2BJsu0qGzZF4ma6oo8NSGK9xA==
X-Google-Smtp-Source: AGHT+IHtgnnklsUaUOI+eZVGyjcElS8au+pZubqxoLs/Yegg0DKtXykitcQJ+0C1XQyfYZEbcKC8hQ==
X-Received: by 2002:a05:6512:68a:b0:500:b5db:990b with SMTP id
 t10-20020a056512068a00b00500b5db990bmr5849418lfe.47.1699905401970; 
 Mon, 13 Nov 2023 11:56:41 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 t25-20020a195f19000000b00507d478c211sm1068710lfb.76.2023.11.13.11.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 11:56:41 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 21:56:31 +0200
Message-Id: <20231113195633.119188-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
References: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 4/6] drm/i915/display: In
 intel_framebuffer_init switch to use intel_bo_to_drm_bo
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

Use intel_bo_to_drm_bo instead of &obj->base.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 3862e55e8980..a21b312bc54b 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2137,7 +2137,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			}
 		}
 
-		fb->obj[i] = &obj->base;
+		fb->obj[i] = intel_bo_to_drm_bo(obj);
 	}
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
-- 
2.25.1

