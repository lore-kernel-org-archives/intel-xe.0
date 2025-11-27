Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AAACFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 04:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788E410E15F;
	Thu, 27 Nov 2025 04:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lem1Ozhk";
	dkim-atps=neutral
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5699E10E74B
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 04:44:10 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7ba55660769so341243b3a.1
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 20:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764218650; x=1764823450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=x7BjBMa+JRnqZfeT1IW4v+bUgZq+0v2oxPOk5e1+Mak=;
 b=lem1OzhkBAiWKL7o9KfeSHO0pJok02NzV9I8Lo0P5xhkB5CU1zMnWwHdTNHBUntidA
 nkFqV2jkN9QDLlwCYl/lkKLoV+6DnGTsBZTBLTc/NsWyc7kkEo0RJo0+oUQr2kA/1B2u
 9nQyOz9XOKm5jPlLfMlTSL32q+LSOL7F9mXAFnKEJPZs9o98xwNmy7QcQH+Fq9f3YDFn
 7DAQcWKFcPfLV0VaRUkhAplPq6Yo75e6SvQnqmGadOkyRAs+BoLtXe4VDMGvxrgyOIZI
 OKX5t4dLVdGCGcMxs0fKdumDfxqOqmgnhUE3h2/zr0kui14GArbpw5BJrz/5DQFURfjW
 RJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764218650; x=1764823450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7BjBMa+JRnqZfeT1IW4v+bUgZq+0v2oxPOk5e1+Mak=;
 b=XJy4gZ5Vhzg2q3YRKBhq1pyoKME4VTl9qZU5DKtY8/R5MBWuz8iOlSDBR9/hcK9377
 r4BeKCMNGBf9CK0hL5czzXNGA8lBECEfnJ1nHS0pGhGtVq8eoJ0KYyLRhl7L+lHrA8AJ
 2Mo4uGOfHpQuuklYToxZRgGFQalCfEp6DclFKnnNsMSi/nZPPDke6rYbB+P+r5qNBHI9
 fiXXT3wsPKD/mCvc4kkUNflua+ZEqCWUDCS2mdcqtW4Cu0BfcfmCeclQYEAEyC4H0AVP
 td98CV6MasaXVo1YcRHZbMxtfUUlXJTCsu/ST61Jnnh1UcQK9puGO1bEZOjFHcbIOSg2
 36cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJX+iDsjFOkMGAEGrkG9HAnaUVYbN/3uZJLQwilcVmDgfsa6hmg4g5BPWcgT2PFt6U8z/nGKEv7A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvnMxentF25QGj3TOPSdxHymL8Vwi/SzNQh/dG0yB9b+fS6uwh
 s7Goz/ODbU0GojPBEIn0JWKxjObvLj0fJYR9tismncr+b9GW0ZBoWLDD
X-Gm-Gg: ASbGncsvlqUMwjMY37Dy1xFbEDupTIoeTNG0U2XqWi/QzgrcG9rxlQgnwdyRLFFrBJH
 fARlPwW3ipAWBukW7QrZO2AQ9+I+q7OUaNdqT4NA1k8mTJbRynRJF0I2D4zEjguXfCfWm+Ow2lv
 yHHxoBUsmXBcyshzllCKy9YJjT2+54URqAA8NOlp7RgFy5KkCV1igikAy0TL5PoEK/fa2v5/BQ6
 UIO+9j7wsGc+wIPjMsFpt4ivlWN8+811eGUnIRPeTQavTM0t5L/TEnMUBFXPHlmicBmaWDdVbsM
 7ZMW756cbIWBPEhCX6p59X5UHUL9g+IPwWoaoyCGCIx7GQAPbEbatDWjfrAmhAyXKHLtMckcYw/
 qfsDQo55+e+bXEJFMoOUsPRdm9IECEMOmByjAOL0a7P5kb7pH2tw/MJovEWrjPGrPZrUfpumcmI
 Cn4tTkZs9n2SAaoddOa+QHX5+QkKLGKv2o7upCa0I9
X-Google-Smtp-Source: AGHT+IGzwx8XxKIfrZDVhykQGzSqr62sGMg9gUipriPRuelgVcksceVllUvwkK7+tgeHc5shxjATTQ==
X-Received: by 2002:a05:6a00:2e9e:b0:7b2:1fb0:6da0 with SMTP id
 d2e1a72fcca58-7c58e602d9dmr26604730b3a.28.1764218649685; 
 Wed, 26 Nov 2025 20:44:09 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d150b6853bsm313375b3a.14.2025.11.26.20.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 20:44:09 -0800 (PST)
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/dp: Add byte-by-byte fallback for broken USB-C
 adapters
Date: Thu, 27 Nov 2025 12:44:06 +0800
Message-ID: <20251127044406.618543-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
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

Some USB-C hubs and adapters have buggy firmware where multi-byte AUX
reads from DPCD address 0x00000 consistently timeout, while single-byte
reads from the same address work correctly.

Known affected devices that exhibit this issue:
- Lenovo USB-C to VGA adapter (VIA VL817 chipset)
  idVendor=17ef, idProduct=7217
- Dell DA310 USB-C mobile adapter hub
  idVendor=413c, idProduct=c010

Analysis of the failure pattern shows:
- Single-byte probes to 0xf0000 (LTTPR) succeed
- Single-byte probes to 0x00102 (TRAINING_AUX_RD_INTERVAL) succeed
- 15-byte reads from 0x00000 (DPCD capabilities) timeout with -ETIMEDOUT
- Retrying does not help - the failure is consistent across all attempts

The issue appears to be a firmware bug in the AUX transaction handling
that specifically affects multi-byte reads from the base DPCD address.

Add a fallback mechanism that attempts byte-by-byte reading when the
normal multi-byte drm_dp_read_dpcd_caps() fails. This workaround only
activates for adapters that fail the standard read path, ensuring no
impact on correctly functioning hardware.

The byte-by-byte read uses drm_dp_dpcd_readb() to read each of the 15
DPCD capability bytes individually, working around the firmware bug
while maintaining compatibility with all other adapters.

Tested with:
- Lenovo USB-C to VGA adapter (VIA VL817) - now works with fallback
- Dell DA310 USB-C hub - now works with fallback
- Dell/Analogix Slimport adapter - continues to work with normal path

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index aad5fe14962f..738a5bb4adb3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -213,6 +213,7 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEI
 int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	struct intel_display *display = to_intel_display(intel_dp);
+	int ret, i;
 
 	if (intel_dp_is_edp(intel_dp))
 		return 0;
@@ -226,7 +227,25 @@ int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_S
 				      DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV))
 			return -EIO;
 
-	if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
+	ret = drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd);
+	if (ret == 0)
+		return 0;
+
+	/*
+	 * Workaround for USB-C hubs/adapters with buggy firmware that fail
+	 * multi-byte AUX reads from DPCD address 0x00000 but work with
+	 * single-byte reads. Known affected devices:
+	 * - Lenovo USB-C to VGA adapter (VIA VL817, idVendor=17ef, idProduct=7217)
+	 * - Dell DA310 USB-C hub (idVendor=413c, idProduct=c010)
+	 * Read the DPCD capabilities byte-by-byte as a fallback.
+	 */
+	for (i = 0; i < DP_RECEIVER_CAP_SIZE; i++) {
+		ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_DPCD_REV + i, &dpcd[i]);
+		if (ret < 0)
+			return -EIO;
+	}
+
+	if (dpcd[DP_DPCD_REV] == 0)
 		return -EIO;
 
 	return 0;
-- 
2.43.0

