Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBF5C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DF910E469;
	Mon,  7 Sep 2026 06:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlSJpXsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246F010E469
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788763638; x=1820299638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0SBMwvS344fxQ2w0r3UQCyOaR37Zw78GIyGmm7zEcQ=;
 b=mlSJpXsdBs5F1bqDHjzxDvzgJx9NDUxlY1avQSZhxF55dwLkU3AaC2AW
 Ijz+zv2PBG+vUudxuKa3hmLtByArXRJVwHFGG1L7NVN9fkBbQkWUIeZeW
 nY4mLAnIHDo4ahsxptrQU29hu4E+EvSpqkjzziKRDkSk2fBNweSAp1Av6
 zIJdRqNXYVcSL7xbw5yFNjMuaAatuJ1E1db/Rfxve6rTUTQ22vqa+YhNB
 zzwpezQUoKvfvW1tJlP45VG2a15wdG1rioZlI8HxoSY6HFatVqznGk2AA
 jtZ3HV+ZlYGkZJwWEidQl1Y/qAuHsaBM4MeUhYw3H3FNBKy/4SGIEsELe g==;
X-CSE-ConnectionGUID: Y9+gl37sQoWQxYNzcVH3qA==
X-CSE-MsgGUID: Hwi5F2ZRQvKzBoAZenuYww==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76717863"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="76717863"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:47:18 -0700
X-CSE-ConnectionGUID: 8yQJPMPhTIG8f0pM3cooIw==
X-CSE-MsgGUID: wHyj+QVhQGyefLJTwOKNzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="264434161"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2026 23:47:16 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: S Sebinraj <s.sebinraj@intel.corp-partner.google.com>,
 Carlos Santa <carlos.santa@intel.com>, Ryan Neph <ryanneph@google.com>,
 S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 2/4] RFC: ANDROID: drm/xe: register ttm page alloc vendor
 hooks internally
Date: Mon,  7 Sep 2026 11:37:35 +0530
Message-Id: <20260907060737.3636824-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907060737.3636824-1-s.sebinraj@intel.com>
References: <20260907060737.3636824-1-s.sebinraj@intel.com>
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

From: S Sebinraj <s.sebinraj@intel.corp-partner.google.com>

Register the TTM page allocation vendor hooks
(android_vh_ttm_pool_alloc_max_page_order,
android_vh_ttm_pool_alloc_page_flags) directly from Xe, rather than via
the standalone intel_ttm_vendor_hooks.ko module, for direct, low
overhead access to xe_device state.

xe_register_android_vendor_hooks()/xe_unregister_android_vendor_hooks()
are called from xe_device_create()/xe_device_destroy() respectively.
Both are gated on the xe_modparam.mem_monitor_enabled master switch
(shared with xe_mem_monitor): if disabled, the hooks are never
registered at all, leaving TTM's default GFP flag behavior completely
untouched.

The hook caps the max TTM page order at 9 (2M pages) and adjusts GFP
flags for that order only based on xe->gpu_mem_mode, which is maintained
by xe_mem_monitor:

  XE_GPU_MEM_MODE_LATENCY (default):
      strip __GFP_DIRECT_RECLAIM and __GFP_KSWAPD_RECLAIM so 2M page
      allocations fail fast rather than stalling on reclaim.
      __GFP_NORETRY (already set by TTM for order>0) is left untouched.

  XE_GPU_MEM_MODE_HIGH_THROUGHPUT:
      explicitly set __GFP_DIRECT_RECLAIM and __GFP_KSWAPD_RECLAIM, clear
      __GFP_NORETRY, and add __GFP_RETRY_MAYFAIL so the allocator retries
      harder (including shrinking the page cache) to satisfy 2M page
      allocations during bursts of GPU memory growth.

      __GFP_NORETRY and __GFP_RETRY_MAYFAIL represent mutually exclusive
      points on the same "costly allocation" retry spectrum (see
      Documentation / gfp_types.h); __GFP_NORETRY is cleared explicitly
      here since TTM sets it unconditionally for order>0 allocations and
      leaving it set would blunt the effect of __GFP_RETRY_MAYFAIL.

  - order-0: leave flags unmodified
  - order-9: select based on gpu_mem_mode
  - all others: ~gfp_flags &= ~(__GFP_DIRECT_RECLAIM | __GFP_KSWAPD_RECLAIM)

