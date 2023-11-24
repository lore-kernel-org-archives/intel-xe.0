Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A69C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 12:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFE110E1CC;
	Fri, 24 Nov 2023 12:14:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB8410E1CA
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700828041; x=1732364041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrzEfwRACMKhjb/RX3wFNqij3RNVTvEpDQFoJPnXkNI=;
 b=V/8FDHK7Fq6VGOj/ys5Q8VWY/t9EH+LhWdnzdHEDj3markqO5FWerR9c
 PjPIXJzb8gvXFTp4IbuWnbaMuDOun95H/bwW4ubpErk0vkuIA3aO4I5kx
 np/lxLLSwETbW0ZCrdqFdJwLJ0LLB3PeJrY2Xv6w3qISIiPXsPCnvSVv9
 59LVDueKuUZ+MzkdfcwNoyuulSTKXUw+eKZkqRkrwrBtmXPWqtNcdbEn1
 R8A2/3mJqzv6PyLortZeMzrYgO/hLwdxiclpxoSEQDD1DbhQW1cm15THY
 +4m2ci/+mCcNSei7fL5XZHaEiC44xnZIP/EVBbW3pOYs097F/vxq0dPC9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396319888"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="396319888"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833679755"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="833679755"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2023 04:13:58 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 17:57:55 +0530
Message-Id: <20231124122755.91279-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
References: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Add vram frequency sysfs attributes
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

/device/tile<n>/memory/freq
			|-vram_rp0_freq
			|-vram_rpn_freq

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 78 +++++++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 5935cfe30204..edde5335bdb1 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -42,6 +42,14 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+#define   XEHP_PCODE_FREQUENCY_CONFIG                  0x6e    /* xehp, pvc */
+/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
+/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
+/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
+#define     PCODE_MBOX_DOMAIN_HBM                      0x2
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index f354c8b2bfc6..ddf5072c40eb 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,9 +7,14 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_gt_types.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 
+#define GT_FREQUENCY_MULTIPLIER        50
+
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -35,11 +40,72 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
 static const struct attribute *physical_memsize_attr =
 	&dev_attr_physical_vram_size_bytes.attr;
 
+static ssize_t vram_rp0_freq_show(struct device *kdev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct kobject *kobj = &kdev->kobj;
+	struct xe_tile *tile = kobj_to_tile(kobj->parent);
+	struct xe_gt *gt = tile->primary_gt;
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
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
+static DEVICE_ATTR_RO(vram_rp0_freq);
+
+static ssize_t vram_rpn_freq_show(struct device *kdev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct kobject *kobj = &kdev->kobj;
+	struct xe_tile *tile = kobj_to_tile(kobj->parent);
+	struct xe_gt *gt = tile->primary_gt;
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
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
+static DEVICE_ATTR_RO(vram_rpn_freq);
+
+static struct attribute *vram_freq_attrs[] = {
+	&dev_attr_vram_rp0_freq.attr,
+	&dev_attr_vram_rpn_freq.attr,
+	NULL
+};
+
+static const struct attribute_group freq_group_attrs = {
+	.name = "freq",
+	.attrs = vram_freq_attrs,
+};
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
-	struct xe_tile *tile = arg;
+	struct kobject *kobj = arg;
 
-	kobject_put(tile->sysfs);
+	sysfs_remove_file(kobj, physical_memsize_attr);
+	sysfs_remove_group(kobj, &freq_group_attrs);
+	kobject_put(kobj);
 }
 
 void xe_tile_sysfs_init(struct xe_tile *tile)
@@ -77,6 +143,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 		drm_warn(&xe->drm,
 			 "Sysfs creation to read addr_range per tile failed\n");
 
+	if (xe->info.platform == XE_PVC) {
+	err = sysfs_create_group(kobj, &freq_group_attrs);
+		if (err) {
+			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
+			return;
+		}
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-- 
2.25.1

