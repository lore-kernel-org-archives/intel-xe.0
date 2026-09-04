Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4269C79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 15:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758CB10E130;
	Fri,  4 Sep 2026 15:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCWfUTVQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFA410E130
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788536961; x=1820072961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5Kjdce/Lkuph7rZPQNaAr6XgiB3OnNAiOXvHGDxGXE=;
 b=NCWfUTVQ8NUF8k/hZS+66B1ir6BGw2Tfd6DqakzKJEfw0C9VC/HupW5O
 nVRmpD3/Vh/G/Av9U+otFIXw/kqDIaj1VIHXJ0EH3MO6NRifWb1nmdONm
 DGf7x2XHRs/SCU0dG0sQzisLCqUavsRnwHACaifBX9XRQk0Qh2+zlBwRx
 9mfgOfiCbxqQLtrIyrnn6k4/qqfRyiYmpOun6VY209YX7VLGq5oKVkhwU
 u7pnhx/vCU4KIJvtIeGh7nqu+H8q/A81QYBqgAnD7VXEYgoKKXVfH4Z1P
 6XJNJgKOz485mQ3igDvLWSwyP2/bRzBRIHXdRuMpW2PDG1yVWVc5GlKDa g==;
X-CSE-ConnectionGUID: ZKnHCtgdSjCw/uY5NU+lvA==
X-CSE-MsgGUID: NiQRXAARTyCjk8+QcEPipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100563160"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="100563160"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:49:21 -0700
X-CSE-ConnectionGUID: Nai3N/mYT16Z47KuYncDSg==
X-CSE-MsgGUID: 7i2paAR8SK+GVLNezYjiAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="263871885"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:49:18 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 1/2] drm/xe/i2c: Expose AMC Alert reason sysfs
Date: Fri,  4 Sep 2026 21:36:10 +0530
Message-ID: <20260904160608.2004174-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260904160608.2004174-4-badal.nilawar@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
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
---
 .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 +++++++
 drivers/gpu/drm/xe/xe_amc.c                   | 61 ++++++++++++++++++-
 2 files changed, 79 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
new file mode 100644
index 000000000000..4e5389163dbb
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
@@ -0,0 +1,21 @@
+What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This file exposes the reason for the most recent Add-In
+		Management Controller (AMC) alert on Intel Xe platforms.
+
+		An AMC alert is delivered via an SMBUS interrupt and causes the
+		device to be wedged, requiring vendor-specific recovery. This
+		attribute is created when such an alert is handled and is
+		available to all users as read-only.
+
+		Read returns a single line containing one of the following
+		alert reasons:
+
+			Firmware Download
+			Thermal Trip
+			OOB Request
+			OOB Reset
+			Catastrophic
diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index 8ecadee6eea3..c2d516c76502 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -18,6 +18,7 @@
 #include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_printk.h"
 
 /**
  * DOC: Add-In Management Controller (AMC)
@@ -46,6 +47,7 @@ enum xe_amc_alert {
 };
 
 static const char * const amc_alert[] = {
+	[AMC_ALERT_UNKNOWN]		= "None",
 	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
 	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
 	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
@@ -56,6 +58,8 @@ static const char * const amc_alert[] = {
 struct xe_amc {
 	struct xe_i2c *i2c;
 	struct work_struct work;
+	u8 alert_reason;
+	bool sysfs_created;
 };
 
 struct amc_header {
@@ -104,6 +108,45 @@ static const struct amc_request amc_get_alert_reason = {
 	},
 };
 
+/**
+ * DOC: AMC Alert Reason
+ *
+ * On Intel Xe platforms, AMC sends an alert notification via an SMBUS interrupt
+ * to notify events such as firmware download, thermal trip or a
+ * catastrophic error. See enum xe_amc_alert for the full list of reasons.
+ * Upon an AMC alert the device is wedged and requires vendor-specific recovery.
+ *
+ * The alert reason is exposed through
+ * /sys/bus/pci/devices/<BDF>/xe_amc_alert_reason
+ *
+ * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
+ * specification.
+ */
+
+static ssize_t xe_amc_alert_reason_show(struct device *dev,
+					struct device_attribute *attr, char *buff)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_amc *amc = xe->i2c->amc;
+
+	return sysfs_emit(buff, "%s\n", amc_alert[amc->alert_reason]);
+}
+static DEVICE_ATTR_RO(xe_amc_alert_reason);
+
+static void xe_amc_remove_alert_sysfs(struct xe_i2c *i2c)
+{
+	struct device *dev = i2c->drm_dev;
+
+	device_remove_file(dev, &dev_attr_xe_amc_alert_reason);
+}
+
+static int xe_amc_create_alert_sysfs(struct xe_i2c *i2c)
+{
+	struct device *dev = i2c->drm_dev;
+
+	return device_create_file(dev, &dev_attr_xe_amc_alert_reason);
+}
+
 static void xe_amc_work(struct work_struct *work)
 {
 	const struct amc_request *request = &amc_get_alert_reason;
@@ -158,10 +201,15 @@ static void xe_amc_work(struct work_struct *work)
 	case AMC_ALERT_THERMAL_TRIP:
 	case AMC_ALERT_OOB_REQUEST:
 	case AMC_ALERT_OOB_RESET:
-	case AMC_ALERT_CATERR:
+	case AMC_ALERT_CATERR: {
+		struct xe_device *xe = i2c_client_to_xe_device(client);
+
 		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
-		xe_device_declare_wedged(i2c_client_to_xe_device(client));
+		amc->alert_reason = alert_reason;
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
+		xe_device_declare_wedged(xe);
 		break;
+	}
 	default:
 		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
 		break;
@@ -176,6 +224,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
 int xe_amc_init(struct xe_i2c *i2c)
 {
 	struct xe_amc *amc;
+	int ret;
 
 	amc = kzalloc(sizeof(*amc), GFP_KERNEL);
 	if (!amc)
@@ -185,11 +234,17 @@ int xe_amc_init(struct xe_i2c *i2c)
 	i2c->amc = amc;
 	amc->i2c = i2c;
 
-	return 0;
+	ret =  xe_amc_create_alert_sysfs(i2c);
+	if (ret)
+		kfree(i2c->amc);
+
+	return ret;
 }
 
 void xe_amc_exit(struct xe_i2c *i2c)
 {
+	xe_amc_remove_alert_sysfs(i2c);
+
 	if (i2c->amc) {
 		cancel_work_sync(&i2c->amc->work);
 		kfree(i2c->amc);
-- 
2.54.0

