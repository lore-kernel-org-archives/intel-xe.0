Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCBFFF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 05:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EDE10E2F9;
	Tue, 28 Apr 2026 05:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtrDx96F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E922210E2F9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 05:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777355493; x=1808891493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUyIeFTNo0LHleEhcLcivl61Bz8/0wijadgnFRzaku8=;
 b=PtrDx96FQE8gv4LrOcjcocVHf8gODxTHVpFZbTms3uwRr4bOZRg09PA9
 lBCEKf23BgYVSC8LR8TWB3/gbGyNpPTEETL9bGLF/02dpzbhbDfA1F5+n
 3phbkA2YXPUYwsSHGJxslkemS68vCbNVhIXQUvrFcE8jwwNZtA1MICU44
 GiTJGSAmqbEQGnVTJgFOUL2lWyxWYJp6UDAKbY5mslJKKot1fYJBrJv1Z
 cmJxO7+dnRu4/QQCI1ilmmPQI9odel463fbgZgrqyMWAQdaJAJhu6TVLV
 JTjqDoQDIt6NA7ooGhvKB0HSF5qABhXByp4QGVVa2szb5bHKyH0IZL8Ie A==;
X-CSE-ConnectionGUID: wjDVojuzTN28bqEBEDgO0A==
X-CSE-MsgGUID: 1it3HPZZQ9CUH4AQvF4j8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82119234"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="82119234"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 22:51:33 -0700
X-CSE-ConnectionGUID: 3FY5i3W5RQuNdrsJlv56vQ==
X-CSE-MsgGUID: tElna0J8RJmE9XEDMco5og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="271978596"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 27 Apr 2026 22:51:29 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 3/3] drm/xe/ras: Introduce correctable error handling
Date: Tue, 28 Apr 2026 11:18:26 +0530
Message-ID: <20260428054826.1202076-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428054826.1202076-1-raag.jadav@intel.com>
References: <20260428054826.1202076-1-raag.jadav@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Handle unexpected response length (Mallesh)
v3: Handle event flood (Mallesh)
v6: Drop xe prefix from static functions (Riana)
    Don't fail on unexpected event (Riana)
    Move sysctrl commands to xe_sysctrl_mailbox_types.h (Riana)
    Add kernel doc (Riana)
---
 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/xe_ras.c           | 93 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h           | 15 +++++
 drivers/gpu/drm/xe/xe_ras_types.h     | 73 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
 5 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1c863b711ae9..22f17bd1082d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -114,6 +114,7 @@ xe-y += xe_bb.o \
 	xe_pxp_submit.o \
 	xe_query.o \
 	xe_range_fence.o \
+	xe_ras.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
 	xe_ring_ops.o \
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..4cb16b419b0c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_device.h"
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
+static inline const char *sev_to_str(u8 severity)
+{
+	if (severity >= XE_RAS_SEV_MAX)
+		severity = XE_RAS_SEV_NOT_SUPPORTED;
+
+	return xe_ras_severities[severity];
+}
+
+static inline const char *comp_to_str(u8 component)
+{
+	if (component >= XE_RAS_COMP_MAX)
+		component = XE_RAS_COMP_NOT_SUPPORTED;
+
+	return xe_ras_components[component];
+}
+
+void xe_ras_counter_threshold_crossed(struct xe_device *xe,
+				      struct xe_sysctrl_event_response *response)
+{
+	struct xe_ras_threshold_crossed *pending = (void *)&response->data;
+	struct xe_ras_error_class *errors = pending->counters;
+	u32 id, ncounters = pending->ncounters;
+
+	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
+	xe_device_assert_mem_access(xe);
+
+	if (!ncounters || ncounters > XE_RAS_NUM_COUNTERS)
+		xe_err(xe, "sysctrl: unexpected counter threshold crossed %u\n", ncounters);
+	else
+		xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", ncounters);
+
+	for (id = 0; id < ncounters && id < XE_RAS_NUM_COUNTERS; id++) {
+		u8 severity, component;
+
+		severity = errors[id].common.severity;
+		component = errors[id].common.component;
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
index 5a5721699ce3..b4d17329af6c 100644
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
@@ -35,7 +36,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 		}
 
 		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
-			xe_warn(xe, "[RAS]: counter threshold crossed\n");
+			xe_ras_counter_threshold_crossed(xe, response);
 		else
 			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
 
-- 
2.43.0

