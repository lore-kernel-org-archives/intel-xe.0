Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F270A606A6B4
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 20:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dGupz/P4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B2B112D15;
	Fri, 20 Nov 2026 20:56:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371CC10E310
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 20:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795208182; x=1826744182;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9E9nnj5zbdvzrD7iabPxZN2AiiilSXfjeTF+EOWiWeU=;
 b=dGupz/P4cSCC9n3Q1UltDOLmMSwHF+sydThZxsCmI3Ow+RZ8+0oCC1af
 Cy2Zc8eYRLMwkpubqNOiBElVEyHyW/APyab8mWNnoYs909G7uLrQlmQs+
 hi95e7z5T8CgqJugGCYjPWicooD5nGFzvBjVz/FiUsiHApPQEJBeG9teH
 PmstVcR7kRZlhwk/xdaZwAZLfOOWBt/NYNx4R8NEcWCvABidGt1PtV3s0
 9xEkIjlo0SqsuHlNhKXbZR3ghE5ScBXPLJs7yYyZ7yLN2HhXrzcYBsOuQ
 zHvFi4XOJIVG4KK2nG1wzaxS+C4px5LswXcb6PUZSnEKMTZGZDzOjOCoD A==;
X-CSE-ConnectionGUID: y992aTWtQZ6HgU8XFWqc9Q==
X-CSE-MsgGUID: tNOgIAHCT/SC9xnOpWawcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136414"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136414"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: tROcxf8iQ4u9c3bc4dJcAQ==
X-CSE-MsgGUID: zGieF7MDSF6109cYLTF0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10908733"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:49 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v21 15/19] drm/xe/vsec: Support late bind fw information
Date: Fri, 20 Nov 2026 12:55:55 -0800
Message-ID: <20261120205540.1220643-36-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CRI FW is loaded on power on.  Because of this, access to the FW cannot
be done until it is running.

Update the XE PMT probe and access to check for late bind devices,
verify, and wait for the appropriate FW state before probe or access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   5 +-
 drivers/gpu/drm/xe/xe_device_types.h |   5 ++
 drivers/gpu/drm/xe/xe_vsec.c         | 122 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h         |   1 +
 4 files changed, 127 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e9a9634744ae..614b7e376739 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1098,7 +1098,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_hwmon_register(xe);
 	if (err)
-		goto err_unregister_display;
+		goto err_unregister_vsec;
 
 	err = xe_i2c_probe(xe);
 	if (err)
@@ -1118,6 +1118,8 @@ int xe_device_probe(struct xe_device *xe)
 
 err_unregister_hwmon:
 	xe_hwmon_unregister(xe);
+err_unregister_vsec:
+	xe_vsec_remove(xe);
 err_unregister_display:
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
@@ -1128,6 +1130,7 @@ int xe_device_probe(struct xe_device *xe)
 void xe_device_remove(struct xe_device *xe)
 {
 	xe_hwmon_unregister(xe);
+	xe_vsec_remove(xe);
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 28b1669a14d8..d1bdd3a872a8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_TYPES_H_
 
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -487,6 +488,10 @@ struct xe_device {
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
index 188eaf13d68f..26ed4e85614f 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -3,6 +3,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/log2.h>
 #include <linux/intel_vsec.h>
@@ -19,6 +20,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_sysctrl.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
@@ -174,6 +176,14 @@ enum capability {
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
@@ -282,6 +292,53 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
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
+	if (!queue_delayed_work(system_freezable_wq, &xe->pmt.work,
+				msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
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
+		if (signal_pending(current)) {
+			drm_warn(&xe->drm, "Late Binding interrupted\n");
+			return false;
+		}
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
@@ -344,6 +401,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		goto dev_exit;
 	}
 
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
 	scoped_guard(mutex, &xe->pmt.lock) {
 		u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
 
@@ -356,6 +418,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 			xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -470,6 +533,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -477,6 +544,7 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 		*reg = readl(disc_addr);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 	drm_dev_exit(idx);
@@ -504,6 +572,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -511,6 +583,7 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 		writel(reg, disc_addr);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 	drm_dev_exit(idx);
@@ -547,6 +620,25 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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
+
+	intel_vsec_register(dev, info);
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
@@ -575,16 +667,36 @@ void xe_vsec_init(struct xe_device *xe)
 	case XE_VSEC_CRI:
 		xe->pmt.base_offset = CRI_PMT_OFFSET;
 		info->priv_data = &xe_cri_pmt_cb;
+
+		xe->pmt.retry_count = 0;
+		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
+
+		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+			xe_pm_runtime_get_noresume(xe);
+			queue_delayed_work(system_freezable_wq, &xe->pmt.work,
+					   msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
+			return;
+		}
 		break;
 
 	default:
-		break;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
+		return;
 	}
 
-	/*
-	 * Register a VSEC. Cleanup is handled using device managed
-	 * resources.
-	 */
 	intel_vsec_register(dev, info);
 }
+
+/**
+ * xe_vsec_remove - cleanup any outstanding resources
+ * @xe: valid xe instance
+ */
+void xe_vsec_remove(struct xe_device *xe)
+{
+	/* Cleanup on Crescent Isle */
+	if (xe->info.platform == XE_CRESCENTISLAND &&
+	    xe->pmt.base_offset == CRI_PMT_OFFSET &&
+	    disable_delayed_work_sync(&xe->pmt.work))
+		xe_pm_runtime_put(xe);
+}
 MODULE_IMPORT_NS("INTEL_VSEC");
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index a25b4e6e681b..e925dba4158b 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -10,6 +10,7 @@ struct device;
 struct xe_device;
 
 void xe_vsec_init(struct xe_device *xe);
+void xe_vsec_remove(struct xe_device *xe);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

