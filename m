Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF6C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 18:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919D310E8C9;
	Thu, 25 Jul 2024 18:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RXcNIHyh";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B708910E8C9
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 18:32:30 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc611a0f8cso9941545ad.2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 11:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721932350; x=1722537150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jhb025P0LCVkxqpk/AGn0caDgHI1j1dpPHJiij/IsIU=;
 b=RXcNIHyhYIEdrdVY4k2yNWURCNPo7p6iCwGpHcJ6kJFsY+cTSUFRSz6JZoaaF+fPy2
 XB0ByY3X7hGmWadEIRT/X/ktRyzQHvyEQJnLtR8zRStfOMgzO4BME3iNcGLAX0s7YGMd
 Gt11y/N//PfrXCeh17hTb/qtcrmip5a6R52a/aK4/P9Y2jWYRbZDkHrgqHzEA8/FzW/i
 j6dEU40JjbnIcZ01m4fvcyeZ8AXqkdkF9GH1V6CVRv8zHqLJs1IxWBjqckUg7afH9/Yr
 sDm4HHCg3nJH/R3QG26+GXUTq/10kkatHQmECAc8c9pj/Gd3vSvZDftMETuoqx/v0k4E
 Hp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721932350; x=1722537150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jhb025P0LCVkxqpk/AGn0caDgHI1j1dpPHJiij/IsIU=;
 b=mAfHAjsyR582hTb6osUGLzQTEbc42G9P9GotVmk4vqaKkEKP7DCeCMhqSHd8IXRl1Y
 EBR4YvowV5mj1DzmBpXB+UT7sTg6wtHDxXg5clilgwfCA30dJQHywNW6yyusVwRQfPUf
 iBN73951zgvZkioanm+tPuHHI2nMkFUBK0khVtA2PO+Yp/Bg4/qTOx64yJm+wao1aNdG
 2ChxLvaOitn6yDAPmNo/37rGnwDpxTy9neB4LxHMu8ZYvHeZ0dvKdkZKfqULvBUX9B0u
 +RGTS2RQPjF3eCp++CratXxspAngeTRFbJZ9aa7II6RD8yk/U9UgQuXJokpoQZ91g4k3
 Tvqg==
X-Gm-Message-State: AOJu0YwSpUOuAubU+r5kl58FJtCUK847WB9axUhEqQC2QMBNIt9KklVE
 jpOoGR2MEYAsUS+pZsFgrq5sdfC7V8iyv41/l5nzC8G6ldRnd3XVhHtVxPdGG8o=
X-Google-Smtp-Source: AGHT+IFdvPvSGAzmX56F5KbGsksLjqzO5XroeBJ/PLkxm9DpUZOkda8djWBSJE9n2LTyvERVCwYfKQ==
X-Received: by 2002:a17:902:e751:b0:1fb:72b4:8775 with SMTP id
 d9443c01a7336-1fed92f33e6mr28502985ad.40.1721932349715; 
 Thu, 25 Jul 2024 11:32:29 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7c7fce4sm17439185ad.32.2024.07.25.11.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 11:32:29 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 1/2] drm/fourcc: define Intel Xe2 related tile4 ccs modifier
Date: Thu, 25 Jul 2024 21:35:53 +0300
Message-ID: <20240725183600.3458050-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725183600.3458050-1-juhapekka.heikkila@gmail.com>
References: <20240725183600.3458050-1-juhapekka.heikkila@gmail.com>
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

Add Tile4 type ccs modifier to indicate presence of compression on Xe2

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 2d84a8052b15..81a26d971077 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -702,6 +702,18 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
 
+/*
+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 render compression.
+ *
+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
+ * GEM object in a reserved memory area dedicated for the storage of the
+ * CCS data for all compressible GEM objects. The GEM object must be stored in
+ * contiguous memory with a size aligned to 64KB
+ */
+#define I915_FORMAT_MOD_4_TILED_XE2_CCS fourcc_mod_code(INTEL, 16)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.43.2

