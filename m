Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE16BD13C13
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 13:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A3210E43B;
	Mon, 26 Jan 2026 13:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CRzTbWsA";
	dkim-atps=neutral
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C84710E34A
 for <intel-xe@lists.freedesktop.org>; Sun, 25 Jan 2026 00:12:16 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-82311f4070cso1354065b3a.0
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 16:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769299936; x=1769904736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iR/kjqFsPEWOeJ8atT4KIIDdY2v61pRn+hE1X2EyFVo=;
 b=CRzTbWsACR5WzeGVD8vOY6a8eKgQ8bAKu+e2z2csuK7Cj1uHSfRdjBuwFQCnz2Ix5F
 L3ai/L8HYsGp7lSSmDEa7afqM2vlY79QezwSP5ZjXDzulg37X1M6UpsjEJiPTm4wDfiQ
 UkhSpzSCtu+UFRlIK1fRpAwP1LzWTT0pP8H3Lm+7/OptIYt0L0miCqZtgWrNUk/0410i
 rYN68M3vS/2AS458f+oE5I/jhss1x6WwVCzdHqkrXk2CjoCmycEvuxAUd5KUhaoIeFVG
 /JIQul2Om9HjVLQ2n+AM88vXswGI3gOId9Y3vhwkLGC7dj8kU5gp1v0YbxPeUx4stwbu
 kvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769299936; x=1769904736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iR/kjqFsPEWOeJ8atT4KIIDdY2v61pRn+hE1X2EyFVo=;
 b=TkQvsTxUXlMbVQmnc0aBjpRzL+LKxJIVz4y7x+cJ7twj4e6pU3V3C/4LP7kHeVt8C5
 qaMbNIBgScZeHPFggo/6ijaKpeez1u5DpvSCAA7o5zsJXDpDz9hivV9HAAvuj0jtjtIf
 zmG/CgQaeCwt9xYpVo1dANgJVuoLr+xxFV9q4GhJuqXqY9CNBSgKG4hHO10BilWIViDX
 QgLmcEx0zfJ4fu3xoHC+PhOJyhJbh9iI6SrANzB2KB/6556cREWjyi3PGSn7QUaRpznR
 1eFtCvD0ixzvrpjlXq3VV+wFPmGM3aDsoGY5zOcuHRUOE01zKzizS69sk0d3S1ZDvg+q
 nJ4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLBv02ds+c9Z9ne72WaA4klwtuKTnJeCTwJ3y+7ZWdLHzKn/LvQPjb+s7b4AKLw6E3IOUdkEPUFQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNePhfEVB0z0ozafvQ3a9T1IjGI5WosCk9tXRAKqmg15DBqFCk
 G2vJnLimNqsrW5IdrvfyFHFtTTg07Et7DrZEMfTaP43MrU8OJdRuZzM=
X-Gm-Gg: AZuq6aI7e/Xv5B3I0w2moHpzdfuL3/0SO9m7odm+qY8lhadhpP3j7KM5PPrVHnYgtyw
 EOy0hIMa+RNbOdk/eqafYDegqm/5aCFzoEUo2wL6cgoRCq/zlnoRmQy0KH+7uBEETqvPfC33Rd2
 p/x8CN/GexBBL9ep+AsP5Y+j7SzuJT65A64NBqrstYATYxvYw8VUvImmPzqNsK17PPP1kdJ3q8M
 GGRexaQ/arOQM0h5f4Sdkfl+hnGVtnZ9AaQaopQ3HA4Au6gWEizMXzzSD82GDRGrVqpNpI/Q20Q
 PZG/KGV/fzcvB1hcJklTz/d7Cc1F1WaqwHyZEm6rUuWeqrL4+ufLO/itxGidaXdyin3cOUlsLP0
 39zn7hCaeB82VkyF+gC9qkeQ27cNaPCr9upIq6F1pKQerrgYuO1LpzVKlFe4aEclFwp1LNhQ2A8
 gQp3HZmNAqSLGd2xw=
X-Received: by 2002:a05:6a00:7702:b0:7ab:2c18:34eb with SMTP id
 d2e1a72fcca58-823411db9d4mr224890b3a.12.1769299936136; 
 Sat, 24 Jan 2026 16:12:16 -0800 (PST)
Received: from at.. ([171.61.161.234]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231876e5d0sm5608273b3a.61.2026.01.24.16.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 16:12:15 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/i915/display: Disable display for iMac's
Date: Sun, 25 Jan 2026 00:11:01 +0000
Message-ID: <20260125001111.1269-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
References: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Jan 2026 13:55:32 +0000
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

Disable display on iMacs, as they can't do link training
on the internal display.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 1170afaa8680..3fb47232e7a4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/dmi.h>
 #include <linux/pci.h>
 
 #include <drm/drm_color_mgmt.h>
@@ -1657,6 +1658,7 @@ struct intel_display *intel_display_device_probe(struct pci_dev *pdev,
 	const struct platform_desc *desc;
 	const struct subplatform_desc *subdesc;
 	enum intel_step step;
+	const char *product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
 
 	display = kzalloc(sizeof(*display), GFP_KERNEL);
 	if (!display)
@@ -1674,6 +1676,11 @@ struct intel_display *intel_display_device_probe(struct pci_dev *pdev,
 		goto no_display;
 	}
 
+	if (dmi_match(DMI_BOARD_VENDOR, "Apple Inc.") && !strncmp(product_name, "iMac", 4)) {
+		drm_dbg_kms(display->drm, "iMac Detected, Disabling display\n");
+		goto no_display;
+	}
+
 	desc = find_platform_desc(pdev);
 	if (!desc) {
 		drm_dbg_kms(display->drm,
-- 
2.43.0

