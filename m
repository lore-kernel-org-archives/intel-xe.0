Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B63C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 14:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389CD10E0D1;
	Fri, 10 Nov 2023 14:45:46 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AFF10E0C4
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 14:45:44 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c788f5bf53so14566561fa.2
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 06:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699627542; x=1700232342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4973aTbmbVpg6gH4msXRZbf3JumSuchaiRfTkV6YcSw=;
 b=Wa4qxSTO4otxDSqRTrQsxqOeJq/3fUmnHBy+IiRV/vDQxSyzQDJ9ZyQSYEUDY1Qe9r
 E99W4GDk+O2N+wGOuJS451EPvmN1ArJIdleM4DtFc851gZx04XgNiNAfAAEO/b/TmYNZ
 jhiERhqVgTwQEWf8EpYkjbhzqQ04rL87iukqRTde2WUMe4A+c3IwAABx99F1Qro1UYu1
 aSX3P/ad/3/SK1+1q7UDLT29qvgrVgHf3gBP671DRAUT46suQDPSwVaeXgNMEaN4D0WI
 GWwxp92Z/Qt+tGAzR/HEymS8xuGi1vvrikfry26p2bJfAlBtYpbL+5/vpAx2vVDgsi+c
 ewJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699627542; x=1700232342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4973aTbmbVpg6gH4msXRZbf3JumSuchaiRfTkV6YcSw=;
 b=nVn3DLbzfowuVw9yvtnmpBwejouAwcfoUCVLkdim8oV5+sSDlvRRJKK34eVEkt0rhl
 wG68SBbO8o8oB4z2eyysPCIrLbIrdDRKgmoc+wJdWvJ37YjBc+ldyPd/qzmriaEMCqZV
 QN9vE5A3SoaYATb0kmA9yutEx6B2d5qzP11i+aO+bXqA2NsRyFqvAZP+3g01euWAfRdM
 b1JuDOv9B+0dPyxyTkBZEHIECRyz3FGlHEGZON8hMdOg+CykUJF+LWUgcRUmMZUIXfB+
 nFXYEChMzKJe9lsKTczs2iEV+4pRACGqhz9tJM2mzBCT5wDPXSH/1cl7USmeltRFqQzh
 wkYQ==
X-Gm-Message-State: AOJu0YwNYaIowOIWng3WXBohpJd8uQ4/gmB1YkfwdUr2AeG8vILBB4iZ
 lBuWqTHLKH6NfgKJGgk6lgAqxvHjszK+4w==
X-Google-Smtp-Source: AGHT+IFeBKT8+/RMRn/NlG28lO3SxCz7oDqu/SLoxVzXeTDoPAfYG0D7++ouGH7PnL9VV5/8u4wsCQ==
X-Received: by 2002:a05:6512:3b98:b0:509:4645:b78b with SMTP id
 g24-20020a0565123b9800b005094645b78bmr5686119lfv.10.1699627541934; 
 Fri, 10 Nov 2023 06:45:41 -0800 (PST)
Received: from jheikkil-mobl1.. ([2001:998:22:0:c7cb:24:1577:4029])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a195f55000000b005095614210dsm1441547lfj.241.2023.11.10.06.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 06:45:41 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 16:45:32 +0200
Message-Id: <20231110144536.76914-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110144536.76914-1-juhapekka.heikkila@gmail.com>
References: <20231110144536.76914-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 2/6] drm/i915/display: Separate xe and i915
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Here created intel_dpt_common.c to hold intel_dpt_configure which is
needed for both xe and i915.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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
index 3c26e9ae3722..3b745ee8b3c5 100644
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

