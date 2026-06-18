Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79BCD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 06:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB1E10F17A;
	Thu, 18 Jun 2026 06:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTGrHEPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74A910F17A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 06:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781763075; x=1813299075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xa5iONclVsPyJxzd3JzJqGego63meTwhDUWRutDpn50=;
 b=nTGrHEPpI8j5qrqX1GnAQ5DiE8F4H8LCCPWqZiLhPkn6aMhpgTdxxkK2
 z3rRY0lSNnoH+Vt9HHeYWs9uYbpnNFaAWTwl1DCeZHcDvWR/T2KKpspfH
 rJXNUC2m/+gu3zPR/wtr+rvwfZSYUEYsSEUFLyKUMODe1SOoQRgFTlR0e
 xExN0X7uT64A50K5vG/ZmotGC4VewNhu4stRiWvu5uI1b48KlPy/ZwzW3
 XtQtXeDfsOD1hny7KC75fqqQqnIqT2P0A8qS3tG7xb+7aM8d3CBxK3aa4
 Whq++aat/5WzLhBkZZokiW+A25utau5ZJ+lwyMfama5oVrErsz34/Ev71 w==;
X-CSE-ConnectionGUID: KHSccrTqStO7MU3WW0uyww==
X-CSE-MsgGUID: mceLjgihTyGHg3ALdEVpUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86502173"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="86502173"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:11:15 -0700
X-CSE-ConnectionGUID: mNMBoznUSD2jt5sFmR49xQ==
X-CSE-MsgGUID: BBoG6NCHRzaCpDl995zxmg==
X-ExtLoop1: 1
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:11:12 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v5 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Date: Thu, 18 Jun 2026 11:40:55 +0530
Message-ID: <20260618061053.3307213-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618061053.3307213-3-soham.purkait@intel.com>
References: <20260618061053.3307213-3-soham.purkait@intel.com>
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

Add a sysfs interface that reports the current GPU health state and
lets admin users and management tools update it but is readable by all
users. Requests are routed through the sysctrl mailbox. The interface
is present only on platforms that support the GPU health indicator.

The interface is a single read/write file at the device level:

  $ cat /sys/.../device/gpu_health
  ok

  $ echo critical > /sys/.../device/gpu_health

  $ cat /sys/.../device/gpu_health
  critical

v1:
 - Add enum for health status. (Andi, Rodrigo)
 - Return error number instead of error message in _show/_store. (Andi)
 - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
 - Return only the current health state for sysfs read. (Andi, Rodrigo)
 - Add documentation for sysfs interface. (Andi, Rodrigo)

v2:
 - Make logs and structures consistent with their counterparts. (Riana)
 - Drop unnecessary variables. (Andi, Riana)
 - Add correct KernelVersion. (Raag)

v3:
 - Add missing blank line before #endif. (Badal)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
 drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   1 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  61 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 7 files changed, 304 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
new file mode 100644
index 000000000000..c7f2cf8bb6ad
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
@@ -0,0 +1,30 @@
+What:		/sys/bus/pci/drivers/xe/.../gpu_health
+Date:		April 2026
+KernelVersion:	7.2
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This file exposes the current GPU health state and allows the GPU
+		health state to be updated.
+
+		This sysfs file is present only on Intel Xe platforms that support
+		the GPU health indicator interface for RAS. Reading the current
+		health state is available to all users, while updating the health
+		state is restricted to administrative users only.
+
+		Read returns a single line containing one of the valid values for
+		the current device health state. Writing one of the valid values
+		updates the current device health state.
+
+		The valid values for the device health state are:
+
+			ok
+				The device is healthy and operating within normal
+				parameters.
+
+			warning
+				The device is experiencing minor issues but remains
+				operational.
+
+			critical
+				The device is in a critical state and may not be
+				operational.
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 4cb16b419b0c..b7efd607aadf 100644
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
@@ -31,6 +34,16 @@ enum xe_ras_component {
 	XE_RAS_COMP_MAX
 };
 
+/* RAS response status codes */
+enum xe_ras_response_status {
+	XE_RAS_STATUS_SUCCESS = 0,
+	XE_RAS_STATUS_INVALID_PARAM,
+	XE_RAS_STATUS_OP_NOT_SUPPORTED,
+	XE_RAS_STATUS_TIMEOUT,
+	XE_RAS_STATUS_HARDWARE_FAILURE,
+	XE_RAS_STATUS_INSUFFICIENT_RESOURCES
+};
+
 static const char *const xe_ras_severities[] = {
 	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
 	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
@@ -50,6 +63,33 @@ static const char *const xe_ras_components[] = {
 };
 static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
 
+static const char * const gpu_health_states[] = {
+	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
+	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
+	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
+};
+static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_STATUS_MAX);
+
+static int ras_status_to_errno(u32 status)
+{
+	switch (status) {
+	case XE_RAS_STATUS_SUCCESS:
+		return 0;
+	case XE_RAS_STATUS_INVALID_PARAM:
+		return -EINVAL;
+	case XE_RAS_STATUS_OP_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case XE_RAS_STATUS_TIMEOUT:
+		return -ETIMEDOUT;
+	case XE_RAS_STATUS_HARDWARE_FAILURE:
+		return -EIO;
+	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
+		return -ENOSPC;
+	default:
+		return -EPROTO;
+	}
+}
+
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -91,3 +131,140 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 			comp_to_str(component), sev_to_str(severity));
 	}
 }
