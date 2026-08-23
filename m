Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3616C5DF9B
	for <intel-xe@archiver.kernel.org>; Sun, 23 Aug 2026 10:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785BF10E4C1;
	Sun, 23 Aug 2026 10:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UO1i34e8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C764110E4C1
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Aug 2026 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787480322; x=1819016322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OgxOx7zCqJjgUVedgRM9tuEZnoT9SU1ijyAanE3Rr40=;
 b=UO1i34e8YPo4O9mAIYMvdJAjK+eHS2Q0OJso61LGX7nAcrkcE5LtcDUo
 33bjolrV5ejPWpGdeebCJ8mzs1T65GnCFEXxCLGetCHXVCIegppyCkUnw
 jft0xAlVZvGudZ0uMsQr3whwy4EJpyzbrysUrfdiWkCRdCzEQ6SPYWD4G
 zV/KmAg5nsYMcCoNVvt3On9n6ZDdD8+x1tImWe8r67mNg4MIYxa5Rw/9I
 N9jSAmyVDNvgeNCcwpd4gBJcqAtm8LVzM36Vpeszau9ZEsZtgwoXxd1eo
 pL/q8u1GQPofB+z0UT3czy5/SpB3KYcriQ8en0ZJs/p4kSPyEsJJI0Nds g==;
X-CSE-ConnectionGUID: +C3yZip9RgqwjnCFx9Vtig==
X-CSE-MsgGUID: /XVYHLMWQium150RKsamXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="98547678"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; d="scan'208";a="98547678"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 03:18:42 -0700
X-CSE-ConnectionGUID: Qp9hgG9dQ+CL06BaaVal6w==
X-CSE-MsgGUID: D33J+BySS4CTRUQ2vw8+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; d="scan'208";a="266222479"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 03:18:41 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 2/2] drm/xe/i2c: Expose AMC Alert reason sysfs
Date: Sun, 23 Aug 2026 16:05:26 +0530
Message-ID: <20260823103523.554184-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260823103523.554184-4-badal.nilawar@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
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
 .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 ++++++
 drivers/gpu/drm/xe/xe_amc.c                   | 65 ++++++++++++++++++-
 2 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
new file mode 100644
index 000000000000..b3de933efe11
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
@@ -0,0 +1,21 @@
+What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
+Date:		August 2026
+KernelVersion:	7.3
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
index 8ecadee6eea3..ceb2c4d618fe 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -18,6 +18,7 @@
 #include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_printk.h"
 
 /**
  * DOC: Add-In Management Controller (AMC)
@@ -56,6 +57,8 @@ static const char * const amc_alert[] = {
 struct xe_amc {
 	struct xe_i2c *i2c;
 	struct work_struct work;
+	u8 alert_reason;
+	bool sysfs_created;
 };
 
 struct amc_header {
@@ -104,6 +107,54 @@ static const struct amc_request amc_get_alert_reason = {
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
+ * /sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
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
+static void xe_remove_amc_alert_sysfs(struct xe_device *xe)
+{
+	if (xe->i2c->amc->sysfs_created)
+		device_remove_file(xe->drm.dev, &dev_attr_xe_amc_alert_reason);
+}
+
+static void xe_create_amc_alert_sysfs(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int ret;
+
+	if (xe->i2c->amc->sysfs_created)
+		return;
+
+	ret = device_create_file(dev, &dev_attr_xe_amc_alert_reason);
+	if (ret)
+		goto failed;
+
+	xe->i2c->amc->sysfs_created = true;
+failed:
+	dev_err(dev, "Failed to create sysfs file for amc alert reason\n");
+}
+
 static void xe_amc_work(struct work_struct *work)
 {
 	const struct amc_request *request = &amc_get_alert_reason;
@@ -158,10 +209,16 @@ static void xe_amc_work(struct work_struct *work)
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
+		xe_create_amc_alert_sysfs(xe);
 		break;
+	}
 	default:
 		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
 		break;
@@ -190,8 +247,12 @@ int xe_amc_init(struct xe_i2c *i2c)
 
 void xe_amc_exit(struct xe_i2c *i2c)
 {
+	struct xe_device *xe;
+
 	if (i2c->amc) {
 		cancel_work_sync(&i2c->amc->work);
+		xe = i2c_client_to_xe_device(i2c->client[XE_I2C_CLIENT_AMC]);
+		xe_remove_amc_alert_sysfs(xe);
 		kfree(i2c->amc);
 	}
 }
-- 
2.54.0

