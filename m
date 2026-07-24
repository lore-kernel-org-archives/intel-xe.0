Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEF3C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 23:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B50B10F4B2;
	Fri, 24 Jul 2026 23:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kItLZFgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2BF10E0C6
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 23:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784935566; x=1816471566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xa+IigjYuIgIioXe95ckve3hgfJgL0gwCiQpkukhIUA=;
 b=kItLZFgrdYn7AVmRzK6sk73pWgkqPfpkFuatydlAY1G3zcEVjK2AEhon
 8q0l7Ntum3dRGlj4Vrhn2c3nN+KqqPkPL06BrIAOQc7SPLS2Y+Ci0GuP7
 UFvFCahlMDoq0fwBadcWJs4Tk+2gmeJwDsbA4pkpuJEl+SUwWSIdPkQjU
 WQVpOLvZFEEOylQ7lP9qt9K5W14ZQVulDKRv725KTRh6JE2287oIV9A8i
 bsqjTl9vEpYq7j9d9ZFLo9NC1RWDSM9eboivuqN6Ch3fZDf0V31q821lK
 DDtTdEBJa+xH9oKCXEXjshTvUfHi2lSAZ/QukXu2WK97WR45yvrNi/6IU g==;
X-CSE-ConnectionGUID: hlmpEHDZQR+kxtdtHcLmJw==
X-CSE-MsgGUID: uB2RcYj3S3+97X9l7pLIGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85652034"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="85652034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 16:26:05 -0700
X-CSE-ConnectionGUID: zYr0+KhVTNinUX8nl6J0wQ==
X-CSE-MsgGUID: uuz27SEsQxKlAv5n2g2uKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="257073809"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 16:26:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v8 10/12] drm/xe: Add debugfs pagefault_info
Date: Fri, 24 Jul 2026 16:25:59 -0700
Message-Id: <20260724232601.1753977-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724232601.1753977-1-matthew.brost@intel.com>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
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

Add a debugfs entry to dump Xe page fault queue state. The output
includes queue geometry (entry size, total size, head/tail), per-entry
allocation state counts, and whether each page fault worker cache is
currently valid.

This is intended to help debug page fault storms, chaining, and retry
behaviour without needing tracing.

Assisted-by: ChatGPT:gpt-5 # Documentation
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c   | 11 +++++
 drivers/gpu/drm/xe/xe_pagefault.c | 67 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.h |  3 ++
 3 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 5a3877fcb0f0..5a7286679958 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -22,6 +22,7 @@
 #include "xe_guc_ads.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
+#include "xe_pagefault.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
@@ -194,6 +195,15 @@ static int sriov_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int pagefault_info(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pagefault_print_info(xe, &p);
+	return 0;
+}
+
 static int workarounds(struct xe_device *xe, struct drm_printer *p)
 {
 	guard(xe_pm_runtime)(xe);
@@ -285,6 +295,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
 	{ .name = "sriov_info", .show = sriov_info, },
 	{ .name = "workarounds", .show = workaround_info, },
+	{ .name = "pagefault_info", .show = pagefault_info, },
 };
 
 static const struct drm_info_list pcode_info_debugfs[] = {
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index b11b1985d091..caa39a024ae6 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -83,6 +83,8 @@
  *	Entry is not independently serviced; it has been chained onto an
  *	ACTIVE entry via consumer.next and will be acknowledged when the
  *	leading fault completes.
+ * @XE_PAGEFAULT_ALLOC_STATE_COUNT:
+ *	Count of allocation states.
  *
  * The page fault queue provides stable storage for outstanding faults so the
  * IRQ handler can chain new cache hits directly onto a worker's active fault.
@@ -97,6 +99,7 @@ enum xe_pagefault_alloc_state {
 	XE_PAGEFAULT_ALLOC_STATE_QUEUED		= 1,
 	XE_PAGEFAULT_ALLOC_STATE_CHAINED	= 2,
 	XE_PAGEFAULT_ALLOC_STATE_ACTIVE		= 3,
+	XE_PAGEFAULT_ALLOC_STATE_COUNT		= 4,
 };
 
 static int xe_pagefault_entry_size(void)
@@ -873,3 +876,67 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 
 	return full ? -ENOSPC : 0;
 }
