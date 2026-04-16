Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D86F8A154
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 09:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C76210E716;
	Thu, 16 Apr 2026 09:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irbkS5Y0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B4D10E023
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776332969; x=1807868969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gniVdWeA9Wy7RL1rcliQIdPOainN16c3hDdHAWJHtWI=;
 b=irbkS5Y0qRj/W/hcUVtV3pwWbVRmB3Z/lEHTK3jI5olPNmeSfwpj67KR
 fr6K4/g7Qghg6wGI4lALbfttfSlZk8VKVC38uk64wWZS7NzgQomAaVrkE
 2VVZfq5yKHfHAxf2bZ4FtfQhiWTlUTGMT+Ti2nOFDN3hayylEH1NNuFI2
 x/jPOivJ3o4Cbn6SUsGD4AJ/GsS6xAKsTsJ8SlXb6XzCEMARxreP+szSg
 /qJOtnucqFNL+IbxUjm1ylnrOuwkiTSvT7RSrOEP+Yh4vcxo1Og3ESlVi
 MbrF5zWGvYSxBfCKCfImHVWs9wcRE2Cgk+T1G67h4fbzdmopijbzlo6f8 Q==;
X-CSE-ConnectionGUID: /xeb2ihVQn++GMOQodjEHg==
X-CSE-MsgGUID: C+9ofF6vRWWBWvHCg37/Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76360093"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="76360093"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:49:28 -0700
X-CSE-ConnectionGUID: YApf1+S9TsOQ5+aTR2zC5w==
X-CSE-MsgGUID: UV0dwfR1Tymy410bN7kpJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235068591"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:43:35 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v1 1/2] drm/xe/xe_ras: Add structures and commands for RAS GPU
 health indicator
Date: Thu, 16 Apr 2026 15:06:09 +0530
Message-Id: <20260416093610.4085667-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260416093610.4085667-1-soham.purkait@intel.com>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
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

