Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1E8C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 12:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3E210E5EF;
	Fri,  5 Jan 2024 12:29:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802E910E5EF
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704457794; x=1735993794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=INkUancE3Bqkh58pq1HUdbUYtE1q3QoFPm54fByeDLI=;
 b=QATu1PLrQuEoOs/2BUFLK+tkfOrT+Ui8z0Z9/WrYcfoxwH26MQ9pdAYq
 IydKiSbs+V4h5onLTJWZCMEf50lSdqGuXtRgAejf20uysjCuxvAezFdgF
 sad5H6xFnBOYmiRTxy1MiJ1goBjOaxFMh4gTKy1rpCFhk0LAG2xMWawfu
 H0dR7xa8BzKlxlp00pg5DjnvXAcxjF2ni2ViMXmX2/ZhyPvFnBBDG66a8
 FAlyaH0kgHygar2s93Q3uMGpQ3z9kwDTBBU+6K9/y3lflRev8UUWMaiqu
 LjcsIPrsbx/wV55GV6cgRnG52BAKCHwDLP7E80dWAfhiNmsIXb+50oLDj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="401283697"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="401283697"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 04:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="924216968"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="924216968"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2024 04:29:50 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [v8] drm/xe: Add vram frequency sysfs attributes
Date: Fri,  5 Jan 2024 18:15:03 +0530
Message-Id: <20240105124503.1821966-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add vram frequency sysfs attributes under the below hierarchy;

/device/tile#/memory/freq0
			|-max_freq
			|-min_freq

v2: Drop "vram" from attribute names (Rodrigo)

v3: Add documentation for new sysfs (Riana)
    Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)

v4: Create sysfs under tile#/freq0 after removal of
    physical_memsize attrbute

v5: Revert back to creating sysfs under tile#/memory/freq0
    Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)

v6: Rename attributes to max/min_freq (Anshuman)
    Fix review comments (Rodrigo)

v7: Make documentation more verbose
    Move sysfs to separate file (Anshuman)

v8: Fix platform specific conditions and add kernel docwq (Anshuman)
    Fix typos and remove redundant headers (Riana)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
 drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
 drivers/gpu/drm/xe/xe_vram_freq.c  | 129 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram_freq.h  |  13 +++
 5 files changed, 153 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c
 create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index df8601d6a59f..17884e422cec 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -139,6 +139,7 @@ xe-y += xe_bb.o \
 	xe_uc_debugfs.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vram_freq.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
 	xe_wopcm.o
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 5935cfe30204..f153ce96f69a 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -42,6 +42,13 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+#define   PCODE_FREQUENCY_CONFIG		0x6e
+/* Frequency Config Sub Commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
+/* Domain IDs (param2) */
+#define     PCODE_MBOX_DOMAIN_HBM		0x2
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 0f8d3e7fce46..ed60d12f5cf0 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -9,6 +9,7 @@
 
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
+#include "xe_vram_freq.h"
 
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
@@ -50,6 +51,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
+	xe_vram_freq_init(tile);
+
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
 	if (err)
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
new file mode 100644
index 000000000000..ea8b4511767c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+#include <linux/sysfs.h>
+#include <drm/drm_managed.h>
+
+#include "xe_gt_types.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
+#include "xe_tile.h"
+#include "xe_tile_sysfs.h"
+#include "xe_vram_freq.h"
+
+/**
+ * DOC: Xe VRAM freq
+ *
+ * Provides sysfs entries for vram frequency in tile
+ *
+ * device/tile#/memory/freq0/max_freq - This is maximum frequency. This value is read-only as it
+ *					is the fixed fuse point P0. It is not the system
+ *					configuration.
+ * device/tile#/memory/freq0/min_freq - This is minimum frequency. This value is read-only as it
+ *					is the fixed fuse point PN. It is not the system
+ *					configuration.
+ */
+
+static struct xe_tile *dev_to_tile(struct device *dev)
+{
+	return kobj_to_tile(dev->kobj.parent);
+}
+
+static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct xe_tile *tile = dev_to_tile(dev);
+	struct xe_gt *gt = tile->primary_gt;
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
+
+	err = xe_pcode_read(gt, mbox, &val, NULL);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= 50;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+static DEVICE_ATTR_RO(max_freq);
+
+static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct xe_tile *tile = dev_to_tile(dev);
+	struct xe_gt *gt = tile->primary_gt;
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
+
+	err = xe_pcode_read(gt, mbox, &val, NULL);
+	if (err)
+		return err;
+
+	/* data_out - Fused Pn for domain ID in units of 50 MHz */
+	val *= 50;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+static DEVICE_ATTR_RO(min_freq);
+
+static struct attribute *freq_attrs[] = {
+	&dev_attr_max_freq.attr,
+	&dev_attr_min_freq.attr,
+	NULL
+};
+
+static const struct attribute_group freq_group_attrs = {
+	.name = "freq0",
+	.attrs = freq_attrs,
+};
+
+static void vram_freq_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_group(kobj, &freq_group_attrs);
+	kobject_put(kobj);
+}
+
+/*
+ * xe_vram_freq_init - Initialize vram frequency component
+ * @tile: Xe Tile object
+ *
+ * It needs to be initialized after the main tile component is ready
+ */
+
+void xe_vram_freq_init(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct kobject *kobj;
+	int err;
+
+	if (xe->info.platform != XE_PVC)
+		return;
+
+	kobj = kobject_create_and_add("memory", tile->sysfs);
+	if (!kobj)
+		drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
+
+	err = sysfs_create_group(kobj, &freq_group_attrs);
+	if (err) {
+		kobject_put(kobj);
+		drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, vram_freq_fini, kobj);
+	if (err)
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+}
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h b/drivers/gpu/drm/xe/xe_vram_freq.h
new file mode 100644
index 000000000000..ae3ed6ce68f8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_freq.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_FREQ_H_
+#define _XE_VRAM_FREQ_H_
+
+struct xe_tile;
+
+void xe_vram_freq_init(struct xe_tile *tile);
+
+#endif /* _XE_VRAM_FREQ_H_ */
-- 
2.25.1

