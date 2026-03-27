Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD37910F284A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 15:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D2810E259;
	Fri, 27 Mar 2026 15:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bB9Vxac/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552AB10E259
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774627116; x=1806163116;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vXPBcfq4pjMg98jYuTxBmNoV40msQFKhtOepVT9Xy58=;
 b=bB9Vxac/dwTTdxpAa+qaJ9jATFIJt6CILnb/hKL5KjPbtOINDc7c5pfa
 Sz9iMHvbX2qYouaiBereyaTAIcHwj4oP5AbXU0SEP2a2TThitGc9T//km
 eWwKDw8woLtZrJ56HDTQg8VkKCORwtxQv0fbmsFZNvKbe7hiYurloQEBR
 TPpwTh4OVbqdMS2ED5KW6xU+joojmbdH/gKCEdOSNut6d9Nwh5/vlU9u8
 Ui48zssBum+VpAqzlSgxW4rpSC9DLKmFBDo7QOkSerWsfVp94ufiSn0fR
 A0Ls9/edjpbVscOSnuFe1MxIcI6yjoqTX5uvAkdpoEkDoiq5sjj1H23JO g==;
X-CSE-ConnectionGUID: cEWEaYOrTICFDOLV71eJjw==
X-CSE-MsgGUID: cM6iff8bSWe7mwhXEfz9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78297878"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="78297878"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 08:58:35 -0700
X-CSE-ConnectionGUID: iO0D9ztxSLW5pjyBHqsYXA==
X-CSE-MsgGUID: 96uEmxvYTwST5cHEtFpuzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224562303"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.155])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 08:58:31 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Document GT statistics
Date: Fri, 27 Mar 2026 16:58:17 +0100
Message-ID: <20260327155817.201865-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In the context of porting applications to SVM, the Xe GT statistics are
used by application developers to validate expected behavior such as
proper alignment, page fault count and migrations. As those statistics
are made for kernel developers, they assume good understanding of driver
internals, which is not always the case on the application side.
Therefore, this commit documents the usage of GT statistics and clarifies
the meaning of identifiers which correspond to the values exposed via
debugfs. Documentation is close to identifiers declaration to make it
easier to maintain when adding new entries in the future.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 Documentation/gpu/xe/index.rst         |   1 +
 Documentation/gpu/xe/xe_gt_stats.rst   |  11 +++
 drivers/gpu/drm/xe/xe_gt_stats.c       |  41 +++++++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 118 +++++++++++++++++++++++++
 4 files changed, 171 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_gt_stats.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index bc432c95d1a3..874ffcb6da3a 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -29,3 +29,4 @@ DG2, etc is provided to prototype the driver.
    xe_device
    xe-drm-usage-stats.rst
    xe_configfs
+   xe_gt_stats
diff --git a/Documentation/gpu/xe/xe_gt_stats.rst b/Documentation/gpu/xe/xe_gt_stats.rst
new file mode 100644
index 000000000000..5ff806abaddb
--- /dev/null
+++ b/Documentation/gpu/xe/xe_gt_stats.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+================
+Xe GT Statistics
+================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_stats.c
+   :doc: Xe GT Statistics
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_stats_types.h
+   :internal:
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 59b3b23a54c8..789397514f3e 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -9,6 +9,47 @@
 #include "xe_device.h"
 #include "xe_gt_stats.h"
 
