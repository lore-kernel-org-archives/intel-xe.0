Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9F3C4167D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 14:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8CB10E0C4;
	Fri, 10 Nov 2023 14:45:47 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3795D10E0C9
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 14:45:46 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507ad511315so3000739e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 06:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699627544; x=1700232344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtQAQPYIW0ogaNADhrkOIwtnuVnYJgO4ZX8oGJpuckM=;
 b=noLl9csji2m+YMq3uhAYVxHky19pKLew5ceVBqVPBar7H9LHTAxAaw0FM0lG1y/3W1
 GenYD9HlCfE7P0IryPH3XXWVZ97Bm2BSBvg6T2luh4oNReHGjs3VYvw/36qnG8DUMjnI
 QhDp4WJNMLUMHlfimfoPxFxlCPfLWQcSvT9hKZIc8dShdzgw5s1kNmpdJNHwCVC7C9oF
 9/riTXLZneE1klV8nOjL2l9IdBkRdaURcxWchU1TKlBIDP3pozLeNm0zN86oCMaEhxGk
 DJPCsg9gy6/5rIv8xkFrRcgrcyuvoYH5SG/msm33WZII39N3x3PqmLxaEMd49QOl/WiW
 T4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699627544; x=1700232344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtQAQPYIW0ogaNADhrkOIwtnuVnYJgO4ZX8oGJpuckM=;
 b=gQJS1SOXJsKXR0b11E6fEHaFBgULDscr0IVB7Va6x05fffaiFr8rZhN2URscHikRuQ
 ibh+1JDQB2LKWDzYJbV/kffsw7YQE4IJOWI4AevFXQTlnngGsCxbOSCcC+6/90gmbykq
 3LHYVqwi44nEmgSUntDXVvGBbspB5ghJgf3P7T8xKv+GgSkIz1gT4fo5+8IsVjkpkQ2h
 TSuO3Y3E3SmoEshBbAixQTlT8RO+P43i3E0ab7vvgYWhLl7fQbiLaXYFjlqIvkt9GTRB
 5MwRiq3S0HHAghfJbffEdbTo+cdULOqW3noTCNq2brnuGGfSpb9z02wBC82LGNVHdzD0
 JemQ==
X-Gm-Message-State: AOJu0YztWPEPMHpR6FqyGFWo22QCKcfydSKNMdUVxgX+F6MRRNPi5OrF
 WPHkS2Yn7qirFrKWvhhwwMOHSFv/GH/zYg==
X-Google-Smtp-Source: AGHT+IFnQD3anFNT2svrJCD+TiLngPG+u/wxlCHFgFo38xFHrL3dTps8HhpypcrpHFmrBSJGCI85jw==
X-Received: by 2002:a19:ad45:0:b0:509:e5a4:2b03 with SMTP id
 s5-20020a19ad45000000b00509e5a42b03mr2067734lfd.13.1699627543799; 
 Fri, 10 Nov 2023 06:45:43 -0800 (PST)
Received: from jheikkil-mobl1.. ([2001:998:22:0:c7cb:24:1577:4029])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a195f55000000b005095614210dsm1441547lfj.241.2023.11.10.06.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 06:45:43 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 16:45:34 +0200
Message-Id: <20231110144536.76914-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110144536.76914-1-juhapekka.heikkila@gmail.com>
References: <20231110144536.76914-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 4/6] drm/i915/display: In
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

