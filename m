Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75D3C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A5F10E2C2;
	Wed,  3 May 2023 13:10:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A280210E2C3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119423; x=1714655423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3zRo6HSRHg4iSIYGyYaObtXnNWrmFwh6/H8h3FyaBNg=;
 b=gBUnCicdb+0VCqTEOnUy5XuYzfvMCyl400maJXCl4nBfxK+nRaWwI8dz
 GFrten80xfi/cj0+S5FrNi1XpZdQfe4aGgWrrCGmnfd2hQI+ya7hg7U0P
 r9Ufn3sSzPdsLIo0fHPXtQK+vOLHm0L0bVUtnWq0yxx+uVfNaktMsGEVO
 DTcfSZ6XsyBJgydlopK9D5APMxAgz6rA+uFcRNKC1/FjsYrWsJcquGkT1
 3+tUKfG/qZBDHHpxaRMMJVga2c9VcgSeBOaAf1oSE7lCNcE+3MFaQXleZ
 Y762UGJVoiKj9Gp6Bs8TdveNVEKGhi5XxGldpaQx5sEjJAgISKDdTJzfA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348691415"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="348691415"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="727132252"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="727132252"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:49 +0300
Message-Id: <20230503131005.1602412-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/18] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add compat intel_uncore.h glue layer to direct all uncore calls to xe
mmio.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
new file mode 100644
index 000000000000..960e2327d217
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_UNCORE_H__
+#define __INTEL_UNCORE_H__
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_mmio.h"
+
+static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
+{
+	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
+
+	return to_gt(xe);
+}
+
+static inline u32 intel_uncore_read(struct fake_uncore *uncore, i915_reg_t reg)
+{
+	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
+}
+
+static inline u32 intel_uncore_read8(struct fake_uncore *uncore, i915_reg_t reg)
+{
+	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg.reg);
+}
+
+static inline u64 intel_uncore_read64_2x32(struct fake_uncore *uncore, i915_reg_t lower_reg, i915_reg_t upper_reg)
+{
+	u32 upper, lower, old_upper;
+	int loop = 0;
+
+	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
+	do {
+		old_upper = upper;
+		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg.reg);
+		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
+	} while (upper != old_upper && loop++ < 2);
+
+	return (u64)upper << 32 | lower;
+}
+
+static inline void intel_uncore_posting_read(struct fake_uncore *uncore, i915_reg_t reg)
+{
+	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
+}
+
+static inline void intel_uncore_write(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
+{
+	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
+}
+
+static inline u32 intel_uncore_rmw(struct fake_uncore *uncore, i915_reg_t reg, u32 clear, u32 set)
+{
+	/* FIXME: rmw32 should be fixed to not need ~clear */
+	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg.reg, ~clear, set);
+}
+
+static inline int intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
+{
+	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
+}
+
+static inline int intel_wait_for_register_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
+{
+	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
+}
+
+static inline int __intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value,
+					    unsigned int fast_timeout_us, unsigned int slow_timeout_ms, u32 *out_value)
+{
+	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask,
+			      fast_timeout_us + 1000 * slow_timeout_ms,
+			      out_value, false);
+}
+
+static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore, i915_reg_t reg)
+{
+	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
+}
+
+static inline void intel_uncore_write_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
+{
+	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
+}
+
+static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore, i915_reg_t reg)
+{
+	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
+}
+
+static inline void intel_uncore_write_notrace(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
+{
+	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
+}
+
+#endif /* __INTEL_UNCORE_H__ */
-- 
2.39.2