+/**
+ * DOC: Xe GT Statistics
+ *
+ * Overview
+ * ========
+ *
+ * The Xe driver exposes per-GT statistics through the debugfs filesystem at::
+ *
+ *   /sys/kernel/debug/dri/<device>/gt<id>/stats
+ *
+ * This interface requires the kernel to be built with ``CONFIG_DEBUG_FS=y``.
+ *
+ * Reading statistics
+ * ==================
+ *
+ * Reading the file prints all available statistics, one per line, in
+ * ``name: value`` format::
+ *
+ *   $ cat /sys/kernel/debug/dri/0/gt0/stats
+ *   svm_pagefault_count: 0
+ *   tlb_inval_count: 1234
+ *   ...
+ *
+ * All values are 64-bit unsigned integers aggregated across all CPUs.
+ * Counters accumulate since the driver was loaded or since the last explicit
+ * reset.  Timing counters use microseconds as their unit; data volume counters
+ * use KiB.
+ *
+ * Resetting statistics
+ * ====================
+ *
+ * Writing a boolean true value to the file resets all counters to zero::
+ *
+ *   echo 1 > /sys/kernel/debug/dri/0/gt0/stats
+ *
+ * Any value accepted by ``kstrtobool()`` (e.g. ``1``, ``y``, ``yes``,
+ * ``on``) triggers the reset.  Resetting while the GPU is active may yield
+ * unpredictable intermediate values; it is recommended to reset only when
+ * the GPU is idle.
+ */
+
 static void xe_gt_stats_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_gt *gt = arg;
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index 081c787ddcb6..cec0dddf4176 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -8,6 +8,124 @@
 
 #include <linux/types.h>
 
