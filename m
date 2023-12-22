Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295B6C41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 10:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A091710E03B;
	Fri, 22 Dec 2023 10:51:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE3B10E03B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703242299; x=1734778299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bJJymXjpet9A3WPpkMJauIEH6fEAtFK3ezEqZpgIf/4=;
 b=Qiicy8y9p6/t9c2UEq78hGBv4MN0pf/I1BRPNdvF5PKNxf+T6ctYd5FA
 vTmm+x+EYacbSAmAZIeF5zYKbsE+1EyaxJEN60aP6Ph6RWJ1uGt9CaJ5p
 YB6dqnctCezNRhOYC2Uhu8EJZWN0pB2ZqO228jtjdkDf2soalZDMVsOVl
 rvk6oB0UL2DjZ+NU4C43HpvjSE8K7Dr284mS8sv9u2WxLYuspPmL6hy6p
 1GsycTX4H0karRo0gqARgV3twtFH4QMOc1ZwwcDghWtKu9CRHkxccr/lU
 8MhsZyFew0kjXDT5sXb6O07l3nNxt4K6v7uXfAHp2gWlrAxW0uNgDnliM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3359598"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="3359598"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 02:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920612799"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="920612799"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2023 02:51:36 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [v6] drm/xe: Add vram frequency sysfs attributes
Date: Fri, 22 Dec 2023 16:36:31 +0530
Message-Id: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
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

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h  |  7 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 86 ++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

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
index 0f8d3e7fce46..cdc9dbbc97b0 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,9 +7,21 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_gt_types.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 
+/**
+ * DOC: Xe Tile sysfs
+ *
+ * Provides sysfs entries for frequency in tile
+ *
+ * device/tile#/memory/freq0/max_freq - Maximum Frequency, not a configuration and read-only.
+ * device/tile#/memory/freq0/min_freq - Minimum Frequency, not a configuration and read-only.
+ */
+
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -20,6 +32,65 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
+static ssize_t max_freq_show(struct device *kdev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct kobject *kobj = &kdev->kobj;
+	struct xe_tile *tile = kobj_to_tile(kobj->parent);
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
+static ssize_t min_freq_show(struct device *kdev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct kobject *kobj = &kdev->kobj;
+	struct xe_tile *tile = kobj_to_tile(kobj->parent);
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
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
 	struct kobj_tile *kt;
+	struct kobject *kobj;
 	int err;
 
 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
@@ -50,6 +122,20 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
+	if (xe->info.platform == XE_PVC) {
+		kobj = kobject_create_and_add("memory", tile->sysfs);
+		if (!kobj)
+			drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
+	}
+
+	if (kobj && xe->info.platform == XE_PVC) {
+		err = sysfs_create_group(kobj, &freq_group_attrs);
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

