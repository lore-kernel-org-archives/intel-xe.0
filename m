Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D9D2FEDF
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606AC10E5BB;
	Tue, 27 Jan 2026 19:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fm6IbELt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBAB10E5B3
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769542657; x=1801078657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YcO7ubYxT4jT260nMoUOB+1POJ9pB+lZRUtCOJEBnmY=;
 b=fm6IbELtEil9gQ8QO/ULdaSLAiQMO9ypoSnREVWCb0VH0QGshVcZmYBt
 ou+i6W1VQK56zR5eoGfy/FfimaBFhcUGq/xiV2WQ9vx7GudtdYlV4FZOe
 UK9B25emTuO9H1Hicx7EFTiYD9fr0bFoez6fsrpmQSRdy4VUGmp4QOmv5
 ChPGqjSkTj2rpH1F5XeHxW4DGuQzwhl5f/FdRaXQenlsatkhMTDQICqqA
 E72cM6Hp7dR4PhF4FiigIl5cXQat8TRlXEQejhikc1cgQhE4cZCiVnWHQ
 PAkcW9tGITJdrmLwH7V4HKVMDkZraSFjV4NCTWOdn0ms4uPuiPaD7vCi5 Q==;
X-CSE-ConnectionGUID: dutvY/UhQoeqRlsoyZ1/SQ==
X-CSE-MsgGUID: dwGO3X5DT8uip0Rtz+kYiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69764778"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69764778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:37 -0800
X-CSE-ConnectionGUID: h475Ztb5TTa8XLSRNmIyUA==
X-CSE-MsgGUID: CPuKkViZQK+XPvkM1WPvfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207958939"
Received: from mahadzix-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:37 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/6] drm/xe: Promote relaxed_ms_sleep
Date: Tue, 27 Jan 2026 20:37:21 +0100
Message-ID: <20260127193727.601-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127193727.601-1-michal.wajdeczko@intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
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

We want to have single place with sleep related helpers for better
code reuse. Create xe_sleep.h and move relaxed_ms_sleep() there.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++-----------------
 drivers/gpu/drm/xe/xe_sleep.h      | 36 ++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sleep.h

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 456f549c16f6..4ea14f2794f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -8,9 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/circ_buf.h>
-#include <linux/delay.h>
 #include <linux/dma-fence-array.h>
-#include <linux/math64.h>
 
 #include <drm/drm_managed.h>
 
@@ -42,6 +40,7 @@
 #include "xe_pm.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
+#include "xe_sleep.h"
 #include "xe_trace.h"
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
@@ -1028,24 +1027,6 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
 	return (WQ_SIZE - q->guc->wqi_tail);
 }
 
-static inline void relaxed_ms_sleep(unsigned int delay_ms)
-{
-	unsigned long min_us, max_us;
-
-	if (!delay_ms)
-		return;
-
-	if (delay_ms > 20) {
-		msleep(delay_ms);
-		return;
-	}
-
-	min_us = mul_u32_u32(delay_ms, 1000);
-	max_us = min_us + 500;
-
-	usleep_range(min_us, max_us);
-}
-
 static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1830,7 +1811,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 				since_resume_ms;
 
 			if (wait_ms > 0 && q->guc->resume_time)
-				relaxed_ms_sleep(wait_ms);
+				xe_sleep_relaxed_ms(wait_ms);
 
 			set_exec_queue_suspended(q);
 			disable_scheduling(q, false);
diff --git a/drivers/gpu/drm/xe/xe_sleep.h b/drivers/gpu/drm/xe/xe_sleep.h
new file mode 100644
index 000000000000..a772f1a37395
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sleep.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SLEEP_H_
+#define _XE_SLEEP_H_
+
+#include <linux/delay.h>
+#include <linux/math64.h>
+
+/**
+ * xe_sleep_relaxed_ms() - Sleep for an approximate time.
+ * @delay_ms: time in msec to sleep
+ *
+ * For smaller timeouts, sleep with 0.5ms accuracy.
+ */
+static inline void xe_sleep_relaxed_ms(unsigned int delay_ms)
+{
+	unsigned long min_us, max_us;
+
+	if (!delay_ms)
+		return;
+
+	if (delay_ms > 20) {
+		msleep(delay_ms);
+		return;
+	}
+
+	min_us = mul_u32_u32(delay_ms, 1000);
+	max_us = min_us + 500;
+
+	usleep_range(min_us, max_us);
+}
+
+#endif
-- 
2.47.1

