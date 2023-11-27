Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04312C46CA0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C559E10E3F3;
	Mon, 27 Nov 2023 19:09:55 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A4E10E3F1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:09:53 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507c5249d55so6986799e87.3
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701112191; x=1701716991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7ikot4wdz27F48XhTI52Xf80vY4+JxbXFZOPHbwXTM=;
 b=c+2sKpvs9odYjKfSkehSKF6u8PjtOQfzVIqWMfYK82KVMllSjVaOMXhde5yKeHrNGv
 Hz8klqV4+F2Y5A33lduADbH4/pYN5/Rxep3FTK3aLOf4ThhoamTBYL/b/ECpCSYQSBvZ
 8B5Z6Tbkp7q4h2JV9Nl57HQf9Y4bDqwIqavH01be3V/XQ0XNHl2sXxoz7sOFY8vL8QHD
 Iz3BlZy/VICTe8x9BXhrv0tnsPHE+8dg0Rcl7Y6BuK7twDAi4hpY3L7UHs7PRCFBaUoG
 X6FkVxBzX2JxlvsAHOR4vcrtCuPb7vfMGKwC7yOGIzUXocU5pR9Jc4QhU2NRi+IS0HhD
 c6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701112191; x=1701716991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7ikot4wdz27F48XhTI52Xf80vY4+JxbXFZOPHbwXTM=;
 b=C9MKzblgdRAWtThNKsbCLcKwY4mo6vv2uoQ1DbA/b20viLAJjVaedr+UwQUa505tpd
 SpGluWs5tFnNXvyIjLLzebvsvgr1+O4AoC23gxxsBJgUgHv0loxn4QSEGUJcMvqy/G5n
 Xh+ZIRH4q+RqedL57q6n5MOyqd9U4WmR//KDIQdmFKo+wbeOnu+h07ukDJjhf3LE6zBi
 YhLyRN6eRrbk8hSIyx+UkANbCJdmNqwRi1a0xkNcLGJLDsFiZg+EjX+MZVjRC11KTZ5C
 KF3wNFDBnHvGST2MXt8lnTS1WZZn+wrhU++XL9QDLRa7x9/yoMjigWDlzBoOSjLLr7a7
 DW7g==
X-Gm-Message-State: AOJu0YxgWQSI2AGVhXeciJYdikbjckzK1W4mkRjvu+7e6Q9/9GOjy6OS
 TuLU8jeBt9L2Q8wHDe/TCS5wDIMU5K3AIxWV
X-Google-Smtp-Source: AGHT+IG1r8T95V4Wpr/WNQ7okmrqsF/cDIMWuXM0zWirQwLj+HjWrK9kWxae/3G+QDZQnqcRIMM/Fw==
X-Received: by 2002:a05:6512:104b:b0:50b:b5c0:fe8b with SMTP id
 c11-20020a056512104b00b0050bb5c0fe8bmr1531182lfb.28.1701112190814; 
 Mon, 27 Nov 2023 11:09:50 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 eo27-20020a056512481b00b00507a0098424sm1573810lfb.109.2023.11.27.11.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:09:50 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 21:09:35 +0200
Message-Id: <20231127190935.3150610-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/i915/display: Separate xe and i915
 common dpt code into own file
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Here created intel_dpt_common.c to hold intel_dpt_configure which is
needed for both xe and i915.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231116150225.204233-1-juhapekka.heikkila@gmail.com
(cherry picked from commit 1aba67132cbc46856dfa8f904cd7021a75b1806d)
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 drivers/gpu/drm/i915/display/intel_dpt.c      | 26 --------------
 drivers/gpu/drm/i915/display/intel_dpt.h      |  2 --
 .../gpu/drm/i915/display/intel_dpt_common.c   | 34 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_dpt_common.h   | 13 +++++++
 6 files changed, 49 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 401fc5778843..498f4be1c5a8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -260,6 +260,7 @@ i915-y += \
 	display/intel_dpll.o \
 	display/intel_dpll_mgr.o \
 	display/intel_dpt.o \
+	display/intel_dpt_common.o \
 	display/intel_drrs.o \
 	display/intel_dsb.o \
 	display/intel_fb.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b27b533f03d6..5069b31bf1b7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -79,6 +79,7 @@
 #include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
 #include "intel_dpt.h"
+#include "intel_dpt_common.h"
 #include "intel_drrs.h"
 #include "intel_dsb.h"
 #include "intel_dsi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 2b067cb952f0..b29bceff73f2 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -9,8 +9,6 @@
 #include "gt/gen8_ppgtt.h"
 
 #include "i915_drv.h"
-#include "i915_reg.h"
-#include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
@@ -318,27 +316,3 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
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
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index d9a166550185..e18a9f767b11 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -10,7 +10,6 @@ struct drm_i915_private;
 
 struct i915_address_space;
 struct i915_vma;
-struct intel_crtc;
 struct intel_framebuffer;
 
 void intel_dpt_destroy(struct i915_address_space *vm);
@@ -20,6 +19,5 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
-void intel_dpt_configure(struct intel_crtc *crtc);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.c b/drivers/gpu/drm/i915/display/intel_dpt_common.c
new file mode 100644
index 000000000000..cdba47165c04
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dpt_common.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "i915_reg.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+#include "intel_dpt_common.h"
+
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
diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.h b/drivers/gpu/drm/i915/display/intel_dpt_common.h
new file mode 100644
index 000000000000..6d7de405126a
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dpt_common.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_DPT_COMMON_H__
+#define __INTEL_DPT_COMMON_H__
+
+struct intel_crtc;
+
+void intel_dpt_configure(struct intel_crtc *crtc);
+
+#endif /* __INTEL_DPT_COMMON_H__ */
-- 
2.25.1

