Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2718C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 13:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6861510F1F5;
	Thu,  6 Aug 2026 13:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQH/6hj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9CE10E285
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786024723; x=1817560723;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XJ3CBY8ukYJXvH2Ec6yodpMHJLw96DHSJTF/T81FCSE=;
 b=HQH/6hj3/EDfWT3OHrtH61RC0628uxwsalDKO5AgkdROmoxYbbFry+J2
 5DB8oDktfk2lWCYh7XVpF55btI0p4ZeCITtS3zSb/gqMEwKmDyyRdanTW
 z3PcRKV8LbgpfLWP2OmIz4u6oCFG7Y+lv7tpv6EuBVgvEIBa53N+tcFLF
 psAIBINLzFgJx6PKhWI09gGEF57kpcm7ihzuKR2u3WabyC29Ak3UkZdZ9
 tUAz633pd9OzZ0y4UJmAnXRTpqz63RT2Jb+SXFcrVZyYXQdmlMTnlkjgk
 GC9Fq67xT4ENeKENsXRUryYC2R1CQgWfoI8DUVEi20H64L4f58tNOauVD w==;
X-CSE-ConnectionGUID: lEc4aWQ9QLeK+6aKUBrKLQ==
X-CSE-MsgGUID: XxOH6L3aR/y/INFcVzTI1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141364"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="89141364"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 06:58:43 -0700
X-CSE-ConnectionGUID: 8zUlcl/RQ4uIcfPWNZpnqw==
X-CSE-MsgGUID: bmQSWkVCRO6uZpTqkK0fyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="265594956"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 06:58:43 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH 7/7] drm/xe/vsec: support late bind fw information
Date: Thu,  6 Aug 2026 06:58:27 -0700
Message-ID: <20260806135820.1422040-16-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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

CRI FW is loaded on power on.  Because of this, access to
the FW cannot be done until it is running.

Update the XE PMT probe and access to check for late bind
devices, verify, and wait for the appropriate FW state
before probe or access.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_vsec.c         | 131 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
 4 files changed, 135 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d25d02b24898..ee5e2e28e07e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1129,7 +1129,9 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
+	err = xe_vsec_init(xe);
+	if (err)
+		goto err_unregister_display;
 
 	err = xe_sriov_init_late(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 03a7bb08adf7..0a6b6630b945 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -463,6 +463,10 @@ struct xe_device {
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
 		struct mutex lock;
+		/** @pmt.work: support late-bind probe */
+		struct delayed_work work;
+		/** @pmt.retry_count: late-bind probe retry */
+		u32 retry_count;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index b84ec9088de7..9de32564fc29 100644
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
@@ -15,6 +16,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_sysctrl.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
@@ -160,6 +162,14 @@ enum capability {
 	WATCHER,
 };
 
+/*
+ * Late bind will delay 100msec for up to 20 seconds
+ */
+#define VSEC_LATE_BIND_DELAY_MSEC	(100)
+#define VSEC_LATE_BIND_RETRY		(200)
+
+static void cri_late_bind_probe(struct xe_device *xe);
+
 static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
@@ -270,6 +280,56 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return -ENODEV;
 }
 
+#define WAITING_FOR_SYCTLR
+#ifdef WAITING_FOR_SYCTLR
+static bool xe_is_oobmsm_fw_ready(struct xe_device *xe)
+{
+	return true;
+}
+#endif
+
+static void cri_late_bind_probe_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, pmt.work.work);
+
+	if (xe_is_oobmsm_fw_ready(xe)) {
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
+		if (xe_is_oobmsm_fw_ready(xe))
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
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
@@ -310,6 +370,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		return -EINVAL;
 	}
 
+	if (!wait_for_fw(xe)) {
+		xe_pm_runtime_put(xe);
+		return -ENODATA;
+	}
+
 	/* set SoC re-mapper index register based on GUID memory region */
 	xe->soc_remapper.set_telem_region(xe, mem_region);
 
@@ -349,6 +414,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	guard(mutex)(&xe->pmt.lock);
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		xe_pm_runtime_put(xe);
+		return -ENODATA;
+	}
 
 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 
@@ -376,6 +445,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	guard(mutex)(&xe->pmt.lock);
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		xe_pm_runtime_get(xe);
+		return -ENODATA;
+	}
 
 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 
@@ -409,12 +482,44 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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
+	 * If was work was cancelled while it was still pending, we need to
+	 * take care of releasing the runtime reference
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
@@ -422,11 +527,11 @@ void xe_vsec_init(struct xe_device *xe)
 
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
@@ -434,12 +539,25 @@ void xe_vsec_init(struct xe_device *xe)
 		break;
 
 	case XE_VSEC_CRI:
+		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
+		xe->pmt.retry_count = 0;
+
+		xe_pm_runtime_get_noresume(xe);
+		if (!xe_is_oobmsm_fw_ready(xe)) {
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
@@ -447,5 +565,10 @@ void xe_vsec_init(struct xe_device *xe)
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

