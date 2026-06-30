Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A89DC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 11:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2742310EC53;
	Tue, 30 Jun 2026 11:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d68bQaxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA33110EC53
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 11:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782820729; x=1814356729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lo1VWrIhSGBuHyD+rOl+bWZqDFZe6/XoxrlxXm3luPg=;
 b=d68bQaxmmnsRcdTNtrVFH4gpEDnJsGSGA3Ki3L2yIlcdGKjrfpUPMTVI
 H11Q7dwu+I7XkGrutieJmLPB41ADOSqGooukBldEIZnkaYoT23lApQAhY
 57Vd1t/Sl6QljLTL/KhcEVm67kaTRUl4urZGrnNV/Q11sPObfSq60ipsq
 TVbSoNhaoAbW5BOjEJdnSvEN5S/BM8cjrQLzALHK3+Me3HEUMN6Mv8Eek
 yOkhnsoRJEQ26flw8DUMUJrJDXKA145QQsu8AEb8us8mIgHEz2C1R0aso
 NEG0h3kVSGY0Kb7SjccUJeGXrufHa505QLyy1ZW7zwO7CeyInXAO7u8zU g==;
X-CSE-ConnectionGUID: xyxfG99aRGun0AEqeTXCOw==
X-CSE-MsgGUID: T7h8DptpQJiD4CgoeUbOtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106323571"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106323571"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:58:49 -0700
X-CSE-ConnectionGUID: 8u5r/gFbSc63VssOqyMJvQ==
X-CSE-MsgGUID: WPJ6D/ojSdqZO3AA+NlSZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="255839657"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 04:58:45 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v4 1/5] drm/xe: Add SIG_IDs for RAS error logging
Date: Tue, 30 Jun 2026 17:25:05 +0530
Message-ID: <20260630115503.407158-8-mallesh.koujalagi@intel.com>
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

Add xe_sig_ids.h which defines a set of stable numeric labels
for Xe error categories, called SIG_IDs.

Each SIG_ID identifies which subsystem reported an error (e.g. probe,
wedged, GT TDR, firmware). It does not encode the full failure details,
those come from errno and the free-form message:

  SIG_ID  -> which area failed
  errno   -> what failed
  message -> extra human-readable context

Also add a DOC: kernel-doc section covering design rationale, driver
severity labels (FATAL/RECOVERABLE), usage guidelines, and the
distinction between driver and hardware error paths.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v3:
- Add HW SIG IDS details. (Riana)

v4:
- Change commit message.
- Update the document. (Riana)
- Move documents to xe_sig_ids.h
- Update Hardware error.
- Remove example in Hardware error SIG_ID.
- Make Fabric errors.
- Add kernel doc for SIG_IDS. (Michal Wajdeczko)
- Provide severity details.
---
 Documentation/gpu/xe/index.rst      |   1 +
 Documentation/gpu/xe/xe_sig_ids.rst |   8 ++
 drivers/gpu/drm/xe/xe_sig_ids.h     | 124 ++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_sig_ids.rst
 create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 665c0e93601c..557877837348 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe-drm-usage-stats.rst
    xe_configfs
    xe_gt_stats
