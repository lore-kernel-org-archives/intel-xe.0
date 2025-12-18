Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6865DD6E2B7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F0010EBD5;
	Thu, 18 Dec 2025 22:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTdACiwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F2510EBC4
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766097543; x=1797633543;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3gn98LvnmFk4nLf07SArcjzj5I61XI3sIxP0ijkMfQo=;
 b=NTdACiwIX7tbCud8Q6O1al3EZx2WXLdnfRs6+3hY2d42mWk5SYQf50Oy
 mO0oDYQNPFE49t9VAZtUCFEG+Pb85yTRdhCTYApOuVKSJD7A8Erl13FR4
 DH38CD/b5RxhsOuCisQw8PMXA/5tu4re/zf8Oqe2pBHXhTAp2RZCrQ2oL
 xm89+jSoUGNrmlaZ+b+8qHeKLylzB5vO59lF7H2olIOkYj3hOZKAy7RO8
 pHypGbJ3gmAZQW3zkMxy2q1gYfB6APVwrfY6vzb+Nr/OU/uLdSRy4Qlt8
 XM86wDWGU+zSY34bfbJHYq1i7D7n/at92PDwzRY4cZq80Hd6vF6BNfTJX A==;
X-CSE-ConnectionGUID: EUWoYXZyQBilnWpp/2Xgww==
X-CSE-MsgGUID: nQr34VTmQZSEcjQ+OEQNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71910896"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="71910896"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:39:03 -0800
X-CSE-ConnectionGUID: +HYfvZE3R4e2BAef3WG5UA==
X-CSE-MsgGUID: K5qQvgf8SwanQY2l4juHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199176821"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:39:03 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 02/12] drm/gt/guc: extract scheduler-related defines from
 guc_fwif.h
Date: Thu, 18 Dec 2025 14:38:48 -0800
Message-ID: <20251218223846.1146344-16-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
References: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
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

Some upcoming KLVs are sized based on the engine counts, so we need
those defines to be moved to a separate file to include them from
guc_klv_abi.h (which is already included by guc_fwif.h).
Instead of moving just the engine-related defines, it is cleaner to
move all scheduler-related defines (i.e., everything engine or context
related). Note that the legacy GuC defines have not been moved and have
instead been dropped because Xe doesn't support any GuC old enough to
still use them.

While at it, struct guc_ctxt_registration_info has been moved to
guc_submit.c since it doesn't come from the GuC specs (we added it to
make things simpler in our code).

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h | 48 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h        |  2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h           | 54 +---------------------
 drivers/gpu/drm/xe/xe_guc_submit.c         | 17 +++++++
 4 files changed, 67 insertions(+), 54 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
new file mode 100644
index 000000000000..db9c171f8b64
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _ABI_GUC_SCHEDULER_ABI_H
+#define _ABI_GUC_SCHEDULER_ABI_H
+
+/**
+ * Generic defines required for registration with and submissions to the GuC
+ * scheduler. Includes engine class/instance defines and context attributes
+ * (id, priority, etc)
+ */
+
+/* Engine classes/instances */
+#define GUC_RENDER_CLASS		0
+#define GUC_VIDEO_CLASS			1
+#define GUC_VIDEOENHANCE_CLASS		2
+#define GUC_BLITTER_CLASS		3
+#define GUC_COMPUTE_CLASS		4
+#define GUC_GSC_OTHER_CLASS		5
+#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
+#define GUC_MAX_ENGINE_CLASSES		16
+#define GUC_MAX_INSTANCES_PER_CLASS	32
+
+/* context priority values */
+#define GUC_CLIENT_PRIORITY_KMD_HIGH	0
+#define GUC_CLIENT_PRIORITY_HIGH	1
+#define GUC_CLIENT_PRIORITY_KMD_NORMAL	2
+#define GUC_CLIENT_PRIORITY_NORMAL	3
+#define GUC_CLIENT_PRIORITY_NUM		4
+
+/* Context registration */
+#define GUC_ID_MAX			65535
+#define GUC_ID_UNKNOWN			0xffffffff
+
+#define CONTEXT_REGISTRATION_FLAG_KMD	        BIT(0)
+#define CONTEXT_REGISTRATION_FLAG_TYPE	        GENMASK(2, 1)
+#define   GUC_CONTEXT_NORMAL			0
+#define   GUC_CONTEXT_COMPRESSION_SAVE		1
+#define   GUC_CONTEXT_COMPRESSION_RESTORE	2
+#define   GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
+
+/* context enable/disable */
+#define GUC_CONTEXT_DISABLE		0
+#define GUC_CONTEXT_ENABLE		1
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 20a078dc4b85..34d6fdc64f56 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -8,8 +8,8 @@
 
 #include <linux/types.h>
 #include "abi/guc_capture_abi.h"
