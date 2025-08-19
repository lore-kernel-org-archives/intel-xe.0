Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DEACA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD5B10E538;
	Tue, 19 Aug 2025 06:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LW81w7mE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9210E537
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755585565; x=1787121565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V7xWCQOi++5bk0y2PWGNEK0zj3VIRw+CYPR1bK8Yoic=;
 b=LW81w7mE5Z84HCLm3nQ8+3oGSr0CqsFNDXyPjx3jLY8Geaojy3kL3X/F
 vAr3NbllmO2dEjdq+WBK5CatR1fvStnXuAyLFI0ji86eXFv7fR9KpdfxR
 y+yx40HnOdoX1GfsPEGjlX+IDGy8K4sXLa2XBw2tNPvhMXvQyPdMATirl
 6bYCKJ2HM57MkRdk1BZG0ojfbPFN878jMnO7lVunIle2BEexyGRfOFFVT
 9AjPnjnMMnQK1kaAZ158uKHotlm5W9SdUUi487Y9WjB3FMmvBVWPaCfgt
 iIMK50ZOIp8bgJ9y1jD9A3/1ycA177o46iiin409fJmLFvdHCWclkIdHc Q==;
X-CSE-ConnectionGUID: W1p+cvc7RvOMkgzEzh1bng==
X-CSE-MsgGUID: hwH4iArFQr2BXg9rEGpGmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57966978"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57966978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:39:25 -0700
X-CSE-ConnectionGUID: TBGGtdN+QWabxSRUimPVpQ==
X-CSE-MsgGUID: L570O5moRvSZiBdZnyyJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172009486"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 23:39:24 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 3/8] drm/xe: Add GPU frequency tracing tracepoint definition
Date: Tue, 19 Aug 2025 12:04:12 +0530
Message-Id: <20250819063417.918666-4-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
References: <20250819063417.918666-1-s.sebinraj@intel.com>
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

Add tracepoint definition for GPU frequency monitoring under the
'power' trace system. The tracepoint will be available at:
/sys/kernel/debug/tracing/events/power/gpu_frequency

The tracepoint format includes:
- state: GPU frequency in KHz
- gpu_id: GT ID

This provides the ftrace infrastructure for monitoring GPU frequency
changes that will be utilized by the frequency tracer implementation.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h | 48 +++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h

diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h b/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
new file mode 100644
index 000000000000..5664db62e3fb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM power
+
+#if !defined(_XE_GPUFREQTRACER_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _XE_GPUFREQTRACER_TRACE_H
+
+#include <linux/tracepoint.h>
+
+/*
+ * Tracepoint for GPU frequency changes
+ * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
+ *
+ * location: /d/events/power/gpu_frequency
+ * format: {unsigned int state, unsigned int gpu_id}
+ * where state holds the frequency(in Khz) and the gpu_id holds the GPU clock domain.
+ */
+
+TRACE_EVENT(gpu_frequency,
+	TP_PROTO(unsigned int state, unsigned int gpu_id),
+
+	TP_ARGS(state, gpu_id),
+
+	TP_STRUCT__entry(
+		__field(unsigned int, state)
+		__field(unsigned int, gpu_id)
+	),
+
+	TP_fast_assign(
+		__entry->state = state;
+		__entry->gpu_id = gpu_id;
+	),
+
+	TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
+);
+
+#endif /* _XE_GPUFREQTRACER_TRACE_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE xe_gpufreqtracer_trace
+#include <trace/define_trace.h>
-- 
2.34.1

