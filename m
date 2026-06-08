Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF97CD8CA8
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 12:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F85410F304;
	Mon,  8 Jun 2026 12:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DGpN5gBI";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3995810F302
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 12:25:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so37659475e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Jun 2026 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780921558; x=1781526358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HToUuJ6es2zjFw8PTyZUYRF4Q9UIJtuonF67RdPYTL8=;
 b=DGpN5gBI0CSXJqbk0MH5r5KvVjW+s0pJV2y4+NfjfT36UCFHtfve2zW478p9KYt4Hz
 SfgfAYwD89/BbPce7RPgsmgxGheUvL6vY58gduyblKLd2mHFPrBOPxoQzkl6ib8AR8F2
 FfsnCxCoLlJNOTJzor6zl5/NSnwi0mi3QTDPQwJKbLwq574jJaStf2idcWnUZCvXl3xQ
 h/w9Jd6YA5qQBkiGeZfG2j7kNCxFgPM35IA8d6geWFDoRTWXgc6M4xkWSnTkkPZh1LXU
 WK9tD5qy6myG2ruOEHeyaxzvmkPHMJ6+/SnA1e7dqsGytfyoq1gTWX0LHWiffxcfdJic
 W6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780921558; x=1781526358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HToUuJ6es2zjFw8PTyZUYRF4Q9UIJtuonF67RdPYTL8=;
 b=DLQCyylwHdlsr7uw7R9CL3F2lYWOWi+0xw8CYuMor7aClLi32ZQCdd56Ra4493hGWu
 9UV3m2nKi/m04jZnaVenRtaS6fP0RrU3QwPWP5SQlLlcTOMRmcL+3VV71HuPlyu8lpAO
 50J9BvhLxuPb98LIuc+JXPpY82f6zu6GCUPp2ySBGDs9mSPyyt/lzQjRtTxbxZq9da9H
 ZdfMVPG4q/FH9z+MKuTutc2No3zEXYyumXlMGg6uFrW/RopPYQ1K2kfWy5O+XXjrXcEt
 F/1gmyPFJ/bCz7yPwvIf1wWVqUgIF5mvkL+EqZfT9VG0WQ2ZFBYbFJ6eNnCMrp7k1PnF
 7S9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ899sx0mk9yEhcMqqkHjBbZDKZe6+2csF5EVq4tLtOKtzYeLMkqAfMRfkKRN3xqky33LZWXmCu3Vw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFUvfHxUED4j51zJyuoKyEqrER37VPi7Ajoyh06PgOauH6ZlSw
 /17oBjpT57A2U+KLTMyn43njv12yoNkce7yqYhApQZErqRd3nTPN1KzJqVqBq82t
X-Gm-Gg: Acq92OHsgZK9cLRkZmCqXnIhXvDGHeg7cSfTST9sQvQvRcjhLp13l9UuD2jO7huzED7
 am48yXeJfpkEcKzlRQa6nuBL3Ygr3Dqygb2CSxXbsXW+mzgV/+mFJJwxWXJav2RZDHtQ9lTm5rF
 MkmWmzBYM6TmwU43SDE6vHarlRThGHOhY1n5gJqxQPmGDk32h/uAHeKWUrDKFQPul7RgQfheoRh
 Pllp2XqFVDLm8y9O0IdAzDazf8rk8l56wyzH6ovvqLemTNUk+rY2oM+jaGQKH3oBQwFeR8k/HL7
 MwdA74Q1ES4sH2KpYoxfahrDVt4hUIJKvNqo5GuWRgI44AE06Ir92AIXNRRXfFC79GzHK2aA9xO
 HFHiZjOejswb3rHddogEx3aP/T6iJXLr8XUt4wMsVB0NsN1KphY1Blho2Oi5RkbXQrRSHcvX0TQ
 n+V8q8FcOeLrqR6ReCEItCIfPNNmNWP/AT
X-Received: by 2002:a05:600c:8208:b0:490:ad1e:1846 with SMTP id
 5b1f17b1804b1-490c2cf6718mr190635455e9.9.1780921557568; 
 Mon, 08 Jun 2026 05:25:57 -0700 (PDT)
Received: from localhost ([87.254.0.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d69sm94264837f8f.29.2026.06.08.05.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 05:25:57 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/display: make read-only array rates static
 const
Date: Mon,  8 Jun 2026 13:24:27 +0100
Message-ID: <20260608122427.48375-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Don't populate the read-only array rates the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9076c2b176ec..351a62654a8d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -71,7 +71,7 @@
 
 bool intel_hdmi_is_frl(u32 clock)
 {
-	u32 rates[] = { 300000, 600000, 800000, 1000000, 1200000 };
+	static const u32 rates[] = { 300000, 600000, 800000, 1000000, 1200000 };
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(rates); i++)
-- 
2.53.0

