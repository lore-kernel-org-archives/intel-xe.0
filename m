Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFF8EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3D110E1C6;
	Thu, 17 Aug 2023 08:25:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2F310E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260714; x=1723796714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKkCvLmLIrEX73JMo6jfAZYkTdFEGqWWxwYtpYKsPZs=;
 b=AyDnhV16+fV20/lePKo4qUW/e4VSCISbu4Cw4Q5nwasfPHgcjP6ThZuz
 NThmlPrh5wh7egUK+0gg13JCl7hEfwvJ6MVMxy5YC2t+VYTkXtWJc/FQb
 FbyEToCtV6Xcd8DqsXY+OpE/+4VXprYtxwIFCvQuQZ2T4Dul2AtuDGcqB
 Dk6Hq17wyMTR6ste/zrirvu3XGrKJsAks7rF1y/Q+SoDFAo+m46fQ+0UU
 xqX1hXQxAn48BwQcBliuST2IvLB39XpswIcOUjsGS0ch7ED4fUvPMbzCP
 n3vwiv0mMubX8oU0GfmKZK64mHehZV4i6a/YkqVAePZ5iBEzt5c5enBok A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375514246"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="375514246"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848803692"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="848803692"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:35 +0300
Message-Id: <20230817082437.3116208-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 7/9] fixup! drm/xe/display: Implement display support
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

No need to keep a copy of i915_irq.h around. Use the i915 one.

v2: xe_display.h no longer needs to include ext/i915_irq.h either

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_irq.h |  6 +++
 drivers/gpu/drm/xe/display/ext/i915_irq.h     | 54 -------------------
 drivers/gpu/drm/xe/xe_display.c               |  1 -
 3 files changed, 6 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
new file mode 100644
index 000000000000..61707a07f91f
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "../../i915/i915_irq.h"
diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.h b/drivers/gpu/drm/xe/display/ext/i915_irq.h
deleted file mode 100644
index d7931139d4cd..000000000000
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.h
+++ /dev/null
@@ -1,54 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#ifndef __I915_IRQ_H__
-#define __I915_IRQ_H__
-
-#include <linux/types.h>
-
-#include "i915_reg_defs.h"
-
-struct drm_i915_private;
-struct intel_uncore;
-
-bool intel_irqs_enabled(struct drm_i915_private *dev_priv);
-void intel_synchronize_irq(struct drm_i915_private *i915);
-
-void gen3_assert_iir_is_zero(struct intel_uncore *uncore, i915_reg_t reg);
-
-void gen3_irq_reset(struct intel_uncore *uncore, i915_reg_t imr,
-		    i915_reg_t iir, i915_reg_t ier);
-
-void gen3_irq_init(struct intel_uncore *uncore,
-		   i915_reg_t imr, u32 imr_val,
-		   i915_reg_t ier, u32 ier_val,
-		   i915_reg_t iir);
-
-#define GEN8_IRQ_RESET_NDX(uncore, type, which) \
-({ \
-	unsigned int which_ = which; \
-	gen3_irq_reset((uncore), GEN8_##type##_IMR(which_), \
-		       GEN8_##type##_IIR(which_), GEN8_##type##_IER(which_)); \
-})
-
-#define GEN3_IRQ_RESET(uncore, type) \
-	gen3_irq_reset((uncore), type##IMR, type##IIR, type##IER)
-
-#define GEN8_IRQ_INIT_NDX(uncore, type, which, imr_val, ier_val) \
-({ \
-	unsigned int which_ = which; \
-	gen3_irq_init((uncore), \
-		      GEN8_##type##_IMR(which_), imr_val, \
-		      GEN8_##type##_IER(which_), ier_val, \
-		      GEN8_##type##_IIR(which_)); \
-})
-
-#define GEN3_IRQ_INIT(uncore, type, imr_val, ier_val) \
-	gen3_irq_init((uncore), \
-		      type##IMR, imr_val, \
-		      type##IER, ier_val, \
-		      type##IIR)
-
-#endif /* __I915_IRQ_H__ */
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index be4cd6ebbe83..b6b547c4877c 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -14,7 +14,6 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
-#include "ext/i915_irq.h"
 #include "soc/intel_dram.h"
 #include "intel_acpi.h"
 #include "intel_audio.h"
-- 
2.39.2

