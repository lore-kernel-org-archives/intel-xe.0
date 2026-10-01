Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0FBCA5FCC
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 11:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B91810E35F;
	Thu,  1 Oct 2026 11:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsuPUwf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB66110E35C
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790855766; x=1822391766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zlgzF7q4249qh15ZvggpoLpGztcGJ8Azck0yxFYYVCk=;
 b=dsuPUwf7lmgUNZW6mFtilu92ACuPjfzG3cczlDhoFEX4TycXlu1GhLSu
 Q/GcWkJG4yF/5UvoUiaXruAa74esnvvR7U5dFi+oDX8b4GRYENSZUC1b2
 ZNBzDfGme+/n4kiw3J4dSnEkGBZZF/USRSbU9IeoRuqSnYyzuf8HF/6vU
 gLohUHCHr7kevUhyKU7fOVNbFMRbzzh7xNvdIxNQnylbYK8d9y+PwrbCn
 7oWS6PpgQTObflyRQZCPHOTZPNh+icwoXLEuM7r9IvAAdlwpNv+Sf5QlG
 GbsMD0kqAikKbkI7TUWYoln3ZyWqYRgztLq4/yEVQzanREjLKEIJK+COI g==;
X-CSE-ConnectionGUID: se/O/QfyQqmSHKvTR3vYig==
X-CSE-MsgGUID: 6So+dKGhQFeSPCeRlEa+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79169822"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="79169822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:56:05 -0700
X-CSE-ConnectionGUID: IdJF8SR3SfaQERxmSKaI2A==
X-CSE-MsgGUID: sVOyVdcSS1O/zGC6g7ByHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="274596867"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:56:03 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3] drm/xe/i2c: Expose AMC Alert reason sysfs
Date: Thu,  1 Oct 2026 17:43:03 +0530
Message-ID: <20261001121302.4102629-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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

AMC raises an SMBUS alert before performing a power removal or
power-cycle operation. The xe driver then places the device into
vendor-specific wedge mode until the recovery is performed.

Expose a read-only xe_amc_alert_reason sysfs attribute to help users
identify the required recovery action.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v2:
 - Created sysfs during i2c probe time
 - Fix Documentation (Rodrigo)
v3:
 - Keep limited information in "DOC:" section (Michal)
 - Handle AMC alert none and unknown cases, document
   in ABI
 - Clear i2c->amc on sysfs creation failure (Sashiko)
v4:
 - Fix sashiko comments
 - Fix review comments (Michal)
---
 .../ABI/testing/sysfs-driver-intel-xe-amc     | 24 ++++++
 drivers/gpu/drm/xe/xe_amc.c                   | 82 ++++++++++++++++---
 2 files changed, 96 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
