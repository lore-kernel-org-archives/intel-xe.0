Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4292AEF48E6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 08:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074BB10E2E8;
	Fri, 13 Feb 2026 08:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOQfaiD1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AECB10E2E8
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770970742; x=1802506742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6cYVckHEwTure+K1woMhthhZzwmQEAWBIy+0N7CZgxk=;
 b=eOQfaiD1DvY8IitI2Kxto7ySPphIqzq/vY/vwEmrZlXtImb92ishSsCN
 k6gnm4GKUwLyvWOboZUEBeHqqsMBtuH/0+LMpU1k0tUtnx5AuzYaFwr0b
 7uYGPNC2W2TpChCJG/rtMztnIuH3NKCkPV10CqViwjougin9KqnyBS4uJ
 UMyTLpCvdqur3qw9AHRdb1BNGMGvCy3XhwLODghoJP0oSVzZzShZtL9tX
 65IJBbLCpwCXiRNZ35jCVoznOdmlgIg29AyhuC9oBCUalDbq6hFM3HejE
 xMZi/avG1d8bNpPFTh62Ry2v5HaOpmw7Rs9x4AlYvHHeNp1JEn6CCQR7y g==;
X-CSE-ConnectionGUID: gCuSM8QKQv653YJOV/T9cQ==
X-CSE-MsgGUID: E4Boco5TSOGcgQ+ijEQvVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83522685"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="83522685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:19:02 -0800
X-CSE-ConnectionGUID: jzUk/+OJRS6+JuSs+tMqdg==
X-CSE-MsgGUID: bc8ZvH5hSmuE75VOQUpL4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212696796"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 00:18:59 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 4/4] drm/xe/ras: Introduce correctable error handling
Date: Fri, 13 Feb 2026 13:46:02 +0530
Message-ID: <20260213081644.2085314-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213081644.2085314-1-raag.jadav@intel.com>
References: <20260213081644.2085314-1-raag.jadav@intel.com>
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

Add initial support for correctable error handling which is serviced
using system controller event. Currently we only log the errors in
dmesg but this serves as a foundation for RAS infrastructure and will
be further extended to facilitate other RAS features.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/xe_ras.c           | 87 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
 drivers/gpu/drm/xe/xe_ras_types.h     | 79 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
 5 files changed, 183 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 59e083f90d7e..7fc67c320086 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -111,6 +111,7 @@ xe-y += xe_bb.o \
 	xe_pxp_submit.o \
 	xe_query.o \
 	xe_range_fence.o \
