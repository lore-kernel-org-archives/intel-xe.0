Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC202C43602
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 13:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBF810F138;
	Wed,  8 Jul 2026 13:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="tFLRu6oM";
	dkim-atps=neutral
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DBE10E5FE
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 13:43:27 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-5bdfd7a2e06so375738e0c.0
 for <intel-xe@lists.freedesktop.org>; Wed, 08 Jul 2026 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783518206; x=1784123006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BTjqa+8oynSoVj1P4JC5t/e1L3Jq0cVpGMAlSPn0/oc=;
 b=tFLRu6oMRZVeGsW8VeP1a57m5TyezZzToNqsXsEr+fuj8f77vUeVEFxwwCiFA2QrUb
 FLNoG1iPQs/ExNP6L6bdu0NKrLaWxGqUf/sjPwbmAh67uv8c1wyN6QxCM1Vbt6I+g1zw
 FOv3C0RUsqF/q9Gr1DZhhCYyTV18o1ueB1cykofRoCSNZSeuQltraTf6E3QpD3VW7cdS
 NTZ8EMTt21A1IrhFWNIAWOqHs5LK0em0CnzdaBXMyjFzmnKmXLQuV9gGeAXnTfLBzh7C
 UeTwaTOGT1Nmr9chc90L35PVb9onJhgTU45u7+uU/uL9vQaPYSvs8VLKW0Kb2JBXj2XR
 DT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783518206; x=1784123006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BTjqa+8oynSoVj1P4JC5t/e1L3Jq0cVpGMAlSPn0/oc=;
 b=RrqlFqRfZMt+WEgCgnMlQEihoNBtwHmZOX6np/fm4WBCT2SF/yJ1uMoijHoA7M7x8V
 cT1a/1bHLk8v+FeYbyPq8r1fHXwvCxjqsZRF/j1YzPI47oWWhNHqEuaFJfw14Z2Cmm9A
 eycIhleq08MKfggThY9ZYUvNRM6ZEKueW+C+NzaaKMyCAhu8AMWtYIF/uyOuH+Wx2VPa
 p9Ap/xjXORGQ3G3pSQrTRy/K3kvIE2+cPtXluQ/gHsULu6wqJrRY7gVMm1UPaO5j/OT/
 9gzVgHUhbQyEeOibxDlirElRGjT1uwaoY/JB8u2dVDal3Nbs1fcqn2OLUeRfYJxVHBJO
 +KTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RprxbGLRr3c6Emw4Sv343bWE19nccGeFX6KqzMlSBck0ZZTu3Q24dKhe9I3JTR7eW0xDCsAlW6RAw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGDqisdIU/GxYtuHB+a1Ro80mAkDn4crW/bKZ+aGnN9Ytn8+mm
 /tjn0CzKY1qUVCZwtFX7tpLV0/AtC7pJ2TnX6Kho/w6X7XGsUgLy5y8x
X-Gm-Gg: AfdE7cnop14o6B63LtMgH0VB79mwxRWxqcGaTwLvrC8rK0WHNnYYn9FON9VjN+vNNBB
 5PfY2Y3kvbSieIVgJHpbcH8axxTIpsIGqrpwrxyd7IY1ACZxcPJAwI9mSf5yRmvBykw0LaMSjhI
 K9QFfPzJ46qR6PKj3KRsSK9fyVZ0sKkWSKuw9JjPhIS+P8DsuZAIlFp+Ad3QrH3eukt9gJr0L5+
 KagGhgAlFDca2Z2X4QhuNooff3GmuvOSU09xQAXNL1dJ1bsSiicniVW5tsTzH2ZVWED6ZgA5unz
 Rx80HxUSwyb3GZLh2rJZwlDlDBu0EGl8LSS1RiKvRXb3EQjDQRtT8f67QT7mPKSqJmypFMHDfFQ
 lObDXlKN32ltsm130JZiW1JBxLV+ah/WrcxSkaDSGCfvqSSSY+wKlbqOgNG7Y0v9+nJ6mPj2YtR
 BfyXumYBY9FXnwfJVnU/wFQzB0IJGy
X-Received: by 2002:a05:6123:102:b0:567:4e8a:fb13 with SMTP id
 71dfb90a1353d-5bf75dc3cf4mr1129732e0c.8.1783518206208; 
 Wed, 08 Jul 2026 06:43:26 -0700 (PDT)
Received: from fedora ([67.230.148.25]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5bf6f5e12a9sm1652971e0c.1.2026.07.08.06.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 06:43:25 -0700 (PDT)
From: Thierry Cantin-Demers <thierrycantindemers@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Thierry Cantin-Demers <thierrycantindemers@gmail.com>
Subject: [PATCH] drm/i915/psr: Disable eDP Panel Replay on XPS 16 DA16260 (LG
 0x07C5)
Date: Wed,  8 Jul 2026 09:42:52 -0400
Message-ID: <20260708134252.11854-1-thierrycantindemers@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Jul 2026 13:49:02 +0000
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

The Dell XPS 16 DA16260 ships in more than one panel variant. The existing
quirk entry only matches the LG Display panel with DPCD sink OUI 00:22:b9.
Another variant of the same laptop (subsystem 1028:0dba) uses an LG Display
0x07C5 panel with sink OUI 00:aa:01, which is not matched, so eDP Panel
Replay stays enabled and the panel hits a persistent PANEL-REPLAY Link CRC
error, dropping the internal display to ~5 fps.

Add a quirk entry for OUI 00:aa:01 so this variant also gets eDP Panel
Replay disabled. Confirmed xe.enable_panel_replay=0 resolves the issue.

Fixes: cb8d155b0806 ("drm/i915/psr: Disable Panel Replay on Dell XPS 16 DA16260 as a quirk")
Signed-off-by: Thierry Cantin-Demers <thierrycantindemers@gmail.com>
Tested-by: Thierry Cantin-Demers <thierrycantindemers@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 33245f44c0d5..e452235832fe 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -286,6 +286,14 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
 		.hook = quirk_disable_edp_panel_replay,
 	},
+	/* Dell XPS 16 DA16260 (LG Display 0x07C5, OUI 00:aa:01) */
+	{
+		.device = DEVICE_ID_ANY,
+		.subsystem_vendor = 0x1028,
+		.subsystem_device = 0x0dba,
+		.sink_oui = SINK_OUI(0x00, 0xaa, 0x01),
+		.hook = quirk_disable_edp_panel_replay,
+	},
 };
 
 void intel_init_quirks(struct intel_display *display)
-- 
2.55.0

