Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750ADC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 13:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3F410E5EA;
	Wed,  8 Jul 2026 13:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kpgk+cLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A9610E5EA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783518706; x=1815054706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H2+752QzDz2aZPp/u9r63OtNR54fa9DBRQOvOCOEQPg=;
 b=Kpgk+cLf9Tu0P9pbj3G1tLFGuizWaRW/weyAMKDFGBa4jXF0br6hjWul
 smfESKRT2A+3UhovfDoSsi1FuhdSeu6dgzlPavss/fQDQUqgCdVC1kuTe
 SwhJslNjkt2hurmkI02Z5jEIJ4AHV6zYFeVfeOrCz2Uony/fGXeYwMWo5
 EHrvDOvxIc+A3ljtf/2lCZlhCbwk344XmdAWAre8ghc3z79R/VkCXJKwN
 pU3usjWu3/9VJ9U6O3NbdFt/FPtFgiZ3TqkDmC0OgFdss+SSFocMVix9N
 Izm/h/cMSxCO333QcJW4AeTAF3tmJrdGGDKrlby6Ns8GN+hDsamrzyQLV g==;
X-CSE-ConnectionGUID: 3QBg7f9hRJujPhowwLbPhA==
X-CSE-MsgGUID: gzXN8AnaSEyWbHy0/Zia7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109724384"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="109724384"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 06:51:37 -0700
X-CSE-ConnectionGUID: CUkGtXG8S1CzhNk8lOJ/sg==
X-CSE-MsgGUID: fimJ6ZemSpavoCUohH8qVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="251634801"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 06:51:34 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v8 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Date: Wed,  8 Jul 2026 19:21:12 +0530
Message-ID: <20260708135110.4117174-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708135110.4117174-3-soham.purkait@intel.com>
References: <20260708135110.4117174-3-soham.purkait@intel.com>
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

v6:
 - Add updated ABI Date. (Raag)
 - Rewrite DOC block with canonical path and cleaner wording. (Riana)
 - Refactor enum name. (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
 Documentation/gpu/xe/xe_device.rst            |   7 +
 drivers/gpu/drm/xe/xe_ras.c                   | 147 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 5 files changed, 245 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
new file mode 100644
index 000000000000..9c4a713b8cdd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
@@ -0,0 +1,30 @@
+What:		/sys/bus/pci/drivers/xe/.../gpu_health
+Date:		July 2026
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
index 39a937b97cd3..d3a022362ade 100644
--- a/Documentation/gpu/xe/xe_device.rst
+++ b/Documentation/gpu/xe/xe_device.rst
@@ -8,3 +8,10 @@ Xe Device Wedging
 
 .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
    :doc: Xe Device Wedging
+
+====================
+GPU Health Indicator
+====================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
+   :doc: GPU Health Indicator
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 74d5016d9ffe..5ae5cd5b3383 100644
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
@@ -332,6 +339,140 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
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
+ * On Intel Xe platforms that support the gpu health indicator interface,
+ * the driver exposes this sysfs attribute for in-band access to the gpu
+ * health state::
+ *
+ *     /sys/bus/pci/devices/<device>/gpu_health
+ *
+ * Reading the attribute is available to all users and returns a single
+ * line containing the current gpu health state, whereas writing is
+ * restricted to administrative users and updates the state to one of the
+ * valid values.
+ *
+ * Management tools and administrators use this interface to query the
+ * current gpu health state (e.g. for telemetry/monitoring) and to
+ * update it - for example, to mark the gpu as ``warning`` or ``critical``
+ * after diagnostics, or reset it back to ``ok`` once remediated.
+ *
+ * The valid values for the gpu health state are:
+ *
+ * - ``ok``
+ *     The gpu is healthy and operating within normal parameters.
+ *
+ * - ``warning``
+ *     The gpu is experiencing minor issues but remains operational.
+ *
+ * - ``critical``
+ *     The gpu is in a critical state and may not be operational.
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
@@ -340,6 +481,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
  */
 void xe_ras_init(struct xe_device *xe)
 {
+	int ret;
+
 	if (!xe->info.has_drm_ras)
 		return;
 
@@ -350,4 +493,8 @@ void xe_ras_init(struct xe_device *xe)
 
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
+
+	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
+	if (ret)
+		xe_err(xe, "Failed to initialize GPU health sysfs, err=%d\n", ret);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 6688e11f57a8..bbfaff8326cb 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,21 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 
+/**
+ * enum xe_ras_health - gpu health values
+ *
+ * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
+ * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still operational.
+ * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not be operational.
+ * @XE_RAS_HEALTH_MAX: Sentinel value for validation
+ */
+enum xe_ras_health {
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
+	/** @health: gpu health, see &enum xe_ras_health */
+	u8 health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_set_health_request - Request structure for setting gpu health
+ */
+struct xe_ras_set_health_request {
+	/** @health: gpu health, see &enum xe_ras_health */
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
+	/** @health: Resulting gpu health, see &enum xe_ras_health */
+	u8 health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+	/** @reserved1: Reserved for future use */
+	u32 reserved1[2];
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 6e3753554510..693c0ee592be 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -25,11 +25,15 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
+ * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
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

