Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAC1D13C0F
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 13:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDAC10E171;
	Mon, 26 Jan 2026 13:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BFX37hRu";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F5910E34D
 for <intel-xe@lists.freedesktop.org>; Sun, 25 Jan 2026 00:12:11 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-823081bb15fso1748695b3a.3
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 16:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769299931; x=1769904731; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Al/HNzlL8sxMxMZcOP9VatI2C0Emnla0lc07B+7h3yk=;
 b=BFX37hRuU+Lcg2nNqvsyucDLHIeSfHgKnhJ5G7r0dfIL9sqJlQ5/GbcV7SpDr5yF+i
 b2r5zB5lf2qTsNJ7EYftFCYItVmLd3hKHRHDNScMxqRSv6DGPHtSNcNbVFay3EndWp5b
 bfy3cMEPH6YfJ0o04Q7KKABAMtUSYEGHIsLaj/QeTlI+nrQEZUKkcDl52fXvsDyt3Ey1
 UiQPOy0ZvPY0olO2egfiaeuPEbYI8PrtBf24fjXUdttliQj2wrRDpu3fYr5Oo2rxoIM9
 iFPDOFz2g9vrC9Ap/QOq8yDJIJLvjfY938ymuc4XGWHahJV/yt8nob/V9fo7hK3dVhqu
 6x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769299931; x=1769904731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Al/HNzlL8sxMxMZcOP9VatI2C0Emnla0lc07B+7h3yk=;
 b=pn+Wpcw35ReiYCh5NJ62T39C8kA2RWFgLXQ0LBAq0pYtcHHAS2TOeUeWsQB8RqwrQ6
 399ehCs0JpmUTIMcAXfPBzRyICK4UgDz9XMyIyVNLPrigGru1zVOu0+rYrWMlIqLUMCo
 lE285GQQkGpPHp+x6mBmWRavllpUuaU8r0DeM4F/314kkOIlW7M20VrkNxzM47aTAuZ/
 WaOBCZ1AhCaonX9lxOh646amwTP6Sp3If4s1VVEsVyIiSnhUA/lV82OL45Z7a9dnigYB
 p8w+bSjpqrlkzsJDGaDQSM2qvHDiYcx7GMYToA2WN9wA0aSzefbwkA6JgR4sA1LU3AXy
 cYgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV69+laseprAehOguqQADEpM2mv2wUBSoCRpqDeOF/qcDDCUeagvmN5GBwaiCMU1Fd5qI0Jhxv9bg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwRGCxYefO7po11SaoNiiwsTt8xupP2ac825fRiuUTNxRZcASv
 pmGasKvi+mpSq55fDMZpUOFWLzqmNlvkmufmgS3CajdSmbng1V2OW5o=
X-Gm-Gg: AZuq6aIsgL+2WO4f0TAd0LLXijAeCtv4NgKBl5lKpmuyVKWC7zpb3ocXBSXWu2qAGef
 pA0HahzJbPj6V0ftPyq7mUzteLkCwwUU1CRC84fo/DiQkP5F2XRtvkoWsmaE7o5VTQvmvMDy6WV
 d4btlwmj6z6zN39dLhZT6MyG7/bOiKWCPi3CDDx3WcyrpFh8vNn6DYlnsGft6hEY/e26mBXj/sW
 O3wQJ3oCFc3Uf8WMT/IFIdw1Z6Sy+Rpy5FFehrhK0WeZMq+oZ5I89kZu7N8PS1AxWSk69jbZ2mY
 eLucb8mxleUUHLKEPsbsv8G9jJHNvVF0ylg4pLCJAwxitFV73f0rBAQ7riwmHkUualcYcQiw16I
 zP9FHviQhE5unblYrVXVkvyR32I4jZhbvf+R5pem642wppcYlSFzwztqMOsrRBHVh9k/5VnYKeg
 sgrwMr+wwRn6h9P78RzatxQes66g==
X-Received: by 2002:a05:6a00:418c:b0:81f:3d13:e070 with SMTP id
 d2e1a72fcca58-823411df004mr215116b3a.12.1769299931419; 
 Sat, 24 Jan 2026 16:12:11 -0800 (PST)
Received: from at.. ([171.61.161.234]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231876e5d0sm5608273b3a.61.2026.01.24.16.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 16:12:11 -0800 (PST)
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
 Thomas Zimmermann <tzimmermann@suse.de>, Ingo Molnar <mingo@kernel.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Francesco Pompo <francescopompo2@gmail.com>,
 Lenny Szubowicz <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] efi/libstub: Enable apple-set-os for all Apple Devices
Date: Sun, 25 Jan 2026 00:11:00 +0000
Message-ID: <20260125001111.1269-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
References: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
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

Enable apple-set-os on all macs, as
apple-set-os is needed to use eGPUs and the iGPU.

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

