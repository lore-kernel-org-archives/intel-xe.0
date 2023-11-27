Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB25C07D5A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B416D10E3F2;
	Mon, 27 Nov 2023 19:09:55 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236A910E3F0
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:09:51 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c51682fddeso56563991fa.1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 11:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701112189; x=1701716989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LLEEDPRt4eb7zw6YESpU7b9xlGW2Ko0rGugSB8jSw4=;
 b=DW5prjmKbuI2HSrclLfkdNRfX77Wtr6hNHJAF4O+8Rd6iw96zSyq3b6LkZjbHknFjw
 rSN58ODZHlWB9FMf89oMyBLaphDbU5qt71RPbQouLK+NzqnSgsKlVYym5TCh9mHzGQjy
 Op+qbgJnVNxDCVMAVQ024Y9XEpApm/FS0jV+7zAYLu4zjQWksI2PBWXry2tPsBg8Fj14
 uxqO7/NWt1RyVQQcZ4Qlj57y1vMPdfuphHqtHNFfRIz+CVFZ99Y6/xVkp1HYKaFPdhuD
 MDmvJMyFY0+BU0TiAAo+zAVjpOpub6e86zMuRGqI3/O0UVFrqdNEBTNN8Zqo1FP2DAA0
 Fs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701112189; x=1701716989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LLEEDPRt4eb7zw6YESpU7b9xlGW2Ko0rGugSB8jSw4=;
 b=ZD8gK5YY7of9ny3saefJ/wvEA3b80gkPj0IwLqx2d/c0yno7Yepoop6rHGB26au6Lv
 /IYcFjOxUs7jg4u1/vf2qpYP+80etQzcZ+cP7C0rAgT+jIgOy96o0mQjCQxQMGe8ioNa
 HwELn39O40D7jNI861+q1XwwnMAKt69hbfddRlQnzs21hauZSJqZqW6pMwnR7D9H2e+k
 pMzFqDQEPvdEcrsj27oNKDVras2Kej+Bo7sQ4ojNN3sRmVhnLwSZ3iI/Z/G5jHvon6O2
 MfFyaZBwt2UqN7zapZeqlRYHvCpKBRIBn5cCjlytKX8gohAvvFtb4JDdceNret2Ryew+
 KAIg==
X-Gm-Message-State: AOJu0YxbuAMykvvR3XOzmR9BPogiSevaNUAZfdpttk9XohH71nTgyS/b
 HHRA1Rl2YamR0sL7NC0qxjbjWhNrstyVL6EI
X-Google-Smtp-Source: AGHT+IGbrgdiTa5h24M/w0w7UkAgs7QozW34Qk3xAUd+X/yDxpuIzyz/Esm9iP/QI3n20TgmyA1OwQ==
X-Received: by 2002:a19:c50f:0:b0:50a:a9bc:6598 with SMTP id
 w15-20020a19c50f000000b0050aa9bc6598mr4503916lfe.24.1701112188558; 
 Mon, 27 Nov 2023 11:09:48 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 eo27-20020a056512481b00b00507a0098424sm1573810lfb.109.2023.11.27.11.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:09:48 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 21:09:32 +0200
Message-Id: <20231127190935.3150610-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] Revert "drm/i915/display: Separate xe and
 i915 common dpt code into own file"
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

This reverts commit c87774bd9237e8f45181cff47f193d1966da1403.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 -
 drivers/gpu/drm/i915/display/intel_display.c  |  1 -
 drivers/gpu/drm/i915/display/intel_dpt.c      | 26 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_dpt.h      |  2 ++
 .../gpu/drm/i915/display/intel_dpt_common.c   | 34 -------------------
 .../gpu/drm/i915/display/intel_dpt_common.h   | 13 -------
 6 files changed, 28 insertions(+), 49 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.c
 delete mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 498f4be1c5a8..401fc5778843 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -260,7 +260,6 @@ i915-y += \
 	display/intel_dpll.o \
 	display/intel_dpll_mgr.o \
 	display/intel_dpt.o \
-	display/intel_dpt_common.o \
 	display/intel_drrs.o \
 	display/intel_dsb.o \
 	display/intel_fb.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5069b31bf1b7..b27b533f03d6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -79,7 +79,6 @@
 #include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
 #include "intel_dpt.h"
-#include "intel_dpt_common.h"
 #include "intel_drrs.h"
 #include "intel_dsb.h"
 #include "intel_dsi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index b29bceff73f2..2b067cb952f0 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -9,6 +9,8 @@
 #include "gt/gen8_ppgtt.h"
 
 #include "i915_drv.h"
+#include "i915_reg.h"
+#include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
@@ -316,3 +318,27 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
+void intel_dpt_configure(struct intel_crtc *crtc)
+{
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+
+	if (DISPLAY_VER(i915) == 14) {
+		enum pipe pipe = crtc->pipe;
+		enum plane_id plane_id;
+
+		for_each_plane_id_on_crtc(crtc, plane_id) {
+			if (plane_id == PLANE_CURSOR)
+				continue;
+
+			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
+				     PLANE_CHICKEN_DISABLE_DPT,
+				     i915->display.params.enable_dpt ? 0 :
+				     PLANE_CHICKEN_DISABLE_DPT);
+		}
+	} else if (DISPLAY_VER(i915) == 13) {
+		intel_de_rmw(i915, CHICKEN_MISC_2,
+			     CHICKEN_MISC_DISABLE_DPT,
+			     i915->display.params.enable_dpt ? 0 :
+			     CHICKEN_MISC_DISABLE_DPT);
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index e18a9f767b11..d9a166550185 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -10,6 +10,7 @@ struct drm_i915_private;
 
 struct i915_address_space;
 struct i915_vma;
+struct intel_crtc;
 struct intel_framebuffer;
 
 void intel_dpt_destroy(struct i915_address_space *vm);
@@ -19,5 +20,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
+void intel_dpt_configure(struct intel_crtc *crtc);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.c b/drivers/gpu/drm/i915/display/intel_dpt_common.c
deleted file mode 100644
index cdba47165c04..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dpt_common.c
+++ /dev/null
@@ -1,34 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#include "i915_reg.h"
-#include "intel_de.h"
-#include "intel_display_types.h"
-#include "intel_dpt_common.h"
-
-void intel_dpt_configure(struct intel_crtc *crtc)
-{
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
-
-	if (DISPLAY_VER(i915) == 14) {
-		enum pipe pipe = crtc->pipe;
-		enum plane_id plane_id;
-
-		for_each_plane_id_on_crtc(crtc, plane_id) {
-			if (plane_id == PLANE_CURSOR)
-				continue;
-
-			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
-				     PLANE_CHICKEN_DISABLE_DPT,
-				     i915->display.params.enable_dpt ? 0 :
-				     PLANE_CHICKEN_DISABLE_DPT);
-		}
-	} else if (DISPLAY_VER(i915) == 13) {
-		intel_de_rmw(i915, CHICKEN_MISC_2,
-			     CHICKEN_MISC_DISABLE_DPT,
-			     i915->display.params.enable_dpt ? 0 :
-			     CHICKEN_MISC_DISABLE_DPT);
-	}
-}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.h b/drivers/gpu/drm/i915/display/intel_dpt_common.h
deleted file mode 100644
index 6d7de405126a..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dpt_common.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef __INTEL_DPT_COMMON_H__
-#define __INTEL_DPT_COMMON_H__
-
-struct intel_crtc;
-
-void intel_dpt_configure(struct intel_crtc *crtc);
-
-#endif /* __INTEL_DPT_COMMON_H__ */
-- 
2.25.1

