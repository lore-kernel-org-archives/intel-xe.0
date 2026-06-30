Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87762C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 11:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAAE10EC54;
	Tue, 30 Jun 2026 11:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJVu1gme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EDA10EC54
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782820733; x=1814356733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=szNaDMzeG8KVLhuLBagjJi3vpCoNA+i4PYHn7Sz+PI8=;
 b=YJVu1gmeisHKgiTy2djYGuBCDgzpSFZBrzuaWeubhyVnGithxbwplfSQ
 ipCMvB49U1OPdBVMUtib1GrXmjBsK6Mh7iMPbsyYYinCn7x243e+HmS04
 JL2UkyU2FIhPuc6uA24epuLbtHK2Wx1kvwzHsyFRkjnlq5BuHPrNxMFVX
 3z5oHFODSD3zgIbYeaQnC11X2jlF2t/Ok18acCC3s/urnIIz8sjQCVhQz
 uksa3xogHhHAdyWQmx3txmykJkVXS/H9r23/D25hrauTStlh3RpvN89gM
 c6aT9gkDPFnjTC6BQoPnizlIzsgjVBik6ySzwGBl9CGO3UADI31j6f3o9 Q==;
X-CSE-ConnectionGUID: YPbvtDWLQXy7wQ93fRZEZw==
X-CSE-MsgGUID: TM20QGpkRTWOos5Rl5P9ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106323573"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106323573"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:58:53 -0700
X-CSE-ConnectionGUID: hHnSY1VKRUKBOGwDn6KNdg==
X-CSE-MsgGUID: QnrKM3DnS7qa1oi96X55+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="255839667"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 04:58:48 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v4 2/5] drm/xe: Add RAS logging helpers
Date: Tue, 30 Jun 2026 17:25:06 +0530
Message-ID: <20260630115503.407158-9-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
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

Add xe_ras_log_(*) macros to report Xe driver errors in a
consistent, structured format.

Exposes one macro per error category (probe, wedged,
survivability, firmware, GT TDR, memory fault, IO bus). Each macro
hard-codes the correct SIG_ID and severity for that category, so
callers only need to pass the device or GT handle, errno, and message.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v3:
- Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
- Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
- Declare __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
- Make macro function properly.
- Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
- Add sig id documents. (Riana)
- Change macro function same prefix as the file.
- Handle __xe_ras_log() function with variable format.

v4:
- Handle CONFIG_UEFI_CPER properly.
- Add CPER_SEV_RECOVERABLE in __xe_ras_log().
- Add xe_ras_log_runtime_fw() and xe_ras_log_device_fw() macros.
- Update commit message.
- Remove document. (Riana)
---
 drivers/gpu/drm/xe/Makefile     |  1 +
 drivers/gpu/drm/xe/xe_ras_log.c | 65 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_log.h | 62 +++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e5a04253e73b..cac19c21be08 100644
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
index 000000000000..928fa4f45cdc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_log.c
@@ -0,0 +1,65 @@
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
+	if (cper_sev == CPER_SEV_FATAL || cper_sev == CPER_SEV_RECOVERABLE)
+		drm_err(&xe->drm,
+			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
+			sig_id,
+			IS_ENABLED(CONFIG_UEFI_CPER) ? cper_severity_str(cper_sev) : "unknown",
+			loc, errno_val, &vaf);
+	else
+		drm_warn(&xe->drm,
+			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
+			 sig_id,
+			 IS_ENABLED(CONFIG_UEFI_CPER) ? cper_severity_str(cper_sev) : "unknown",
+			 loc, errno_val, &vaf);
+
+	va_end(ap);
+
+	/* TODO: Add CPER record driver handler */
+	/* TODO: Add RAS dump cper hex handler */
+}
diff --git a/drivers/gpu/drm/xe/xe_ras_log.h b/drivers/gpu/drm/xe/xe_ras_log.h
new file mode 100644
index 000000000000..3f94e6747e86
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_log.h
@@ -0,0 +1,62 @@
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
+/*
+ * Common backend helper
+ */
+__printf(6, 7)
+void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
+		  u16 sig_id, u32 cper_sev, int errno_val,
+		  const char *fmt, ...);
+
+/*
+ * Driver error reporting macros
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
+#define xe_ras_log_runtime_fw(xe, gt, errno, fmt, ...) \
+	__xe_ras_log((xe), (gt), XE_SIG_RUNTIME_FW, CPER_SEV_RECOVERABLE, \
+		     (errno), fmt, ##__VA_ARGS__)
+
+#define xe_ras_log_device_fw(xe, gt, errno, fmt, ...) \
+	__xe_ras_log((xe), (gt), XE_SIG_DEVICE_FW, CPER_SEV_RECOVERABLE, \
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