A message (rate-limited to mode transitions only, not per allocation) is
logged whenever the effective mode changes, to aid verification. A new
xe_gpu_mem_mode_switch tracepoint is also emitted on every mode
transition (from xe_mem_monitor, see xe_trace.h) so the switching
behavior can be recorded in Perfetto/ftrace traces for debugging and
parameter tuning.

Test: confirmed hook fires and GFP flags change correctly across mode
      transitions via dmesg while running WebGL Aquarium / WLEU
      benchmark. Confirmed xe_gpu_mem_mode_switch tracepoint fires on
      each transition via ftrace. Confirmed hooks are not registered
      when mem_monitor_enabled=0 is passed as a boot argument.

Cc: Carlos Santa <carlos.santa@intel.com>
Signed-off-by: Ryan Neph <ryanneph@google.com>
Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/BUILD.bazel              |   1 +
 drivers/gpu/drm/xe/xe_device.c           |   6 +
 drivers/gpu/drm/xe/xe_mem_monitor.c      |  15 ++-
 drivers/gpu/drm/xe/xe_trace.h            |  16 +++
 drivers/gpu/drm/xe/xe_ttm_vendor_hooks.c | 135 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vendor_hooks.h |   9 ++
 6 files changed, 178 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_vendor_hooks.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_vendor_hooks.h

diff --git a/drivers/gpu/drm/BUILD.bazel b/drivers/gpu/drm/BUILD.bazel
index 274a1aa4ca93..f4fc4b94f71f 100644
--- a/drivers/gpu/drm/BUILD.bazel
+++ b/drivers/gpu/drm/BUILD.bazel
@@ -127,6 +127,7 @@ ddk_module(
         "xe/xe_trace_lrc.c",
         "xe/xe_ttm_stolen_mgr.c",
         "xe/xe_ttm_sys_mgr.c",
+        "xe/xe_ttm_vendor_hooks.c",
         "xe/xe_ttm_vram_mgr.c",
         "xe/xe_tuning.c",
         "xe/xe_uc.c",
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 676ffc258b94..d21068c1effc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -69,6 +69,7 @@
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
+#include "xe_ttm_vendor_hooks.h"
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
 #include "xe_vram.h"
@@ -419,6 +420,7 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	xe_unregister_android_vendor_hooks(xe);
 	xe_bo_dev_fini(&xe->bo_device);
 
 	if (xe->preempt_fence_wq)
@@ -464,6 +466,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
+	err = xe_register_android_vendor_hooks(xe);
+	if (err)
+		goto err;
+
 	err = xe_shrinker_create(xe);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_mem_monitor.c b/drivers/gpu/drm/xe/xe_mem_monitor.c
index 06fbd0624da7..9205417bfb0b 100644
--- a/drivers/gpu/drm/xe/xe_mem_monitor.c
+++ b/drivers/gpu/drm/xe/xe_mem_monitor.c
@@ -69,6 +69,7 @@
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_module.h"
+#include "xe_trace.h"
 
 /*
  * EMA smoothing factor. alpha (13/16 = 0.8125) applies to every real
@@ -157,18 +158,24 @@ struct xe_mem_monitor_data {
 
 static void xe_mem_monitor_set_high_throughput_mode(struct xe_mem_monitor_data *mon)
 {
-	/* TODO: wire up to the actual vendor hook (adds __GFP_RETRY_MAYFAIL, TBD) */
+	/*
+	 * The TTM vendor hook (xe_ttm_vendor_hooks.c) reads xe->gpu_mem_mode
+	 * directly on the next 2M page allocation, so updating the mode here
+	 * is sufficient - no separate hook call is needed.
+	 */
 	drm_dbg(&mon->xe->drm,
-		 "xe_mem_monitor: switching to HIGH_THROUGHPUT mode (TBD)\n");
+		 "xe_mem_monitor: switching to HIGH_THROUGHPUT mode\n");
 	atomic_set(&mon->xe->gpu_mem_mode, XE_GPU_MEM_MODE_HIGH_THROUGHPUT);
