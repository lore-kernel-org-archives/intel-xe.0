Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15082C982D4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 20:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C257110E51C;
	Wed, 16 Sep 2026 20:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AK+eg0gF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4425C10E3C2
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789589522; x=1821125522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pVtOOf9xYV0aJxkkcyEulC8MRtp+ab4M7mjQ3dkbdkc=;
 b=AK+eg0gFISPssj3S6IdckhPhEj9rZ6BnhYA8nfDkqGNxS3yaxY/SNGYL
 WjgnhXtJaG2CcnN0FhcuRpZ8q5xb2DRKOvBIOt++eUBr2soTO8rNIMoB8
 wzWXfIzKOlbcpR4hMXpJV0lmeaennmpZl99arYaLqa+o/TL8OM7efbX7I
 sek5Hp0jk3l5wLW3HWUSMMx8StGTiXkVTgSWIuwaNQl1qa+MfMdUUaAQf
 8qTq9BQTSJ5WZtw2T020u7tjAyx6DdsaqLPo5rdQh8jXGqjjFGIeJ4sp4
 lyNo8ZqniqdPCv6lm2C6B/I9xZYov7DtUAE3Jo4gt6nfsWb0mfU7AXrs5 Q==;
X-CSE-ConnectionGUID: oNrU/zy1SuK20UxFxDcjCg==
X-CSE-MsgGUID: gcPhP/xFSA6Qcu9VVJ/LSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296217"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100296217"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 13:12:02 -0700
X-CSE-ConnectionGUID: FnKQgTKTRPm9lcqUtJy/cA==
X-CSE-MsgGUID: LjTSHXCGQXGptutLAoNetA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277574047"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 13:12:02 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v9 17/20] drm/xe/vsec: Support late bind fw information
Date: Wed, 16 Sep 2026 13:11:55 -0700
Message-ID: <20260916201139.2374531-39-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
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

CRI FW is loaded on power on.  Because of this, access to the FW cannot
be done until it is running.

Update the XE PMT probe and access to check for late bind devices,
verify, and wait for the appropriate FW state before probe or access.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h |   5 ++
 drivers/gpu/drm/xe/xe_vsec.c         | 129 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
 4 files changed, 134 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3ec950606e67..a2c8c7909688 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1053,7 +1053,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	xe_vsec_init(xe);
+	err = xe_vsec_init(xe);
+	if (err)
+		goto err_unregister_display;
 
 	xe_debugfs_register(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e08348a95b28..8f5cc5d65419 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_TYPES_H_
 
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -488,6 +489,10 @@ struct xe_device {
 		struct mutex lock;
 		/** @pmt.base_offset: device specific base offset */
 		u64 base_offset;
+		/** @pmt.work: support late-bind probe */
+		struct delayed_work work;
+		/** @pmt.retry_count: late-bind probe retry */
+		u32 retry_count;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index d1427ec50728..f905ef51df65 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -3,6 +3,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/intel_vsec.h>
 #include <linux/module.h>
@@ -18,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_sysctrl.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
@@ -173,6 +175,14 @@ enum capability {
 	WATCHER,
 };
 
+/*
+ * Late bind will delay 100msec for up to 20 seconds
+ */
+#define VSEC_LATE_BIND_DELAY_MSEC	100
+#define VSEC_LATE_BIND_RETRY		200
+
+static void cri_late_bind_probe(struct xe_device *xe);
+
 static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
@@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return -ENODEV;
 }
 
+static void cri_late_bind_probe_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, pmt.work.work);
+
+	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+		cri_late_bind_probe(xe);
+		xe_pm_runtime_put(xe);
+		return;
+	}
+
+	xe->pmt.retry_count++;
+
+	/* wait up to 20 seconds */
+	if (xe->pmt.retry_count == VSEC_LATE_BIND_RETRY) {
+		drm_warn(&xe->drm, "PMT probe: Late Binding failed to complete\n");
+		xe_pm_runtime_put(xe);
+		return;
+	}
+
+	if (!schedule_delayed_work(&xe->pmt.work, msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
+		xe_pm_runtime_put(xe);
+}
+
+static bool wait_for_fw(struct xe_device *xe)
+{
+	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
+
+	if (xe->info.platform != XE_CRESCENTISLAND)
+		return true;
+
+	while (retries--) {
+		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
+			return true;
+
+		msleep(VSEC_LATE_BIND_DELAY_MSEC);
+	}
+
+	drm_warn(&xe->drm, "Late Binding failed to complete\n");
+
+	return false;
+}
+
 /**
  * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
  * @dev: valid Xe device
@@ -342,6 +394,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		goto dev_exit;
 	}
 
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
 	scoped_guard(mutex, &xe->pmt.lock) {
 		/* set SoC re-mapper index register based on GUID memory region */
 		xe->soc_remapper.set_telem_region(xe, mem_region);
@@ -349,6 +406,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		memcpy_fromio(data, telem_addr, count);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -396,6 +454,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -403,6 +465,7 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 		*reg = readl(disc_addr);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -433,6 +496,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -440,6 +507,7 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 		writel(reg, disc_addr);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -476,12 +544,46 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	return vsec_platforms[xe->info.platform];
 }
 
