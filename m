Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FB6FDEE38
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 17:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8300610E372;
	Thu, 23 Apr 2026 17:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8L2vRIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6DE10E372
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776966427; x=1808502427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ygZ+AG/7+JQi0d6j5p+lCFEutoK2icn85VfBFc9vmRg=;
 b=P8L2vRIMQ5uce/+365ltTsTunPUmC2oaC3igMFRYQD4OOkY26m7iC1jN
 fzN6+o3DNuKNZNpUTuA1La+TUoTk7SRsTn7kw3DoQyfVuBThcF7oGxEM5
 d50Wybv/YiYvZDCmzyJFtKBmWqLNgOXI7sM5jU5/7QXl+qPZGO4Syfk9z
 z/cH/+uu6L9WjrYt/geyeB9JFO/IhyAbBb6QM7MiV0G5inAO3ix8ZCsam
 r+eCIAytbDiKSPJPlY5KU43+Xi9+QxF522m6GEUdSKZeSyx8shw0DbkNu
 EI2haCoZFQF+fzvIYMX1vPprjQNYgjVHAa+86A/7mJ4BzdINGBNdzJxnM w==;
X-CSE-ConnectionGUID: D64MsBfiSZiSOetWGVMQiA==
X-CSE-MsgGUID: InJDXWBXTCOa4P5I1Ao3dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89407070"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="89407070"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:47:07 -0700
X-CSE-ConnectionGUID: LA8HA64YRg6VZgbYt77Grw==
X-CSE-MsgGUID: UCimiXH0Rt+Ejso++X/C+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="230058600"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:47:03 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v2 1/2] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
Date: Thu, 23 Apr 2026 23:09:24 +0530
Message-Id: <20260423173925.699486-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423173925.699486-1-soham.purkait@intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
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

Add System Controller GPU health status values, RAS response codes
and mailbox payload types for querying and updating GPU health.

GPU health states are encoded as numeric values defined by
enum xe_ras_health_status for use in System Controller commands.
The GET_HEALTH command fetches the current health state, while
the SET_HEALTH command updates it through the System Controller
mailbox.

struct xe_ras_health_get_input and struct xe_ras_health_get_response
describe the GET_HEALTH request and response payloads, respectively,
while struct xe_ras_health_set_input and
struct xe_ras_health_set_response describe the SET_HEALTH request
and response payloads, including the operation status and current
health state in the response.

v2:
 - Add enum for health status instead of xe_ras_health_status_t.
                                                         (Andi), (Rodrigo)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_ras_types.h             | 83 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 15 ++++
 2 files changed, 98 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..5f884d6e24de
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,83 @@
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
+/* RAS response status codes */
+enum xe_ras_response_status {
+	XE_RAS_STATUS_SUCCESS = 0,
+	XE_RAS_STATUS_INVALID_PARAM,
+	XE_RAS_STATUS_OP_NOT_SUPPORTED,
+	XE_RAS_STATUS_TIMEOUT,
+	XE_RAS_STATUS_HARDWARE_FAILURE,
+	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
+	XE_RAS_STATUS_UNKNOWN_ERROR,
+};
+
+/**
+ * enum xe_ras_health_status - Device health status values
+ *
+ * Health indicator status denoted by numeric values to be used in system
+ * controller mailbox commands.
+ *
+ * @XE_RAS_HEALTH_STATUS_OK: The device is healthy and operating within normal
+ * parameters.
+ * @XE_RAS_HEALTH_STATUS_WARNING: The device is experiencing minor issues but is
+ * still operational.
+ * @XE_RAS_HEALTH_STATUS_CRITICAL: The device is in a critical state and may not
+ * be operational.
+ */
+enum xe_ras_health_status {
+	XE_RAS_HEALTH_STATUS_OK = 0,
+	XE_RAS_HEALTH_STATUS_WARNING,
+	XE_RAS_HEALTH_STATUS_CRITICAL,
+};
+
+/**
+ * struct xe_ras_health_get_input - Input for XE_SYSCTRL_CMD_GET_HEALTH
+ */
+struct xe_ras_health_get_input {
+	/** @reserved: Reserved for future use, must be 0 */
+	u32 reserved[2];
+} __packed;
+
+/**
+ * struct xe_ras_health_get_response - Response for XE_SYSCTRL_CMD_GET_HEALTH
+ */
+struct xe_ras_health_get_response {
+	/** @current_health: Current health status (OK/WARNING/CRITICAL) */
+	u8 current_health;
+	/** @reserved: Reserved for alignment */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_health_set_input - Input for XE_SYSCTRL_CMD_SET_HEALTH
+ */
+struct xe_ras_health_set_input {
+	/** @new_health: New health status to set */
+	u8 new_health;
+	/** @reserved: Reserved for alignment */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_health_set_response - Response for XE_SYSCTRL_CMD_SET_HEALTH
+ */
+struct xe_ras_health_set_response {
+	/** @operation_status: Status of set operation (RAS_STATUS) */
+	u32 operation_status;
+	/** @current_health: Health status after this change */
+	u8 current_health;
+	/** @reserved: Reserved for alignment */
+	u8 reserved[3];
+	/** @reserved_2: Reserved for future expansion */
+	u32 reserved_2[2];
+} __packed;
+
+#endif /* _XE_RAS_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 89456aec6097..fc73e02c3202 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -10,6 +10,21 @@
 
 #include "abi/xe_sysctrl_abi.h"
 
+/**
+ * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group
+ *
+ * @XE_SYSCTRL_CMD_GET_HEALTH: Get current health status
+ * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
+ */
+enum xe_sysctrl_mailbox_command_id {
+	XE_SYSCTRL_CMD_GET_HEALTH = 0x0B,
+	XE_SYSCTRL_CMD_SET_HEALTH = 0x0C
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
2.34.1

