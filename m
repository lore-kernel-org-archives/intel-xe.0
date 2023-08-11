Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3149C41513
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 09:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFD910E688;
	Fri, 11 Aug 2023 09:36:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8610C10E684
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691746601; x=1723282601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lHpiPbQ7+SyXyOu4OEzTRT4Vi643aB9ljmcWVpjox2Y=;
 b=l9jS6of1zsX8bnZoz2FxJIxbD23VpBc1xQNzLjGDrpuuL0MJpa+Oi9sO
 B4XDGZuynf5DNkjNmfCQl058nUpNNm/36fZRjLFrVdGgZ28t7O1WAqzst
 vUeiiC85a9BKtC0TGzH/PZaIdgFV4ld3xp5Lwqzv1EX/glOSYVuPbzK+N
 QB6RI4t9sl7drrl+0L5h/A2Sx7HbLRYhk/qiEBu5XrGPH5DMeWkSHBjsx
 /5He2GFdAZKixKHdC3i9q3jrW4lqomuDjUx5JRhU+aV8n1qXzBBIP3zLC
 fdnKDT7cmK7PEbKZkl5uFNvZmLqe8eGPDwndTfows0LnbpMzAvhIy3PgQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="458012827"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="458012827"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906374762"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="906374762"
Received: from unknown (HELO localhost) ([10.252.49.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 12:35:57 +0300
Message-Id: <20230811093559.2304457-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811093559.2304457-1-jani.nikula@intel.com>
References: <20230811093559.2304457-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/9] fixup! drm/xe/display: Implement display
 support
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

No need to keep a copy of i915_irq.h around. Use the i915 one.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_irq.h |  6 +++
 drivers/gpu/drm/xe/display/ext/i915_irq.h     | 54 -------------------
 2 files changed, 6 insertions(+), 54 deletions(-)
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
-- 
2.39.2

