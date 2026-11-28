Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E4F606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GjG+JSg8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF09410E271;
	Sat, 28 Nov 2026 05:58:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D804C10E401
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845503; x=1827381503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Si/EBwofYMW9oHtqtmMCGk2bE+suBRKZpiXuAtIM1E=;
 b=GjG+JSg8zmU5spuBNklnNi1mKNyDcz3F3xhYKE95yhQRlt5xRzwjstuE
 sx+1QQ29/EIGEvd05rIWjmM1Gj+Vpd6CPSrK/XNkWFWaxxoNrzWPcZMk9
 5tDDqpqq4gx/InSGC18Tlk/9RutLLWpu0ZVi7SzgsyP/odBCYg0Ct9t3+
 jf1vLX52UQlZqBnGAk1J0UbGfh5Mj7uy9t/5WdPPfEFLrvUTKtNL6qKyo
 ICNzOdh82JpbFJ3A92F3WIFr0pCrAiphF0opoXsjPcCH5RaOnqwkDttYC
 4EKTOZU7s1NeUiaAjWdy4onF5bO0LNCohSdfX9bEp92BEHUVPyxI8whwG w==;
X-CSE-ConnectionGUID: pGUzwt9EQjKEqkwWufvu/w==
X-CSE-MsgGUID: RB5ui838SCq9mL1MzzIJRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754907"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754907"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:23 -0800
X-CSE-ConnectionGUID: U69BrLTnRAqgFRILXdyTZw==
X-CSE-MsgGUID: FD+3CnADQyK/Xye6CD3y5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304381"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:20 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 09/10] drm/xe: Expose tjmax_fan_control_enable device sysfs
Date: Sat, 28 Nov 2026 11:29:22 +0530
Message-Id: <20261128055923.3316956-10-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128055923.3316956-1-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
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

Add a device attribute to read and configure firmware fan control,
which forces maximum acoustic PWM as SoC VR temperatures
approach their critical thresholds.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-gpu     | 15 ++++
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 76 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
 3 files changed, 93 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
index b563b7e8a9d9..b644a100dd6b 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
@@ -21,6 +21,21 @@ Description:
 		This sysfs file is present only on Crescent Island devices.
 		It is readable by all users.
 
+What:		/sys/bus/pci/drivers/xe/.../tjmax_fan_control_enable
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		RW. Firmware thermal fan control mode.
+
+		Write 1 to enable or 0 to disable the mode that forces maximum
+		acoustic PWM as SoC temperature approaches shutdown or GDDR/VR
+		temperature approaches its thermal maximum. Reads return the
+		status reported by firmware.
+
+		This sysfs file is present only on devices that support
+		this command.
+
 What:		/sys/bus/pci/drivers/xe/.../tile<N>/memory/max_freq
 Date:		October 2026
 KernelVersion:	7.5
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index f6275e74eb31..3a4861b82548 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -35,6 +35,9 @@
  * lb_voltage_regulator_version - Voltage regulator version provisioned by late
  * binding. Exposed only if supported by the device.
  *
+ * tjmax_fan_control_enable - Report/change firmware TjMax fan control mode.
+ * Exposed only if supported by the device.
+ *
  * shrinker_non_purgeable_seeks - Report/change the cost, relative to
  * purgeable buffer objects, of recreating non-purgeable buffer objects
  * reclaimed by the shrinker. Higher values reduce reclaim pressure on
@@ -203,6 +206,73 @@ static const struct attribute_group late_bind_attr_group = {
 	.is_visible = late_bind_attr_is_visible,
 };
 
+static ssize_t
+tjmax_fan_control_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	u32 val = 0;
+	int ret;
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_pcode_read(xe_device_get_root_tile(xe),
+			    PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_TJMAX_FAN_CONTROL_MODE, 0),
+			    &val, NULL);
+	drm_dbg(&xe->drm, "pcode READ_TJMAX_FAN_CONTROL_MODE: val %#x, ret %d\n",
+		ret ? 0 : val, ret);
+
+	return ret ?: sysfs_emit(buf, "%u\n", val);
+}
+
+static ssize_t
+tjmax_fan_control_enable_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val > 1)
+		return -EINVAL;
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_pcode_write(xe_device_get_root_tile(xe),
+			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_TJMAX_FAN_CONTROL_MODE, 0),
+			     val);
+	drm_dbg(&xe->drm, "pcode WRITE_TJMAX_FAN_CONTROL_MODE: val %u, ret %d\n", val, ret);
+
+	return ret ?: count;
+}
+static DEVICE_ATTR_RW(tjmax_fan_control_enable);
+
+static struct attribute *fan_control_attrs[] = {
+	&dev_attr_tjmax_fan_control_enable.attr,
+	NULL
+};
+
+static umode_t fan_control_attr_is_visible(struct kobject *kobj,
+					   struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	u32 val;
+	int ret;
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_pcode_read(xe_device_get_root_tile(xe),
+			    PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_TJMAX_FAN_CONTROL_MODE, 0),
+			    &val, NULL);
+
+	return ret ? 0 : attr->mode;
+}
+
+static const struct attribute_group fan_control_attr_group = {
+	.attrs = fan_control_attrs,
+	.is_visible = fan_control_attr_is_visible,
+};
+
 /**
  * DOC: PCIe Gen5 Limitations
  *
@@ -428,5 +498,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
+	if (xe->info.has_fan_control) {
+		ret = devm_device_add_group(dev, &fan_control_attr_group);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index bf321ed19251..89dd5fba63c3 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -95,6 +95,8 @@
 #define     FSC_READ_FAN_TABLE			0x7
 #define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
 #define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
+#define     FSC_WRITE_TJMAX_FAN_CONTROL_MODE	0x8
+#define     FSC_READ_TJMAX_FAN_CONTROL_MODE	0x9
 
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
-- 
2.34.1

