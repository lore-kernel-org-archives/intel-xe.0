Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18A3C4167D
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 13:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6070E10E759;
	Wed,  8 Nov 2023 13:45:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A52F10E758
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699451146; x=1730987146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qQ3JbL4mZNOWGvtQxxMhoMCawNWtej6kSJG1ULwTqsY=;
 b=I2smvrgQEOe+6ZrLewksdEiz3qNXfG7rpnOyn1tbLwuaO455XPGFmpSv
 yMT61O6533ttrXdyxdA6Lep2LWzzTefkRM6qSwzXV/5SXr5CcAnpazbRE
 8H9Jlig7bW38yF0/nHy7FqFqNv7H7lUPSjGri8Hm+t3IZnMkkHEfyvvSB
 p7ewuAp0e238GqMhLRqIi+XgCahVLHhRY7u45G7PPtadICiE6y+wqXmmT
 HP+ZLEAT9K0SL4In6Ga+C165YuKguES2ucHA1D8o/mE9Vwul4as24/xyA
 ihF+YoL0ucY3fI0feyTE9Vz4qtsthRWorz/SkvmsT1JyhBqVpSj58LJEX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2711228"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="2711228"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:45:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936513449"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="936513449"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 08 Nov 2023 05:45:23 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Nov 2023 19:24:17 +0530
Message-Id: <20231108135418.3049168-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
References: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via sysfs
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

This patch exports uid to the userspace via sysfs.
For example, uid can be read by:
cat /sys/class/drm/cardX/device/csc_unique_id

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
 drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_pci.c          |  3 +++
 5 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index a646d13af03a..1b8de9b8daf1 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -70,6 +70,9 @@
 #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
 #define   SGSI_SIDECLK_DIS			REG_BIT(17)
 
+#define DEVUID_LWORD				XE_REG(0x102008)
+#define DEVUID_HWORD				XE_REG(0x10200C)
+
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
 #define   GGMS_MASK				REG_GENMASK(7, 6)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 515cdf599fab..266e0d5d7159 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -344,6 +344,15 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
 		xe_gt_sanitize(gt);
 }
 
+static void xe_read_dev_uid(struct xe_device *xe)
+{
+	if (xe->info.has_uid) {
+		struct xe_gt *mmio = xe_root_mmio_gt(xe);
+
+		xe->info.uid  = xe_mmio_read64_2x32(mmio, DEVUID_LWORD);
+	}
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -368,6 +377,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_read_dev_uid(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 99113a5a2b84..66f69eada76f 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
+static ssize_t csc_unique_id_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	return sysfs_emit(buf, "%llx\n", xe->info.uid);
+}
+
+static DEVICE_ATTR_RO(csc_unique_id);
+
 static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_unique_id.attr);
 }
 
 void xe_device_sysfs_init(struct xe_device *xe)
@@ -83,6 +96,14 @@ void xe_device_sysfs_init(struct xe_device *xe)
 		return;
 	}
 
+	if (xe->info.has_uid) {
+		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_unique_id.attr);
+		if (ret) {
+			drm_warn(&xe->drm, "UID sysfs setup failed\n");
+			return;
+		}
+	}
+
 	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
 	if (ret)
 		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4119ef03fb7e..1cc8488f8c86 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -238,6 +238,8 @@ struct xe_device {
 		u8 vm_max_level;
 		/** @va_bits: Maximum bits of a virtual address */
 		u8 va_bits;
+		/** @uid: device uid, used for generating uuid */
+		u64 uid;
 
 		/** @is_dgfx: is discrete device */
 		u8 is_dgfx:1;
@@ -261,6 +263,8 @@ struct xe_device {
 		u8 supports_mmio_ext:1;
 		/** @has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @has_uid: device has uid, used for generating uuid */
+		u8 has_uid:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2fae45b9d88e..4d91ad049e59 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -60,6 +60,7 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 
 	u8 has_llc:1;
+	u8 has_uid;
 	u8 bypass_mtcfg:1;
 	u8 supports_mmio_ext:1;
 };
@@ -298,6 +299,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_uid = true,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -577,6 +579,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_uid = desc->has_uid;
 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
 	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
-- 
2.25.1

