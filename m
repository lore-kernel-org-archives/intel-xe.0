Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C25BC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 15:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714D10E1E9;
	Fri,  4 Sep 2026 15:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4L8gnvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B4A10E1E9
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788536964; x=1820072964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V1+H82Lg5wz1lo8H9yv1pWBil9n3Ip0HuXSfu93BSiM=;
 b=M4L8gnvp+HX8jEoXMcR6CMPu6J4XUkFZBNFLkYiElxXCDpbQi/1Yrp9L
 JEO9mbRKJDVYI6Y55Wp+A8BbcYyR9EMLp5AoN6ehKOzixXyaLNS1HVvnV
 sX7OO8pJBnNWTxL8LXTNfHt7/GP9vz0K7iF+j0fj83yyPxt+sKI2K92Ni
 OZBQjnNIBZV/Wa5Rx5E/fFa11Kqmw2tNeJmbcs70Y0GTcxyYnfmlT7QRi
 /pwkTGnRvRsGEaatlA4dA01mbTQBDtX3SxY90RQP1iVPXXVCZeWViioWw
 YMJQmz89QqKPbHzGgwzEdul4qU6besWB4cTTXKd2s12w6TB6m+dqAcNA7 Q==;
X-CSE-ConnectionGUID: WVtjEfOdQtanrMGQ7nyA+A==
X-CSE-MsgGUID: bYQ4BkMEQjCS5pvA0x0K1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100563162"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="100563162"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:49:23 -0700
X-CSE-ConnectionGUID: Kj5v7kStQTmFmyYeeUT0Ng==
X-CSE-MsgGUID: JFHTjyjhRPqivKz9tEouSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="263871895"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:49:21 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
Date: Fri,  4 Sep 2026 21:36:11 +0530
Message-ID: <20260904160608.2004174-6-badal.nilawar@intel.com>
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

Expose a read-only sysfs attribute, device_uuid, that reports the
GPU's unique hardware identifier.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
 drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
 drivers/gpu/drm/xe/xe_device.c                |  3 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  3 ++
 5 files changed, 54 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
new file mode 100644
index 000000000000..1a4bdfbad8d7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
@@ -0,0 +1,10 @@
+What:		/sys/bus/pci/drivers/xe/.../device_uuid
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Unique 64-bit identifier of the device instance, read from
+		the device's CRI_DEVICE_UUID register and printed as a
+		zero-padded 16-digit hexadecimal string.
+
+		This sysfs file is present only on Intel Xe platforms that
+		provide a device UUID. It is available to all users.
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ef4746b7b5d3..68226fe0b659 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -30,6 +30,8 @@
 #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
 #define   TILE_COUNT				REG_GENMASK(15, 8)
 
+#define CRI_DEVICE_UUID				XE_REG(0x102008)
+
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
 #define   GGMS_MASK				REG_GENMASK(7, 6)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8583b2e9ecf4..e8db8871990b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		vf_update_device_info(xe);
 
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		xe->device_uuid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UUID);
+
 	/*
 	 * Check for pcode uncore_init status to confirm if the SoC
 	 * initialization is complete. Until done, any MMIO or lmem access from
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index a73e0e957cb0..a4d326159dce 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -8,6 +8,7 @@
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
+#include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_device_sysfs.h"
 #include "xe_mmio.h"
@@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
 	.attrs = auto_link_downgrade_attrs,
 };
 
+/**
+ * DOC: device_uuid
+ *
+ * Each Xe device exposes a 64-bit UUID that uniquely identifies the SoC.
+ * The value is read from the CRI_DEVICE_UUID register and can be
+ * read back through the ``device_uuid`` sysfs entry.
+ *
+ *    $ cat /sys/bus/pci/devices/<bdf>/device_uuid
+ */
+
+static ssize_t
+device_uuid_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	return sysfs_emit(buf, "%016llx\n", xe->device_uuid);
+}
+static DEVICE_ATTR_RO(device_uuid);
+
+static struct attribute *device_uuid_attrs[] = {
+	&dev_attr_device_uuid.attr,
+	NULL
+};
+
+static const struct attribute_group device_uuid_attr_group = {
+	.attrs = device_uuid_attrs,
+};
+
 int xe_device_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
+	if (xe->info.platform == XE_CRESCENTISLAND) {
+		ret = devm_device_add_group(dev, &device_uuid_attr_group);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..6fdd16eac906 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -257,6 +257,9 @@ struct xe_device {
 		bool oob_initialized;
 	} wa_active;
 
+	/** @device_uuid: unique 64-bit identifier read from CRI_DEVICE_UUID */
+	u64 device_uuid;
+
 	/** @survivability: survivability information for device */
 	struct xe_survivability survivability;
 
-- 
2.54.0

