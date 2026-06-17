Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E998CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 10:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106410EFA9;
	Wed, 17 Jun 2026 10:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ET1Ip+CX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6259310EFA9
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781693447; x=1813229447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q/xqVFFsrgQcIgf2yL83mRNJaRrp0dIdcunqIbtvkZY=;
 b=ET1Ip+CXppoEbZJrlg4Ks2j9VUvMwuXPvFz5BE3PgiQle0QtavjRO+yS
 oPkao2KNDKsaBzppiRJ5i8+/sQ3vJuD4aCoF7/SqKoyOvYftiQPpc+fiV
 hRSS/MmIp2pe/qWBToCBInOjsYwRrkbH+CqhUYBr0ayxOTyLRvYsx1Gjw
 qxCsYMAIGllgEDO1amO/YcK4rsl3nR4GYzW+N48df5QgpG5P+GrUtjEBh
 m/IilxcRmvl9kInkMeqE5w0Pw1L4Hxk9MRs82SehDQJeHu7IkfRHYksXI
 R4Qa8rPHeqkwkveCYLlUL/UakIIQDN6DU7vRxsKPkfwAkV74ksAW3IzIf w==;
X-CSE-ConnectionGUID: tdk2DivqRp6xIPabuQG3yQ==
X-CSE-MsgGUID: Pjslq7VGRpmgausUhuitxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82677396"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82677396"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:50:46 -0700
X-CSE-ConnectionGUID: 0B8tlKk4T62EiwMmtmXKiA==
X-CSE-MsgGUID: n1yD5krUQUm5X/b6N4egaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248099635"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 17 Jun 2026 03:50:42 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v3 2/3] drm/xe: Add RAS logging helpers
Date: Wed, 17 Jun 2026 16:17:14 +0530
Message-ID: <20260617104711.79646-7-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
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

Add xe_ras_log.c and xe_ras_log.h so the driver can report
faults in a structured, machine-readable way.

The core is __xe_ras_log(), which emits a single log line with:
SIG_ID, severity, location (device or tile/GT), errno, and message.
Fatal faults go to drm_err(); recoverable ones to drm_warn().

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v3:
- Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
- Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
- Move __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
- Make macro function properly.
- Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
- Add sig id documents. (Riana)
- Change macro function same prefix as the file.
- Handle __xe_ras_log() function with variable format.
---
 drivers/gpu/drm/xe/Makefile     |   1 +
 drivers/gpu/drm/xe/xe_ras_log.c |  63 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_log.h | 108 ++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e7b146880f4..607c9b099d03 100644
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
index 000000000000..0e836ef5dcf6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_log.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_print.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_ras_log.h"
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
+	struct va_format vaf;
+	va_list ap;
+
+	if (gt)
+		snprintf(loc, sizeof(loc), "tile%u/gt%u",
+			 gt->tile->id, gt->info.id);
+	else
+		snprintf(loc, sizeof(loc), "device");
+
+	va_start(ap, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &ap;
+
+	if (cper_sev == CPER_SEV_FATAL)
+		drm_err(&xe->drm,
+			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
+			sig_id, cper_severity_str(cper_sev), loc,
+			errno_val, &vaf);
+	else
+		drm_warn(&xe->drm,
+			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
+			 sig_id, cper_severity_str(cper_sev), loc,
+			 errno_val, &vaf);
+
+	va_end(ap);
+
+	/* TODO: Add CPER record driver handler */
+	/* TODO: Add RAS dump cper hex handler */
+}
diff --git a/drivers/gpu/drm/xe/xe_ras_log.h b/drivers/gpu/drm/xe/xe_ras_log.h
new file mode 100644
index 000000000000..08318dea75a9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_log.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_LOG_H_
+#define _XE_RAS_LOG_H_
+
+#include <linux/cper.h>
+
+#include "xe_sig_ids.h"
+
+struct xe_device;
+struct xe_gt;
+
+/**
+ * DOC: RAS structured logging and SIG_IDs
+ *
+ * What this file is for
+ * ---------------------
+ * Use the xe_ras_log_*() macros to report faults in a
+ * machine-readable way.
+ *
+ * What is a SIG_ID?
+ * -----------------
+ * A SIG_ID (defined in xe_sig_ids.h) is a stable numeric error class.
+ * It tells tooling what kind of fault happened, independent of message text.
+ *
+ * Driver SIG_ID classes:
+ *   XE_SIG_PROBE         - probe/init failure
+ *   XE_SIG_WEDGED        - device unrecoverable
+ *   XE_SIG_SURVIVABILITY - degraded/safe mode
+ *   XE_SIG_FW            - firmware fault (GuC/HuC/GSC/CSC/PCODE)
+ *   XE_SIG_GT_TDR        - engine hang or GT reset (TDR)
+ *   XE_SIG_MEM_FAULT     - VM/page-fault/GTT error
+ *   XE_SIG_IO_BUS        - PCIe/IOMMU/MMIO bus error
+ *
+ * HW SIG_ID classes are hardware-defined categories, reported by firmware via
+ * CPER records (for example XE_SIG_HW_DEVICE_MEMORY). Driver code does not
+ * emit HW SIG_IDs directly.
+ *   XE_SIG_HW_DEVICE_MEMORY  - device memory errors (e.g. ECC)
+ *   XE_SIG_HW_CORE_COMPUTE   - compute/shader core errors
+ *   XE_SIG_HW_PCIE           - PCIe interface errors
+ *   XE_SIG_HW_FABRIC         - on-package fabric errors
+ *   XE_SIG_HW_SOC_INTERNAL   - SoC-internal errors
+ *
+ * Why this exists
+ * ---------------
+ * SIG_IDs let RAS tools parse logs reliably, correlate CPER events, and apply
+ * policy/thresholding without depending on fragile string matching.
+ *
+ * When to use xe_ras_log_*()
+ * --------------------------
+ * Use these macros when the event is:
+ *   1) a real hardware/firmware fault,
+ *   2) relevant to production monitoring, and
+ *   3) clearly mapped to one SIG_ID class.
+ *
+ * Do not use for all logs
+ * -----------------------
+ * Keep regular debug/info/driver-state messages on standard logging helpers
+ * (xe_gt_dbg(), xe_gt_info(), xe_gt_warn(), xe_gt_err(), drm_dbg(), drm_info()).
+ * RAS macros are for structured fault reporting only.
+ */
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
+#define xe_ras_log_probe(xe, errno, fmt, ...) \
+	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define xe_ras_log_wedged(xe, errno, fmt, ...) \
+	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define xe_ras_log_survivability(xe, errno, fmt, ...) \
+	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+/* RECOVERABLE */
+#define xe_ras_log_fw(xe, gt, errno, fmt, ...) \
+	__xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
+	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
+	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
+	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#endif /* _XE_RAS_LOG_H_ */
-- 
2.34.1

