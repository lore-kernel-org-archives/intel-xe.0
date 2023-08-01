Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F690C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 10:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CDF10E39F;
	Tue,  1 Aug 2023 10:49:00 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803410E0CA
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690886937; x=1722422937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hMdTpEdSz+n/IbrA2Cz8KfC7ROHkI2kS8ILyuBwtkTw=;
 b=DoXrwzT25iwCzZ4GtoB/VCDvl7bt4MPpv0x9X9JomUdnanGaFyYgUj5+
 Gq0ossL5j8WmsWytxiSdGrnHaAC+/NBUkrBSO9z2m7Vb+qVCOjxn8q2gs
 ma30RUysog5iolKkDYeChvQzqc0ECA1ih72jxaNbFLHydRrHpbCkY/17w
 J4MNYbvXyPuPZ8YwssCpAvSs3qWn9W+lpE4cZ2Mg0USwsBLk31TE8SQkA
 UI5B+mORp0uAizCD3cUpd15qtCAVevFFja6JGZ9zb8UVVTzIQeyCgePJC
 m7xPQiTUK3ntTtrMhraKGOU+DEAI8LqKLFR2Zx90tsEILlaCEdbsmBxJi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371977816"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="371977816"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 03:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763714890"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="763714890"
Received: from aboros-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.210.9])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 03:48:56 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  1 Aug 2023 10:48:41 +0000
Message-Id: <20230801104842.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801104842.7-1-francois.dugast@intel.com>
References: <20230801104842.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/2] drm/xe: Rename xe_engine.[ch] to
 xe_exec_queue.[ch]
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a preparation commit for a larger renaming of engine to exec queue.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Makefile                         | 2 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                 | 2 +-
 drivers/gpu/drm/xe/xe_device.c                      | 2 +-
 drivers/gpu/drm/xe/xe_exec.c                        | 2 +-
 drivers/gpu/drm/xe/{xe_engine.c => xe_exec_queue.c} | 2 +-
 drivers/gpu/drm/xe/{xe_engine.h => xe_exec_queue.h} | 0
 drivers/gpu/drm/xe/xe_execlist.c                    | 2 +-
 drivers/gpu/drm/xe/xe_gt.c                          | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                  | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c                     | 2 +-
 drivers/gpu/drm/xe/xe_mocs.c                        | 2 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c               | 2 +-
 drivers/gpu/drm/xe/xe_query.c                       | 2 +-
 drivers/gpu/drm/xe/xe_sched_job.c                   | 2 +-
 drivers/gpu/drm/xe/xe_vm.c                          | 2 +-
 15 files changed, 14 insertions(+), 14 deletions(-)
 rename drivers/gpu/drm/xe/{xe_engine.c => xe_exec_queue.c} (99%)
 rename drivers/gpu/drm/xe/{xe_engine.h => xe_exec_queue.h} (100%)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4ea9e3150c20..e79624ab2cb3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -51,9 +51,9 @@ xe-y += xe_bb.o \
 	xe_device.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
-	xe_engine.o \
 	xe_exec.o \
 	xe_execlist.o \
+	xe_exec_queue.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
 	xe_gt.o \
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index f53f4b51233a..61ff97ea7659 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -10,7 +10,7 @@
 #include <generated/utsrelease.h>
 
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5409cf7895d3..1456c6a5c243 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -19,7 +19,7 @@
 #include "xe_display.h"
 #include "xe_dma_buf.h"
 #include "xe_drv.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_exec.h"
 #include "xe_gt.h"
 #include "xe_irq.h"
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index fff4a9d9d12a..e7120ba4341d 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -12,7 +12,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_macros.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_exec_queue.c
similarity index 99%
rename from drivers/gpu/drm/xe/xe_engine.c
rename to drivers/gpu/drm/xe/xe_exec_queue.c
index c30810a687b1..3055ab531ff0 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -3,7 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 
 #include <linux/nospec.h>
 
diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_exec_queue.h
similarity index 100%
rename from drivers/gpu/drm/xe/xe_engine.h
rename to drivers/gpu/drm/xe/xe_exec_queue.h
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 0f9d919405b0..2cbb8d2990d1 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -14,7 +14,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 28bf577c7bf2..543b085723c5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -14,7 +14,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8d2b50e03ed2..9484a215e834 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -16,7 +16,7 @@
 #include "regs/xe_lrc_layout.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 414f93cddb28..e44bff127f8c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -16,7 +16,7 @@
 #include "tests/xe_test.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index ccc852500eda..c9653978fc9f 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -8,7 +8,7 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 219eefeb90ff..e86604e0174d 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -7,7 +7,7 @@
 
 #include <linux/slab.h>
 
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_vm.h"
 
 static void preempt_fence_work_func(struct work_struct *w)
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 6ba7baf7c777..382851f436b7 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -12,7 +12,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index b5bf14b828f9..8f017a5ec221 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -9,7 +9,7 @@
 #include <linux/slab.h>
 
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence.h"
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 44df7b9d801e..797fc91de2fd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -18,7 +18,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_tlb_invalidation.h"
-- 
2.34.1