+#include "abi/guc_scheduler_abi.h"
 #include "xe_guc.h"
-#include "xe_guc_fwif.h"
 
 struct xe_exec_queue;
 struct xe_guc;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index a04faec477ae..a33ea288b907 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -10,6 +10,7 @@
 
 #include "abi/guc_capture_abi.h"
 #include "abi/guc_klvs_abi.h"
+#include "abi/guc_scheduler_abi.h"
 #include "xe_hw_engine_types.h"
 
 #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
@@ -19,59 +20,6 @@
 #define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		3
 #define G2H_LEN_DW_PAGE_RECLAMATION		3
 
-#define GUC_ID_MAX			65535
-#define GUC_ID_UNKNOWN			0xffffffff
-
-#define GUC_CONTEXT_DISABLE		0
-#define GUC_CONTEXT_ENABLE		1
-
-#define GUC_CLIENT_PRIORITY_KMD_HIGH	0
-#define GUC_CLIENT_PRIORITY_HIGH	1
-#define GUC_CLIENT_PRIORITY_KMD_NORMAL	2
-#define GUC_CLIENT_PRIORITY_NORMAL	3
-#define GUC_CLIENT_PRIORITY_NUM		4
-
-#define GUC_RENDER_ENGINE		0
-#define GUC_VIDEO_ENGINE		1
-#define GUC_BLITTER_ENGINE		2
-#define GUC_VIDEOENHANCE_ENGINE		3
-#define GUC_VIDEO_ENGINE2		4
-#define GUC_MAX_ENGINES_NUM		(GUC_VIDEO_ENGINE2 + 1)
-
-#define GUC_RENDER_CLASS		0
-#define GUC_VIDEO_CLASS			1
-#define GUC_VIDEOENHANCE_CLASS		2
-#define GUC_BLITTER_CLASS		3
-#define GUC_COMPUTE_CLASS		4
-#define GUC_GSC_OTHER_CLASS		5
-#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
-#define GUC_MAX_ENGINE_CLASSES		16
-#define GUC_MAX_INSTANCES_PER_CLASS	32
-
-#define GUC_CONTEXT_NORMAL			0
-#define GUC_CONTEXT_COMPRESSION_SAVE		1
-#define GUC_CONTEXT_COMPRESSION_RESTORE	2
-#define GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
-
-/* Helper for context registration H2G */
-struct guc_ctxt_registration_info {
-	u32 flags;
-	u32 context_idx;
-	u32 engine_class;
-	u32 engine_submit_mask;
-	u32 wq_desc_lo;
-	u32 wq_desc_hi;
-	u32 wq_base_lo;
-	u32 wq_base_hi;
-	u32 wq_size;
-	u32 cgp_lo;
-	u32 cgp_hi;
-	u32 hwlrca_lo;
-	u32 hwlrca_hi;
-};
-#define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
-#define CONTEXT_REGISTRATION_FLAG_TYPE	GENMASK(2, 1)
-
 /* 32-bit KLV structure as used by policy updates and others */
 struct guc_klv_generic_dw_t {
 	u32 kl;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d6cfc3481ace..1777133246e4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -673,6 +673,23 @@ static void set_exec_queue_group_banned(struct xe_exec_queue *q)
 	mutex_unlock(&group->list_lock);
 }
 
+/* Helper for context registration H2G */
+struct guc_ctxt_registration_info {
+	u32 flags;
+	u32 context_idx;
+	u32 engine_class;
+	u32 engine_submit_mask;
+	u32 wq_desc_lo;
+	u32 wq_desc_hi;
+	u32 wq_base_lo;
+	u32 wq_base_hi;
+	u32 wq_size;
+	u32 cgp_lo;
+	u32 cgp_hi;
+	u32 hwlrca_lo;
+	u32 hwlrca_hi;
+};
+
 #define parallel_read(xe_, map_, field_) \
 	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
 			field_)
-- 
2.43.0

