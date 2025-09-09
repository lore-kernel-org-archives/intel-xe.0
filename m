Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB299CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 15:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B415210E798;
	Tue,  9 Sep 2025 15:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0qu2HvP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B33B10E71F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757430304; x=1788966304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qiEIRaVAOs0y/Xi9U18p0vaqsKjfSsDPRCVl5eh/9Ys=;
 b=F0qu2HvPVNtrsM0gq6GZuHClf2mXuVwlT2L+vPe/jFSPGaaZIwGuCQVj
 UUXJWiar7Ctf767D7Cp9jhiwfpj56SyGf5gAnJtdTWXxGs0J2gXycEKGQ
 dKhy6TopK94mM/jleLTeRLbEeWqCIjEx8YAMF4zcRV4S6IEjQdfHqqIvj
 LQp6O5uKIWAwKNDlemX23oLa3f413Sa9VDQGilwarMduPthXBfRADtWBO
 L/r5ifadOH0VxZNZSWVf9TjonqfEOzqtCadve5a5AzGos4bADOZcqG6TZ
 Lq5LUpkay2Bro5s6DKMFrUJfZDsuqBxAz50Le86n76hiyVdZRwhXFjEcn g==;
X-CSE-ConnectionGUID: xSYtFYKAQKqc4GoSthYKfg==
X-CSE-MsgGUID: ehsQQ+W0R92MKjgV/5olfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63354358"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63354358"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:05:04 -0700
X-CSE-ConnectionGUID: V1iwFL/8QiyiX9fqzDGDuw==
X-CSE-MsgGUID: L/QJmzqXSVWuxyOMNjoswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="203881488"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.4])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:05:02 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, michal.mrozek@intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC 1/2] drm/xe/migrate: Add tracepoint during VRAM copy
Date: Tue,  9 Sep 2025 17:03:36 +0200
Message-ID: <20250909150437.986365-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909150437.986365-1-francois.dugast@intel.com>
References: <20250909150437.986365-1-francois.dugast@intel.com>
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

Add a new tracepoint when migrating memory to/from VRAM.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c       |  9 ++++----
 drivers/gpu/drm/xe/xe_migrate_types.h | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_trace.h         | 32 +++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_migrate_types.h

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3f0c8832120f..d4462cb91cbb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -28,12 +28,14 @@
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
+#include "xe_migrate_types.h"
 #include "xe_mocs.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
+#include "xe_trace.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
@@ -1783,11 +1785,6 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 	}
 }
 
-enum xe_migrate_copy_dir {
-	XE_MIGRATE_COPY_TO_VRAM,
-	XE_MIGRATE_COPY_TO_SRAM,
-};
-
 #define XE_CACHELINE_BYTES	64ull
 #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
 
@@ -1813,6 +1810,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	int err;
 	unsigned long i, j;
 
+	trace_xe_migrate_vram(xe, len, vram_addr, dir);
+
 	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
 			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
 		return ERR_PTR(-EOPNOTSUPP);
diff --git a/drivers/gpu/drm/xe/xe_migrate_types.h b/drivers/gpu/drm/xe/xe_migrate_types.h
new file mode 100644
index 000000000000..c332d0610814
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_migrate_types.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_MIGRATE_TYPES_
+#define _XE_MIGRATE_TYPES_
+
+enum xe_migrate_copy_dir {
+	XE_MIGRATE_COPY_TO_VRAM,
+	XE_MIGRATE_COPY_TO_SRAM,
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 314f42fcbcbd..b9f59651771e 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -16,6 +16,7 @@
 #include "xe_gpu_scheduler_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
+#include "xe_migrate_types.h"
 #include "xe_sched_job.h"
 #include "xe_tlb_inval_types.h"
 #include "xe_vm.h"
@@ -441,6 +442,37 @@ TRACE_EVENT(xe_eu_stall_data_read,
 		      __entry->read_size, __entry->total_size)
 );
 
+DECLARE_EVENT_CLASS(xe_migrate,
+		    TP_PROTO(struct xe_device *xe, unsigned long len,
+			     u64 vram_addr, u8 dir),
+		    TP_ARGS(xe, len, vram_addr, dir),
+
+		    TP_STRUCT__entry(
+			    __string(dev, __dev_name_xe(xe))
+			    __field(u32, len)
+			    __field(u64, vram_addr)
+			    __field(u8, dir)
+			    ),
+
+		    TP_fast_assign(
+			    __assign_str(dev);
+			    __entry->len = len;
+			    __entry->vram_addr = vram_addr;
+			    __entry->dir = dir;
+			    ),
+
+		    TP_printk("dev=%s len=%x vram_addr=%llx dir=%s",
+			      __get_str(dev), __entry->len, __entry->vram_addr,
+			      __entry->dir == XE_MIGRATE_COPY_TO_VRAM ?
+			      "TO_VRAM" : "TO_SRAM")
+);
+
+DEFINE_EVENT(xe_migrate, xe_migrate_vram,
+	     TP_PROTO(struct xe_device *xe, unsigned long len, u64 vram_addr,
+		      u8 dir),
+	     TP_ARGS(xe, len, vram_addr, dir)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.43.0