+	xe_ras.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
 	xe_ring_ops.o \
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..413c6e62cd50
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_assert.h"
+#include "xe_printk.h"
+#include "xe_ras.h"
+#include "xe_ras_types.h"
+#include "xe_sysctrl_event_types.h"
+
+/* Severity of detected errors  */
+enum xe_ras_severity {
+	XE_RAS_SEV_NOT_SUPPORTED		= 0x00,
+	XE_RAS_SEV_CORRECTABLE			= 0x01,
+	XE_RAS_SEV_UNCORRECTABLE		= 0x02,
+	XE_RAS_SEV_INFORMATIONAL		= 0x03,
+	XE_RAS_SEV_MAX
+};
+
+/* Major IP blocks/components where errors can originate */
+enum xe_ras_component {
+	XE_RAS_COMP_NOT_SUPPORTED		= 0x00,
+	XE_RAS_COMP_DEVICE_MEMORY		= 0x01,
+	XE_RAS_COMP_CORE_COMPUTE		= 0x02,
+	XE_RAS_COMP_RESERVED			= 0x03,
+	XE_RAS_COMP_PCIE			= 0x04,
+	XE_RAS_COMP_FABRIC			= 0x05,
+	XE_RAS_COMP_SOC_INTERNAL		= 0x06,
+	XE_RAS_COMP_MAX
+};
+
+static const char *const xe_ras_severities[] = {
+	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
+	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
+	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
+	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
+
+static const char *const xe_ras_components[] = {
+	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
+	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
+	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
+	[XE_RAS_COMP_RESERVED]			= "Reserved",
+	[XE_RAS_COMP_PCIE]			= "PCIe",
+	[XE_RAS_COMP_FABRIC]			= "Fabric",
+	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
+
+static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
+{
+	xe_assert(xe, sev < XE_RAS_SEV_MAX);
+
+	return xe_ras_severities[sev];
+}
+
+static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
+{
+	xe_assert(xe, comp < XE_RAS_COMP_MAX);
+
+	return xe_ras_components[comp];
+}
+
+void xe_ras_event_log(struct xe_device *xe, struct xe_sysctrl_event_response *response)
+{
+	struct xe_ras_event_threshold_crossed *pending = (void *)&response->data;
+	struct xe_ras_error *errors = pending->counters;
+	u32 cid, sev, comp, inst, cause;
+	u8 tile;
+
+	xe_warn(xe, "[RAS]: error counter threshold crossed\n");
+	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);
+
+	for (cid = 0; cid < pending->ncounters; cid++) {
+		sev = errors[cid].common.severity;
+		comp = errors[cid].common.component;
+
+		tile = errors[cid].product.unit.tile;
+		inst = errors[cid].product.unit.instance;
+		cause = errors[cid].product.cause.cause;
+
+		xe_warn(xe, "[RAS]: Error:%s Tile:%u Component:%s Instance:%u Cause:%#x\n",
+			sev_to_str(xe, sev), tile, comp_to_str(xe, comp), inst, cause);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
new file mode 100644
index 000000000000..fdefe0e2fe98
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_H_
+#define _XE_RAS_H_
+
+struct xe_device;
+struct xe_sysctrl_event_response;
+
+void xe_ras_event_log(struct xe_device *xe, struct xe_sysctrl_event_response *response);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..0afcf8bf982d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_TYPES_H_
+#define _XE_RAS_TYPES_H_
+
+#include <linux/types.h>
+
+#define XE_RAS_NUM_COUNTERS			21
+
+/**
+ * struct xe_ras_error_common - Error fields that are common across all products
+ */
+struct xe_ras_error_common {
+	/** @severity: Error severity */
+	u8 severity;
+	/** @component: IP block where error originated */
+	u8 component;
+} __packed;
+
+/**
+ * struct xe_ras_error_unit - Error unit information
+ */
+struct xe_ras_error_unit {
+	/** @tile: Tile identifier */
+	u8 tile;
+	/** @instance: Instance identifier specific to IP */
+	u32 instance;
+} __packed;
+
+/**
+ * struct xe_ras_error_cause - Error cause information
+ */
+struct xe_ras_error_cause {
+	/** @cause: Cause/checker */
+	u32 cause;
+	/** @reserved: For future use */
+	u8 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_error_product - Error fields that are specific to the product
+ */
+struct xe_ras_error_product {
+	/** @unit: Unit within IP block */
+	struct xe_ras_error_unit unit;
+	/** @cause: Cause/checker */
+	struct xe_ras_error_cause cause;
+} __packed;
+
+/**
+ * struct xe_ras_error - Combines common and product-specific parts
+ */
+struct xe_ras_error {
+	/** @common: Common error type and component */
+	struct xe_ras_error_common common;
+	/** @product: Product-specific unit and cause */
+	struct xe_ras_error_product product;
+} __packed;
+
+/**
+ * struct xe_ras_event_threshold_crossed - Event data for counter threshold crossed event
+ */
+struct xe_ras_event_threshold_crossed {
+	/** @ncounters: Number of counters that crossed thresholds */
+	u32 ncounters;
+	/** @ts_high: Higher 32 bits of event timestamp */
+	u32 ts_high;
+	/** @ts_low: Lower 32 bits of event timestamp */
+	u32 ts_low;
+	/** @reason: Threshold cross reason */
+	u32 reason;
+	/** @counters: Array of error counters that crossed threshold */
+	struct xe_ras_error counters[XE_RAS_NUM_COUNTERS];
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index 7c3041f4196a..876754f9fe35 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -7,6 +7,7 @@
 #include "xe_device.h"
 #include "xe_irq.h"
 #include "xe_printk.h"
+#include "xe_ras.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_event_types.h"
 #include "xe_sysctrl_mailbox.h"
@@ -37,7 +38,7 @@ static void xe_sysctrl_get_pending_event(struct xe_device *xe,
 		}
 
 		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
-			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
+			xe_ras_event_log(xe, &response);
 		} else {
 			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
 			return;
-- 
2.43.0

