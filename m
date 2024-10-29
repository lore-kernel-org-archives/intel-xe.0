Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D4AD74941
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 21:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908410E3B6;
	Tue, 29 Oct 2024 21:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euBaXg9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA6810E3B6
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730238257; x=1761774257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dn0YF/S4KsMQTONjujLm1pgpVemXQs/0SomLGnYsgVw=;
 b=euBaXg9hI+xZFKGQtzS1eErVD86CupQwxTiYhpmW+PvMxq38WCtFQPYK
 Hoz6rzUG+UKl8IjDcu6o8bHi2VCoKrULLQ4OkCzW74dGijgesXJAwNT8X
 eWt+L26ZW0MGIFlhje2eVlE7WKOw7R7P5hvTtU8W1FoER4OifliR3jC24
 NrrFvHOTkJrzK2008PkX0vNSXwF7bzYXQRH+E6WSbGl0YauQt7CTqeEd7
 Efs0CKUbjUHZ93i/cGF7hLLksm1gC78DM4msjwshCk5eGWA1T+9oNoWHE
 9WS0M43NQvW7USn3TufoQeCMBy1GZC/B45lMlVV0J4daSLjWAhER71tLD g==;
X-CSE-ConnectionGUID: RI45aH+MTnSWr+6utrde5w==
X-CSE-MsgGUID: +9QljhW6QOSRWc+JN16bPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40523808"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="40523808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
X-CSE-ConnectionGUID: Q5MkmtDuQiSpuFMIJ4bdzw==
X-CSE-MsgGUID: xnmy1zx/SmSVvwa04MkQOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="119579594"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/4] drm/xe: Add trace to lrc timestamp update
Date: Tue, 29 Oct 2024 14:43:48 -0700
Message-ID: <20241029214351.776293-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029214351.776293-1-lucas.demarchi@intel.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
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

Help debugging when LRC timestamp is updated for a exec queue.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile       |  1 +
 drivers/gpu/drm/xe/xe_lrc.c       |  3 ++
 drivers/gpu/drm/xe/xe_trace_lrc.c |  9 ++++++
 drivers/gpu/drm/xe/xe_trace_lrc.h | 52 +++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index bc7a04ce69fd0..21d69935c3365 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -101,6 +101,7 @@ xe-y += xe_bb.o \
 	xe_trace.o \
 	xe_trace_bo.o \
 	xe_trace_guc.o \
+	xe_trace_lrc.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4f64c7f4e68de..4b65da77c6e09 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -25,6 +25,7 @@
 #include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_sriov.h"
+#include "xe_trace_lrc.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
 
@@ -1758,5 +1759,7 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
 
 	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 
+	trace_xe_lrc_update_timestamp(lrc, *old_ts);
+
 	return lrc->ctx_timestamp;
 }
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.c b/drivers/gpu/drm/xe/xe_trace_lrc.c
new file mode 100644
index 0000000000000..ab9b7e2970bc2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __CHECKER__
+#define CREATE_TRACE_POINTS
+#include "xe_trace_lrc.h"
+#endif
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
new file mode 100644
index 0000000000000..5c669a0b21808
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM xe
+
+#if !defined(_XE_TRACE_LRC_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _XE_TRACE_LRC_H_
+
+#include <linux/tracepoint.h>
+#include <linux/types.h>
+
+#include "xe_gt_types.h"
+#include "xe_lrc.h"
+#include "xe_lrc_types.h"
+
+#define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)->fence_ctx.gt)->drm.dev)
+
+TRACE_EVENT(xe_lrc_update_timestamp,
+	    TP_PROTO(struct xe_lrc *lrc, uint32_t old),
+	    TP_ARGS(lrc, old),
+	    TP_STRUCT__entry(
+		     __field(struct xe_lrc *, lrc)
+		     __field(u32, old)
+		     __field(u32, new)
+		     __string(name, lrc->fence_ctx.name)
+		     __string(device_id, __dev_name_lrc(lrc))
+	    ),
+
+	    TP_fast_assign(
+		   __entry->lrc	= lrc;
+		   __entry->old = old;
+		   __entry->new = lrc->ctx_timestamp;
+		   __assign_str(name);
+		   __assign_str(device_id);
+		   ),
+	    TP_printk("lrc=:%p lrc->name=%s old=%u new=%u device_id:%s",
+		      __entry->lrc, __get_str(name),
+		      __entry->old, __entry->new,
+		      __get_str(device_id))
+);
+
+#endif
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
+#define TRACE_INCLUDE_FILE xe_trace_lrc
+#include <trace/define_trace.h>
-- 
2.47.0

