Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE662C43602
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 06:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977010E572;
	Wed,  8 Jul 2026 06:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8vftmjL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0920A10E572
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 06:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783491166; x=1815027166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3CWhz/PWxsZnpU6RLxYLGV1rNhdvfwKTsxY+2O0ntFs=;
 b=L8vftmjLwE+flVanY3u7cpvW0gFXyfbMPvKtOxYTCiHoq6v0+iILuVVM
 3umOyoqmMZQiQ4QWhHTFikDyVbXbJJPUFc94Am8zDxv+Kp5PJMQQwF+U4
 mMVd60arAckjOUMTOWcJ/RzR8jXris9VcWWjz43fdzj4loUFDqsa61Upt
 4sVdQU3i7RtZUurgrP2zPPmABGKQgZvlHEBSDUBsexJhJcnewHy++0x24
 l+pCDGK/Vf79bdXM3zA7f3MlXbadMvnk0RBJ8j88N+783CS53Wj9o1wp4
 0TzDsMTet2Iptvd2nRJIm3z5vyqyb4BaEpS/nDkZAe9szTCTJ9F3sauRa w==;
X-CSE-ConnectionGUID: mqnfxB7aSbCQJa2VrOUaHw==
X-CSE-MsgGUID: 58oR3MjSQ/iohkd7ybD6fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83257831"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83257831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 23:12:46 -0700
X-CSE-ConnectionGUID: rIQBhRvkTMCEdmSC6xXybQ==
X-CSE-MsgGUID: l6hVvSM1RE+xZr24+seCcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="258504078"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 23:12:42 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v7 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Date: Wed,  8 Jul 2026 11:42:23 +0530
Message-ID: <20260708061221.4006706-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708061221.4006706-3-soham.purkait@intel.com>
References: <20260708061221.4006706-3-soham.purkait@intel.com>
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

v4:
 - Add consistent "gpu" nomenclature to the gpu health indicator
   DOC blocks. (Riana)
 - Add Kdoc for gpu health indicator. (Anshuman)

v5:
 - Rename struct fields to response.health, request.health. (Riana, Raag)
 - Use devm_device_add_group instead of custom sysfs init/fini. (Raag)
 - Rename health enum to shorter XE_RAS_HEALTH_*, drop redundant
   invalid-input log, and minor log/format cleanups. (Raag)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
 Documentation/gpu/xe/xe_device.rst            |   9 ++
 drivers/gpu/drm/xe/xe_ras.c                   | 139 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 5 files changed, 239 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
new file mode 100644
index 000000000000..9612b97b0f88
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
@@ -0,0 +1,30 @@
+What:		/sys/bus/pci/drivers/xe/.../gpu_health
+Date:		April 2026
+KernelVersion:	7.2
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This file exposes the current gpu health state and allows the gpu
+		health state to be updated.
+
+		This sysfs file is present only on Intel Xe platforms that support
+		the gpu health indicator interface for RAS. Reading the current
+		health state is available to all users, while updating the health
+		state is restricted to administrative users only.
+
+		Read returns a single line containing one of the valid values for
+		the current gpu health state. Writing one of the valid values
+		updates the current gpu health state.
+
+		The valid values for the gpu health state are:
+
+			ok
+				The gpu is healthy and operating within normal
+				parameters.
+
+			warning
+				The gpu is experiencing minor issues but remains
+				operational.
+
+			critical
+				The gpu is in a critical state and may not be
+				operational.
diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
index 39a937b97cd3..6fdba960c2d9 100644
--- a/Documentation/gpu/xe/xe_device.rst
+++ b/Documentation/gpu/xe/xe_device.rst
@@ -8,3 +8,12 @@ Xe Device Wedging
 
 .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
    :doc: Xe Device Wedging
+
+.. _xe-gpu-health-indicator:
+
+====================
+GPU Health Indicator
+====================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
+   :doc: GPU Health Indicator
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 74d5016d9ffe..d1214a213d6e 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
 };
 static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
 
