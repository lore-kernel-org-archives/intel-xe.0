Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A390BC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 10:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B71510E08E;
	Thu, 14 Dec 2023 10:57:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F3710E188
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702551439; x=1734087439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TQhxa576YH88CUjtdHxHaWIbKADSeyWhdyyvCWrTwfA=;
 b=m+3j8CunpdV0jP2aKMpvlDB4fjvkocJL5+BcDN6HiVQmTzOIg74plzTA
 46OFr3jmjxS+B4aGBQTkHbI7BuQ1TNZDljbyT/7LU+p3fJnTS3xBfkIp0
 zHk7ThbTNYmvEl3l3jQqHddjLtirtM6MnFL0gHra4C0ox+0V1Io3wrmQQ
 sWeE+bdjhkHJ6iuJVgGOtZwa3y0IgXS3/BuA9zgP6WJFFQV9ijVag4We8
 eQJpgtIXJWiBcdTIpyBLHwc9Rx4Y2QDtbgZNfsOdhSizGLyA0qJOGziAt
 ae56RclJspLCXdvpDcvuOHgKJGoiAQ4NWU00oov3i0/MDS18hVPnmyrCb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8499797"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="8499797"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 02:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="774320098"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="774320098"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga002.jf.intel.com with ESMTP; 14 Dec 2023 02:57:13 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [v4] drm/xe: Add vram frequency sysfs attributes
Date: Thu, 14 Dec 2023 16:41:59 +0530
Message-Id: <20231214111159.149984-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add vram frequency sysfs attributes under the below hierarchy;

/device/tile#/freq0
		|-rp0_freq
		|-rpn_freq

v2: Drop "vram" from attribute names (Rodrigo)

v3: Add documentation for new sysfs (Riana)
    Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)

v4: Create sysfs under tile#/freq0 after removal of
    physical_memsize attrbute

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 80 ++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 5935cfe30204..26ceb8c0c010 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -42,6 +42,14 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+ #define   PCODE_FREQUENCY_CONFIG		0x6e
+/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
+/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
+/* PCODE_FREQUENCY_CONFIG param2 */
+#define     PCODE_MBOX_DOMAIN_HBM		0x2
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 0f8d3e7fce46..45518442ed15 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,9 +7,23 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_gt_types.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 
+#define GT_FREQUENCY_MULTIPLIER	50
+
+/**
+ * DOC: Xe Tile sysfs
+ *
+ * Provides sysfs entries for memory related frequency in tile
+ *
+ * device/tile#/freq0/rp0_freq - The Render Performance 0 level, which is the maximum one.
+ * device/tile#/freq0/rpn_freq - The Render Performance N level, which is the minimal one.
+ */
+
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -20,10 +34,68 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
+static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
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
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+static DEVICE_ATTR_RO(rp0_freq);
+
+static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
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
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+static DEVICE_ATTR_RO(rpn_freq);
+
+static struct attribute *freq_attrs[] = {
+	&dev_attr_rp0_freq.attr,
+	&dev_attr_rpn_freq.attr,
+	NULL
+};
+
+static const struct attribute_group freq_group_attrs = {
+	.name = "freq0",
+	.attrs = freq_attrs,
+};
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
 
+	sysfs_remove_group(tile->sysfs, &freq_group_attrs);
 	kobject_put(tile->sysfs);
 }
 
@@ -50,6 +122,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
+	if (xe->info.platform == XE_PVC) {
+		err = sysfs_create_group(tile->sysfs, &freq_group_attrs);
+		if (err) {
+			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
+			return;
+		}
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
 	if (err)
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-- 
2.25.1

