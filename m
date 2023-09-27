Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26376E80AA1
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 07:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7DA10E46B;
	Wed, 27 Sep 2023 07:31:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C0610E416
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695799907; x=1727335907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sApVa/mgwifRVFlcP6P3FO6guua0WSRaKqdK33lEl1E=;
 b=G9vQdnJmXclvKMFqh8M5qy4oC2jYuVI86AgI8/SCRRKPHv07ioO138AT
 Wu+8rN0WgI0RIGcbbhygDHiZQMdDtr4VH6kbzQH86slaPfU29jZu8G9zf
 p4+2zyzrZzlABVEoyP9z3Z7FmroOWXYOVfe/aDalDnD859dsH6RI7GcMb
 9Sib0LvGz0sJFQlnN20dtLVcZ82/UB+/7kTG36KqUBYs/2tCqb8zAOaF1
 tkR3BlV8UxlL3lG2aMtTOdiLaopVe4goC8HMBy25zmzK3mgYbwq/Tc7HJ
 KMgLkKQCY2GoAJNdef9A4xNOQ7l6A5WQTMICwKEWOjV6Vjvmsqlng6JOf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372091629"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372091629"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922684505"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="922684505"
Received: from petrovam-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.220.182])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:31:44 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 10:31:25 +0300
Message-Id: <20230927073125.3825836-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927073125.3825836-1-jouni.hogander@intel.com>
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 3/3] fixup! drm/xe/display: Implement display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add i915_sw_fence.h compatibility header and implement sw fence
interfaces for display code usage.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |   1 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 -
 .../xe/compat-i915-headers/i915_sw_fence.h    | 111 ++++++++++++++++++
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b1141fb125c8..2d11f159f927 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -46,6 +46,7 @@
 #include <drm/i915_hdcp_interface.h>
 #include <media/cec-notifier.h>
 
+#include "i915_sw_fence.h"
 #include "i915_vma.h"
 #include "i915_vma_types.h"
 #include "intel_bios.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 03ac39efba38..c8b0f38e55fa 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -196,7 +196,6 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
 #define intel_uncore_forcewake_put(x, y) do { } while (0)
 
 #define intel_uncore_arm_unclaimed_mmio_detection(x) do { } while (0)
-#define i915_sw_fence_commit(x) do { } while (0)
 
 #define with_intel_runtime_pm(rpm, wf) \
 	for ((wf) = intel_runtime_pm_get(rpm); (wf); \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h
new file mode 100644
index 000000000000..fd6c96682932
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h
@@ -0,0 +1,111 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * i915_sw_fence.h - library routines for N:M synchronisation points
+ *
+ * Copyright (C) 2023 Intel Corporation
+ */
+
+#ifndef _I915_SW_FENCE_H_
+#define _I915_SW_FENCE_H_
+
+#include <linux/dma-fence.h>
+#include <linux/dma-resv.h>
+#include <linux/gfp.h>
+#include <linux/notifier.h> /* for NOTIFY_DONE */
+
+struct completion;
+struct dma_resv;
+struct i915_sw_fence;
+
+enum i915_sw_fence_notify {
+	FENCE_COMPLETE,
+	FENCE_FREE
+};
+
+typedef int (*i915_sw_fence_notify_t)(struct i915_sw_fence *,
+				      enum i915_sw_fence_notify state);
+
+struct i915_sw_fence {
+	struct dma_resv resv;
+	i915_sw_fence_notify_t fn;
+	unsigned long timeout;
+};
+static inline void i915_sw_fence_init(struct i915_sw_fence *fence, i915_sw_fence_notify_t fn)
+{
+	dma_resv_init(&fence->resv);
+	fence->fn = fn;
+	fence->timeout = 0;
+}
+
+static inline void i915_sw_fence_fini(struct i915_sw_fence *fence)
+{
+	dma_resv_fini(&fence->resv);
+}
+
+#define i915_sw_fence_commit(x) do { } while (0)
+
+struct i915_sw_dma_fence_cb {
+	struct dma_fence_cb base;
+	struct i915_sw_fence *fence;
+};
+
+static inline int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
+				  struct dma_fence *dma,
+				  unsigned long timeout,
+				  gfp_t gfp)
+{
+	int ret;
+
+	dma_resv_lock(&fence->resv, NULL);
+	ret = dma_resv_reserve_fences(&fence->resv, 1);
+	if (!ret) {
+		dma_resv_add_fence(&fence->resv, dma, dma_resv_usage_rw(false));
+		fence->timeout = max(timeout, fence->timeout);
+	}
+	dma_resv_unlock(&fence->resv);
+
+	return ret;
+}
+
+static inline int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
+				    struct dma_resv *resv,
+				    bool write,
+				    unsigned long timeout,
+				    gfp_t gfp)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *f;
+	int ret;
+
+	dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(false));
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
+		ret = i915_sw_fence_await_dma_fence(fence, f, timeout, gfp);
+		if (ret < 0)
+			break;
+	}
+	dma_resv_iter_end(&cursor);
+
+	return ret;
+}
+
+static inline void i915_sw_fence_wait_completion(void *unused,
+						 struct i915_sw_fence *fence)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *f;
+
+	dma_resv_wait_timeout(&fence->resv, dma_resv_usage_rw(false),
+			      false, fence->timeout);
+
+	fence->fn(fence, FENCE_COMPLETE);
+
+	dma_resv_iter_begin(&cursor, &fence->resv, dma_resv_usage_rw(false));
+	dma_resv_for_each_fence_unlocked(&cursor, f)
+		dma_fence_put(f);
+	dma_resv_iter_end(&cursor);
+
+	fence->fn(fence, FENCE_FREE);
+}
+
+#endif /* _I915_SW_FENCE_H_ */
-- 
2.34.1