+static const char * const gpu_health_states[] = {
+	[XE_RAS_HEALTH_OK]		= "ok",
+	[XE_RAS_HEALTH_WARNING]		= "warning",
+	[XE_RAS_HEALTH_CRITICAL]	= "critical",
+};
+static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
+
 static u8 drm_to_xe_ras_severity(u8 severity)
 {
 	switch (severity) {
@@ -332,6 +339,132 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 	return 0;
 }
 
+static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_ras_get_health_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_get_health_request request = {0};
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	const char *health;
+	size_t rlen;
+	int ret;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
+				  &request, sizeof(request), &response, sizeof(response));
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to get health %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+	if (response.health >= XE_RAS_HEALTH_MAX) {
+		xe_err(xe, "sysctrl: invalid health state %u\n",
+		       response.health);
+		return -EIO;
+	}
+
+	health = gpu_health_states[response.health];
+
+	xe_dbg(xe, "[RAS]: get health: %s\n", health);
+
+	return sysfs_emit(buf, "%s\n", health);
+}
+
+static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct xe_ras_set_health_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_set_health_request request = {0};
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	const char *health;
+	size_t rlen;
+	int state;
+	int ret;
+
+	state = sysfs_match_string(gpu_health_states, buf);
+	if (state < 0)
+		return -EINVAL;
+
+	request.health = state;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
+				  &request, sizeof(request), &response, sizeof(response));
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to set health %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+
+	ret = ras_status_to_errno(response.status);
+	if (ret) {
+		xe_err(xe, "sysctrl: set health command failed with status %#x\n",
+		       response.status);
+		return ret;
+	}
+
+	if (response.health >= XE_RAS_HEALTH_MAX) {
+		xe_err(xe, "sysctrl: invalid health state %u\n",
+		       response.health);
+		return -EIO;
+	}
+
+	health = gpu_health_states[response.health];
+
+	xe_dbg(xe, "[RAS]: set health: %s\n", health);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(gpu_health);
+
+static struct attribute *gpu_health_attrs[] = {
+	&dev_attr_gpu_health.attr,
+	NULL,
+};
+
+/**
+ * DOC: GPU Health Indicator
+ *
+ * On Intel Xe platforms that support the GPU health indicator interface,
+ * the driver exposes a sysfs attribute at the device level as:
+ *
+ *	``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``
+ *
+ * Reading the attribute returns a single line containing the current GPU
+ * health state. Writing one of the valid values updates the same. Reads
+ * are available to all users; writes are restricted to administrative
+ * users only (attribute permissions ``0644``).
+ *
+ * The valid values for the GPU health state are:
+ *
+ * - ``ok``:
+ *	The GPU is healthy and operating within normal parameters.
+ * - ``warning``:
+ *	The GPU is experiencing minor issues but remains operational.
+ * - ``critical``:
+ *	The GPU is in a critical state and may not be operational.
+ *
+ * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the ABI
+ * specification.
+ */
+static const struct attribute_group gpu_health_group = {
+	.attrs = gpu_health_attrs,
+};
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
@@ -340,6 +473,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
  */
 void xe_ras_init(struct xe_device *xe)
 {
+	int ret;
+
 	if (!xe->info.has_drm_ras)
 		return;
 
@@ -350,4 +485,8 @@ void xe_ras_init(struct xe_device *xe)
 
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
+
+	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
+	if (ret)
+		xe_err(xe, "Failed to initialize GPU health sysfs, err=%d\n", ret);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 6688e11f57a8..4c4fbc42c956 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,21 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 
+/**
+ * enum xe_ras_health_status - gpu health status values
+ *
+ * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
+ * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still operational.
+ * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not be operational.
+ * @XE_RAS_HEALTH_MAX: Sentinel value for validation
+ */
+enum xe_ras_health_status {
+	XE_RAS_HEALTH_OK = 0,
+	XE_RAS_HEALTH_WARNING,
+	XE_RAS_HEALTH_CRITICAL,
+	XE_RAS_HEALTH_MAX
+};
+
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
  */
@@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[3];
 } __packed;
+
+/**
+ * struct xe_ras_get_health_request - Request structure for obtaining gpu health
+ */
+struct xe_ras_get_health_request {
+	/** @reserved: Reserved for future use. */
+	u32 reserved[2];
+} __packed;
+
+/**
+ * struct xe_ras_get_health_response - Response structure for obtaining gpu health
+ */
+struct xe_ras_get_health_response {
+	/** @health: Current gpu health, see &enum xe_ras_health_status */
+	u8 health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_set_health_request - Request structure for setting gpu health
+ */
+struct xe_ras_set_health_request {
+	/** @health: New gpu health to set, see &enum xe_ras_health_status */
+	u8 health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_set_health_response - Response structure for setting gpu health
+ */
+struct xe_ras_set_health_response {
+	/** @status: Status of set health operation, see &enum xe_ras_response_status */
+	u32 status;
+	/** @health: Resulting current gpu health, see &enum xe_ras_health_status */
+	u8 health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+	/** @reserved1: Reserved for future use */
+	u32 reserved1[2];
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 6e3753554510..d4da6e9ef774 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -25,11 +25,15 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
+ * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
+	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
 
 /**
-- 
2.43.0

