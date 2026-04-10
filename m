Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B031E9907D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 10:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B31510E935;
	Fri, 10 Apr 2026 10:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QiH+uQnL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A10110E935
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775817062; x=1807353062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bNHBJ44eMq+J6B2Fge+pM31FMaygfN9RNV68Mm5PLCg=;
 b=QiH+uQnLe9TrkneYozeme3VAWvoyPqThwMie8m9Ucv/KK5nKbRamkQTT
 GCr4jpJR4WkB2rYgrZKdodzzT6+FHuwu6ZdM+Za28I2IAAsRpgJoJLa53
 HinttZcT7pPaYF+/QixM0LNg+AIjoBprmBfpACPCqz8pZ2ZUIacA1GmTW
 QgJkB7sg3tbLax1YpAek5TCBceUfZ1DRFHA3MZFBACyP/hvcbsDCm97TL
 3WaDUgLP7igITGyfDoSXmJTuRbLBDAsmIa4a0JVqpu2D2XeEDbZZrggbK
 e+E7dys+4y6YfBE+lClpq1le0QYcx3R/aOYnTvIuKibLrnhp5a7nUsrgn w==;
X-CSE-ConnectionGUID: 1vYNrHlJTWq4aFIwlw/wig==
X-CSE-MsgGUID: 4aAHH8q2Rqq9jeZV4O+Uhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76724482"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76724482"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 03:31:02 -0700
X-CSE-ConnectionGUID: 5RkDRHV4Q660pmVzsEyfYw==
X-CSE-MsgGUID: cLh5N2vETpG0Z5s+UmeB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="226331260"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 03:30:59 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 3/3] drm/xe/ras: Introduce correctable error handling
Date: Fri, 10 Apr 2026 15:57:44 +0530
Message-ID: <20260410102744.427150-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410102744.427150-1-raag.jadav@intel.com>
References: <20260410102744.427150-1-raag.jadav@intel.com>
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
v4: Fix Severity/Component logging (Mallesh)
    s/xe_ras_error/xe_ras_error_class (Riana)
v5: Handle unexpected counter threshold crossed (Mallesh)
v6: Drop unused xe_device parameter (Mallesh)
    Fix unexpected counter threshold logic (Mallesh)
    Use xe_device parameter for xe_ras functions (Riana)
    Shorten dmesg logging (Riana)
    s/xe_ras_threshold_crossed_data/xe_ras_threshold_crossed (Riana)
---
 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/xe_ras.c           | 92 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h           | 15 +++++
 drivers/gpu/drm/xe/xe_ras_types.h     | 73 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
 5 files changed, 183 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9e6689c86797..0e6e91a6063c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -113,6 +113,7 @@ xe-y += xe_bb.o \
 	xe_pxp_submit.o \
 	xe_query.o \
 	xe_range_fence.o \
+	xe_ras.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
 	xe_ring_ops.o \
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..08e91348c459
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_printk.h"
+#include "xe_ras.h"
+#include "xe_ras_types.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_event_types.h"
+
+/* Severity of detected errors  */
+enum xe_ras_severity {
+	XE_RAS_SEV_NOT_SUPPORTED = 0,
+	XE_RAS_SEV_CORRECTABLE,
+	XE_RAS_SEV_UNCORRECTABLE,
+	XE_RAS_SEV_INFORMATIONAL,
+	XE_RAS_SEV_MAX
+};
+
+/* Major IP blocks/components where errors can originate */
+enum xe_ras_component {
+	XE_RAS_COMP_NOT_SUPPORTED = 0,
+	XE_RAS_COMP_DEVICE_MEMORY,
+	XE_RAS_COMP_CORE_COMPUTE,
+	XE_RAS_COMP_RESERVED,
+	XE_RAS_COMP_PCIE,
+	XE_RAS_COMP_FABRIC,
+	XE_RAS_COMP_SOC_INTERNAL,
+	XE_RAS_COMP_MAX
+};
+
+static const char *const xe_ras_severities[] = {
+	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
+	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
+	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable Error",
+	[XE_RAS_SEV_INFORMATIONAL]		= "Informational Error",
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
+static inline const char *sev_to_str(u8 sev)
+{
+	if (sev >= XE_RAS_SEV_MAX)
+		sev = XE_RAS_SEV_NOT_SUPPORTED;
+
+	return xe_ras_severities[sev];
+}
+
+static inline const char *comp_to_str(u8 comp)
+{
+	if (comp >= XE_RAS_COMP_MAX)
+		comp = XE_RAS_COMP_NOT_SUPPORTED;
+
+	return xe_ras_components[comp];
+}
+
+void xe_ras_counter_threshold_crossed(struct xe_device *xe,
+				      struct xe_sysctrl_event_response *response)
+{
+	struct xe_ras_threshold_crossed *pending = (void *)&response->data;
+	struct xe_ras_error_class *errors = pending->counters;
+	u32 counter_id, ncounters = pending->ncounters;
+
+	if (!ncounters || ncounters > XE_RAS_NUM_COUNTERS) {
+		xe_err(xe, "sysctrl: unexpected counter threshold crossed %u\n", ncounters);
+		return;
+	}
+
+	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
+	xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", ncounters);
+
+	for (counter_id = 0; counter_id < ncounters; counter_id++) {
+		u8 severity, component;
+
+		severity = errors[counter_id].common.severity;
+		component = errors[counter_id].common.component;
+
+		xe_warn(xe, "[RAS]: %s %s detected\n",
+			comp_to_str(component), sev_to_str(severity));
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
new file mode 100644
index 000000000000..ea90593b62dc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -0,0 +1,15 @@
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
+void xe_ras_counter_threshold_crossed(struct xe_device *xe,
+				      struct xe_sysctrl_event_response *response);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..4e63c67f806a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,73 @@
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
+#define XE_RAS_NUM_COUNTERS			16
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
+ * struct xe_ras_error_class - Combines common and product-specific parts
+ */
+struct xe_ras_error_class {
+	/** @common: Common error type and component */
+	struct xe_ras_error_common common;
+	/** @product: Product-specific unit and cause */
+	struct xe_ras_error_product product;
+} __packed;
+
+/**
+ * struct xe_ras_threshold_crossed - Data for threshold crossed event
+ */
+struct xe_ras_threshold_crossed {
+	/** @ncounters: Number of error counters that crossed thresholds */
+	u32 ncounters;
+	/** @counters: Array of error counters that crossed threshold */
+	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index 3edde46a9711..c6ea32f3471e 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -6,6 +6,7 @@
 #include "xe_device.h"
 #include "xe_irq.h"
 #include "xe_printk.h"
+#include "xe_ras.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_event_types.h"
 #include "xe_sysctrl_mailbox.h"
@@ -34,7 +35,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 		}
 
 		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
-			xe_warn(xe, "[RAS]: counter threshold crossed\n");
+			xe_ras_counter_threshold_crossed(xe, response);
 		else
 			xe_err(xe, "sysctrl: unexpected event %#x\n", response->event);
 
-- 
2.43.0

