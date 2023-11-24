Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421BAC624B4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 14:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2F010E0AD;
	Fri, 24 Nov 2023 14:04:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929BC10E0AD
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700834637; x=1732370637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PS/lFxr+1bt+eu3X9WXBCmf07mWO43ccTxDkFkP8+WE=;
 b=BZq78+NK+BcBv+9SqOO/mFRo3WfxIJyWi2HBlEFw9jEm8/xlnWBIrqDD
 TpWIlGXnbtafjMMHt0F/n/5PCkdFg0bz3YGh4ppOTKvEorqkmlJ6lsF0M
 uWP/jdWEP3wmptuT5bIuVq10SL4nwS6LmTIP0P8BWAYqQXyu5vNMZwG31
 t3EQG1J+UDMQi5pR/oD+ZvDimX+3TAJRFHmjklorvhuflah2IdTy+fHl6
 MqAK7AET08C8xVLyUTpiP2+2Hmzv95N578ggk9NwNFj3UfE0c6oJ9cD5U
 lefS87MGUUS7kJfgf6NCn2eV8SlkcvNha7P1sjyBUiuquzlKGkA0XbImI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391302258"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391302258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 06:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="760968469"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="760968469"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 06:03:55 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 19:43:10 +0530
Message-Id: <20231124141311.3894165-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124141311.3894165-1-tejas.upadhyay@intel.com>
References: <20231124141311.3894165-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 2/3] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
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

On ATS-M CSC firmware calculated unique device id(uid) can be
read from defined registers. Only ATS-M has this way of reading
uid. Also ATS-M customer require this solution to locate and name
their devices effectively.

Consumer of csc uid is level0 sysman and end users using sysman.

This patch exports uid to the userspace via sysfs.
For example, uid can be read by:
cat /sys/class/drm/cardX/device/csc_uid

V2(Michal):
  - Make separate patch for csc uid capability
  - Use %#llx for 0x
  - Dump error value when sysfs creation fails
  - Have consistency in csc uid name

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
 drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 4 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ec9372aa739f..3599c7b38b61 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -71,6 +71,9 @@
 #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
 #define   SGSI_SIDECLK_DIS			REG_BIT(17)
 
+#define DEVUID_LWORD				XE_REG(0x102008)
+#define DEVUID_HWORD				XE_REG(0x10200C)
+
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
 #define   GGMS_MASK				REG_GENMASK(7, 6)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8be765adf702..6c8a9f9d69c9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -342,6 +342,15 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
 		xe_gt_sanitize(gt);
 }
 
+static void xe_read_csc_uid(struct xe_device *xe)
+{
+	if (xe->info.has_csc_uid) {
+		struct xe_gt *mmio = xe_root_mmio_gt(xe);
+
+		xe->info.csc_uid  = xe_mmio_read64_2x32(mmio, DEVUID_LWORD);
+	}
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -366,6 +375,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_read_csc_uid(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 99113a5a2b84..4fbf0275d3bf 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
+static ssize_t csc_uid_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid);
+}
+
+static DEVICE_ATTR_RO(csc_uid);
+
 static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);
 }
 
 void xe_device_sysfs_init(struct xe_device *xe)
@@ -83,6 +96,14 @@ void xe_device_sysfs_init(struct xe_device *xe)
 		return;
 	}
 
+	if (xe->info.has_csc_uid) {
+		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
+		if (ret) {
+			drm_warn(&xe->drm, "UID sysfs setup failed err=%pe\n", ERR_PTR(ret));
+			return;
+		}
+	}
+
 	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
 	if (ret)
 		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a28257b26355..eb3897309dac 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -238,6 +238,8 @@ struct xe_device {
 		u8 vm_max_level;
 		/** @va_bits: Maximum bits of a virtual address */
 		u8 va_bits;
+		/** @csc_uid: device uid calculated by CSC FW, used for generating uuid */
+		u64 csc_uid;
 
 		/** @is_dgfx: is discrete device */
 		u8 is_dgfx:1;
-- 
2.25.1