+	trace_xe_gpu_mem_mode_switch(XE_GPU_MEM_MODE_HIGH_THROUGHPUT, mon->ema_growth_bytes);
 }
 
 static void xe_mem_monitor_set_latency_mode(struct xe_mem_monitor_data *mon)
 {
-	/* TODO: wire up to the actual vendor hook (TBD) */
+	/* See xe_mem_monitor_set_high_throughput_mode() above. */
 	drm_dbg(&mon->xe->drm,
-		 "xe_mem_monitor: switching to LATENCY mode (TBD)\n");
+		 "xe_mem_monitor: switching to LATENCY mode\n");
 	atomic_set(&mon->xe->gpu_mem_mode, XE_GPU_MEM_MODE_LATENCY);
+	trace_xe_gpu_mem_mode_switch(XE_GPU_MEM_MODE_LATENCY, mon->ema_growth_bytes);
 }
 
 static void xe_mem_monitor_work(struct work_struct *work)
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 314f42fcbcbd..77bfc08613b9 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -441,6 +441,22 @@ TRACE_EVENT(xe_eu_stall_data_read,
 		      __entry->read_size, __entry->total_size)
 );
 
+TRACE_EVENT(xe_gpu_mem_mode_switch,
+	    TP_PROTO(int mode, u64 growth_bytes),
+	    TP_ARGS(mode, growth_bytes),
+
+	    TP_STRUCT__entry(__field(int, mode)
+			     __field(u64, growth_bytes)
+			     ),
+
+	    TP_fast_assign(__entry->mode = mode;
+			   __entry->growth_bytes = growth_bytes;
+			   ),
+
+	    TP_printk("mode=%d, growth_bytes=%llu", __entry->mode,
+		      __entry->growth_bytes)
+);
+
 #endif
 
 /* This part must be outside protection */
