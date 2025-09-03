Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B57CA1011
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 07:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8273910E431;
	Wed,  3 Sep 2025 07:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8pa6iqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695310E431
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756885933; x=1788421933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ntQe2tBsW5QWbZHhycOU4h1TFp4MgoHMuW63/zJQG00=;
 b=Y8pa6iqIm2FTYhgVN4iffSolOobk0s8fhG5FCGD9d74gMhfv8rY/s2A1
 TDsf0SrLpzVZygJHwtRyEQSb5LDmWlGxTqMzOPemGFCs7o3GbiA5CRc1N
 1o2fOBvj2v1WVvYadz0w9aBnL4YH0tGY/pWPJBVPhf8CBvIKqukeQ68uU
 1bkYDeX91Ib4JFTsnPrfCrJXSkejgVYmxDXVuQzuOlp+AxEXBAkA5P1Jq
 TSqJhurkA79zs8l8Mv1LNiWoK/BT1gg9yp2dWNDVDgTPRX+YFd8QgHlLo
 zmcsd/HA7MgnaF/TC+cb3yrubKl3hB6lRu95xGfug9fmGU1kMSc+Rb+QU A==;
X-CSE-ConnectionGUID: Km4hY56LSOWHolIaWDK7tQ==
X-CSE-MsgGUID: dCvzLXbLSJi+cQCDmuZZGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59126075"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59126075"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:52:13 -0700
X-CSE-ConnectionGUID: YqAAOHQzTTyx7JUDVuhReQ==
X-CSE-MsgGUID: V2ZEvGc0SHeSHbXy2VjHRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171396662"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa007.jf.intel.com with ESMTP; 03 Sep 2025 00:52:11 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 1/2] drm: Add GPU frequency tracepoint at DRM level
Date: Wed,  3 Sep 2025 13:15:27 +0530
Message-Id: <20250903074528.69159-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903074528.69159-1-s.sebinraj@intel.com>
References: <20250903074528.69159-1-s.sebinraj@intel.com>
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

Add a GPU frequency tracepoint at the DRM subsystem level

The implementation includes:
- CONFIG_DRM_GPU_FREQUENCY_TRACE Kconfig option (default=n)
- DRM-level tracepoint exposed at

  /sys/kernel/debug/tracing/events/power/gpu_frequency/

The tracepoint follows kernel tracing and provides kHz frequency
values with GPU identification for power analysis and
performance monitoring tools.

The tracepoint is only active when CONFIG_DRM_GPU_FREQUENCY_TRACE=y
and can be integrated by GPU drivers for frequency reporting.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/Kconfig                   | 11 ++++++
 drivers/gpu/drm/Makefile                  |  1 +
 drivers/gpu/drm/drm_gpu_frequency_trace.c | 16 ++++++++
 drivers/gpu/drm/drm_gpu_frequency_trace.h | 47 +++++++++++++++++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.c
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c..975cc7b2581d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -53,6 +53,17 @@ config DRM_DRAW
 	bool
 	depends on DRM
 
+config DRM_GPU_FREQUENCY_TRACE
+	bool "Enable GPU frequency tracepoints"
+	depends on DRM && TRACEPOINTS
+	default n
+	help
+	  Enable GPU frequency tracepoints in the power trace subsystem.
+	  This provides kernel tracing support for GPU frequency changes
+	  that will be exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency/.
+
+	  If unsure, say N.
+
 config DRM_PANIC
 	bool "Display a user-friendly message when a kernel panic occurs"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4dafbdc8f86a..12c81b6a750d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -77,6 +77,7 @@ drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client.o \
 	drm_client_event.o \
 	drm_client_modeset.o
+drm-$(CONFIG_DRM_GPU_FREQUENCY_TRACE) += drm_gpu_frequency_trace.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.c b/drivers/gpu/drm/drm_gpu_frequency_trace.c
new file mode 100644
index 000000000000..b5fa5134226d
--- /dev/null
+++ b/drivers/gpu/drm/drm_gpu_frequency_trace.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPU frequency trace points for DRM subsystem
+ *
+ * This provides GPU frequency tracing support that will be exposed at:
+ * /sys/kernel/debug/tracing/events/power/gpu_frequency/
+ */
+
+#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
+
+#define CREATE_TRACE_POINTS
+#include "drm_gpu_frequency_trace.h"
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(gpu_frequency);
+
+#endif /* CONFIG_DRM_GPU_FREQUENCY_TRACE */
diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.h b/drivers/gpu/drm/drm_gpu_frequency_trace.h
new file mode 100644
index 000000000000..cf6337847b3a
--- /dev/null
+++ b/drivers/gpu/drm/drm_gpu_frequency_trace.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(_GPU_FREQUENCY_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _GPU_FREQUENCY_TRACE_H
+
+#include <linux/tracepoint.h>
+
+#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM power
+#define TRACE_INCLUDE_FILE drm_gpu_frequency_trace
+
+/*
+ * Tracepoint for GPU frequency changes
+ * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
+ *
+ * location: /sys/kernel/debug/tracing/events/power/gpu_frequency
+ * format: {unsigned int state, unsigned int gpu_id}
+ * where state holds the frequency(in KHz) and the gpu_id holds the GPU clock domain.
+ */
+TRACE_EVENT(gpu_frequency,
+	    TP_PROTO(unsigned int state, unsigned int gpu_id),
+	    TP_ARGS(state, gpu_id),
+	    TP_STRUCT__entry(
+		    __field(unsigned int, state)
+		    __field(unsigned int, gpu_id)
+		    ),
+	    TP_fast_assign(
+		    __entry->state = state;
+		    __entry->gpu_id = gpu_id;
+		    ),
+	    TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
+);
+
+#else /* !CONFIG_DRM_GPU_FREQUENCY_TRACE */
+
+static inline void trace_gpu_frequency(unsigned int state, unsigned int gpu_id) { }
+
+#endif /* CONFIG_DRM_GPU_FREQUENCY_TRACE */
+
+#endif /* _GPU_FREQUENCY_TRACE_H */
+
+#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
+#include <trace/define_trace.h>
+#endif
-- 
2.34.1

