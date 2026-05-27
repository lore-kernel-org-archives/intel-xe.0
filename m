Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78150CD5BDE
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 05:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F10B10E684;
	Wed, 27 May 2026 05:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNuQfRYH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB1510E684
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 05:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779859756; x=1811395756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2GyxBYPOKVEgY71CIh0R2YJWvE2dPDsfTaqfzRn41mY=;
 b=XNuQfRYH8XO/sxC8uBQvcE/RbiSDw4pQNuJ0Rx6npgRAQckqH0epYaTc
 V/2aIrGVnLeM+Tws+j+dYGD7jba/P7J30diPteXRVp0lILp2e7WZ1EM3p
 TLhUJpWf87wo8MDxyDtZ1zhOGiGEN93gbMJTfuAnBRTSwjK6MhQvLkCA6
 d3OTSqrnW5WCGD87LOTiJ3JZGIA9rW26Q485IR7a3j2W8OcCisQef+6io
 4xtWdfwBhMuidvVolnm0T/+PZ8hsTVM2F0mCsQefcStuV7lyS3+3ci+X7
 QGEsXeH2IAp0Y1Mz8BlkUTeAvciMftwwDoLlF8cReEBBH4jrtKr2rPa92 A==;
X-CSE-ConnectionGUID: 2j5fZqMERyOEYOFl4rHHRg==
X-CSE-MsgGUID: 7jmvW/pgTxKKKl1YrgBIPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84306599"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="84306599"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:29:16 -0700
X-CSE-ConnectionGUID: I1w+Q+5dRs2ASrQW8+7bJQ==
X-CSE-MsgGUID: rOtzRUvDTvGVKkOYPzdrZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="241301274"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:29:13 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v7 2/6] drm/xe/xe_ras: Add support to get error counter in CRI
Date: Wed, 27 May 2026 11:32:44 +0530
Message-ID: <20260527060241.3351323-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260527060241.3351323-8-riana.tauro@intel.com>
References: <20260527060241.3351323-8-riana.tauro@intel.com>
MIME-Version: 1.0
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

v4: rename function
    remove unecessary macro (Raag)
    add documentation for enum

v5: rebase

v6: add sysctrl command helper
    add debug log
    rename error_class to counter (Raag)

v7: use local variable to avoid nesting
    simplify structure member names
    rename sysctrl command helper (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 91 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  3 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 28 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 28 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  3 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
 6 files changed, 155 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 4cb16b419b0c..33c979cd9a10 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -4,11 +4,14 @@
  */
 
 #include "xe_device.h"
+#include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_event_types.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
 
 /* Severity of detected errors  */
 enum xe_ras_severity {
@@ -50,6 +53,36 @@ static const char *const xe_ras_components[] = {
 };
 static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
 
+static u8 drm_to_xe_ras_component(u8 component)
+{
+	switch (component) {
+	case DRM_XE_RAS_ERR_COMP_CORE_COMPUTE:
+		return XE_RAS_COMP_CORE_COMPUTE;
+	case DRM_XE_RAS_ERR_COMP_SOC_INTERNAL:
+		return XE_RAS_COMP_SOC_INTERNAL;
+	case DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY:
+		return XE_RAS_COMP_DEVICE_MEMORY;
+	case DRM_XE_RAS_ERR_COMP_PCIE:
+		return XE_RAS_COMP_PCIE;
+	case DRM_XE_RAS_ERR_COMP_FABRIC:
+		return XE_RAS_COMP_FABRIC;
+	default:
+		return XE_RAS_COMP_NOT_SUPPORTED;
+	}
+}
+
+static u8 drm_to_xe_ras_severity(u8 severity)
+{
+	switch (severity) {
+	case DRM_XE_RAS_ERR_SEV_CORRECTABLE:
+		return XE_RAS_SEV_CORRECTABLE;
+	case DRM_XE_RAS_ERR_SEV_UNCORRECTABLE:
+		return XE_RAS_SEV_UNCORRECTABLE;
+	default:
+		return XE_RAS_SEV_NOT_SUPPORTED;
+	}
+}
+
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -91,3 +124,61 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 			comp_to_str(component), sev_to_str(severity));
 	}
 }
