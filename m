Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316CAD73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD6010E8CC;
	Thu, 29 Jan 2026 20:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g8L04+IK";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C8D10E711
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 14:59:29 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2a12ed4d205so46369215ad.0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 06:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769612369; x=1770217169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXyZBm2HT5a2syRm7I8O8JEOj9+5Hm8S0vVHV9UIr+Q=;
 b=g8L04+IK5edafrFewkF4egpq/1U4F9l3c5eUEiLuZ8xy479s1ZoS68Qup0umF8kqqr
 42/k7Ve20KT4sZUbc4Fi3rtjUSh7uWjAojcbybVgcV9GD5cxrb6XOw6yeskXwWYp1xy1
 FW7FKIZQvStzzk8R+d3Wr/s04H1OBpN6FqbxJQoQ2ZTxlFvo8h7Sa1KDsvZHLdB1skYG
 hLeBwm8WGB4L8hjYyI+OcOoTgM+NdtjY4B8YJ2tUcqRkqXTavkQBRB3VuuyRNAgMxvAL
 BR14NnC2zC3xsKGpCsh9R0VxOU0sS1SZFbZdQpUdzgkqNtYHdCjvPVtQ8MfzU8RzRyso
 KnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769612369; x=1770217169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aXyZBm2HT5a2syRm7I8O8JEOj9+5Hm8S0vVHV9UIr+Q=;
 b=jPTK36YupAdiwei6h1LNNnmrnH5lwoFijp+kw2sduSpd3/PwsyWsDOfjTOl+dbTKVo
 2LXimgNnyjbXQXG+HrIpTg0J/YMxh3PfrNj+iATmiGTRSwpZB0b5Hnk/b2wkANLJXwnm
 H4o99xXu1jjd4bmSFikixfPE0fFU9gqP4mp0PS1+kYqJGD4Fdulw7AwuZHbdhNdAMGK0
 1qNQyzgsGlgXDd5EBec5MHZ0i/nJLNj9vrALfypMVbXrnSvpCLduyrBUnfAskYGlKyOa
 D0frXx5dIypjNa3zg4p8qZZZuVzTtQjTAZRUDIvGwLjlLBVyWGpzSo6JscR2PssjkSRM
 F8jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkgWVneZwMTiYCTp+bZZlvoNH4QuILsABo/WwqtK1RDw6H7jZ44b79Rn/qJQLz+x318GJK4GySSg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw/mFdi4e4urnVI8MhWCCOggtJrg5kPWbr0WTBXQjLXPEtIG0+
 /zJHXbatojN5RaAYlcbrqJhmh1NgfMOuE++9F1k11K2/vhYWdqOnY/I=
X-Gm-Gg: AZuq6aI48Xr+EiLc1nzXtuTxvZz0TDDIShv3QySzGlO5xCzNGIQUaHqN9XzPuHo/a/b
 3151tJfjm6FCJm83IeHiEbm3HDytfHAs3VxwRayUaqJmg++cdka+yoY0p1XgT3fZYqgeW0f1AyD
 CCmBrloXbxiVSaLEIrrKCWX5AeKftFG0FY56uFEvrd84GSlWSLEVV04fXR6Jsj1318d1oFCgfvY
 it8qin2NCWqBhtETMZobnlfaFcuXzYKN1cdySzWrNp2ts3R4RmY3M73utdy/6OmLnn5nnoDTe/S
 aSHIPrase3R5zxiFjWHu2B/a9r/yUr237jo8cPII2OWYXLbbmUEfFLMXvdzVSDGPFGPvGCRtEQv
 fSWcnSfNGluegpPQz5gnXjzBnbrv2aF1ald70ifataKgezI65lfju1itIgflJfRnr0TQrPldiBG
 9KvUtPq4Zgi1zB
X-Received: by 2002:a17:902:ce0d:b0:2a7:d7b8:7661 with SMTP id
 d9443c01a7336-2a870d536c7mr48989305ad.4.1769612368925; 
 Wed, 28 Jan 2026 06:59:28 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b5d9a7bsm25820235ad.79.2026.01.28.06.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 06:59:28 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Lenny Szubowicz <lszubowi@redhat.com>,
 Francesco Pompo <francescopompo2@gmail.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/display: Disable display for iMac's
Date: Wed, 28 Jan 2026 14:58:38 +0000
Message-ID: <20260128145855.1071-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
References: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 20:47:57 +0000
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
 .../gpu/drm/i915/display/intel_display_device.c    | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 1170afaa8680..b1fec1018d7e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/dmi.h>
 #include <linux/pci.h>
 
 #include <drm/drm_color_mgmt.h>
@@ -1435,7 +1436,18 @@ static bool has_no_display(struct pci_dev *pdev)
 		{}
 	};
 
-	return pci_match_id(ids, pdev);
+	static const struct dmi_system_id dmi_ids[] = {
+		{
+			.ident = "Apple Inc. iMac",
+			.matches = {
+				DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Apple Inc."),
+				DMI_MATCH(DMI_PRODUCT_NAME, "iMac"),
+			}
+		},
+		{}
+	};
+
+	return pci_match_id(ids, pdev) || dmi_check_system(dmi_ids);
 }
 
 #define INTEL_DISPLAY_DEVICE(_id, _desc) { .devid = (_id), .desc = (_desc) }
-- 
2.43.0

