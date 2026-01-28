Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9CDD73E8A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBFE10E8D2;
	Thu, 29 Jan 2026 20:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V0bpNCWm";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2E810E6F9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 14:59:21 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a79ded11a2so43739825ad.3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769612361; x=1770217161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGJMSx3RqPnXMSF3iMxugpnUOfI/BDwqereywSHSzkk=;
 b=V0bpNCWmd9FiAigqm+GuYwtU+mHfiutsz9vVoozfpdf+invJK3YjfcBqRwK5COemIZ
 mDNfN52Vd8Cc5jM7R7aYViNbi32DmEpLVGgMSgs+SUkzLhn2tMBwpjhw4ObpBx8ineXt
 RQFZnrn6pL+Y0bOWo4tQ2csQ/fbDnfjD7Xk7dkF1BOGtIBRyyDTKqIIoPXHaN+eEEJsc
 7vNvA4Yi068bJS4X0HH/NiVIo6uUztJRibK3J4JFO0iF2dOlEDY14WMf8cD6WquiZpMe
 XlJhIo03KzzMIQMDN7+Eq2YVjhlIlAkq1u617qO75OYtZY2Dgx/ONpFNFrrxcXLk+dcI
 080A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769612361; x=1770217161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vGJMSx3RqPnXMSF3iMxugpnUOfI/BDwqereywSHSzkk=;
 b=SZD8+g+1yjwqzqsU9t9wT05L7CEOTLm5pTGOyQI4Z8kKvkpILCauHSgKHeoSKMF7w7
 IvpDYzkL5HGpg01khCNVP5IIovBdaf/xn/7uhovfG9/Jr1Q5/9s5YDeG+sn2CRT5NyLg
 VNsjcPtR72w8Sw18X4jBsKMmdIBWbaMOhg9HiIR2gbwf8ByV8m2miaShCNMLURAadJyn
 oEbSnOfRgisZggoPkj2TnGeyt+oK0RbUeABvq6m2w0wCGQKG8mi68/5rD8TpgYHh9XMQ
 nnvNh1Df2ALwbnguMVdjPwYyLBVdSdrdw80XsIOmTwHMr1gjcyo911jCaOlVPo71vkIH
 mvgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaHjGVnnbKiSt9+rTcbOaNmjCSHcU8YCwt4yeWPO/IGsGMfCQEKzGvfjU0tBZ+/1e5M3pEHjukHw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoEILHQeEVOlzGYXPKwNj6vXC11hwcdbdhzKXmV41F42BRwCQS
 pYhjUkqhJMv4Yvfit3dpGaAaM0Il51R4DwPWoZkN8MECzOpjO67j6G4=
X-Gm-Gg: AZuq6aIpUpfuGQf2o5+f1tZYG3EeR46uTjCPNGGjkO1/fhaM3FSV+BIoX0C2I6qz+Zh
 T4Yx/boCcn9mmrRsWIL7b8i72zTcNYXAz6Lfj5Ugzz9bQCdZEqEJoJ2SkaI0ZJIHp4X8jU/AbNL
 V52Gd1HZ5PETNwV9M3vF/ZLinHoDyglDeYj1VT/7PycSt1UzRmowjwHjKQlW9eLM/wcqcorvt+o
 Jv2XmVuSIAtfEECqCmNvVWsKJp0E995AoDLgHhar28+AyXAUWl5U9j9rgloa3tiQF3b2+PefEta
 6uCU1w+EuOrbs9TKGFIPr4TOqwguFKFr7eCxg6lbsvX73Jd+y7K55yLSRmfS7QaGV6tQOulHw3l
 H+bsVjbI4sQ72SfWBwDNG00SI7G3V80fxsvTTgnUiwED+iw/7xrQXTkSre759t3nq0TAPDiVzCd
 KdBXwP3eFtm8v3JiA2RbKC3AM=
X-Received: by 2002:a17:903:4410:b0:296:2b7a:90cd with SMTP id
 d9443c01a7336-2a870db7c28mr53750585ad.32.1769612360659; 
 Wed, 28 Jan 2026 06:59:20 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b5d9a7bsm25820235ad.79.2026.01.28.06.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 06:59:20 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Francesco Pompo <francescopompo2@gmail.com>,
 Lenny Szubowicz <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple devices
Date: Wed, 28 Jan 2026 14:58:37 +0000
Message-ID: <20260128145855.1071-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
References: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
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

Make apple-set-os run on all macs, as
apple-set-os is needed to use eGPUs and iGPU.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cef32e2c82d8..60e1a41bfe5f 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -303,32 +303,20 @@ static const struct efi_smbios_record *get_table_record(u8 type)
 
 static bool apple_match_product_name(void)
 {
-	static const char type1_product_matches[][15] = {
-		"MacBookPro11,3",
-		"MacBookPro11,5",
-		"MacBookPro13,3",
-		"MacBookPro14,3",
-		"MacBookPro15,1",
-		"MacBookPro15,3",
-		"MacBookPro16,1",
-		"MacBookPro16,4",
-	};
 	const struct efi_smbios_type1_record *record;
-	const u8 *product;
+	const u8 *vendor;
 
 	record = (struct efi_smbios_type1_record *)
 			(efi_get_smbios_record(1) ?: get_table_record(1));
 	if (!record)
 		return false;
 
-	product = efi_get_smbios_string(record, product_name);
-	if (!product)
+	vendor = efi_get_smbios_string(record, manufacturer);
+	if (!vendor)
 		return false;
 
-	for (int i = 0; i < ARRAY_SIZE(type1_product_matches); i++) {
-		if (!strcmp(product, type1_product_matches[i]))
-			return true;
-	}
+	if (!strcmp(vendor, "Apple Inc."))
+		return true;
 
 	return false;
 }
-- 
2.43.0

