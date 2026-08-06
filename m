Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CB0C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 11:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22C010F17C;
	Thu,  6 Aug 2026 11:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ej7d8Y8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C754610F17B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786014053; x=1817550053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6QKCmV0yIN3y0haaNW/NQezfHtZ4ha78uto7xT8W8QA=;
 b=Ej7d8Y8KZlx+3mMIMXXgTOnauFhf9wFsj0VKXt7yv7/ofB/1tO8T44SU
 1UYwi0AB1gJvewETU58bioPdJsMO6sehpnhynS4mHg/ht0dbk2EgVVf87
 fRDXOcIdELUyTuF9vimMCr3zV8eY1TU1ldjc6xdWijY0eLQgPOK3UINO2
 IioP2I9ksJl04sXDpcYwvgXky35+kVHoiaDrDE3T3iuoh85Y9Jm1fdSw6
 9J9+d4qDgImSpjpC5ih7a+oK5AP3XJQ4EGV8+xv69mgZCgwTsVeeTJ4Ll
 ZfMuL/gC2O59qQeXwoyaOkF3CHPwn/J0FgbTI7C8AII4DTbuPwgpq26zM Q==;
X-CSE-ConnectionGUID: lEAdNzcQQnKJ+KEtHHk2ng==
X-CSE-MsgGUID: v9tgCl+STYC04BAzfEwFAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86614753"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86614753"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:00:53 -0700
X-CSE-ConnectionGUID: Oz+pYhv/Qdm9WSP2ajoL/g==
X-CSE-MsgGUID: jDUA0alIRnGxIF0EWLzsWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="259453622"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2026 04:00:49 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 1/4] drm/xe/log: DO NOT REVIEW
Date: Thu,  6 Aug 2026 16:30:41 +0530
Message-ID: <20260806110039.1245282-7-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
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

