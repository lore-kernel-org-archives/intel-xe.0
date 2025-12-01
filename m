Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452D8D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 16:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0436710E42E;
	Mon,  1 Dec 2025 16:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i9x0WkzX";
	dkim-atps=neutral
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B9910E42F
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 16:10:32 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7b9387df58cso7064928b3a.3
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Dec 2025 08:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764605432; x=1765210232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2TX/wlLLmYuma5vOh2NANsRHqz26qzJSEKdm31TE4yc=;
 b=i9x0WkzXXVw5DjDvhV2ZMrzdy3inAU5sVQHN6XBsu6RsbHaZDFZXIHpWdtm0cMR3Fl
 JzYRp8npdErrCgaLyE1Xh4U+P1c8Wbji4wfzdk6BSplV2751RF8WjMRh9zfY0MQXt7ri
 c+UXt32ohliH/4Lzo4yUgtuK0JaBq/mSSWaA5p5/2ebMcdudw4SMbWK9oLGrj9dkmVro
 c2R409HLNTPkgfcBhbXCuuJDePgdPFs/sVdya9eaDYcDYEOeqSr5nVDZLngREs6jUbkN
 4acWkXFL+0IqCrPVSaPZBoY41di+sJPOl3RReWq3hoPoFLTmct4ZbRMvxSPTHn113kc/
 c6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764605432; x=1765210232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2TX/wlLLmYuma5vOh2NANsRHqz26qzJSEKdm31TE4yc=;
 b=HNEjvviQa9x6rVH1nP1kUXUKUOjQWJYUFgRY04IAPJkJmQCnnFzrXyEDb58+3iUOUX
 xB/JAC/70wHBopeJgkyGIgQe0V+EpM74ubxU/2/jsAHjzm+l29V6IOMZNC+0A9rQ5s0w
 IccmCmGKgboXDA1UBAORJiW3jqSPMjqK1WoNaBmFndUfyYpLLnPl1OB6vNz1V8RszB8l
 MhU5+hDpN+bSGSCef1QoZAT2dnn5bOkmpLdgNLZHaMK9SMGYklbXn4KVd7edSZgH7Gb3
 c2JTnBQzlgTRB8O8rBxNEjjt5KZUvoRd6tyM7swTtClkJME3VeEjpXLCOubxWczmwTtG
 Xo5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHICMbev/WR49nwTY3yofsNK1Eu1HKknIzm2ShlFZMHuUS2jmpCqrqC5jyLfRX+D/eKC14PDUH5w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL24AvmGr4TvaMVlhW4vu/9KANE/JwVoSLhivfz58iv4u81DF7
 Duno0tVF6mIRrYogOh7/qP6071sLfXM2WwX/KIUvk0XciipUDoJHlaCp
X-Gm-Gg: ASbGncvaSuemP82vJlaCQYCzFeqRnOMgyzdXe204JIiOjO70MhzgJil1FstxSlM4mD0
 oD+Y3VXx6ACeyJHofDpgivHvN4zC+fe/M0haw4QVqHfkAHugqCyRnN88AbOi9R/eJ1LcWWmfqFP
 zTKnS2mrblQuvViSvS602C5Ov0F1A7vdGUjgr+Ru3QhII6/5cMu+WZYK8Mlu6sxa01gFAuqyv80
 vLkovxgLdBnKZYEymt1/NJgpofKTuBRM+HaY1JuAv+5fDS82NE4ysCSYbFMo7wp8LQXascZed15
 jgGh2ze6WDumAk4p+ZoyEQWPZT9ObHDz3oKAzHJ5dKoDECHNR0KdUc50Q8bDoYuPCl3boBBCLXl
 es4hwB5Pwt+Vdffxn/dvRNi/a/Nd+7iGp/zmIre9EBOnbzTL3w3F+AvdzymrNrUCS7IiBljGklt
 ZsT57ZXZUwOnWyIRWNgQHazBEDFP388TlH5jhxQOy8Lzw34Ew=
X-Google-Smtp-Source: AGHT+IGZq8fpWMEPWsnnDX3t+xC1ZgvvVa+AlQTV+YqB+ZJvW+bd92dkQfUJNYqJYPhb7y3tpacglQ==
X-Received: by 2002:a05:7022:b81:b0:119:e56b:c74d with SMTP id
 a92af1059eb24-11cb3ed28camr21252756c88.18.1764605431403; 
 Mon, 01 Dec 2025 08:10:31 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11dcaed5f6bsm72525103c88.1.2025.12.01.08.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 08:10:31 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/i915: Add intel_gvt_driver_remove() onto error
 cleanup path
Date: Mon,  1 Dec 2025 18:10:13 +0200
Message-ID: <20251201161013.735943-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201161013.735943-1-juhapekka.heikkila@gmail.com>
References: <20251201161013.735943-1-juhapekka.heikkila@gmail.com>
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

Add intel_gvt_driver_remove() onto error cleanup path.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 0128faf2e483..f8c01d52aba8 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -908,6 +908,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i915_gem_drain_freed_objects(i915);
 	i915_ggtt_driver_late_release(i915);
 out_cleanup_mmio:
+	intel_gvt_driver_remove(i915);
 	i915_driver_mmio_release(i915);
 out_runtime_pm_put:
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
-- 
2.43.0

