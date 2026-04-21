Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E84F8FA80
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 14:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B512E10ECD0;
	Tue, 21 Apr 2026 14:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ys8ltOtA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C1210E8C3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776781094; x=1808317094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TVKmCnyohntTzms86Oev2D/Eeryq2PZl2E8QkKiTKTU=;
 b=Ys8ltOtABgFgK8+M7vXfqCjfxYxmUd/790ezz7ZoMiWYd57hm40iZQMb
 kRKOYsHn8ExeX7xGh1hKLTyepONqmN0jO5Ca3K0RiTqqrJyG3vNuI31f5
 CtCrMYUzzKL0VjIGEZZgXbAvGHX6jzpHJygnT+qt0/OLNHKX8KoWrHJY/
 g0GD6S5auB1xSFiuX7q6u9cTDXPkQVo7vnaEIDa8FJeFDK9DyLmryszBw
 SbxQvMIiNJUDskF6ra8GW7QNJNvBOeQM1xcc7fZkxdPYUkbWNHNjWfP++
 iR8eapJBSQHeZpG62R0M0Ih6qMmE7vwahkgax99qQMK3PM5++YDYCdLJk Q==;
X-CSE-ConnectionGUID: p087AYoOT0adeFw8OaLRkw==
X-CSE-MsgGUID: uK+gcPudTnmUgGvr6wVRAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95272272"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="95272272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:18:14 -0700
X-CSE-ConnectionGUID: gURRAZmXQXCUA+9u6phRRQ==
X-CSE-MsgGUID: kuMmhdW0RLuou7doZpJbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="233829065"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:18:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 2/5] drm/xe/xe_ras: Add support to get error counter in CRI
Date: Tue, 21 Apr 2026 20:20:58 +0530
Message-ID: <20260421145056.253300-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260421145056.253300-7-riana.tauro@intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
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

Add request/response structures and helper functions to query system
controller to get error counter value.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add structures for clear counter
    move commands to sysctrl file
    split functions
    fix commit message (Raag)

v3: fix log message
    squash patches
    change error code for sysctrl error (Raag)
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 122 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  16 +++
 drivers/gpu/drm/xe/xe_ras_types.h             |  92 +++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  13 ++
 5 files changed, 244 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 95666f950a6f..28a09d06a44c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -112,6 +112,7 @@ xe-y += xe_bb.o \
 	xe_pxp_debugfs.o \
 	xe_pxp_submit.o \
 	xe_query.o \
+	xe_ras.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..c79c4c873fb7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_device_types.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_ras.h"
+#include "xe_ras_types.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
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
+/* Mapping from drm_xe_ras_error_component to xe_ras_component */
+static const int drm_to_xe_ras_component[] = {
+	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
+	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL]	= XE_RAS_COMP_SOC_INTERNAL,
+	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY]	= XE_RAS_COMP_DEVICE_MEMORY,
+	[DRM_XE_RAS_ERR_COMP_PCIE]		= XE_RAS_COMP_PCIE,
+	[DRM_XE_RAS_ERR_COMP_FABRIC]		= XE_RAS_COMP_FABRIC
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);
+
+/* Mapping from drm_xe_ras_error_severity to xe_ras_severity */
+static const int drm_to_xe_ras_severity[] = {
+	[DRM_XE_RAS_ERR_SEV_CORRECTABLE]	= XE_RAS_SEV_CORRECTABLE,
+	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE]	= XE_RAS_SEV_UNCORRECTABLE
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
+
+static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
+				    u32 cmd_mask, void *request, size_t request_len,
+				    void *response, size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr hdr = {0};
+
+	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
+
+	command->header = hdr;
+	command->data_in = request;
+	command->data_in_len = request_len;
+	command->data_out = response;
+	command->data_out_len = response_len;
+}
+
+static int get_error_counter(struct xe_device *xe, struct xe_ras_error_class *error_class,
+			     u32 *value)
+{
+	struct xe_ras_get_counter_response response = {0};
+	struct xe_ras_get_counter_request request = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	enum xe_sysctrl_gfsp_cmd cmd = XE_SYSCTRL_CMD_GET_COUNTER;
+	size_t rlen;
+	int ret;
+
+	request.error_class = *error_class;
+
+	prepare_sysctrl_command(&command, cmd, &request, sizeof(request),
+				&response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: cmd %d error ret %d\n", cmd, ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: cmd %d response size mismatch. Expected %zu, got %zu\n",
+		       cmd, sizeof(response), rlen);
+		return -EIO;
+	}
+
+	*value = response.counter_value;
+
+	return 0;
+}
+
+/**
+ * xe_ras_get_error_counter() - Get error counter value
+ * @xe: xe device instance
+ * @severity: Error severity level to be queried
+ * @error_id: Error component to be queried
+ * @value: Counter value
+ *
+ * This function retrieves the value of a specific RAS error counter based on
+ * the provided severity and component.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_get_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
+			     u32 error_id, u32 *value)
+{
+	struct xe_ras_error_class error_class = {0};
+
+	error_class.common.severity = drm_to_xe_ras_severity[severity];
+	error_class.common.component = drm_to_xe_ras_component[error_id];
+
+	guard(xe_pm_runtime)(xe);
+	return get_error_counter(xe, &error_class, value);
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
new file mode 100644
index 000000000000..1de59b5c4bfe
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_H_
+#define _XE_RAS_H_
+
+#include <uapi/drm/xe_drm.h>
+
+struct xe_device;
+
+int xe_ras_get_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
+			     u32 error_id, u32 *value);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..4a36bc2f5e2b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,92 @@
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
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
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
+	/** @common: Common error severity and component */
+	struct xe_ras_error_common common;
+	/** @product: Product-specific unit and cause */
+	struct xe_ras_error_product product;
+} __packed;
+
+/**
+ * struct xe_ras_get_counter_request - Request to get error counter value
+ */
+struct xe_ras_get_counter_request {
+	/** @error_class: Error class counter to be queried */
+	struct xe_ras_error_class error_class;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_get_counter_response - Response for get error counter command
+ */
+struct xe_ras_get_counter_response {
+	/** @error_class: Error class counter that was queried */
+	struct xe_ras_error_class error_class;
+	/** @counter_value: Current counter value */
+	u32 counter_value;
+	/** @timestamp: Timestamp when counter was last updated */
+	u64 timestamp;
+	/** @threshold_value: Threshold value for the counter */
+	u32 threshold_value;
+	/** @counter_status: Status of the counter */
+	u32 counter_status:8;
+	/** @reserved: Reserved for future use */
+	u32 reserved:24;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1[56];
+} __packed;
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 89456aec6097..3376e0fa1b02 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -10,6 +10,19 @@
 
 #include "abi/xe_sysctrl_abi.h"
 
+/**
+ * enum xe_sysctrl_gfsp_cmd  - Sysctrl Command ID's for GFSP group
+ *
+ * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
+ */
+enum xe_sysctrl_gfsp_cmd  {
+	XE_SYSCTRL_CMD_GET_COUNTER = 0x03
+};
+
+enum xe_sysctrl_group {
+	XE_SYSCTRL_GROUP_GFSP = 1
+};
+
 /**
  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
  */
-- 
2.47.1

