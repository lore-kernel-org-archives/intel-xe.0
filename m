Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2976FCD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 11:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA56A10EEA1;
	Thu, 11 Jun 2026 11:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zx88H2UZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D0B10EEA1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781176743; x=1812712743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4nxj2Z+j82YGE7Vof5FDjinKl/ZvHiQutd7ojqasQ4o=;
 b=Zx88H2UZOVrOihpXAuNU7aIBlbRHgbBwYETO2XTRtTiUycK7v/2TG4wE
 LQqDfReBMCryYO//ux6pPand4m679PB5GkIGz1A7JlZiioFVYrh+VXIOm
 Vxrpz7HvbtgnfuO9KEkdWgD7XaOBUMtK4rDxUsGXDs2uZX15y4OZWKJOL
 1tQe27Qg6kk4xL0ayAudslUvMpmmPsFpac9xEf3QvtKh9WrRiODEr/8hp
 J7Rmq6PSKSDS8FGccoRIcSwXxOxtDSjCZTGJUevLooPXlHewjaeYyYVLD
 p1q82HjEGxt2yVwsaOaL3pb6BbQ/FqO6HaTGxWv3dYKOJUq3Go23StGgV A==;
X-CSE-ConnectionGUID: 5nxq3pP3SQqbi2bEIqZvHA==
X-CSE-MsgGUID: h4HR5Zi1RxOeldSMVqDEHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85885136"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="85885136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 04:19:03 -0700
X-CSE-ConnectionGUID: 69idlmrWSV68CrRLaGLl+Q==
X-CSE-MsgGUID: 2N9ok4ciQWipjgptK3ErOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250741675"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 04:18:59 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v2 1/2] drm/xe: add structured RAS error logging
 infrastructure
Date: Thu, 11 Jun 2026 16:45:44 +0530
Message-ID: <20260611111542.19256-5-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611111542.19256-4-mallesh.koujalagi@intel.com>
References: <20260611111542.19256-4-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce SIG_ID defining Signature IDs (SIG IDs) for
categorising XE GPU errors, and __xe_ras_log() to emit
structured log lines with SIG ID, CPER severity, tile/GT
location, errno, and a free-form message.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/Makefile     |   1 +
 drivers/gpu/drm/xe/xe_ras_log.c |  64 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sig_ids.h | 101 ++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 09661f079d03..45b5aa735aa7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -114,6 +114,7 @@ xe-y += xe_bb.o \
 	xe_query.o \
 	xe_range_fence.o \
 	xe_ras.o \
+	xe_ras_log.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
 	xe_ring_ops.o \
