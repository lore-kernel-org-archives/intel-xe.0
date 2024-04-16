Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C7FC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1E51129A7;
	Tue, 16 Apr 2024 03:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B78trodl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F2E1129A4
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713236708; x=1744772708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DULIJzdnj4u0JLc11g1LnLb2f/gWi6ISs0PIIYkMjgo=;
 b=B78trodl2EffV/NtBnEcza/NBMifeWbkJJeZSDxqeqPuc2D89tGoIJ9O
 Y/O0Ohlcmn0SfjZUZR0IfRHk1mIyVwlV/u2u+tiIrvy2C+8j+YwI/G9df
 TtXnoJINISmp2FAAbC0fnYcmXi9GKPagmm8Z7KTPTrh+42mI6nqlpWLza
 ZFmzd/bXbW/qXXmqN2qFTCkXuAO6uaB7Usy7oBrJ0NQbOEXM1k2pL8bYy
 oTdAsxuG1M4X5FdFZPs6xe82VzNOnfiso/zha9UbEnV5AOhA0RVBOpoBo
 7xdVjS0tfw7DAObrPdT5lVhfhsxTaKD+QL9fak0IZ4LuxbEd/7y8t128/ A==;
X-CSE-ConnectionGUID: OVBD/O+7TCCJQYXxLIyRAg==
X-CSE-MsgGUID: ZYwZzld1QVCuPceUkEY37Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19213832"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19213832"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
X-CSE-ConnectionGUID: hUyD+V7/T5GsgLfIM04rhQ==
X-CSE-MsgGUID: PKz3zmBRRyyDaQOpwkE0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26895712"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 6/7] drm/xe/client: Print runtime to fdinfo
Date: Mon, 15 Apr 2024 20:04:53 -0700
Message-ID: <20240416030454.3739862-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

Print the accumulated runtime, per client, when printing fdinfo.
Each time a query is done it first does 2 things:

1) loop through all the exec queues for the current client and
   accumulates the runtime, per engine class. CTX_TIMESTAMP is used for
   that, being read from the context image.

2) Read a "GPU timestamp" that can be used for considering "how much GPU
   time has passed" and that has the same unit/ref-clock as the one
   recording the runtime. RING_TIMESTAMP is used for that via MMIO.

This second part is done once per engine class, since it's a register
that is replicated on all engines. It is however the same stamp. At
least for the current GPUs this was tested one. It may be simplified,
but in order to play safe and avoid the cases the clock is different in
future for primary/media GTs, or across engine classes, just read it per
class.

This is exported to userspace as 2 numbers in fdinfo:

	drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks

Userspace is expected to collect at least 2 samples, which allows to
know the engine busyness as per:

		    RUNTIME1 - RUNTIME0
	busyness = ---------------------
			  T1 - T0

When calculating the overall system busyness, userspace can loop through
all the clients and add up all the numbers.  Since the GPU timestamp
will be a little bit different, it's expected some fluctuation on
accuracy, but that may be improved with a better hardware/GuC interface
in future, maintaining the UAPI.

Another thing to point out is that it's expected that userspace reads
any 2 samples every few seconds.  Given the update frequency of the
counters involved and that CTX_TIMESTAMP is 32b, it is expect to wrap
every 25 ~ 30 seconds.  This could be mitigated by adding a workqueue to
accumulate the counters every so often, but it's additional complexity
for something that is done already by userspace every few seconds in
tools like gputop (from igt), htop, nvtop, etc.

Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 81 +++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 08f0b7c95901..79eb453bfb14 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include "xe_drm_client.h"
 
 #include <drm/drm_print.h>
 #include <drm/xe_drm.h>
@@ -12,7 +13,10 @@
 #include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_device_types.h"
-#include "xe_drm_client.h"
+#include "xe_exec_queue.h"
+#include "xe_gt.h"
+#include "xe_hw_engine.h"
+#include "xe_pm.h"
 #include "xe_trace.h"
 
 /**
@@ -179,6 +183,80 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	}
 }
 
+static const u64 class_to_mask[] = {
+        [XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,
+        [XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,
+        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,
+        [XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,
+        [XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,
+        [XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,
+};
+
+static void show_runtime(struct drm_printer *p, struct drm_file *file)
+{
+	struct xe_file *xef = file->driver_priv;
+	struct xe_device *xe = xef->xe;
+	struct xe_gt *gt;
+	struct xe_hw_engine *hwe;
+	struct xe_exec_queue *q;
+	unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = { };
+	u64 gpu_timestamp, engine_mask = 0;
+	bool gpu_stamp = false;
+
+	xe_pm_runtime_get(xe);
+
+	mutex_lock(&xef->exec_queue.lock);
+	xa_for_each(&xef->exec_queue.xa, i, q)
+		xe_exec_queue_update_runtime(q);
+	mutex_unlock(&xef->exec_queue.lock);
+
+	for_each_gt(gt, xe, id_gt)
+		engine_mask |= gt->info.engine_mask;
+
+	BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
+	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
+		capacity[i] = hweight64(engine_mask & class_to_mask[i]);
+
+	/*
+	 * Iterate over all engines, printing the accumulated
+	 * runtime for this xef per engine class
+	 */
+	for_each_gt(gt, xe, id_gt) {
+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		for_each_hw_engine(hwe, gt, id_hwe) {
+			const char *class_name;
+
+			if (!capacity[hwe->class])
+				continue;
+
+			/*
+			 * Use any (first) engine to have a timestamp to be used every
+			 * time
+			 */
+			if (!gpu_stamp) {
+				gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
+				gpu_stamp = true;
+			}
+
+			class_name = xe_hw_engine_class_to_str(hwe->class);
+
+			drm_printf(p, "drm-engine-%s:\t%llu %llu ticks\n",
+				   class_name, gpu_timestamp,
+				   xef->runtime[hwe->class]);
+
+			if (capacity[hwe->class] > 1)
+				drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
+					   class_name, capacity[hwe->class]);
+
+			/* engine class already handled, skip next iterations */
+			capacity[hwe->class] = 0;
+		}
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	}
+
+	xe_pm_runtime_get(xe);
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
@@ -192,5 +270,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	show_meminfo(p, file);
+	show_runtime(p, file);
 }
 #endif
-- 
2.43.0

