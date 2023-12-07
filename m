Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B02C10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B4C10E8D0;
	Thu,  7 Dec 2023 15:03:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1813610E8D0
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701961412; x=1733497412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PvrAkHGx6lIbDs1GL7s8YPDZbPcyB4toA0yERH1ofYs=;
 b=HjD4tP+WjS7Llz4+tWpD3dmoxsKoDy0tIxCGSlBlACW6HeKTPavXoS/r
 3RDujgOdyb+btN5X9FXhBxxv6TXB5v5qyLlBJTEuy7oe2PWrnZi7hWcwT
 4KQa1lFt2tLSbFhjBWy8CgsHUOnO82Gf9DDyitl8uUjSRko8LgziRAOLC
 ZAfOXBAkqpre+IixkbcOxpg+SohTX+nnBSUhxcMCxLAJ6s6FwxxXXgkzo
 oeYs7qq7ycu5PlAqKctkhKGRhMSzYcijhrTm6NDjg9gIW6kIyvCNE9nLZ
 2iFqskSDAnYodmfC0dOjiYTugcueUOQmjTe+Rj3uuoILAqiL1zaTDvXT8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1348968"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1348968"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721491087"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721491087"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga003.jf.intel.com with ESMTP; 07 Dec 2023 07:03:28 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [v3 2/2] drm/xe: Add vram frequency sysfs attributes
Date: Thu,  7 Dec 2023 20:47:39 +0530
Message-Id: <20231207151739.1241374-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add vram frequency sysfs attributes under the below hierarchy;

/device/tile<n>/memory/freq
			|-rp0_freq
			|-rpn_freq

v2: Drop "vram" from attribute names (Rodrigo)

v3: Add documentation for new sysfs (Riana)
    Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 82 ++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 5935cfe30204..702cf921b85a 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -42,6 +42,14 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+#define   PCODE_FREQUENCY_CONFIG		0x6e    /* xehp, pvc */
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
index 64be1f3a38a9..18c0d73c56dd 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,9 +7,24 @@
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
+ * Provides sysfs entries for memory and related frequency in tile
+ *
+ * device/tile#/memory/physical_vram_size_bytes - physical memory size in bytes
+ * device/tile#/memory/freq/rp0_freq - The Render Performance (RP) 0 level, which is the maximum one.
+ * device/tile#/memory/freq/rpn_freq - The Render Performance (RP) N level, which is the minimal one.
+ */
+
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -35,6 +50,65 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
 static const struct attribute *physical_memsize_attr =
 	&dev_attr_physical_vram_size_bytes.attr;
 
+static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
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
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+static DEVICE_ATTR_RO(rp0_freq);
+
+static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
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
+	.name = "freq",
+	.attrs = freq_attrs,
+};
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct kobject *kobj = arg;
@@ -78,6 +152,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 		drm_warn(&xe->drm,
 			 "Sysfs creation to read addr_range per tile failed\n");
 
+	if (kobj && xe->info.platform == XE_PVC) {
+		err = sysfs_create_group(kobj, &freq_group_attrs);
+		if (err) {
+			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
+			return;
+		}
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, kobj);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-- 
2.25.1