diff --git a/drivers/gpu/drm/xe/xe_ras_log.c b/drivers/gpu/drm/xe/xe_ras_log.c
new file mode 100644
index 000000000000..b6a2792b61d4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_log.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_print.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_sig_ids.h"
+
+/**
+ * __xe_ras_log - Emit a structured RAS log entry
+ * @xe: xe device instance
+ * @gt: GT instance where the error occurred, or NULL if device-wide
+ * @sig_id: signature ID from xe_sig_ids.h identifying the error class
+ * @cper_sev: CPER severity (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
+ * @errno_val: negative errno describing the error condition
+ * @fmt: printf-style format string
+ * @...: format arguments
+ *
+ * Formats the message and emits a kernel log line via drm_err() for fatal
+ * events or drm_warn() for all others. CPER record generation and hex dump
+ * are planned as follow-ups.
+ *
+ * Format:
+ *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno = <n> Message = "<msg>"
+ */
+__printf(6, 7)
+void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
+		  u16 sig_id, u32 cper_sev, int errno_val,
+		  const char *fmt, ...)
+{
+	char loc[32];
+	char msg[256];
+	va_list ap;
+	int ret;
+
+	if (gt)
+		snprintf(loc, sizeof(loc), "tile = %u/gt = %u",
+			 gt->tile->id, gt->info.id);
+	else
+		snprintf(loc, sizeof(loc), "device");
+
+	va_start(ap, fmt);
+	ret = vsnprintf(msg, sizeof(msg), fmt, ap);
+	va_end(ap);
+
+	WARN_ON_ONCE(ret >= (int)sizeof(msg));
+
+	if (cper_sev == CPER_SEV_FATAL)
+		drm_err(&xe->drm,
+			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%s\"\n",
+			sig_id, xe_cper_severity_str(cper_sev), loc,
+			errno_val, msg);
+	else
+		drm_warn(&xe->drm,
+			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%s\"\n",
+			 sig_id, xe_cper_severity_str(cper_sev), loc,
+			 errno_val, msg);
+
+	/* TODO: Add CPER record driver handler */
+	/* TODO: Add RAS dump cper hex handler */
+}
diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
new file mode 100644
index 000000000000..8abe7554714e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sig_ids.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SIG_IDS_H_
+#define _XE_SIG_IDS_H_
+
+#include <linux/cper.h>
+
+/**
+ * xe_cper_severity_str - local severity-to-string helper
+ * @sev: CPER severity value (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
+ *
+ * Avoids a link-time dependency on cper_severity_str() which is only
+ * compiled when CONFIG_UEFI_CPER=y.
+ *
+ * Return: string representation of the severity, or "unknown".
+ */
+static inline const char *xe_cper_severity_str(u32 sev)
+{
+	switch (sev) {
+	case CPER_SEV_RECOVERABLE:	return "recoverable";
+	case CPER_SEV_FATAL:		return "fatal";
+	case CPER_SEV_CORRECTED:	return "corrected";
+	case CPER_SEV_INFORMATIONAL:	return "informational";
+	default:			return "unknown";
+	}
+}
+
+/*
+ * Driver SIG_IDs
+ */
+#define XE_SIG_PROBE			1  /* FATAL: probe failed */
+#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
+#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
+#define XE_SIG_FW			4  /* RECOVERABLE: GuC/HuC/UC/GSC/CSC/PCODE */
+#define XE_SIG_GT_TDR			5  /* RECOVERABLE: engine hang / reset */
+#define XE_SIG_MEM_FAULT		6  /* RECOVERABLE: VM bind, page fault, GTT */
+#define XE_SIG_IO_BUS			7  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
+
+/*
+ * HW SIG_IDs
+ */
+#define XE_SIG_HW_DEVICE_MEMORY		8
+#define XE_SIG_HW_CORE_COMPUTE		9
+#define XE_SIG_HW_SCALE_UP_LINK		10
+#define XE_SIG_HW_PCIE			11
+#define XE_SIG_HW_FABRIC		12
+#define XE_SIG_HW_SOC_INTERNAL		13
+
+/* Must be updated when adding new driver SIG IDs */
+#define XE_SIG_DRIVER_LAST		XE_SIG_IO_BUS
+#define XE_SIG_HW_FIRST			XE_SIG_HW_DEVICE_MEMORY
+
+struct xe_device;
+struct xe_gt;
+
+/*
+ * Common backend helper
+ */
+__printf(6, 7)
+void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
+		  u16 sig_id, u32 cper_sev, int errno_val,
+		  const char *fmt, ...);
+
+/*
+ * Driver-facing reporting macros
+ */
+
+/* FATAL */
+#define XE_RAS_PROBE(xe, errno, fmt, ...) \
+	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define XE_RAS_WEDGED(xe, errno, fmt, ...) \
+	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define XE_RAS_SURVIVABILITY(xe, errno, fmt, ...) \
+	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+/* RECOVERABLE */
+#define XE_RAS_FW(xe, gt, errno, fmt, ...) \
+	__xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define XE_RAS_GT_TDR(xe, gt, errno, fmt, ...) \
+	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define XE_RAS_MEM_FAULT(xe, gt, errno, fmt, ...) \
+	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define XE_RAS_IO_BUS(xe, errno, fmt, ...) \
+	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#endif /* _XE_SIG_IDS_H_ */
-- 
2.34.1

