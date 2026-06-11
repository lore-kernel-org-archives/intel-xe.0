Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98376CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 09:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574AB10EDA1;
	Thu, 11 Jun 2026 09:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nC3KVH7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D90510EDA1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781169345; x=1812705345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jn9sJ72sLC25wJ3WMYOUn1KS83ZfgvcqVJVhF/jdXaM=;
 b=nC3KVH7kYmvenxhrbPWEzZLKSPlnTl5c0X3ogt1745UV2hJ6yOhPEWKI
 JFqav1upCaRHIGyeS7Dpt9D02Wzk9y9DHFfSnfYpkdrbGzeXZwa82HDm/
 pmviS+0ueN7Ny2LGUn+3lOfQB4BZGiyvKtRYnAT6uYcgW99LiqQtDoFIl
 7jgYvn0KvjqkLHHgvnH+LWcU0RiPo/vJAIjoI2MXjfBWYHGxfrxUD7c/O
 uipWsLUK1YIgItzZ3qnD2cWZpib3yEJPV1D6fy7xKdF55GKcvu234O/3a
 6oDmJJ4IyZ+R5gyv4e8MJwaLGTFdTAr91hQdERASN4ioUEM4S6cWuhzPU A==;
X-CSE-ConnectionGUID: 5M4osLU5R++p5wt6/FRU4Q==
X-CSE-MsgGUID: qrAkTbfVSE2VaS95PpIlaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92654751"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="92654751"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:15:45 -0700
X-CSE-ConnectionGUID: UHi7hTVQRASVlQfQRmpEew==
X-CSE-MsgGUID: 4we85k0kR+eWRRV//aRboQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250346673"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 11 Jun 2026 02:15:41 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 1/2] drm/xe: add structured RAS error logging infrastructure
Date: Thu, 11 Jun 2026 14:42:26 +0530
Message-ID: <20260611091224.17275-5-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611091224.17275-4-mallesh.koujalagi@intel.com>
References: <20260611091224.17275-4-mallesh.koujalagi@intel.com>
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
index 091872771e98..412be4bad952 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -115,6 +115,7 @@ xe-y += xe_bb.o \
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

