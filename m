Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CABC5DF64
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA97A10F0E3;
	Wed, 12 Aug 2026 19:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrMxsKq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2C510F0FB
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562107; x=1818098107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EE9lIGEN+FFJ2K8tPz507grIwPX0oS7+653PKtwDqRs=;
 b=mrMxsKq2LsLa4sKLhFFZ3Qdk861wic8j78Tjbm2oCzTGcRodzKeXa6aP
 ZgLK3o93dcQF2QOueL7Bl5BX1Ou/bIw3Ri0QKcCw7fOPVCaJZJ2qls77+
 Bx8+AkIQ4H5XkDmLKxMd29rmWFGqxOodfbDFe3ClVQu4j8PKtEj1k1cmP
 bi21akWSPKzqi1WTtDrmi6yFPRM99bqKvlA8oaDHmOS6SngHfVnVcZRqv
 Mtyyzr3y5vweMLeYTE9ZTqu0yjmG/TcCJHXgsj6tXOxwi0XEfIkMrRZ56
 SXgMEAjaGrJMUCN6slsC+CXjxTMVIcCqqvU+nS0Xtd/imzADyktoPQE0a Q==;
X-CSE-ConnectionGUID: JZRLPPydSg2z9YB61UI8Uw==
X-CSE-MsgGUID: DP9DTh6iRpWrdkfKDbWbww==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987497"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:07 -0700
X-CSE-ConnectionGUID: 9d8KbzayTt230KhHB38CQQ==
X-CSE-MsgGUID: N/24ay+DSYytz3GJh18a/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891846"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Yoni Levitt <yoni.levitt@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
Date: Wed, 12 Aug 2026 21:14:18 +0200
Message-ID: <20260812191450.11690-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
strings that have no stable shape. That is readable for a human, but it
gives fleet tooling nothing durable to match on: the wording changes
between releases, lines can be rate-limited or dropped under an error
storm, and there is no consistent way to ask "which recognised fault
just happened?".

Introduce a signature identifier (SIGID): a small, stable integer that
names one recognised Xe fault site and serves as the primary handle for
triage. A SIGID maps, through published end-user documentation, to a
description and a recommended action; the driver only has to emit the
right SIGID next to the usual human-readable text.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Assisted-by: Copilot:Opus-4.8
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
Cc: Yoni Levitt <yoni.levitt@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
v2: CORRECTED is still an error (Michal)
    prepare to decorate dmesg with comp/loc (Michal)
v3: update SIGID DOC section (Riana/Aravind)
    warn about unknown severity (Mallesh)
---
 Documentation/gpu/xe/index.rst        |   1 +
 Documentation/gpu/xe/xe_sigid.rst     |  14 +++
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 159 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.c           | 138 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h           |  20 ++++
 6 files changed, 333 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_log.h

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 665c0e93601c..0247a255f7e6 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe-drm-usage-stats.rst
    xe_configfs
    xe_gt_stats
+   xe_sigid
diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
new file mode 100644
index 000000000000..45d84a62f185
--- /dev/null
+++ b/Documentation/gpu/xe/xe_sigid.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+========
+Xe SIGID
+========
+
+.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+   :doc: Xe Error Signatures (SIGID)
+
+Signature Identifiers
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+   :internal:
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 44ed055439d4..92134709d998 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -87,6 +87,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_late_bind_fw.o \
+	xe_log.o \
 	xe_lrc.o \
 	xe_mem_pool.o \
 	xe_migrate.o \
diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
new file mode 100644
index 000000000000..93967183ae51
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _ABI_XE_SIGID_ABI_H_
+#define _ABI_XE_SIGID_ABI_H_
+
+/**
+ * DOC: Xe Error Signatures (SIGID)
+ *
+ * What SIGID stands for
+ * ---------------------
+ *
+ * SIGID is short for *Signature Identifier*. It is a small, stable integer
+ * that names one of *recognised fault site* -- nothing more. It is the
+ * primary handle used for triage and maps directly to specific report site.
+ *
+ * Numbering
+ * ---------
+ *
+ * SIGIDs are a single flat list numbered sequentially within the assigned range,
+ * in the order the fault sites were introduced. Values are stable: once assigned
+ * they are only ever appended, never renumbered or reused. A retired fault site
+ * SIGID value is deprecated in place, never re-purposed.
+ *
+ * Why this exists
+ * ---------------
+ *
+ * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_err()``
+ * strings that have no stable shape. That is fine for a human reading dmesg,
+ * but it gives fleet tooling nothing durable to match on: the wording changes
+ * between releases, lines can be rate-limited or dropped under an error storm,
+ * and there is no consistent way to ask "which recognised fault just happened?"
+ *
+ * A SIGID answers exactly that one question, identically across driver and
+ * firmware versions, and (eventually) across other Intel devices in a node.
+ *
+ * What a SIGID is not
+ * -------------------
+ *
+ * SIGID deliberately does not encode the detailed reason or the outcome. Those
+ * are carried alongside it::
+ *
+ *   SIGID    -> which recognised fault site is being reported
+ *   severity -> how serious this instance is
+ *   errno    -> the failing operation's error, if available, shown with %pe
+ *   message  -> free-form human-readable context
+ *
+ * Severity is independent of the SIGID. The same SIGID can be reported at
+ * different severities depending on the instance and the recovery taken.
+ *
+ * When to use SIGID logging
+ * -------------------------
+ *
+ * The xe_log_*() helpers are for these recognised fault sites only --
+ * important, operator-relevant faults and events. The driver's only job is to
+ * emit the right SIGID next to the usual human-readable text.
+
+ * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracing, nor
+ * for one-off diagnostics; using them for ordinary logging would dilute the
+ * fault stream. Not every ``xe_err()`` needs to become a SIGID report -- only
+ * those that correspond to a published fault sites.
+ *
+ * SIGID log output (dmesg vs. the machine record)
+ * -----------------------------------------------
+ *
+ * The dmesg line stays close to a normal xe error message so it remains
+ * readable for admins; the only stable, machine-matchable token on it is
+ * ``SIGID=<n>`` (``dmesg | grep SIGID=``).
+ *
+ * The full dmesg line is not an ABI: the surrounding text may change freely,
+ * and lines may be dropped. The durable record for tooling is the CPER record
+ * carrying the same SIGID (generation is a planned follow-up).
+ *
+ * How to pick a SIGID (the uniqueness rule)
+ * -----------------------------------------
+ *
+ * Pick per *report site*, not per incident. Each site emits the single most
+ * specific recognised SIGID *for that site* -- so the question is never
+ * "classify this whole failure", it is "what does this site detect?", which has
+ * one answer. A single underlying failure therefore legitimately produces a
+ * *chain* of reports from different layers, each with its own SIGID -- e.g. a
+ * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
+ * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
+ * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
+ * follow a fault from origin to final effect; it is not a duplicate.
+ *
+ * If a site does not match any defined SIGID, keep using the ordinary
+ * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
+ * or over-broad classification is harder to retire than a missing one. When a
+ * new report site is genuinely worth triaging, add it to the list below.
+ *
+ * Usage of the existing SIGID reports must reevaluated according to this section
+ * after making significant changes to the site that emits this SIGID.
+ *
+ * Scope: software vs hardware emitted signatures
+ * ----------------------------------------------
+ *
+ * Some SIGID represents fault sites that the *driver itself* detects and
+ * reports from the software POV: probe abort, wedged, survivability, driver-
+ * detected firmware failures, engine TDR, memory faults and IO/bus faults.
+ * These are the only values the driver assigns on its own.
+ *
+ * Signatures that *originate* in firmware or hardware are a different thing:
+ * they are produced and identified by the firmware or the hardware itself
+ * (e.g. via their own records or error counters), and the driver merely logs
+ * them as they are given to us. They are deliberately enumerated separately.
+ *
+ * The two driver-detected firmware report sites below (%XE_SIGID_RUNTIME_FW,
+ * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
+ * observed a firmware problem, not a signature reported by the firmware.
+ */
+
+/*
+ * Top level Intel Error Signature Identifiers.
+ */
+#define INTEL_SIGID_INVALID			0
+#define INTEL_SIGID_BATCH			100
+#define INTEL_SIGID_RANGE_START(n)		((n) * INTEL_SIGID_BATCH)
+#define INTEL_SIGID_RANGE_END(n)		(INTEL_SIGID_RANGE_START((n) + 1) - 1)
+
+/* SIGIDs 1xx are reserved for Xe GPU software and 2xx for Xe GPU hardware */
+#define INTEL_SIGID_GPU_XE_SOFTWARE_START	INTEL_SIGID_RANGE_START(1)
+#define INTEL_SIGID_GPU_XE_SOFTWARE_END		INTEL_SIGID_RANGE_END(1)
+#define INTEL_SIGID_GPU_XE_HARDWARE_START	INTEL_SIGID_RANGE_START(2)
+#define INTEL_SIGID_GPU_XE_HARDWARE_END		INTEL_SIGID_RANGE_END(2)
+
+/**
+ * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
+ * @XE_SIGID_SW: Software component failure.
+ * @XE_SIGID_PROBE: Device probe/bind was aborted.
+ * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable.
+ * @XE_SIGID_SURVIVABILITY: Device entered survivability mode.
+ * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC.
+ * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl.
+ * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).
+ * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
+ * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
+ *
+ * Each SIGID represents the report sites the driver detects and reports.
+ * Values are numbered sequentially, are only ever appended, and are never
+ * renumbered or reused.
+ *
+ * Firmware- and hardware-originated signatures are not listed yet here.
+ */
+enum xe_sigid {
+	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
+	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
+	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
+	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
+	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
+	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
+	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
+	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
+	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
new file mode 100644
index 000000000000..ae4f6e33f5b8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_log.h"
+#include "xe_printk.h"
+
+static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+			  u32 component, u32 location, const void *data, size_t len,
+			  struct va_format *vaf)
+{
+	/* TODO */
+}
+
+static bool is_hw_sigid(enum xe_sigid sigid)
+{
+	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
+}
+
+static bool is_sev_error(int cper_sev)
+{
+	return cper_sev != CPER_SEV_INFORMATIONAL;
+}
+
+static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
+{
+	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
+}
+
+static const char *log_sev_prefix(int cper_sev)
+{
+	switch (cper_sev) {
+	case CPER_SEV_FATAL:
+		return "FATAL ";
+	case CPER_SEV_RECOVERABLE:
+		return "";
+	case CPER_SEV_CORRECTED:
+		return "CORRECTED ";
+	case CPER_SEV_INFORMATIONAL:
+		return "";
+	default:
+		WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unknown severity %d\n", cper_sev);
+		return "";
+	}
+}
+
+#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
+#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
+
+static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
+{
+	if (cper_sev == CPER_SEV_INFORMATIONAL)
+		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
+	else
+		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
+}
+
+static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	log_dmesg_vprintk(pdev, cper_sev, &vaf);
+
+	va_end(args);
+}
+
+static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+			   u32 component, u32 location, const void *data, size_t len,
+			   struct va_format *vaf)
+{
+	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
+	const char *sev_prefix = log_sev_prefix(cper_sev);
+
+	/* TODO: add component/location details */
+
+	if (IS_ERR(data))
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
+				 sigid, sev_prefix, data, hwe_prefix, vaf);
+	else if (data && len)
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
+				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
+	else
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
+				 sigid, sev_prefix, hwe_prefix, vaf);
+}
+
+/**
+ * xe_log_emit() - Emit a structured SIGID log entry
+ * @pdev: the &pci_dev device
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &enum xe_sigid
+ * @component: component identifer
+ * @location: location details of the @component
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @...: format arguments
+ *
+ * Emits a dmesg line that includes a single stable, machine-matchable token
+ * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
+ * when @data pointer is set, either the error printed with %pe or a packed hex
+ * dump of the @data binary blob. The dmesg line will also include printf-style
+ * text message.
+ *
+ * Note that the full dmesg line, with the free text message, is only a debugging
+ * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
+ * The durable machine record is the CPER carrying the same SIGID.
+ *
+ * Note: generation of the CPER record is a planned follow-up.
+ *
+ * Examples::
+ *
+ *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
+ *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
+ *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
+ */
+void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		 u32 component, u32 location, const void *data, size_t len,
+		 const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
+	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
+
+	va_end(args);
+}
diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
new file mode 100644
index 000000000000..d475e816ee0b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_LOG_H_
+#define _XE_LOG_H_
+
+#include <linux/cper.h>
+
+#include "abi/xe_sigid_abi.h"
+
+struct pci_dev;
+
+__printf(8, 9)
+void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		 u32 component, u32 location, const void *data, size_t len,
+		 const char *fmt, ...);
+
+#endif
-- 
2.47.1