new file mode 100644
index 000000000000..34927fa5dcfe
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
@@ -0,0 +1,24 @@
+What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This file exposes the reason for the most recent Add-In
+		Management Controller (AMC) alert on supported Intel Xe platforms.
+
+		An AMC alert is delivered via an SMBUS interrupt and causes the
+		device to be wedged, requiring vendor-specific recovery.
+		The attribute is read-only and  available to all users.
+
+		Read returns a single line containing one of the following
+		alert reasons:
+
+			"none"
+				No AMC alert has been received
+			"unknown"
+				AMC alert received but with unknown reason
+			"firmware_download"
+			"thermal_trip"
+			"oob_request"
+			"oob_reset"
+			"catastrophic"
diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index edd50bf8261e..7f21044fd1b7 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -18,6 +18,7 @@
 #include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_printk.h"
 
 /**
  * DOC: Add-In Management Controller (AMC)
@@ -46,16 +47,19 @@ enum xe_amc_alert {
 };
 
 static const char * const amc_alert[] = {
-	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
-	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
-	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
-	[AMC_ALERT_OOB_RESET]		= "OOB Reset",
-	[AMC_ALERT_CATERR]		= "Catastrophic",
+	[AMC_ALERT_UNKNOWN]		= "unknown",
+	[AMC_ALERT_FW_DOWNLOAD]		= "firmware_download",
+	[AMC_ALERT_THERMAL_TRIP]	= "thermal_trip",
+	[AMC_ALERT_OOB_REQUEST]		= "oob_request",
+	[AMC_ALERT_OOB_RESET]		= "oob_reset",
+	[AMC_ALERT_CATERR]		= "catastrophic",
 };
 
 struct xe_amc {
 	struct xe_i2c *i2c;
 	struct work_struct work;
+	u8 alert_reason;
+	bool alert_seen;
 };
 
 struct amc_header {
@@ -104,6 +108,45 @@ static const struct amc_request amc_get_alert_reason = {
 	},
 };
 
+/**
+ * DOC: AMC Alert Reason
+ *
+ * Expose AMC alert reason through device sysfs
+ *
+ * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
+ * specification.
+ */
+
+static ssize_t amc_alert_reason_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_amc *amc = xe->i2c->amc;
+	u8 alert_reason;
+
+	if (!amc->alert_seen)
+		return sysfs_emit(buf, "none\n");
+
+	alert_reason = READ_ONCE(amc->alert_reason);
+
+	return sysfs_emit(buf, "%s\n", amc_alert[alert_reason]);
+}
+static DEVICE_ATTR_RO(amc_alert_reason);
+
+static void amc_remove_alert_sysfs(struct xe_i2c *i2c)
+{
+	struct device *dev = i2c->drm_dev;
+
+	device_remove_file(dev, &dev_attr_amc_alert_reason);
+}
+
+static int amc_create_alert_sysfs(struct xe_i2c *i2c)
+{
+	struct device *dev = i2c->drm_dev;
+
+	return device_create_file(dev, &dev_attr_amc_alert_reason);
+}
+
 static void xe_amc_work(struct work_struct *work)
 {
 	const struct amc_request *request = &amc_get_alert_reason;
@@ -153,17 +196,26 @@ static void xe_amc_work(struct work_struct *work)
 out_reassert_interrupt:
 	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
 
+	amc->alert_seen = true;
+
 	switch (alert_reason) {
 	case AMC_ALERT_FW_DOWNLOAD:
 	case AMC_ALERT_THERMAL_TRIP:
 	case AMC_ALERT_OOB_REQUEST:
 	case AMC_ALERT_OOB_RESET:
-	case AMC_ALERT_CATERR:
-		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
-		xe_device_declare_wedged(i2c_client_to_xe_device(client));
+	case AMC_ALERT_CATERR: {
+		struct xe_device *xe = i2c_client_to_xe_device(client);
+
+		WRITE_ONCE(amc->alert_reason, alert_reason);
+		dev_warn(amc->i2c->drm_dev,
+			 "AMC Alert: %s (%u)\n", amc_alert[alert_reason], alert_reason);
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
+		xe_device_declare_wedged(xe);
 		break;
+	}
 	default:
-		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
+		WRITE_ONCE(amc->alert_reason, AMC_ALERT_UNKNOWN);
+		dev_warn(amc->i2c->drm_dev, "AMC Alert: unknown (%u)\n", alert_reason);
 		break;
 	}
 }
@@ -176,6 +228,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
 int xe_amc_init(struct xe_i2c *i2c)
 {
 	struct xe_amc *amc;
+	int ret;
 
 	amc = kzalloc_obj(*amc);
 	if (!amc)
@@ -185,13 +238,22 @@ int xe_amc_init(struct xe_i2c *i2c)
 	i2c->amc = amc;
 	amc->i2c = i2c;
 
-	return 0;
+	amc->alert_seen = false;
+	ret = amc_create_alert_sysfs(i2c);
+	if (ret) {
+		kfree(i2c->amc);
+		i2c->amc = NULL;
+	}
+
+	return ret;
 }
 
 void xe_amc_exit(struct xe_i2c *i2c)
 {
 	if (i2c->amc) {
+		amc_remove_alert_sysfs(i2c);
 		cancel_work_sync(&i2c->amc->work);
 		kfree(i2c->amc);
+		i2c->amc = NULL;
 	}
 }
-- 
2.54.0