+
+/**
+ * xe_pagefault_print_info() - dump page fault queue/cache debug information
+ * @xe: Xe device
+ * @p: DRM printer to emit output to
+ *
+ * Print a snapshot of the page fault queue state for debugging. The output
+ * includes queue parameters (entry size, total size, head/tail), a histogram
+ * of per-entry allocation state values, and the validity of each per-worker
+ * page fault cache.
+ *
+ * This function is intended for debugfs and similar diagnostics. It acquires
+ * the page fault queue spinlock internally to serialize against IRQ-side
+ * producers and the worker consumer path, so callers must not hold the queue
+ * lock.
+ */
+void xe_pagefault_print_info(struct xe_device *xe, struct drm_printer *p)
+{
+	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
+	struct xe_pagefault_work *pf_work;
+	static const char * const alloc_state_names[] = {
+		[XE_PAGEFAULT_ALLOC_STATE_FREE] = "free",
+		[XE_PAGEFAULT_ALLOC_STATE_QUEUED] = "queued",
+		[XE_PAGEFAULT_ALLOC_STATE_CHAINED] = "chained",
+		[XE_PAGEFAULT_ALLOC_STATE_ACTIVE] = "active",
+	};
+	u32 i, counts[XE_PAGEFAULT_ALLOC_STATE_COUNT] = {};
+
+	/* Driver load failure guard / USM not enabled guard */
+	if (!pf_queue->data)
+		return;
+
+	guard(spinlock_irq)(&pf_queue->lock);
+
+	drm_printf(p, "pagefault size: %u\n", xe_pagefault_entry_size());
+	drm_printf(p, "pagefault queue size: %u\n", pf_queue->size);
+	drm_printf(p, "pagefault queue head: %u\n", pf_queue->head);
+	drm_printf(p, "pagefault queue tail: %u\n", pf_queue->tail);
+
+	for (i = 0; i < pf_queue->size; i += xe_pagefault_entry_size()) {
+		struct xe_pagefault *pf = pf_queue->data + i;
+
+		if (pf->consumer.alloc_state >=
+		    XE_PAGEFAULT_ALLOC_STATE_COUNT) {
+			drm_printf(p, "pagefault[%u] corrupted alloc_state=%u\n",
+				   i, pf->consumer.alloc_state);
+			continue;
+		}
+
+		counts[pf->consumer.alloc_state]++;
+	}
+
+	for (i = 0; i < XE_PAGEFAULT_ALLOC_STATE_COUNT; ++i)
+		drm_printf(p, "pagefault queue %s count: %u\n",
+			   alloc_state_names[i], counts[i]);
+
+	for (i = 0, pf_work = xe->usm.pf_workers;
+	     i < xe->info.num_pf_work; ++i, ++pf_work) {
+		if (pf_work->cache.start == XE_PAGEFAULT_CACHE_START_INVALID)
+			drm_printf(p, "pagefault work[%u] cache invalid\n", i);
+		else
+			drm_printf(p, "pagefault work[%u] cache valid\n", i);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
index feaf2a69674a..e9c5d1f03760 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_pagefault.h
@@ -8,6 +8,7 @@
 
 #include "xe_pagefault_types.h"
 
+struct drm_printer;
 struct xe_device;
 struct xe_gt;
 struct xe_pagefault;
@@ -18,6 +19,8 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
 
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
 
+void xe_pagefault_print_info(struct xe_device *xe, struct drm_printer *p);
+
 #define XE_PAGEFAULT_END_ADDR_MASK	(~0xfffull)
 
 /**
-- 
2.34.1