+
+static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
+{
+	struct xe_ras_get_counter_response response = {0};
+	struct xe_ras_get_counter_request request = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_error_common *common;
+	size_t rlen;
+	int ret;
+
+	request.counter = *counter;
+
+	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
+				 &request, sizeof(request), &response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to get counter %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+
+	common = &response.counter.common;
+	*value = response.value;
+
+	xe_dbg(xe, "[RAS]: get counter value %u for %s %s\n", *value,
+	       comp_to_str(common->component), sev_to_str(common->severity));
+
+	return 0;
+}
+
+/**
+ * xe_ras_get_counter() - Get error counter value
+ * @xe: Xe device instance
+ * @severity: Error severity to be queried (&enum drm_xe_ras_error_severity)
+ * @component: Error component to be queried (&enum drm_xe_ras_error_component)
+ * @value: Counter value
+ *
+ * This function retrieves the value of a specific error counter based on
+ * the error severity and component.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
+{
+	struct xe_ras_error_class error_class = {0};
+
+	error_class.common.severity = drm_to_xe_ras_severity(severity);
+	error_class.common.component = drm_to_xe_ras_component(component);
+
+	guard(xe_pm_runtime)(xe);
+	return get_counter(xe, &error_class, value);
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index ea90593b62dc..317b877e375d 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -6,10 +6,13 @@
 #ifndef _XE_RAS_H_
 #define _XE_RAS_H_
 
+#include <uapi/drm/xe_drm.h>
+
 struct xe_device;
 struct xe_sysctrl_event_response;
 
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
+int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 4e63c67f806a..cae633aea550 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -70,4 +70,32 @@ struct xe_ras_threshold_crossed {
 	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
 } __packed;
 
+/**
+ * struct xe_ras_get_counter_request - Request structure for get counter
+ */
+struct xe_ras_get_counter_request {
+	/** @counter: Error counter to be queried */
+	struct xe_ras_error_class counter;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_get_counter_response - Response structure for get counter
+ */
+struct xe_ras_get_counter_response {
+	/** @counter: Error counter that was queried */
+	struct xe_ras_error_class counter;
+	/** @value: Current counter value */
+	u32 value;
+	/** @timestamp: Timestamp when counter was last updated */
+	u64 timestamp;
+	/** @threshold: Threshold value for the counter */
+	u32 threshold;
+	/** @reserved: Reserved */
+	u32 reserved;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1[56];
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 3caa9f15875f..bdb4611b5685 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
 	return 0;
 }
 
+/**
+ * xe_sysctrl_build_command() - Build System controller command structure
+ * @command: Sysctrl command structure
+ * @group: Command group ID
+ * @cmd_id: Command ID
+ * @request: Pointer to request buffer (can be NULL)
+ * @request_len: Size of request buffer
+ * @response: Pointer to response buffer
+ * @response_len: Size of response buffer
+ *
+ * Helper function to build sysctrl command to be sent via %xe_sysctrl_send_command()
+ */
+void xe_sysctrl_build_command(struct xe_sysctrl_mailbox_command *command, u8 group, u8 cmd_id,
+			      void *request, size_t request_len, void *response,
+			      size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr header = {0};
+
+	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group) |
+		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
+
+	command->header = header;
+	command->data_in = request;
+	command->data_in_len = request_len;
+	command->data_out = response;
+	command->data_out_len = response_len;
+}
+
 /**
  * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
  * @sc: System controller structure
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index f67e9234de48..0ba09d6d4da7 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
 #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
 	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
 
+void xe_sysctrl_build_command(struct xe_sysctrl_mailbox_command *command, u8 group, u8 cmd_id,
+			      void *request, size_t request_len, void *response,
+			      size_t response_len);
 void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 			    struct xe_sysctrl_mailbox_command *cmd,
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 84d7c647e743..b315847cbf64 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -22,9 +22,11 @@ enum xe_sysctrl_group {
 /**
  * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
  *
+ * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  */
 enum xe_sysctrl_gfsp_cmd {
+	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 };
 
-- 
2.47.1

