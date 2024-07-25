Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D4C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 14:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87F210E82D;
	Thu, 25 Jul 2024 14:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MnDk2y3l";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E410E82D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 14:15:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1fbc3a9d23bso7082355ad.1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721916947; x=1722521747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqza9f98Y950YqcIqbRTAG59wIxsHsaBxIjSG5RpIrI=;
 b=MnDk2y3lI46qxWqt840wvvP/KDn5Wpkr/pFTVen20HY4Z95E4Qqllo3McI08q9x6ZJ
 wQ5GliXoT98MCWOoIbxQ8l3VPEBnPtufvb+jw8VIryc2xjgsvvla7LhkbFdkuinqnzCW
 tIsSXDxcleoHz0v23jmNA7Ye/3SJzGu/lq014h8xp4pkc9jsM9rLfPAxxSAV2im4gH/3
 nsJ4e5vvNGdW49h8fkdtYmQPvsq8EAf/ZRvRMPpZmnpqdL84y4noo6cpMUsAh18BhXOQ
 mE+NLZl692Z/+piV2vr3YA32UYO13jaNOq90qv7Ep9uMvlyw1LtP8huBFHyjdrBRBICb
 /4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721916947; x=1722521747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dqza9f98Y950YqcIqbRTAG59wIxsHsaBxIjSG5RpIrI=;
 b=qFSk27Hj/qAQ7tswolaK62z/pqV7ZleFn4arnVwgFdhLNKN9YTmez/hYjugtxVBPwb
 qAnQULks2jy21/iCGPE/h9U/Qdsyb8ZJ1R0A2+2/2qKwhN+wfZFYtmHN6hgvcFAPNFTj
 AIGR6RKD9KqDsfxqGR9DBPyFuB/DYgJe0IqCq7tBe6/O4S0icrcpu3eipVJz++6yQkpt
 EDx2Cx8hC9Ulx//Q2paAa+qRws6+lPMH9zEXzqoxmwDZD9x5yBah16leFoC45dwU30CE
 KBMhYZZ3XYijmJIxUo0bgpVCotUO2N+es5Kc3/re2xQYxXxWjuQIk6lC5ziDGbgwMZoY
 Ra3w==
X-Gm-Message-State: AOJu0Yx6OxF7+S612sjRvZqWZnH8YbPjYxsttZzyhr2v0zGwZlCN4W/x
 GTzrWbx386qVBQnuBNXgMnZIERfHKA4P6ypv1IWmLxGFeP4+3+i+usRx4J8DTVY=
X-Google-Smtp-Source: AGHT+IFsfnU31TFDlDo94P/wvH0ck3oyvdanHZbqGOpNreT7IdaTqdsc8y+zxN/Z0guv843yq6PqmA==
X-Received: by 2002:a17:90a:c48:b0:2c7:e46e:f8b7 with SMTP id
 98e67ed59e1d1-2cf23772d29mr3488715a91.4.1721916947088; 
 Thu, 25 Jul 2024 07:15:47 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb73b9b7dsm3617520a91.21.2024.07.25.07.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 07:15:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH 1/1] drm/xe/xe2: Separate graphics_xe2 features to hpg and lpg
Date: Thu, 25 Jul 2024 17:19:11 +0300
Message-ID: <20240725141916.3406757-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725141916.3406757-1-juhapekka.heikkila@gmail.com>
References: <20240725141916.3406757-1-juhapekka.heikkila@gmail.com>
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

Separate graphics_xe2 to graphics_xe2hpg and graphics_xe2lpg. This is done to
be able to add XE_VRAM_FLAGS_NEED64K for xe2hpg. Without 64K pages xe2hpg
ccs decompression can result in corruption on display.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f818aa69f3ca..599fb83f4e27 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -174,12 +174,20 @@ static const struct xe_graphics_desc graphics_xelpg = {
 		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
 
-static const struct xe_graphics_desc graphics_xe2 = {
-	.name = "Xe2_LPG / Xe2_HPG",
+static const struct xe_graphics_desc graphics_xe2lpg = {
+	.name = "Xe2_LPG",
 
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_xe2hpg = {
+	.name = "Xe2_HPG",
+
+	XE2_GFX_FEATURES,
+
+	.vram_flags = XE_VRAM_FLAGS_NEED64K,
+};
+
 static const struct xe_media_desc media_xem = {
 	.name = "Xe_M",
 	.ver = 12,
@@ -361,8 +369,8 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 1270, &graphics_xelpg },
 	{ 1271, &graphics_xelpg },
 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
-	{ 2001, &graphics_xe2 },
-	{ 2004, &graphics_xe2 },
+	{ 2001, &graphics_xe2hpg },
+	{ 2004, &graphics_xe2lpg },
 };
 
 /* Map of GMD_ID values to media IP */
-- 
2.43.2