+
+static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_ras_get_health_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_get_health_request request = {0};
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	enum xe_ras_health_status health;
+	size_t rlen = 0;
+	int ret;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
+				  &request, sizeof(request), &response, sizeof(response));
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to send get health command %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
+		xe_err(xe, "sysctrl: invalid health state %u\n",
+		       response.current_health);
+		return -EIO;
+	}
+
+	health = (enum xe_ras_health_status)response.current_health;
+
+	xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);
+
+	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
+}
+
+static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct xe_ras_set_health_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_set_health_request request = {0};
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	enum xe_ras_health_status health;
+	size_t rlen = 0;
+	int ras_status;
+	int state;
+	int ret;
+
+	state = sysfs_match_string(gpu_health_states, buf);
+	if (state < 0) {
+		xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
+		       (int)strcspn(buf, "\n"), buf);
+		return -EINVAL;
+	}
+
+	request.new_health = (u8)state;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
+				  &request, sizeof(request), &response, sizeof(response));
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to send set health command %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+
+	ras_status = ras_status_to_errno(response.status);
+	if (ras_status) {
+		xe_err(xe, "sysctrl: set health command failed with status %d\n",
+		       response.status);
+		return ras_status;
+	}
+
+	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
+		xe_err(xe, "sysctrl: invalid health state %u\n",
+		       response.current_health);
+		return -EIO;
+	}
+
+	health = (enum xe_ras_health_status)response.current_health;
+
+	xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(gpu_health);
+
+static void gpu_health_sysfs_fini(void *arg)
+{
+	struct device *dev = arg;
+
+	device_remove_file(dev, &dev_attr_gpu_health);
+}
+
+static int gpu_health_sysfs_init(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int err;
+
+	err = device_create_file(dev, &dev_attr_gpu_health);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+/**
+ * xe_ras_init - Initialize Xe RAS
+ * @xe: xe device instance
+ *
+ * Initialize the RAS GPU health sysfs interface.
+ */
+void xe_ras_init(struct xe_device *xe)
+{
+	int ret;
+
+	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
+		return;
+
+	ret = gpu_health_sysfs_init(xe);
+	if (ret)
+		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index ea90593b62dc..8acfd0ffe48e 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
 
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
+void xe_ras_init(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 4e63c67f806a..535841b8d037 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,21 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 
+/**
+ * enum xe_ras_health_status - Device health status values
+ *
+ * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
+ * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
+ * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
+ * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
+ */
+enum xe_ras_health_status {
+	XE_RAS_HEALTH_STATUS_OK = 0,
+	XE_RAS_HEALTH_STATUS_WARNING,
+	XE_RAS_HEALTH_STATUS_CRITICAL,
+	XE_RAS_HEALTH_STATUS_MAX
+};
+
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
  */
@@ -70,4 +85,50 @@ struct xe_ras_threshold_crossed {
 	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
 } __packed;
 
+/**
+ * struct xe_ras_get_health_request - Request structure for GFSP GET_HEALTH
+ *
+ * GET_HEALTH takes no input parameters; the reserved payload is kept to
+ * preserve the firmware wire layout and allow future extensions. The
+ * driver must zero all reserved fields.
+ */
+struct xe_ras_get_health_request {
+	/** @reserved: Reserved for future use. */
+	u32 reserved[2];
+} __packed;
+
+/**
+ * struct xe_ras_get_health_response - Response structure for GFSP GET_HEALTH
+ */
+struct xe_ras_get_health_response {
+	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
+	u8 current_health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_set_health_request - Request structure for GFSP SET_HEALTH
+ */
+struct xe_ras_set_health_request {
+	/** @new_health: New GPU health to set, see &enum xe_ras_health_status */
+	u8 new_health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_set_health_response - Response structure for GFSP SET_HEALTH
+ */
+struct xe_ras_set_health_response {
+	/** @status: Status of set health operation, see &enum xe_ras_response_status */
+	u32 status;
+	/** @current_health: Resulting current GPU health, see &enum xe_ras_health_status */
+	u8 current_health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+	/** @reserved1: Reserved for future use */
+	u32 reserved1[2];
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 3caa9f15875f..9507f68bc2eb 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
 	return 0;
 }
 
+/**
+ * xe_sysctrl_create_command() - Create system controller command
+ * @command: Sysctrl command structure
+ * @group_id: Command group ID
+ * @cmd_id: Command ID
+ * @request: Pointer to request buffer (can be NULL)
+ * @request_len: Size of request buffer
+ * @response: Pointer to response buffer
+ * @response_len: Size of response buffer
+ *
+ * Helper function to build sysctrl command to be sent via %xe_sysctrl_send_command()
+ */
+void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
+			       void *request, size_t request_len, void *response,
+			       size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr header = {0};
+
+	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
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
index f67e9234de48..fb434cc165b2 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
 #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
 	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
 
+void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
+			       void *request, size_t request_len, void *response,
+			       size_t response_len);
 void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 			    struct xe_sysctrl_mailbox_command *cmd,
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 84d7c647e743..f82e3fb9b5ef 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -23,9 +23,13 @@ enum xe_sysctrl_group {
  * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
  *
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
+ * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
+	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
 
 /**
-- 
2.43.0

