Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2005C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0CE10E5E7;
	Thu, 10 Sep 2026 12:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aG2eo4bu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2842810E5E7
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789043106; x=1820579106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S1Dthf5NLl3u+XSnN+jKI1bd+pKxWHW6TRgmjoNAoB4=;
 b=aG2eo4buu+fa1q2OTErwpdGFf8WiIyYc3YK7Nxxzv4/KkIoCx/4mUvlp
 YYxsbJU3+s+kSJ+H9Y1ZXgfr2cKNv7EIkR8yQXFVOJ7Eyt8Kehei59NMN
 mNGMQ4U5oQg35mnzVMEtg0A9Lj6URyAROeVqezxAL0vEJSX4VV6w0XNDC
 7r5PAmjPscG3ddZdHyHyVGr39WxrYaZqR9zf5xp0y0kZKebZeJRVnUejP
 kLofdsjkdCinFyT+zNZ7SeZLZ4+nDmFtZ06KvanT9fY/YuMjd0EzZNjNN
 HQFJ+nzvl1M7CP32G48NXDIBz1WfIUNG2P3pGchsaaOFuhkMZn7+SL209 A==;
X-CSE-ConnectionGUID: EGKqbEiwQtaEYx35/OVFbw==
X-CSE-MsgGUID: 4iY6ExP5RSOc0HfvmPMfPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93181627"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93181627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:25:06 -0700
X-CSE-ConnectionGUID: +uVZu81mQIGPhfCQKVBG4Q==
X-CSE-MsgGUID: dXCLhr7gRZy7g9H5H8cpgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="272121195"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:25:04 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 2/2] drm/xe/cri: Expose device UID through sysfs
Date: Thu, 10 Sep 2026 18:11:53 +0530
Message-ID: <20260910124151.3135801-6-badal.nilawar@intel.com>
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

Expose a read-only sysfs attribute, device_uid, that reports the
GPU's unique hardware identifier.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v2:
  - add has flag instead of platform check to determin uid support (Anshuman)
  - Fix the DOC: section (Michal)
  - %s/_uuid/uid (Joonas)
---
 .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
 drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
 drivers/gpu/drm/xe/xe_device.c                |  4 +++
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  5 +++
 drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
 7 files changed, 60 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
new file mode 100644
index 000000000000..36182bbb1b54
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
@@ -0,0 +1,10 @@
+What:		/sys/bus/pci/drivers/xe/.../device_uid
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		RO. Unique 64-bit identifier of the GPU device, exposed as
+		hexadecimal value.
+
+		This sysfs file is present only on Intel Xe platforms that
+		provide a device UID. It is available to all users.
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ef4746b7b5d3..437485b5a0af 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -30,6 +30,8 @@
 #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
 #define   TILE_COUNT				REG_GENMASK(15, 8)
 
+#define CRI_DEVICE_UID				XE_REG(0x102008)
+
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
 #define   GGMS_MASK				REG_GENMASK(7, 6)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 205cb4e7f9e8..99f6d4184b79 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -671,6 +671,7 @@ static void vf_update_device_info(struct xe_device *xe)
 	xe->info.skip_guc_pc = 1;
 	xe->info.skip_pcode = 1;
 	xe->info.has_drm_ras = false;
+	xe->info.has_device_uid = false;
 }
 
 static int xe_device_vram_alloc(struct xe_device *xe)
@@ -878,6 +879,9 @@ int xe_device_probe(struct xe_device *xe)
 	int err;
 	u8 id;
 
+	if (xe->info.has_device_uid)
+		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);
+
 	xe_pat_init_early(xe);
 
 	err = xe_sriov_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index a73e0e957cb0..657742c22d90 100644
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
+ * DOC: device_uid
+ *
+ * On supported platforms, Xe devices expose a unique 64-bit GPU SOC
+ * identifier through the 'device_uid' sysfs entry.
+ *
+ * See Documentation/ABI/testing/sysfs-driver-intel-xe-gpu for the ABI
+ * specification.
+ */
+
+static ssize_t
+device_uid_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	return sysfs_emit(buf, "%016llx\n", xe->device_uid);
+}
+static DEVICE_ATTR_RO(device_uid);
+
+static struct attribute *device_uid_attrs[] = {
+	&dev_attr_device_uid.attr,
+	NULL
+};
+
+static const struct attribute_group device_uid_attr_group = {
+	.attrs = device_uid_attrs,
+};
+
 int xe_device_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
+	if (xe->info.has_device_uid) {
+		ret = devm_device_add_group(dev, &device_uid_attr_group);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f88bacf63c83..65366e8173c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -174,6 +174,8 @@ struct xe_device {
 		u8 has_cached_pt:1;
 		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
 		u8 has_device_atomics_on_smem:1;
+		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
+		u8 has_device_uid:1;
 		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
 		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
@@ -258,6 +260,9 @@ struct xe_device {
 		bool oob_initialized;
 	} wa_active;
 
+	/** @device_uid: unique 64-bit GPU SOC identifier */
+	u64 device_uid;
+
 	/** @survivability: survivability information for device */
 	struct xe_survivability survivability;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..2900f18c7b4c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -471,6 +471,7 @@ static const struct xe_device_desc cri_desc = {
 	PLATFORM(CRESCENTISLAND),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_device_uid = true,
 	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
@@ -793,6 +794,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
+	xe->info.has_device_uid = desc->has_device_uid;
 	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
 	/* runtime fusing may force flat_ccs to disabled later */
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index fed509ff601e..fe327323a0be 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -40,6 +40,7 @@ struct xe_device_desc {
 
 	u8 has_cached_pt:1;
 	u8 has_display:1;
+	u8 has_device_uid:1;
 	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
 	u8 has_flat_ccs:1;
-- 
2.54.0

