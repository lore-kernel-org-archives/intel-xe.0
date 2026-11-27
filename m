Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD022606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ox708x2f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8193710FC9F;
	Fri, 27 Nov 2026 06:13:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018BB112264
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 06:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795760030; x=1827296030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCzyY0+TP5En4eLUUaARr5QyWyLalnE6Lj6VYCYEKG4=;
 b=Ox708x2fsKAq2hNGJP82h1cHzns8jXBLYcWFBmWklopl08S+/fCQH8Y0
 SFrVyvF/kJkrHZ6DQpS5ciRGtnDHdXHryAH8c4p8uWrNOHh5JBKxpemv3
 xQoTTsKJ4Hj1bmivQErb+ajKoWzW4F1Bwrkl+Vv8AADZLvyMwz85TsXmi
 CS4XvDHN1yritBa+t2iiplWMbQ22PUyTxtsKuj2ds33gSPNt/IS1Xjyj2
 BsTHuVzhwGqWFCmDVADPfDi9A5v7IkqGIJJU+9Ml4LRYw206E93kudDzL
 k1LNWpc9fyPqbnIiBMZP/g4ZR1TEBRV1Njf/zjerJssCkBGPPao2VsxlB A==;
X-CSE-ConnectionGUID: XulpeMagRDuG2t/DSiN26Q==
X-CSE-MsgGUID: 22uNoDctQAKG+NuIP+C86w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4554505"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4554505"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:50 -0800
X-CSE-ConnectionGUID: SLvT+h23ScSzrMzxXC+MpQ==
X-CSE-MsgGUID: QdIdSurmQnWX/A4M+CkmHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12353942"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:48 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 4/5] drm/xe/i2c: Expose AMC alert reason through sysfs
Date: Fri, 27 Nov 2026 11:43:38 +0530
Message-ID: <20261127061333.1019047-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127061333.1019047-7-badal.nilawar@intel.com>
References: <20261127061333.1019047-7-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AMC raises an SMBus alert before a power-removal or power-cycle
operation. The xe driver uses the alert reason to select a recovery
method.

Expose the reason in a read-only sysfs attribute so userspace can
identify the appropriate recovery action.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-amc     | 24 +++++++
 drivers/gpu/drm/xe/xe_amc.c                   | 69 +++++++++++++++++--
 2 files changed, 89 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
new file mode 100644
index 000000000000..8c2731cfa91c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
@@ -0,0 +1,24 @@
+What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
+Date:		October 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This file exposes the reason for the most recent Add-In
+		Management Controller (AMC) alert on supported Intel Xe platforms.
+
+		An AMC alert is delivered via an SMBus interrupt. The device may
+		be wedged; the required recovery method depends on the alert.
+		The attribute is read-only and available to all users.
+
+		Read returns a single line containing one of the following
+		alert reasons:
+
+			"none"
+				No AMC alert has been received
+			"unknown"
+				AMC alert received but with unknown reason
+			"Firmware Download"
+			"Thermal Trip"
+			"OOB Request"
+			"OOB Reset"
+			"Catastrophic"
diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index b0e9250fa971..a619346a3451 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -49,6 +49,7 @@ enum xe_amc_alert {
 };
 
 static const char * const amc_alert[] = {
+	[AMC_ALERT_UNKNOWN]		= "unknown",
 	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
 	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
 	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
@@ -59,6 +60,8 @@ static const char * const amc_alert[] = {
 struct xe_amc {
 	struct xe_i2c *i2c;
 	struct work_struct work;
+	enum xe_amc_alert alert_reason;
+	bool alert_seen;
 };
 
 struct amc_header {
@@ -107,6 +110,50 @@ static const struct amc_request amc_get_alert_reason = {
 	},
 };
 
+/**
+ * DOC: AMC Alert Reason
+ *
+ * Expose the most recent AMC alert reason through device sysfs.
+ *
+ * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
+ * specification.
+ */
+
+static enum xe_amc_alert amc_alert_reason(struct xe_amc *amc)
+{
+	return READ_ONCE(amc->alert_reason);
+}
+
+static ssize_t amc_alert_reason_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_amc *amc = xe->i2c->amc;
+	enum xe_amc_alert alert_reason;
+
+	if (!READ_ONCE(amc->alert_seen))
+		return sysfs_emit(buf, "none\n");
+
+	alert_reason = amc_alert_reason(amc);
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
@@ -156,11 +203,15 @@ static void xe_amc_work(struct work_struct *work)
 	}
 
 	alert_reason = response.value;
-	dev_dbg(&client->dev, "Alert reason: %d\n", alert_reason);
+	dev_dbg(&client->dev, "Alert reason: %u\n", (unsigned int)alert_reason);
 
 out_reassert_interrupt:
 	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
 
+	WRITE_ONCE(amc->alert_reason, alert_reason < ARRAY_SIZE(amc_alert) ?
+		   alert_reason : AMC_ALERT_UNKNOWN);
+	WRITE_ONCE(amc->alert_seen, true);
+
 	switch (alert_reason) {
 	case AMC_ALERT_FW_DOWNLOAD:
 	case AMC_ALERT_OOB_RESET:
@@ -174,11 +225,12 @@ static void xe_amc_work(struct work_struct *work)
 		recovery = DRM_WEDGE_RECOVERY_COLD_RESET;
 		break;
 	default:
-		alert_str = "unknown";
+		alert_str = amc_alert[AMC_ALERT_UNKNOWN];
 		break;
 	}
 
-	dev_warn(amc->i2c->drm_dev, "AMC Alert: %s (%u)\n", alert_str, alert_reason);
+	dev_warn(amc->i2c->drm_dev, "AMC Alert: %s (%u)\n", alert_str, (unsigned int)alert_reason);
+
 	if (recovery)
 		xe_wedge_declare(i2c_client_to_xe_device(client), recovery);
 
@@ -193,6 +245,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
 int xe_amc_init(struct xe_i2c *i2c)
 {
 	struct xe_amc *amc;
+	int ret;
 
 	amc = kzalloc_obj(*amc);
 	if (!amc)
@@ -202,13 +255,21 @@ int xe_amc_init(struct xe_i2c *i2c)
 	i2c->amc = amc;
 	amc->i2c = i2c;
 
-	return 0;
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
2.56.0

