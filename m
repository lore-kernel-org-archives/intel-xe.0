Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8512C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 16:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E5510E9F4;
	Mon,  6 Jul 2026 16:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yf/ugARu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03710E9F4
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783356795; x=1814892795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/61DoEnJI7cNqxjeHATVfENqwmW2LNnjLLOSUia/4Q=;
 b=Yf/ugARuSzeYi6Fo2DnpKnnmzRWepO9ajHtAz1nT0JltCX0iTaIUwYEX
 KHrvQkK2FHLc1wvn2BHNPcY7rgb/UWz8Zs0qMWnA6PAfNVppCVCCl1Ij2
 byt7TMkD0mEJJm/etunClZSqsEoYMYBF9m2vfds/GgoeB9wM4tvf3+MCs
 lS8xspywEo5PL901Ae/P40qIsWYOz95CHKXs0mMNqiEGzbpE04A75YVeU
 hMsillJNjN9KRfHM56+LLJBNV03pm64c8SNFomHtiSkRGzFE8iPeIWeXg
 +q3rjlXRutUdJLHZ8CBzdrtjQWA9wB3yr2hClNUD1/x55fFMGWfUPF/ew Q==;
X-CSE-ConnectionGUID: 39LuWW97QNubIqJ/eopmyg==
X-CSE-MsgGUID: vTzNZMqLSG6UxH81oWKmdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="84022012"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="84022012"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 09:53:15 -0700
X-CSE-ConnectionGUID: A+FE9RfYS8SOhZ1dHfE4OQ==
X-CSE-MsgGUID: 0AvmZn4sS16WrU9Wey9PUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="247372631"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 09:53:11 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v6 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Date: Mon,  6 Jul 2026 22:22:09 +0530
Message-ID: <20260706165207.3773469-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706165207.3773469-3-soham.purkait@intel.com>
References: <20260706165207.3773469-3-soham.purkait@intel.com>
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

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
 Documentation/gpu/xe/xe_device.rst            |   9 +
 drivers/gpu/drm/xe/xe_ras.c                   | 157 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 5 files changed, 257 insertions(+)
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
index 74d5016d9ffe..a97c4bf00ff2 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
 };
 static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
 
+static const char * const gpu_health_states[] = {
+	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
+	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
+	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
+};
+static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_STATUS_MAX);
+
 static u8 drm_to_xe_ras_severity(u8 severity)
 {
 	switch (severity) {
@@ -332,6 +339,150 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 	return 0;
 }
 
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
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
@@ -340,6 +491,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
  */
 void xe_ras_init(struct xe_device *xe)
 {
+	int ret;
+
 	if (!xe->info.has_drm_ras)
 		return;
 
@@ -350,4 +503,8 @@ void xe_ras_init(struct xe_device *xe)
 
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
+
+	ret = gpu_health_sysfs_init(xe);
+	if (ret)
+		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 6688e11f57a8..dac0e6d2270c 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,21 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 
+/**
+ * enum xe_ras_health_status - gpu health status values
+ *
+ * @XE_RAS_HEALTH_STATUS_OK: gpu is healthy and operating normally.
+ * @XE_RAS_HEALTH_STATUS_WARNING: gpu has minor issues but is still operational.
+ * @XE_RAS_HEALTH_STATUS_CRITICAL: gpu is in a critical state and may not be operational.
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
+	/** @current_health: Current gpu health, see &enum xe_ras_health_status */
+	u8 current_health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_set_health_request - Request structure for setting gpu health
+ */
+struct xe_ras_set_health_request {
+	/** @new_health: New gpu health to set, see &enum xe_ras_health_status */
+	u8 new_health;
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
+	/** @current_health: Resulting current gpu health, see &enum xe_ras_health_status */
+	u8 current_health;
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

