Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6103CC54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1CB10E5F3;
	Thu, 16 Nov 2023 14:17:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC3310E5F3
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700144239; x=1731680239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2H5k1yAaDue8nx7sdL6kXE3/P+Fzm5zeN0E5VL6BOxQ=;
 b=IRC/FnQ5M6Ywi/KvlcSs7Bv3wuMjscScnKAKv131MjFsnNx4LXvRmPdT
 ox+4TJRSFzpNeDFrxlpCJgbVMYbvU5GMlVsfjxb4I9h/mM+qHhgYx/zeE
 Ti8LYIeJEf4slnciZpMuWaPFLI+zi2xflejHCaVEilf5Bwz1z29u8OxDi
 zvYEG/C38MvyEd9rmMzQAS2pUIMYjeGFn62rCTubkim3igEH5ivinp/Sb
 OT+oUnQ2/QRhOZnuMH0HIj27ayT0xFeCaS/x/f4aWz9SE828CD+SLT0OI
 ZntvGmRk9lleQaDDqd7X3t2fVZ0/x4OB7F1j4G3+spD1e21aQQG/YNGIx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12643396"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="12643396"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:17:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715230489"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="715230489"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga003.jf.intel.com with ESMTP; 16 Nov 2023 06:17:16 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 20:00:43 +0530
Message-Id: <20231116143043.908412-5-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 4/4] drm/xe: Add vram frequency sysfs attributes
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
 vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add vram rp0/n frequency sysfs attribuites under
/device/../tile<n>/memory/freq/vram_rp0/n_freq

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h  |  8 ++++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 77 ++++++++++++++++++++++++++++--
 2 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 5935cfe30204..c003a423562c 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -42,6 +42,14 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
+/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
+/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
+/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
+#define     PCODE_MBOX_DOMAIN_HBM			0x2
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index d61c6fb1df40..2a6a515f48e8 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,9 +7,15 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_gt.h"
+#include "xe_gt_sysfs.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 
+#define GT_FREQUENCY_MULTIPLIER	50
+
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -34,6 +40,58 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
 static const struct attribute *physical_memsize_attr =
 	&dev_attr_physical_vram_size_bytes.attr;
 
+static ssize_t vram_rp0_freq_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
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
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(vram_rp0_freq);
+
+static ssize_t vram_rpn_freq_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
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
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(vram_rpn_freq);
+
+static const struct attribute *vram_freq_attrs[] = {
+	&dev_attr_vram_rp0_freq.attr,
+	&dev_attr_vram_rpn_freq.attr,
+	NULL
+};
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -46,7 +104,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
 	struct kobj_tile *kt;
-	struct kobject *kobj;
+	struct kobject *kobj1, *kobj2;
+
 	int err;
 
 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
@@ -65,17 +124,27 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
-	kobj = kobject_create_and_add("memory", tile->sysfs);
-	if (!kobj) {
+	kobj1 = kobject_create_and_add("memory", tile->sysfs);
+	if (!kobj1) {
 		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
 		return;
 	}
 
 	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
-	    sysfs_create_file(kobj, physical_memsize_attr))
+	    sysfs_create_file(kobj1, physical_memsize_attr))
 		drm_warn(&xe->drm,
 			 "Sysfs creation to read addr_range per tile failed\n");
 
+	kobj2 = kobject_create_and_add("freq", kobj1);
+	if (xe->info.platform == XE_PVC) {
+	err = sysfs_create_files(kobj2, vram_freq_attrs);
+		if (err) {
+			kobject_put(&kt->base);
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

