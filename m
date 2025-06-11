Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E3C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 22:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A7810E740;
	Wed, 11 Jun 2025 22:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WNpGN0k6";
	dkim-atps=neutral
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DB910E747
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 22:52:10 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-74849e33349so380537b3a.3
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 15:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749682330; x=1750287130;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=84Hgd2RGx/mxW+pZm1vBUVDnwbeeMzQmnUi3fAiJya8=;
 b=WNpGN0k6itp7E8qVe7P/B1a8VCQnw6y9i7CZhg8sHLPrs3lpb/r4MD2aXlNpEVIyii
 sCVwHN6ZmHvcrhk1l1R5eQbbUvPGmC3+MUBFwVswdLfiSh/B9CZORxp5sVshSLdpZ7qN
 YlL8Xd21OBFCF06eLcLgpGe3dZbDJtzdm9Uo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749682330; x=1750287130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=84Hgd2RGx/mxW+pZm1vBUVDnwbeeMzQmnUi3fAiJya8=;
 b=c2i+S9D9o016o/nvKlVVp5YSLUimua4ziA7GZGub9MUN5GRkYs+N2G2WkBLj66sSXa
 ZkSHAYps9s2fBXOiRb3mHNz9B6tbhiFJIGEv2awhOeY3FDG63TKmjeZ+u0dlXdudqrgZ
 rWhNRvPM5MLivggTABR+nF1trup8QG5p6EgoYiMFLfjT2/Kkd/4T79irQXWD6oDnAAdH
 JpeLuwhSGgZze2dSFg3kKHRTzZpI8EXJePXzq4PH5cOtRvCifgRBGCRkmCoTinmWW9ZQ
 wS5ehYqeNEeTtuEUdYHHYDUFIrKiFPile3+tdPBZJb/sxLYScWue7jAvtnLawHbXZbah
 hLrQ==
X-Gm-Message-State: AOJu0Yzs3JLPwR30mDu+lLp7KHQgMQVH7Ygrh27pQyivyrEFTqxRRK27
 g2zkIDkPywDqpYL5UB1vz00hv0c65aOgeLZ0fezT/WVlirH/1BnVthqPIbThfXG/CdVwvZz7a6Z
 6Rjo=
X-Gm-Gg: ASbGncup/JfodWhV94XgCjD5CW4hZfF4W18fMGDvfFbTCmqk7K2CmQNozPoRIJzH6Np
 YoTsUJzxCfq3wZgBWTKKOSV4+tiA6nBg2m+pMpLKHWt/EUD8xwRmRh9PWFBuExVmS2ixHvDfdSJ
 p7FHUgwob2loP8Er1SZgo48OmxZaTVu4Wbs58afpAk+tF8MHQZ7DFsT+2AgFpR4bOuEGOADS7rN
 BSUh8RqpTVTEktRPG8O29DuGalT0mCK1FhtXiO34SVP9Vu9+4bNgWdLYtHSO8uFugj+dvYb/s5S
 LA7WLaq2Pqsay6XRiYoXGbDG3cybxYvvOgwUeClfSXJD6J9vV8daxQSODWGmgQRdjysGjINW8md
 +eKitRkSQZHzkUMtptbra3ts/q5KzPU2d4B5q8oyeooLsYamp2sQ=
X-Google-Smtp-Source: AGHT+IHokrxQ7fax+fHfTiQw8NQRpdyltqL4MaEQkpkazv6Uh48EJr62tYuvVX4wB/mn2W3oIn91NA==
X-Received: by 2002:a05:6a00:1787:b0:746:25d1:b711 with SMTP id
 d2e1a72fcca58-7486ce17a7cmr5771270b3a.17.1749682329697; 
 Wed, 11 Jun 2025 15:52:09 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (11.103.168.34.bc.googleusercontent.com. [34.168.103.11])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74880a0bf68sm90555b3a.163.2025.06.11.15.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:52:08 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v4 1/2] gpu/trace: make TRACE_GPU_MEM configurable
Date: Wed, 11 Jun 2025 15:51:23 -0700
Message-ID: <20250611225145.1739201-1-justonli@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
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

Move the source to a better place in Device Drivers -> Graphics support
now that its configurable.

v4:
 - Move source location (Tvrtko)

v3:
 - Patch introduced to replace per-driver config (Lucas)

Signed-off-by: Juston Li <justonli@chromium.org>
---
 drivers/Kconfig           |  2 --
 drivers/gpu/trace/Kconfig | 11 ++++++++++-
 drivers/video/Kconfig     |  1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7c556c5ac4fdd..c5edbd2288a19 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -209,8 +209,6 @@ source "drivers/thunderbolt/Kconfig"
 
 source "drivers/android/Kconfig"
 
-source "drivers/gpu/trace/Kconfig"
-
 source "drivers/nvdimm/Kconfig"
 
 source "drivers/dax/Kconfig"
diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index c24e9edd022e6..cd3d19c4a201c 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -1,4 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config TRACE_GPU_MEM
-	bool
+	bool "Enable GPU memory usage tracepoints"
+	default n
+	help
+	  Choose this option to enable tracepoints for tracking
+	  global and per-process GPU memory usage. Intended for
+	  performance profiling and required for Android.
+
+	  Tracepoint availability varies by GPU driver.
+
+	  If in doubt, say "N".
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 5df981920a945..96adceab2df00 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -70,5 +70,6 @@ if FB_CORE || SGI_NEWPORT_CONSOLE
 
 endif
 
+source "drivers/gpu/trace/Kconfig"
 
 endmenu
-- 
2.50.0.rc1.591.g9c95f17f64-goog

