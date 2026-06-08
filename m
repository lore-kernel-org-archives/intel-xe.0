Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806DCCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 05:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C3810ED04;
	Mon,  8 Jun 2026 05:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5iN6UA/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94810ED04
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 05:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780896391; x=1812432391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IvuwsRmg30h2oIKMV6dhWMNfR9L9/1HXPTD1kRkh4lQ=;
 b=g5iN6UA/KWmiLWRpzDb99Q/K7r0z41IwzQzzeYroFCh4oBIuIWF6lW0b
 WcP4sJDTF5fUXun9zxyYemc+Aow4AbYz8xnff97dWLDPI/xXPPymOardZ
 +UTBFwzugF+BP+adcEaGx/4n7/Kb0zHEI/sfLE8PDrBu6XFX9mG4Q/C2I
 qoyxP/pE4o27HLESqRGNhgJoaaKsvDynuU9LCsQBIvBMcXWfe8kO4CfE0
 Vwmr9zNVscX1QL8BSxD+sij5kXQ2FA5E3bzJZP93+dZM9Uvmn4Zn8SSI5
 ZiyQMjlcagykA478k1EDCYPPoUUyJhcO4KtDOj0DzdATZaBzilbmSLJFu g==;
X-CSE-ConnectionGUID: s83XDSQiRxerqeF6J6hYNw==
X-CSE-MsgGUID: YzwJBgWcRC+nOW2JE3HNjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="84198439"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="84198439"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:26:31 -0700
X-CSE-ConnectionGUID: 9Wp6vgFxSMGi4J7WYp7uZw==
X-CSE-MsgGUID: kWLpNIUOSweRC8EJMMKVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="245551457"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:26:27 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v3 3/3] drm/xe/xe_ras: Add RAS support for GPU health indicator
Date: Mon,  8 Jun 2026 10:56:00 +0530
Message-ID: <20260608052556.1744123-8-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608052556.1744123-5-soham.purkait@intel.com>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
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

GPU health indicator exposes a single sysfs interface, gpu_health,
at the device level, allowing administrators and management tools to
query and update the GPU health status. It is exposed as read-only for
non admin users while write access is only provided to the admin users.

The sysfs file (gpu_health) is placed at the device level and behaves as
follows:

$ cat /sys/.../device/gpu_health
ok

$ echo critical > /sys/.../device/gpu_health

$ cat /sys/.../device/gpu_health
critical

V1:
 - Return error number instead of error message in _show and
   _store. (Andi)
 - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
 - Return only the current health state for sysfs read. (Andi, Rodrigo)
 - Add documentation for sysfs interface. (Andi, Rodrigo)

v2:
 - Make logs and structures consistent with their counterparts. (Riana)
 - Drop unnecessary variables. (Andi, Riana)
 - Add correct KernelVersion. (Raag)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
 drivers/gpu/drm/xe/xe_ras.c                   | 135 ++++++++++++++++++
 2 files changed, 165 insertions(+)
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
index 7cb6fcb1254a..58dca940ecaa 100644
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
@@ -270,6 +277,125 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 	return 0;
 }
 
+static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_get_health_response response = {0};
+	struct xe_ras_get_health_request request = {0};
+	enum xe_ras_health_status health;
+	int ret;
+	size_t rlen = 0;
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
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_set_health_request request = {0};
+	struct xe_ras_set_health_response response = {0};
+	enum xe_ras_health_status health;
+	int ret;
+	size_t rlen = 0;
+	int state;
+	int ras_status;
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
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
@@ -278,8 +404,17 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
  */
 void xe_ras_init(struct xe_device *xe)
 {
+	int ret;
+
 	if (!xe->info.has_drm_ras)
 		return;
 
 	xe_drm_ras_init(xe);
+
+	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
+		return;
+
+	ret = gpu_health_sysfs_init(xe);
+	if (ret)
+		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
 }
-- 
2.43.0

