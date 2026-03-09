Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697D2EA8559
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 05:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3096710E48C;
	Mon,  9 Mar 2026 05:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBAJA+hx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D3810E48D
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 05:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773033814; x=1804569814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sm8tf/3t4R0nM2HU/4Qie04f6LvU5wkFfU5rQXmVJfA=;
 b=aBAJA+hxJT5c/oYu2/eRHxuyA7EIr2H0Ic9O/NmH8+t4B5sbGRaieTuy
 allY7t9emkBPlTUqUEsJE0RCo2fDMDH2AUm0s/L7ApjXCTV0D3vD2tayv
 jT3CR1FCmRvg3BYM62LPE8pTKmV7aZljZY73VQzULkzvkDHwOrdHFtMin
 wEb9tcyzmZ9hC3jQkVnOe0ofZUMKyu8cGtVBkhxO5gAiRMLB1NtV7OE4A
 HYYjq0vOgisNk3aZ+C//8hGcTsr7/3OZWDvn8BtDTjTZxaywQ7LR2QD4O
 CXF/jd3rTD3cYbgbbyAaabkZtoDxKKB51xsz8GFy0EoLSYKqgDq3BOOE8 w==;
X-CSE-ConnectionGUID: 0UukujR9RaOZHklgbn3OTQ==
X-CSE-MsgGUID: 0YoirFnUQ3iNoBH81ZIMfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85138487"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="85138487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 22:23:34 -0700
X-CSE-ConnectionGUID: QUpbBReORcG8QKZoaEFUsw==
X-CSE-MsgGUID: FlZBE+ClSv6m+TaGLWLmew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224582948"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 22:23:31 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH 2/3] drm/xe/xe_ras: Add structures and commands for RAS GPU
 health indicator
Date: Mon,  9 Mar 2026 10:47:04 +0530
Message-Id: <20260309051705.980155-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309051705.980155-1-soham.purkait@intel.com>
References: <20260309051705.980155-1-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

Add the sysctrl commands and response structures for GPU health
indicator supported by RAS.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_ras_types.h             | 65 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 15 +++++
 2 files changed, 80 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..a05cfd971acd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,65 @@
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
+/**
+ * typedef xe_ras_health_status_t - Device health status values (8-bit)
+ *
+ * Three-state health indicator value reported by system controller commands.
+ *
+ * The expected values are:
+ * - 0: ok  - The device is healthy and operating within normal parameters.
+ * - 1: warning  - The device is experiencing minor issues but is still operational.
+ * - 2: critical  - The device is in a critical state and may not be operational.
+ */
+typedef u8 xe_ras_health_status_t;
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
+	xe_ras_health_status_t current_health;
+	/** @reserved: Reserved for alignment */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_health_set_input - Input for XE_SYSCTRL_CMD_SET_HEALTH
+ */
+struct xe_ras_health_set_input {
+	/** @new_health: New health status to set */
+	xe_ras_health_status_t new_health;
+	/** @reserved: Reserved for alignment */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_health_set_response - Response for XE_SYSCTRL_CMD_SET_HEALTH
+ */
+struct xe_ras_health_set_response {
+	/** @operation_status: Status of set operation (RAS_STATUS_*) */
+	u32 operation_status;
+	/** @current_health: Health status after this change */
+	xe_ras_health_status_t current_health;
+	/** @reserved: Reserved for alignment */
+	u8 reserved[3];
+	/** @reserved_2: Reserved for future expansion */
+	u32 reserved_2[2];
+} __packed;
+
+#endif /* _XE_RAS_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 32c35a6da1cb..a4d6dd0aaff5 100644
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
  * @header: Application message header containing command information
-- 
2.43.0

