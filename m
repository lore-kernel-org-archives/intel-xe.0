Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC8CC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB4E10E4CD;
	Thu, 10 Sep 2026 12:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCKGKovn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F9910E4CD
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789043103; x=1820579103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8coJBeSBaK+luEAkuo9O9StsrRt2Z0JHkjnGruniNiQ=;
 b=gCKGKovnQvTSaK3UeGWb+GDHLA5gayACyZ/4z/Ly3kdhaWWXov1B05rG
 Ithz0Xk0rJ9g2wiEeeOYuPbOpVWeYzAGabBOmc3DDse59XMwcigBpflgY
 OCIY8ghMQnO/SYst9DvIvTVEDIK6apHs256Nhs68E+CC1F2JUHj5VcF4P
 RBprbKSHQuwbzUt408ru+tqzYBs0/nROXPsPxdLXpu9MdCZF9DsYzYw8a
 WAIrtAvZvdyaiT9wxe6Bqci/18p/uuUrKWa8ibgvNWIwp5RwRFZgEr2x5
 2NmLAZfGnre1T7L1s7h4xCeLk8s96SIUUe29U1CWerUe8Bln2mD90bdJ4 w==;
X-CSE-ConnectionGUID: B+TbGiZzSG6yF/jRlWFUuA==
X-CSE-MsgGUID: UMBvbJJjQoiuG5Rt+e/srQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93181625"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93181625"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:25:03 -0700
X-CSE-ConnectionGUID: pOfNB0bbRQCu4b4vkBPE7w==
X-CSE-MsgGUID: 4YB5AUltQR6nBg+6+ucEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="272121185"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:25:01 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 1/2] drm/xe/i2c: Expose AMC Alert reason sysfs
Date: Thu, 10 Sep 2026 18:11:52 +0530
Message-ID: <20260910124151.3135801-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910124151.3135801-4-badal.nilawar@intel.com>
References: <20260910124151.3135801-4-badal.nilawar@intel.com>
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
---
 .../ABI/testing/sysfs-driver-intel-xe-amc     | 25 ++++++
 drivers/gpu/drm/xe/xe_amc.c                   | 78 ++++++++++++++++---
 2 files changed, 93 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
new file mode 100644
index 000000000000..3bae78d1e0d9
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
@@ -0,0 +1,25 @@
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
+			none
+				No AMC alert has been received
+			unknown
+				AMC alert received but with invalid reason code
+			firmware_download
+			thermal_trip
+			oob_request
+			oob_reset
+			catastrophic
diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index edd50bf8261e..bb9d260f800f 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -18,6 +18,7 @@
 #include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_printk.h"
 
 /**
  * DOC: Add-In Management Controller (AMC)
@@ -43,19 +44,23 @@ enum xe_amc_alert {
 	AMC_ALERT_OOB_REQUEST,
 	AMC_ALERT_OOB_RESET,
 	AMC_ALERT_CATERR,
+	AMC_ALERT_NONE = U8_MAX,
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
+	[AMC_ALERT_NONE]		= "none",
 };
 
 struct xe_amc {
 	struct xe_i2c *i2c;
 	struct work_struct work;
+	u8 alert_reason;
 };
 
 struct amc_header {
@@ -104,6 +109,42 @@ static const struct amc_request amc_get_alert_reason = {
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
+ * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
+ * specification.
+ */
+
+static ssize_t xe_amc_alert_reason_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_amc *amc = xe->i2c->amc;
+
+	return sysfs_emit(buf, "%s\n", amc_alert[amc->alert_reason]);
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
@@ -158,12 +199,19 @@ static void xe_amc_work(struct work_struct *work)
 	case AMC_ALERT_THERMAL_TRIP:
 	case AMC_ALERT_OOB_REQUEST:
 	case AMC_ALERT_OOB_RESET:
-	case AMC_ALERT_CATERR:
-		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
-		xe_device_declare_wedged(i2c_client_to_xe_device(client));
+	case AMC_ALERT_CATERR: {
+		struct xe_device *xe = i2c_client_to_xe_device(client);
+
+		dev_warn(amc->i2c->drm_dev,
+			 "AMC Alert: %s (%u)\n", amc_alert[alert_reason], alert_reason);
+		amc->alert_reason = alert_reason;
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
+		xe_device_declare_wedged(xe);
 		break;
+	}
 	default:
-		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
+		amc->alert_reason = AMC_ALERT_UNKNOWN;
+		dev_warn(amc->i2c->drm_dev, "AMC Alert: unknown (%u)\n", alert_reason);
 		break;
 	}
 }
@@ -176,6 +224,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
 int xe_amc_init(struct xe_i2c *i2c)
 {
 	struct xe_amc *amc;
+	int ret;
 
 	amc = kzalloc_obj(*amc);
 	if (!amc)
@@ -185,13 +234,22 @@ int xe_amc_init(struct xe_i2c *i2c)
 	i2c->amc = amc;
 	amc->i2c = i2c;
 
-	return 0;
+	amc->alert_reason = AMC_ALERT_NONE;
+	ret = xe_amc_create_alert_sysfs(i2c);
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
+		xe_amc_remove_alert_sysfs(i2c);
 		cancel_work_sync(&i2c->amc->work);
 		kfree(i2c->amc);
+		i2c->amc = NULL;
 	}
 }
-- 
2.54.0