+/**
+ * enum xe_gt_stats_id - GT statistics identifiers
+ * @XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT: Total SVM page faults handled.
+ * @XE_GT_STATS_ID_TLB_INVAL: Total GPU Translation Lookaside Buffer (TLB)
+ *   invalidations issued.
+ * @XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT: TLB invalidations issued during SVM
+ *   page-fault handling.
+ * @XE_GT_STATS_ID_SVM_TLB_INVAL_US: Cumulative time (µs) waiting for TLB
+ *   invalidations during SVM page-fault handling.
+ *
+ * @XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT: Buffer-object (non-SVM) page faults
+ *   handled.
+ * @XE_GT_STATS_ID_VMA_PAGEFAULT_KB: Size (KiB) of VMAs involved in
+ *   buffer-object page fault handling.
+ * @XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT: GPU prefetch faults for
+ *   addresses with no valid backing.
+ *
+ * @XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT: SVM page faults resolved by
+ *   mapping 4K pages.
+ * @XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT: SVM page faults resolved by
+ *   mapping 64K pages.
+ * @XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT: SVM page faults resolved by
+ *   mapping 2M pages.
+ * @XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT: Valid SVM page faults
+ *   at 4K page size, where the GPU mapping was already valid — resolved without
+ *   creating new mappings.
+ * @XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT: Valid SVM page faults at 64K
+ *   page size.
+ * @XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT: Valid SVM page faults at 2M
+ *   page size.
+ * @XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US: Cumulative time (µs) handling 4K SVM
+ *   page faults.
+ * @XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US: Cumulative time (µs) handling 64K
+ *   SVM page faults.
+ * @XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US: Cumulative time (µs) handling 2M SVM
+ *   page faults.
+ *
+ * @XE_GT_STATS_ID_SVM_4K_MIGRATE_COUNT: 4K pages moved from CPU to device
+ *   memory.
+ * @XE_GT_STATS_ID_SVM_64K_MIGRATE_COUNT: 64K pages moved from CPU to device
+ *   memory.
+ * @XE_GT_STATS_ID_SVM_2M_MIGRATE_COUNT: 2M pages moved from CPU to device
+ *   memory.
+ * @XE_GT_STATS_ID_SVM_4K_MIGRATE_US: Cumulative time (µs) moving 4K pages
+ *   from CPU to device memory.
+ * @XE_GT_STATS_ID_SVM_64K_MIGRATE_US: Cumulative time (µs) moving 64K pages
+ *   from CPU to device memory.
+ * @XE_GT_STATS_ID_SVM_2M_MIGRATE_US: Cumulative time (µs) moving 2M pages
+ *   from CPU to device memory.
+ *
+ * @XE_GT_STATS_ID_SVM_DEVICE_COPY_US: Cumulative time (µs) for memory copies to
+ *   device, across all page sizes.
+ * @XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US: Cumulative time (µs) for memory copies
+ *   of 4K pages to device.
+ * @XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US: Cumulative time (µs) for memory
+ *   copies of 64K pages to device.
+ * @XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US: Cumulative time (µs) for memory copies
+ *   of 2M pages to device.
+ * @XE_GT_STATS_ID_SVM_CPU_COPY_US: Cumulative time (µs) for memory copies to
+ *   CPU, across all page sizes.
+ * @XE_GT_STATS_ID_SVM_4K_CPU_COPY_US: Cumulative time (µs) for memory copies of
+ *   4K pages to CPU.
+ * @XE_GT_STATS_ID_SVM_64K_CPU_COPY_US: Cumulative time (µs) for memory copies
+ *   of 64K pages to CPU.
+ * @XE_GT_STATS_ID_SVM_2M_CPU_COPY_US: Cumulative time (µs) for memory copies of
+ *   2M pages to CPU.
+ * @XE_GT_STATS_ID_SVM_DEVICE_COPY_KB: Data (KiB) copied to device across all
+ *   page sizes.
+ * @XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_KB: Data (KiB) copied to device for 4K
+ *   pages.
+ * @XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_KB: Data (KiB) copied to device for
+ *   64K pages.
+ * @XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_KB: Data (KiB) copied to device for 2M
+ *   pages.
+ * @XE_GT_STATS_ID_SVM_CPU_COPY_KB: Data (KiB) copied to CPU across all page
+ *   sizes.
+ * @XE_GT_STATS_ID_SVM_4K_CPU_COPY_KB: Data (KiB) copied to CPU for 4K pages.
+ * @XE_GT_STATS_ID_SVM_64K_CPU_COPY_KB: Data (KiB) copied to CPU for 64K pages.
+ * @XE_GT_STATS_ID_SVM_2M_CPU_COPY_KB: Data (KiB) copied to CPU for 2M pages.
+ *
+ * @XE_GT_STATS_ID_SVM_4K_GET_PAGES_US: Cumulative time (µs) getting CPU
+ *   memory pages for GPU access at 4K page size.
+ * @XE_GT_STATS_ID_SVM_64K_GET_PAGES_US: Cumulative time (µs) getting CPU
+ *   memory pages for GPU access at 64K page size.
+ * @XE_GT_STATS_ID_SVM_2M_GET_PAGES_US: Cumulative time (µs) getting CPU
+ *   memory pages for GPU access at 2M page size.
+ * @XE_GT_STATS_ID_SVM_4K_BIND_US: Cumulative time (µs) binding 4K pages
+ *   into the GPU page table.
+ * @XE_GT_STATS_ID_SVM_64K_BIND_US: Cumulative time (µs) binding 64K pages
+ *   into the GPU page table.
+ * @XE_GT_STATS_ID_SVM_2M_BIND_US: Cumulative time (µs) binding 2M pages
+ *   into the GPU page table.
+ *
+ * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT: Times the
+ *   scheduler preempted a long-running (LR) GPU exec queue.
+ * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT: Times the scheduler
+ *   skipped suspend because the system was idle.
+ * @XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT: Times the driver
+ *   stalled waiting for prior GPU work to complete before scheduling more.
+ * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US: Cumulative time
+ *   (µs) spent preempting long-running (LR) GPU exec queues.
+ * @XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US: Cumulative time (µs)
+ *   stalled waiting for prior GPU work to complete.
+ *
+ * @XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT: 4K-page entries from the GPU prefetch
+ *   request list that were processed.
+ * @XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT: 64K-page entries from the GPU prefetch
+ *   request list that were processed.
+ * @XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT: 2M-page entries from the GPU prefetch
+ *   request list that were processed.
+ * @XE_GT_STATS_ID_PRL_ISSUED_COUNT: Prefetch requests submitted to the GPU.
+ * @XE_GT_STATS_ID_PRL_ABORTED_COUNT: Prefetch requests cancelled before
+ *   reaching the GPU (e.g. due to conflicting page faults or memory pressure).
+ *
+ * @__XE_GT_STATS_NUM_IDS: Number of valid IDs; not a real counter.
+ *
+ * See Documentation/gpu/xe/xe_gt_stats.rst.
+ */
 enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_TLB_INVAL,
-- 
2.43.0