+   xe_sig_ids
diff --git a/Documentation/gpu/xe/xe_sig_ids.rst b/Documentation/gpu/xe/xe_sig_ids.rst
new file mode 100644
index 000000000000..0e65d577927b
--- /dev/null
+++ b/Documentation/gpu/xe/xe_sig_ids.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+===============
+SIG_ID Overview
+===============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_sig_ids.h
+   :doc: SIG_ID Overview
diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
new file mode 100644
index 000000000000..57e4037fd7d4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sig_ids.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SIG_IDS_H_
+#define _XE_SIG_IDS_H_
+
+/**
+ * DOC: SIG_ID Overview
+ *
+ * Signature ID (SIG_ID) is a stable numeric identifier (u16) for a defined
+ * Xe error category - it answers: "which subsystem reported the error?"
+ *
+ * SIG_ID format
+ * =============
+ *
+ * Xe error events are emitted as a single structured line using stable fields.
+ * Driver events use:
+ *
+ *   [xe-err] SIG_ID = <u16> Severity = <CPER_SEV_*>
+ *            Location = <device|tile/gt> Errno = <neg_errno>
+ *            Message = "<free-form text>"
+ *
+ * Hardware-originated RAS events use the same overall format, but typically
+ * omit Errno and Message and instead report the hardware-derived location /
+ * error-class information.
+ *
+ * Important
+ * =========
+ *
+ * SIG_ID identifies the reporting subsystem/category only. It does not encode
+ * the detailed failure reason. The detailed reason is carried separately by::
+ *
+ *   SIG_ID   -> which subsystem/category failed
+ *   Severity -> how serious the event is
+ *   Errno    -> what failed (driver events)
+ *   Message  -> human-readable context
+ *
+ * Example (driver event)
+ * ======================
+ *
+ *   [xe-err] SIG_ID = 6 Severity = CPER_SEV_RECOVERABLE
+ *   Location = tile0/gt0 Errno = -5
+ *   Message = "Engine 'rcs0' hung; TDR triggered, engine reset succeeded"
+ *
+ * In the example
+ * ==============
+ *
+ *   SIG_ID 6   = XE GT/TDR category
+ *   RECOVERABLE = workload impacted, device still operational
+ *   -5         = Linux errno (-EIO)
+ *   Message    = extra context for triage
+ *
+ * Why SIG_ID exists?
+ * ==================
+ *
+ * The goal is to replace inconsistent ad-hoc error strings with a small
+ * set of stable, structured error events that are easier for operators
+ * and tools to understand. Each driver event carries a fixed SIG_ID with
+ * a severity determined by its error category, and structured output that
+ * can be consumed consistently across driver or firmware versions. It
+ * reduces guesswork during triage and allows machine parsing of important
+ * fault events.
+ *
+ * Driver severity labels
+ * ======================
+ *
+ * FATAL means the device cannot continue operation (e.g. probe failure,
+ * device wedged). RECOVERABLE means the driver encountered an error but
+ * may continue with degraded functionality.
+ *
+ * When to use the xe_ras_log helpers (see xe_ras_log.h)
+ * =====================================================
+ *
+ * Use them only for defined Xe error events that belong to the published
+ * error categories. These helpers are intended for important fault paths
+ * such as probe failure, wedged device, survivability mode, firmware
+ * failures, GT hang/TDR/reset, memory faults, and runtime IO/bus faults.
+ * The selected macro fixes the SIG_ID and severity for that category.
+ *
+ * Do not use xe_ras_log helpers for all logs
+ * ==========================================
+ *
+ * These helpers are not a replacement for normal drm_info(), drm_dbg(),
+ * tracing, or one-off diagnostics. They are for stable, structured error
+ * reporting only. Using them for ordinary logs would dilute the error
+ * stream and make operator-facing fault reporting noisy and less useful.
+ *
+ * Hardware errors
+ * ===============
+ *
+ * Hardware errors are hardware-reported RAS events and map to the
+ * XE_SIG_HW_* identifiers. They are reported through the hardware error
+ * path (e.g. CPER records), not through the driver xe_ras_log helpers.
+ *
+ * Unlike driver xe_ras_log helpers, hardware events do not have one fixed
+ * severity per SIG_ID. For example, a fabric event (XE_SIG_HW_FABRIC) may
+ * be reported as CPER_SEV_CORRECTED, CPER_SEV_FATAL, CPER_SEV_RECOVERABLE,
+ * or CPER_SEV_INFORMATIONAL, depending on what the hardware reported.
+ */
+
+/*
+ * Driver errors: SIG_IDs
+ */
+#define XE_SIG_PROBE			1  /* FATAL: probe failed */
+#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
+#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
+#define XE_SIG_RUNTIME_FW		4  /* RECOVERABLE: GuC/HuC/UC/GSC */
+#define XE_SIG_DEVICE_FW		5  /* RECOVERABLE: PCODE/CSC/System controller */
+#define XE_SIG_GT_TDR			6  /* RECOVERABLE: engine hang / reset */
+#define XE_SIG_MEM_FAULT		7  /* RECOVERABLE: VM bind, page fault, GTT */
+#define XE_SIG_IO_BUS			8  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
+
+/*
+ * Hardware errors: SIG_IDs
+ */
+#define XE_SIG_HW_DEVICE_MEMORY		9  /* Device memory errors */
+#define XE_SIG_HW_CORE_COMPUTE		10 /* Compute/shader core errors */
+#define XE_SIG_HW_PCIE			11 /* PCIe interface errors */
+#define XE_SIG_HW_FABRIC		12 /* Fabric errors */
+#define XE_SIG_HW_SOC_INTERNAL		13 /* SoC-internal errors */
+
+#endif /* _XE_SIG_IDS_H_ */
-- 
2.34.1