diff --git a/drivers/gpu/drm/xe/xe_ttm_vendor_hooks.c b/drivers/gpu/drm/xe/xe_ttm_vendor_hooks.c
new file mode 100644
index 000000000000..b4136ac6cc88
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_vendor_hooks.c
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 Google LLC.
+ *
+ * TTM page allocation vendor hooks, registered internally by Xe (rather than
+ * via the standalone intel_ttm_vendor_hooks.ko module) for direct, low
+ * overhead access to xe_device state.
+ *
+ * The GFP flags for 2M (order-9) page allocations are adjusted based on
+ * xe->gpu_mem_mode, which is maintained by xe_mem_monitor:
+ *
+ *   XE_GPU_MEM_MODE_LATENCY:          strip __GFP_DIRECT_RECLAIM and
+ *                                     __GFP_KSWAPD_RECLAIM for fast, low
+ *                                     latency allocation. __GFP_NORETRY (set
+ *                                     by TTM for order>0) is left untouched.
+ *   XE_GPU_MEM_MODE_HIGH_THROUGHPUT:  ensure __GFP_DIRECT_RECLAIM and
+ *                                     __GFP_KSWAPD_RECLAIM are set, clear
+ *                                     __GFP_NORETRY (set by TTM for order>0,
+ *                                     and mutually exclusive in intent with
+ *                                     __GFP_RETRY_MAYFAIL below), and add
+ *                                     __GFP_RETRY_MAYFAIL to maximize the
+ *                                     chance of a successful 2M page
+ *                                     allocation.
+ *
+ * All other orders (including order-0) are left completely unmodified.
+ */
+
+#include <linux/atomic.h>
+#include <linux/gfp.h>
+#include <linux/printk.h>
+#include <trace/hooks/ttm_pool.h>
+
+#include "xe_device_types.h"
+#include "xe_mem_monitor.h"
+#include "xe_module.h"
+#include "xe_ttm_vendor_hooks.h"
+
+/* 2M pages (order-9) are the only order whose GFP flags are adjusted. */
+#define XE_TTM_VENDOR_HOOKS_ORDER	9
+
+static void xe_android_vh_ttm_pool_alloc_max_page_order(void *data,
+							unsigned int *max_order)
+{
+	*max_order = XE_TTM_VENDOR_HOOKS_ORDER;
+}
+
+static void xe_android_vh_ttm_pool_alloc_page_flags(void *data,
+						    unsigned int order,
+						    gfp_t *gfp_flags)
+{
+	struct xe_device *xe = (struct xe_device *)data;
+	int mode;
+
+	/* order-0 must always be with __GFP_DIRECT_RECLAIM to avoid ENOMEM
+	 * unless it is absolutely necessary (system memory is completely
+	 * exhausted).
+	 */
+	if (!order)
+		return;
+
+	mode = atomic_read(&xe->gpu_mem_mode);
+
+	if (order == XE_TTM_VENDOR_HOOKS_ORDER &&
+	    mode == XE_GPU_MEM_MODE_HIGH_THROUGHPUT) {
+		/*
+		 * Ensure reclaim is allowed, clear __GFP_NORETRY (set by TTM for
+		 * order>0, but mutually exclusive in intent with
+		 * __GFP_RETRY_MAYFAIL) and add __GFP_RETRY_MAYFAIL so the
+		 * allocator retries harder for a 2M page instead of failing fast.
+		 * Order-9 (2MB) is specifically targeted here as the underlying IOMMU
+		 * hardware and Xe architecture operate most efficiently with 2MB alignments.
+		 */
+		*gfp_flags |= (__GFP_DIRECT_RECLAIM | __GFP_KSWAPD_RECLAIM | __GFP_RETRY_MAYFAIL);
+		*gfp_flags &= ~__GFP_NORETRY;
+	} else {
+		*gfp_flags &= ~(__GFP_DIRECT_RECLAIM | __GFP_KSWAPD_RECLAIM);
+	}
+}
+
+int xe_register_android_vendor_hooks(struct xe_device *xe)
+{
+	int ret;
+
+	/*
+	 * Gated by the same master switch as xe_mem_monitor: if the feature is
+	 * disabled, do not register the hooks at all so TTM's default GFP flag
+	 * behavior is left completely untouched.
+	 */
+	if (!xe_modparam.mem_monitor_enabled)
+		return 0;
+
+	ret = register_trace_android_vh_ttm_pool_alloc_max_page_order(
+		xe_android_vh_ttm_pool_alloc_max_page_order, (void *)xe);
+	if (ret) {
+		pr_warn("failed to register ttm_pool_alloc_max_page_order hook: %d\n",
+			ret);
+		goto fail;
+	}
+
+	ret = register_trace_android_vh_ttm_pool_alloc_page_flags(
+		xe_android_vh_ttm_pool_alloc_page_flags, (void *)xe);
+	if (ret) {
+		pr_warn("failed to register ttm_pool_alloc_page_flags hook: %d\n",
+			ret);
+		goto fail_alloc_page_flags;
+	}
+
+	return 0;
+
+fail_alloc_page_flags:
+	unregister_trace_android_vh_ttm_pool_alloc_max_page_order(
+		xe_android_vh_ttm_pool_alloc_max_page_order, (void *)xe);
+fail:
+	return ret;
+}
+
+void xe_unregister_android_vendor_hooks(struct xe_device *xe)
+{
+	int ret;
+
+	if (!xe_modparam.mem_monitor_enabled)
+		return;
+
+	ret = unregister_trace_android_vh_ttm_pool_alloc_max_page_order(
+		xe_android_vh_ttm_pool_alloc_max_page_order, (void *)xe);
+	if (ret)
+		pr_warn("failed to unregister ttm_pool_alloc_max_page_order hook: %d\n",
+			ret);
+
+	ret = unregister_trace_android_vh_ttm_pool_alloc_page_flags(
+		xe_android_vh_ttm_pool_alloc_page_flags, (void *)xe);
+	if (ret)
+		pr_warn("failed to unregister ttm_pool_alloc_page_flags hook: %d\n",
+			ret);
+}
diff --git a/drivers/gpu/drm/xe/xe_ttm_vendor_hooks.h b/drivers/gpu/drm/xe/xe_ttm_vendor_hooks.h
new file mode 100644
index 000000000000..f2059a3822ae
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_vendor_hooks.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 Google LLC.
+ */
+
+struct xe_device;
+
+int xe_register_android_vendor_hooks(struct xe_device *xe);
+void xe_unregister_android_vendor_hooks(struct xe_device *xe);
-- 
2.34.1