DO NOT REVIEW. COMPILATION ONLY
This patch is from https://patchwork.freedesktop.org/series/171022/
Added only for Compilation.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 Documentation/gpu/xe/index.rst        |   1 +
 Documentation/gpu/xe/xe_sigid.rst     |  14 ++
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/abi/xe_log_abi.h   | 198 +++++++++++++++++++++++
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 195 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_any.h           | 142 +++++++++++++++++
 drivers/gpu/drm/xe/xe_log.c           | 221 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h           | 158 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.c           |  11 ++
 9 files changed, 941 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_any.h
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
diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
new file mode 100644
index 000000000000..b3373d4b29d5
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -0,0 +1,198 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _ABI_XE_LOG_ABI_H_
+#define _ABI_XE_LOG_ABI_H_
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+
+#include "abi/xe_sigid_abi.h"
+
+/**
+ * enum xe_log_component_bits - bits for components structure definitions
+ *
+ * Component identifiers are structured based on::
+ *
+ *     COMPONENT = CLASS(8b).TYPE(8b)
+ *
+ * and the structure looks like this::
+ *
+ *     ├── SYSTEM(0)
+ *     │   └── ...
+ *     ├── DRIVER(1)
+ *     │   └── ...
+ *     ├── FEATURE(2)
+ *     │   └── ...
+ *     ├── FIRMWARE(4)
+ *     │   └── ...
+ *     └── HARDWARE(8)
+ *         └── ...
+ *
+ * Examples::
+ *
+ *     COMPONENT(0.type) = SYSTEM.type = system component
+ *     COMPONENT(1.type) = DRIVER.type = driver core component
+ *     COMPONENT(3.type) = DRIVER_FEATURE.type = driver feature
+ *     COMPONENT(5.type) = DRIVER_FIRMWARE.type = firmware driver component
+ *     COMPONENT(9.type) = DRIVER_HARDWARE.type = hardware driver component
+ *
+ */
+enum xe_log_component_bits {
+	/* private: */
+	XE_LOG_COMPONENT_CLASS_MASK = GENMASK_U16(7, 0),
+	XE_LOG_COMPONENT_TYPE_MASK = GENMASK_U16(15, 8),
+	/* private: component classes */
+	XE_LOG_COMPONENT_CLASS_SYSTEM = 0u,
+	XE_LOG_COMPONENT_CLASS_DRIVER = 1u,
+	XE_LOG_COMPONENT_CLASS_FEATURE = 2u,
+	XE_LOG_COMPONENT_CLASS_FIRMWARE = 4u,
+	XE_LOG_COMPONENT_CLASS_HARDWARE = 8u,
+	XE_LOG_COMPONENT_CLASS_DRIVER_FEATURE = XE_LOG_COMPONENT_CLASS_DRIVER |
+						XE_LOG_COMPONENT_CLASS_FEATURE,
+	XE_LOG_COMPONENT_CLASS_DRIVER_FIRMWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
+						 XE_LOG_COMPONENT_CLASS_FIRMWARE,
+	XE_LOG_COMPONENT_CLASS_DRIVER_HARDWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
+						 XE_LOG_COMPONENT_CLASS_HARDWARE,
+	/* private: reserved identifiers */
+	XE_LOG_COMPONENT_NONE = 0u,
+};
+
+#define MAKE_XE_LOG_COMPONENT(_CLASS, type) \
+	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, \
+			  XE_LOG_COMPONENT_CLASS_##_CLASS) | \
+	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
+
+/**
+ * enum xe_log_location_bits - bits for location structure definitions
+ *
+ * Location identifiers are structured based on::
+ *
+ *     LOCATION = TYPE(8b).ID(8b)
+ *
+ * and the structure looks like this::
+ *
+ *     ├── DEVICE(0)
+ *     │   └── MBZ(0)
+ *     ├── TILE(1)
+ *     │   ├── Tile0(0)
+ *     │   ├── ...
+ *     │   └── TileN(n)
+ *     ├── GT(1)
+ *     │   ├── GT0(0)
+ *     │   ├── ...
+ *     │   └── GTn(n)
+ *     └── ...
+ *
+ * Examples::
+ *
+ *     LOCATION(0.0) = NONE
+ *     LOCATION(1.0) = DEVICE.0 = "Device"
+ *     LOCATION(2.1) = TILE.1 = "Tile1"
+ *     LOCATION(3.2) = GT.2 = "GT2"
+ *
+ */
+enum xe_log_location_bits {
+	/* private: */
+	XE_LOG_LOCATION_TYPE_MASK = GENMASK_U16(7, 0),
+	XE_LOG_LOCATION_ID_MASK = GENMASK_U16(15, 8),
+	/* private: location types */
+	XE_LOG_LOCATION_TYPE_DEVICE = 1u,
+	XE_LOG_LOCATION_TYPE_TILE = 2u,
+	XE_LOG_LOCATION_TYPE_GT = 3u,
+	/* private: reserved identifiers */
+	XE_LOG_LOCATION_NONE = 0u,
+};
+
+#define PREP_XE_LOG_LOCATION(type, id) \
+	(FIELD_PREP(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
+	 FIELD_PREP(XE_LOG_LOCATION_ID_MASK, (id)))
+
+#define MAKE_XE_LOG_LOCATION(_TYPE, id) \
+	PREP_XE_LOG_LOCATION(XE_LOG_LOCATION_TYPE_##_TYPE, (id))
+
+/**
+ * DEFINE_XE_LOG_COMPONENTS() - Define log components.
+ * @define: name of the inner macro to expand.
+ *
+ * Use this super macro to define custom code for the log components.
+ * The following parameters are available for each component::
+ *
+ *     define(CLASS, ID, TAG, SIGID, NAME)
+ *
+ * where:
+ *
+ *     @ID is the unique component identifier within CLASS.SUBCLASS.CATEGORY
+ *     @TAG is unique component tag (across all components)
+ *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
+ */
+#define DEFINE_XE_LOG_COMPONENTS(define) \
+	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
+	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
+
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
+	/* */									\
+	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
+	define(SYSTEM, 2, DRM, SW, "DRM")					\
+	/* */									\
+	define(DRIVER, 1, XE, SW, "Xe Driver")					\
+	define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")		\
+	define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")			\
+	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
+	define(DRIVER, 5, WA, SW, "Workarounds")				\
+	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
+	/* */									\
+	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
+	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
+	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
+	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
+	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
+	/* */									\
+	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
+	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
+	define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
+	define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
+	/* */									\
+	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
+	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
+	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
+	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
+	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
+
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
+	/* eod */
+
+/**
+ * enum xe_log_component_tags - TAGs of all supported components
+ */
+enum xe_log_component_tags {
+	/* private: */
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */
+	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_ENUM)
+#undef MAKE_XE_LOG_COMPONENT_ENUM
+};
+
+/**
+ * enum xe_log_component_sigids - SIGIDs of all supported components
+ */
+enum xe_log_component_sigids {
+	/* private: */
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */
+	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_SIGID)
+#undef MAKE_XE_LOG_COMPONENT_SIGID
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
new file mode 100644
index 000000000000..69cce4b45635
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
@@ -0,0 +1,195 @@
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
+ * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
+ * that names one *recognised Xe fault situation* -- nothing more. It is the
+ * primary handle used for triage: a SIGID maps to a human description and a
+ * recommended first action. A coarse first-order action is documented in-tree
+ * per SIGID (see "First-order action" below) so the id is actionable on its
+ * own; published end-user documentation refines it with finer, cross-product
+ * detail. The driver's only job is to emit the right SIGID next to the usual
+ * human-readable text.
+ *
+ * Why this exists
+ * ---------------
+ *
+ * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
+ * strings that have no stable shape. That is fine for a human reading dmesg,
+ * but it gives fleet tooling nothing durable to match on: the wording changes
+ * between releases, lines can be rate-limited or dropped under an error storm,
+ * and there is no consistent way to ask "which recognised fault just happened?"
+ * A SIGID answers exactly that one question, identically across driver and
+ * firmware versions, and (eventually) across other Intel devices in a node.
+ *
+ * What a SIGID is (and is not)
+ * ----------------------------
+ *
+ * A SIGID names *which situation* is being reported. It deliberately does not
+ * encode the detailed reason or the outcome. Those are carried alongside it::
+ *
+ *   SIGID    -> which recognised situation is being reported
+ *   severity -> how serious this instance is (see below -- not fixed per SIGID)
+ *   errno    -> the failing operation's error, shown with %pe
+ *   message  -> free-form human-readable context
+ *
+ * Severity is independent of the SIGID. The same situation can be reported at
+ * different severities depending on the instance and the recovery taken, so a
+ * SIGID is never tied to one severity; the reporting site chooses it by calling
+ * the matching xe_log_*() helper (see xe_log.h).
+ *
+ * How to pick a SIGID (the uniqueness rule)
+ * -----------------------------------------
+ *
+ * Pick per *report site*, not per incident. Each site emits the single most
+ * specific recognised situation *for that site* -- so the question is never
+ * "classify this whole failure", it is "what does this site detect?", which has
+ * one answer. A single underlying failure therefore legitimately produces a
+ * *chain* of reports from different layers, each with its own SIGID -- e.g. a
+ * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
+ * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
+ * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
+ * follow a fault from origin to final effect; it is not a duplicate.
+ *
+ * If a site does not match any defined situation, keep using the ordinary
+ * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
+ * or over-broad classification is harder to retire than a missing one. When a
+ * new situation is genuinely worth triaging, add it to the list below.
+ *
+ * Scope: software-emitted signatures only
+ * ---------------------------------------
+ *
+ * This header enumerates only the situations that the *driver itself* detects
+ * and reports from software: probe abort, wedged, survivability, driver-
+ * detected firmware failures, engine TDR, memory faults and IO/bus faults.
+ * These are the only values the driver assigns.
+ *
+ * Signatures that *originate* in firmware or hardware are a different thing:
+ * they are produced and identified by the firmware or the hardware itself
+ * (e.g. via their own records or error counters), and the driver merely logs
+ * them as they are given to us. They are deliberately *not* enumerated here --
+ * minting a driver-side id for a firmware/hardware-reported error would only
+ * duplicate an identifier the reporting layer already owns. The two
+ * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
+ * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
+ * observed a firmware problem, not a signature reported by the firmware.
+ *
+ * Numbering
+ * ---------
+ *
+ * SIGIDs are a single flat list numbered sequentially within the assigned range,
+ * in the order the situations were introduced. Values are stable: once assigned
+ * they are only ever appended, never renumbered or reused.
+ *
+ * A retired situation is deprecated in place, never re-purposed.
+ *
+ * First-order action (resolution buckets)
+ * ---------------------------------------
+ *
+ * So that a SIGID is actionable on its own, each one is tagged with a coarse
+ * *resolution bucket*: the first thing an operator should do on seeing it. The
+ * bucket is a stable, driver-owned hint; external documentation may refine it,
+ * but the in-tree value always stands on its own. Every new SIGID must pick a
+ * bucket, which forces the question "what should someone do about this?" to be
+ * answered up front. The buckets are::
+ *
+ *   COLLECT  -- capture logs and open a bug report
+ *   RETRY    -- transient or already recovered; watch for recurrence
+ *   UPDATE   -- a firmware update / flash is required
+ *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
+ *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
+ *
+ * The bucket is documentation only -- it is recorded per SIGID in the enum
+ * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
+ *
+ * When to use SIGID logging
+ * -------------------------
+ *
+ * The xe_log_*() helpers are for these recognised fault situations only --
+ * important, operator-relevant faults and events. They are not a replacement
+ * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
+ * using them for ordinary logging would dilute the fault stream. Not every
+ * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
+ * a published situation.
+ *
+ * dmesg vs. the machine record
+ * ----------------------------
+ *
+ * The dmesg line stays close to a normal xe error message so it remains
+ * readable for admins; the only stable, machine-matchable token on it is
+ * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
+ * text may change freely, and lines may be dropped. The durable record for
+ * tooling is the CPER record carrying the same SIGID (generation is a planned
+ * follow-up).
+ */
+
+/*
+ * Top level Intel Error Signature Identifiers.
+ */
+#define INTEL_SIGID_INVALID			0
+#define INTEL_SIGID_GPU_START			100
+#define INTEL_SIGID_GPU_END			999
+
+#define INTEL_SIGID_GPU_XE_START		100
+#define INTEL_SIGID_GPU_XE_END			299
+
+#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
+#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
+#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
+#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
+
+/**
+ * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
+ * @XE_SIGID_SW: Software component failure. [COLLECT]
+ * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
+ * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
+ * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
+ * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
+ * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
+ * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
+ * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
+ * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
+ * @XE_SIGID_HW: Generic hardware failure.
+ * @XE_SIGID_PCIE: PCIe interface errors.
+ * @XE_SIGID_DEVICE_MEMORY: Device memory errors
+ * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
+ * @XE_SIGID_FABRIC: Fabric errors.
+ * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
+ *
+ * The situations the driver detects and reports in software. Values are
+ * numbered sequentially, are only ever appended, and are never renumbered or
+ * reused. The tag in brackets is the default resolution bucket (see the `Xe
+ * Error Signatures (SIGID)`_ section).
+ *
+ * Firmware- and hardware-originated signatures are numbered separately.
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
+
+	XE_SIGID_HW			= INTEL_SIGID_GPU_XE_HARDWARE_START,
+	XE_SIGID_PCIE			= INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
+	XE_SIGID_DEVICE_MEMORY		= INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
+	XE_SIGID_CORE_COMPUTE		= INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
+	XE_SIGID_FABRIC			= INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
+	XE_SIGID_SOC_INTERNAL		= INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
new file mode 100644
index 000000000000..c49f87ccdb47
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_any.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ANY_H_
+#define _XE_ANY_H_
+
+#include "xe_device.h"
+
+#define __xe_any_to_self_assoc(type, any) \
+	const type * : (any), \
+	type * : (any)
+
+/**
+ * xe_any_if_type() - Get the pointer only if it is @type pointer.
+ * @any: any pointer
+ * @type: data type to look for
+ *
+ * Return: the @type pointer or NULL.
+ */
+#define xe_any_if_type(any, type)						\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(type, (any)),				\
+		default :								\
+			NULL)
+
+/**
+ * xe_any_if_gt() - Get the pointer only if it is &xe_gt.
+ * @any: any pointer
+ *
+ * Return: the @xe_gt pointer or NULL.
+ */
+#define xe_any_if_gt(any)	xe_any_if_type((any), struct xe_gt)
+
+/**
+ * xe_any_if_tile() - Get the pointer only if it is &xe_tile.
+ * @any: any pointer
+ *
+ * Return: the @xe_tile pointer or NULL.
+ */
+#define xe_any_if_tile(any)	xe_any_if_type((any), struct xe_tile)
+
+/**
+ * xe_any_if_xe() - Get the pointer only if it is &xe_device.
+ * @any: any pointer
+ *
+ * Return: the @xe_device pointer or NULL.
+ */
+#define xe_any_if_xe(any)	xe_any_if_type((any), struct xe_device)
+
+/**
+ * xe_any_if_pdev() - Get the pointer only if it is &pci_dev.
+ * @any: any pointer
+ *
+ * Return: the @pci_dev pointer or NULL.
+ */
+#define xe_any_if_pdev(any)	xe_any_if_type((any), struct pci_dev)
+
+#define __xe_any_to_other_assoc(const, from, other, p) \
+	const struct from * : __##from##_to_##other((const struct from *)(p))
+
+#define __xe_tile_to_xe_device(p)	tile_to_xe(p)
+#define __xe_gt_to_xe_device(p)		gt_to_xe(p)
+#define __pci_dev_to_xe_device(p)	pdev_to_xe_device(p)
+#define __device_to_xe_device(p)	kdev_to_xe_device(p)
+#define __drm_device_to_xe_device(p)	to_xe_device(p)
+#define __pci_dev_to_device(p)		(&(p)->dev)
+
+/**
+ * xe_any_to_xe() - Obtain the &xe_device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @xe_device pointer or backpointer.
+ */
+#define xe_any_to_xe(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct xe_device, (any)),		\
+		 __xe_any_to_other_assoc(/* */, xe_tile, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(const, xe_tile, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(/* */, xe_gt, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(const, xe_gt, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(, drm_device, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(, pci_dev, xe_device, (any)),		\
+		 __xe_any_to_other_assoc(, device, xe_device, (any)))
+
+/**
+ * xe_any_to_drm() - Obtain the &drm_device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @drm_device pointer or backpointer.
+ */
+#define xe_any_to_drm(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct drm_device, (any)),		\
+		default :								\
+			&xe_any_to_xe(any)->drm)
+
+/**
+ * xe_any_to_dev() - Obtain the &device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @device pointer or backpointer.
+ */
+#define xe_any_to_dev(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct device, (any)),			\
+		 __xe_any_to_other_assoc(, pci_dev, device, (any)),		\
+		default :								\
+			xe_any_to_drm(any)->dev)
+
+/**
+ * xe_any_to_pdev() - Obtain the &pci_dev pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @pci_dev pointer or backpointer.
+ */
+#define xe_any_to_pdev(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct pci_dev, (any)),			\
+		default :								\
+			to_pci_dev(xe_any_to_dev(any)))
+
+#define __xe_tile_to_id(p)		((p)->id)
+#define __xe_gt_to_id(p)		((p)->info.id)
+
+/**
+ * xe_any_id() - Get the identifier of the underlying object.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the identifier of the object, or 0 if not applicable/available.
+ */
+#define xe_any_id(any)								\
+	_Generic((any),								\
+		 __xe_any_to_other_assoc(/* */, xe_tile, id, (any)),		\
+		 __xe_any_to_other_assoc(const, xe_tile, id, (any)),		\
+		 __xe_any_to_other_assoc(/* */, xe_gt, id, (any)),		\
+		 __xe_any_to_other_assoc(const, xe_gt, id, (any)),		\
+		default :								\
+			0)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
new file mode 100644
index 000000000000..32fbf83fd992
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "abi/xe_log_abi.h"
+
+#include "xe_device.h"
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
+static const char *log_unknown_component_prefix(u32 component)
+{
+	u32 class = FIELD_GET(XE_LOG_COMPONENT_CLASS_MASK, component);
+	u32 type = FIELD_GET(XE_LOG_COMPONENT_TYPE_MASK, component);
+
+	WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unrecognized component %u.%u\n", class, type);
+	switch (class) {
+#define MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(_CLASS) \
+	case XE_LOG_COMPONENT_CLASS_##_CLASS: return #_CLASS "? "
+	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(SYSTEM);
+	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(DRIVER);
+	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(FEATURE);
+	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(FIRMWARE);
+	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(HARDWARE);
+#undef MAKE_XE_LOG_COMPONENT_CLASS_PREFIX
+	}
+	return "COMP? ";
+}
+
+static const char *log_component_prefix(u32 component)
+{
+	switch (component) {
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return /* _CLASS _ID _SIG _NAME */ #_TAG ": ";
+	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_CASE_PREFIX)
+#undef MAKE_XE_LOG_COMPONENT_CASE_PREFIX
+	}
+
+	return component ? log_unknown_component_prefix(component) : "";
+}
+
+static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	return xe ? xe_device_get_gt(xe, id) : NULL;
+}
+
+static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	return xe && id < xe->info.tile_count ? &xe->tiles[id] : NULL;
+}
+
+static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
+{
+	u32 type = FIELD_GET(XE_LOG_LOCATION_TYPE_MASK, location);
+	u32 id = FIELD_GET(XE_LOG_LOCATION_ID_MASK, location);
+
+	if (!location || type == XE_LOG_LOCATION_TYPE_DEVICE) {
+		if (id)
+			goto unrecognized;
+		strscpy(buf, "", size);
+	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
+		struct xe_tile *tile = get_tile_safe(pdev, id);
+
+		if (!tile)
+			goto unrecognized;
+		snprintf(buf, size, "Tile%u: ", id);
+	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
+		struct xe_gt *gt = get_gt_safe(pdev, id);
+
+		if (!gt)
+			goto unrecognized;
+		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
+	} else {
+		goto unrecognized;
+	}
+
+	return buf;
+
+unrecognized:
+	pci_WARN(pdev, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+		 "LOG: unrecognized location %u.%u\n", type, id);
+	snprintf(buf, size, "LOC%u.%u? ", type, id);
+	return buf;
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
+	default:
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
+	char buf[32];
+	const char *loc_prefix = log_location_prefix(pdev, location, buf, sizeof(buf));
+	const char *comp_prefix = log_component_prefix(component);
+	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
+	const char *sev_prefix = log_sev_prefix(cper_sev);
+
+	if (IS_ERR(data))
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%s%s%pV",
+				 sigid, sev_prefix, data, hwe_prefix,
+				 loc_prefix, comp_prefix, vaf);
+	else if (data && len)
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%s%s%pV",
+				 sigid, sev_prefix, (int)len, data, hwe_prefix,
+				 loc_prefix, comp_prefix, vaf);
+	else
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%s%s%pV",
+				 sigid, sev_prefix, hwe_prefix,
+				 loc_prefix, comp_prefix, vaf);
+}
+
+/**
+ * xe_log_emit() - Emit a structured SIGID log entry
+ * @pdev: the &pci_dev device
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &enum xe_sigid
+ * @component: component identifier
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
+ *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
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
index 000000000000..7b90e39b97be
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_LOG_H_
+#define _XE_LOG_H_
+
+#include <linux/cper.h>
+#include <linux/err.h>
+
+#include "abi/xe_log_abi.h"
+#include "abi/xe_sigid_abi.h"
+#include "xe_any.h"
+
+struct pci_dev;
+
+__printf(8, 9)
+void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		 u32 component, u32 location, const void *data, size_t len,
+		 const char *fmt, ...);
+
+#define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_recoverable(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_RECOVERABLE, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_corrected(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_CORRECTED, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_info(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_location_type(any)							\
+	_Generic((any),									\
+		 struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,				\
+		 const struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,			\
+		 struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,				\
+		 const struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,			\
+		 struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,			\
+		 const struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,		\
+		 struct pci_dev * : XE_LOG_LOCATION_TYPE_DEVICE,			\
+		 struct device * : XE_LOG_LOCATION_TYPE_DEVICE)
+
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))
+
+/**
+ * xe_log_from() - Emit a structured SIGID log entry using @any pointer as location.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &enum xe_sigid
+ * @component: component identifier
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @args: arguments for the @fmt format string
+ *
+ * The location used to emit SIGID entry will be based on the @any pointer type.
+ * See xe_log_emit() for more details.
+ */
+#define xe_log_from(any, cper_sev, sigid, component, data, len, fmt, args...) do {	\
+	typeof(any) ___any = (any);							\
+	xe_log_emit(xe_any_to_pdev(___any), (cper_sev), (sigid), (component),		\
+		    xe_log_location(___any), (data), (len), fmt, ##args);		\
+} while (0)
+
+#define xe_log_from_fatal(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_FATAL, (sig), (comp), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_recoverable(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_RECOVERABLE, (sig), (comp), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_corrected(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_CORRECTED, (sig), (comp), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_info(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), \
+		    (data), (len), fmt, ##args)
+
+/**
+ * xe_log_comp() - Emit a structured SIGID log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @TAG: the component tag to use
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The SIGID will be determined from the component's @TAG.
+ * The component identifier will be determined from the component's @TAG.
+ * The location used to emit SIGID entry will be based on the @any pointer type.
+ */
+#define xe_log_comp(any, cper_sev, TAG, data, len, fmt, args...) \
+	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
+		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
+
+/**
+ * xe_log_err() - Emit a structured SIGID error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_RECOVERABLE severity.
+ */
+#define xe_log_err(any, TAG, err, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_RECOVERABLE, TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_err_fatal() - Emit a structured SIGID error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_FATAL severity.
+ */
+#define xe_log_err_fatal(any, TAG, err, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_FATAL, TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_err_corrected() - Emit a structured SIGID error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_CORRECTED severity.
+ */
+#define xe_log_err_corrected(any, TAG, err, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_CORRECTED, TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_info() - Emit a structured SIGID information log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_INFORMATIONAL severity.
+ */
+#define xe_log_info(any, TAG, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_INFORMATIONAL, TAG, NULL, 0, fmt, ##args)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 352f056fd9ef..65dd77250ff3 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_drm_ras.h"
+#include "xe_log.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -45,6 +46,16 @@ enum xe_ras_component {
 	XE_RAS_COMP_MAX
 };
 
+#define CHECK_COMPONENT(RAS_COMP, LOG_COMP) \
+	static_assert(MAKE_XE_LOG_COMPONENT(HARDWARE, (RAS_COMP)) == (LOG_COMP))
+	/* make sure components definitions maintain stable relation */
+	CHECK_COMPONENT(XE_RAS_COMP_DEVICE_MEMORY, XE_LOG_COMPONENT_DEVMEM);
+	CHECK_COMPONENT(XE_RAS_COMP_CORE_COMPUTE, XE_LOG_COMPONENT_HWCORE);
+	CHECK_COMPONENT(XE_RAS_COMP_PCIE, XE_LOG_COMPONENT_PCIE);
+	CHECK_COMPONENT(XE_RAS_COMP_FABRIC, XE_LOG_COMPONENT_FABRIC);
+	CHECK_COMPONENT(XE_RAS_COMP_SOC_INTERNAL, XE_LOG_COMPONENT_SOC);
+#undef CHECK_COMPONENT
+
 /* RAS response status codes */
 enum xe_ras_response_status {
 	XE_RAS_STATUS_SUCCESS = 0,
-- 
2.48.1