+static void cri_late_bind_probe(struct xe_device *xe)
+{
+	struct intel_vsec_platform_info *info;
+	struct device *dev = xe->drm.dev;
+	enum xe_vsec platform;
+
+	platform = get_platform_info(xe);
+	if (platform != XE_VSEC_CRI)
+		return;
+
+	info = &xe_vsec_info[platform];
+	if (!info->headers)
+		return;
+
+	guard(mutex)(&xe->pmt.lock);
+
+	info->priv_data = &xe_cri_pmt_cb;
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	intel_vsec_register(dev, info);
+}
+
+static void vsec_disable_late_bind_work(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	/*
+	 * If the queued work is canceled, the runtime reference needs to be
+	 * released here.
+	 */
+	if (disable_delayed_work_sync(&xe->pmt.work))
+		xe_pm_runtime_put(xe);
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
  * @xe: valid xe instance
  */
-void xe_vsec_init(struct xe_device *xe)
+int xe_vsec_init(struct xe_device *xe)
 {
 	struct intel_vsec_platform_info *info;
 	struct device *dev = xe->drm.dev;
@@ -489,11 +591,11 @@ void xe_vsec_init(struct xe_device *xe)
 
 	platform = get_platform_info(xe);
 	if (platform == XE_VSEC_UNKNOWN)
-		return;
+		return 0;
 
 	info = &xe_vsec_info[platform];
 	if (!info->headers)
-		return;
+		return 0;
 
 	switch (platform) {
 	case XE_VSEC_BMG:
@@ -503,12 +605,26 @@ void xe_vsec_init(struct xe_device *xe)
 
 	case XE_VSEC_CRI:
 		xe->pmt.base_offset = CRI_PMT_OFFSET;
+
+		xe->pmt.retry_count = 0;
+		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
+
+		xe_pm_runtime_get_noresume(xe);
+		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+			schedule_delayed_work(&xe->pmt.work,
+					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
+			return devm_add_action_or_reset(xe->drm.dev,
+							vsec_disable_late_bind_work,
+							xe);
+		}
+
 		info->priv_data = &xe_cri_pmt_cb;
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 		break;
 
 	default:
-		break;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
+		return 0;
 	}
 
 	/*
@@ -516,5 +632,10 @@ void xe_vsec_init(struct xe_device *xe)
 	 * resources.
 	 */
 	intel_vsec_register(dev, info);
+
+	if (platform == XE_VSEC_CRI)
+		xe_pm_runtime_put(xe);
+
+	return 0;
 }
 MODULE_IMPORT_NS("INTEL_VSEC");
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index a25b4e6e681b..c4a1e2fc67d8 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -9,7 +9,7 @@
 struct device;
 struct xe_device;
 
-void xe_vsec_init(struct xe_device *xe);
+int xe_vsec_init(struct xe_device *xe);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

