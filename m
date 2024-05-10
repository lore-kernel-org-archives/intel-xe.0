Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC6BC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 21:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE7810E967;
	Fri, 10 May 2024 21:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAHVRaXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2380810E600
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 21:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715374810; x=1746910810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aTMpCeQJMglav/Bx+mnV1l7E7Hf2+f10jzQqkUtx/5I=;
 b=UAHVRaXLJ3lvMhLy5eqPDRCC2S4gAfeDUtSgzNqQYyUKLTGuxyWwvIRA
 TpibEnpp7G8DZ9lEDmUAGSfSfjFD6B1vBznYuiIXPtCssDMGsp3G5Incy
 er+HxEyv1tPID0qpTk237y7OG1Z2n3CfYrt1HrUVSjB77JB5u6iHsw77h
 ZHUW1jXY3AhTZQk2E2+ZwIRi37zFkPjFqoiB1ES1iqV8Gck9oRP/vPrPK
 8X3Us/T5MJHB3NpNkxANrjwWzN4aka6bmX6oL1rlRoIabDTwwMd+UP5Kn
 qzf8h/3Fa1cUQKAsKTUS2i+VzAbKEg/GizH5xvNBPl7lyuGDqxbwhiNe4 g==;
X-CSE-ConnectionGUID: hx0dkTszQICn/miz/UVdBA==
X-CSE-MsgGUID: 8mCGC52YRv6aT5Dfj29XHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22048293"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22048293"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:10 -0700
X-CSE-ConnectionGUID: eKsB0ouhQZuUBjlNt+59cw==
X-CSE-MsgGUID: 4LXu/GeEQcCUD+PR7fqtTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34604097"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:09 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: david.e.box@linux.intel.com, "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 6/6] drm/xe/vsec: Support BMG devices
Date: Fri, 10 May 2024 16:59:38 -0400
Message-ID: <20240510205948.904409-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510205948.904409-1-michael.j.ruhl@intel.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
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

Utilize the PMT callback API to add support for the BMG
devices.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_vsec.c         | 145 +++++++++++++++++++++++++--
 drivers/platform/x86/intel/vsec.c    |   2 +-
 4 files changed, 146 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e77768bc4471..940f4cf0274a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -315,6 +315,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
+	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0af739981ebf..f451216c2283 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -448,6 +448,11 @@ struct xe_device {
 		struct mutex lock;
 	} d3cold;
 
+	struct {
+		/** @pmt.lock: protect access for telemetry data */
+		struct mutex lock;
+	} pmt;
+
 	/**
 	 * @pm_callback_task: Track the active task that is running in either
 	 * the runtime_suspend or runtime_resume callbacks.
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a91aec49d04a..ac840a1e20a4 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -5,9 +5,12 @@
 #include <linux/intel_vsec.h>
 #include <linux/pci.h>
 
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_drv.h"
+#include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_pm.h"
 #include "xe_vsec.h"
 
 #define SOC_BASE		0x280000
@@ -15,6 +18,10 @@
 /* from drivers/platform/x86/intel/pmt/telemetry.c */
 #define TELEM_BASE_OFFSET	0x8
 
+/* Decode the guid information */
+#define GUID_RECORD_MASK GENMASK(1, 0)
+#define GUID_CAP_TYPE    GENMASK(3, 2)
+
 #define DG2_PMT_BASE		0xE8000
 #define DG2_DISCOVERY_START	0x6000
 #define DG2_TELEM_START		0x4000
@@ -22,8 +29,18 @@
 #define DG2_DISCOVERY_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_DISCOVERY_START)
 #define DG2_TELEM_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_TELEM_START)
 
+#define BMG_PMT_BASE		0xDB000
+#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
+
+#define BMG_TELEMETRY_BASE	0xE0000
+#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)
+
 #define GFX_BAR			0
 
+#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
+#define SG_REMAP_ACCESS(_mem)	((_mem) << 24)
+#define SG_REMAP_BITS		GENMASK(31, 24)
+
 static struct intel_vsec_header dg2_telemetry = {
 	.length = 0x10,
 	.id = VSEC_ID_TELEMETRY,
@@ -38,12 +55,106 @@ static struct intel_vsec_header *dg2_capabilities[] = {
 	NULL
 };
 
-static struct intel_vsec_platform_info dg2_vsec_info = {
-	.caps = VSEC_CAP_TELEMETRY,
-	.headers = dg2_capabilities,
-	.quirks = VSEC_QUIRK_EARLY_HW | VSEC_QUIRK_P2SB_OFFSET,
+static struct intel_vsec_header bmg_telemetry = {
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 2,
+	.entry_size = 4,
+	.tbir = GFX_BAR,
+	.offset = BMG_DISCOVERY_OFFSET,
+};
+
+static struct intel_vsec_header *bmg_capabilities[] = {
+	&bmg_telemetry,
+	NULL
+};
+
+enum xe_vsec {
+	XE_VSEC_UNKNOWN = 0,
+	XE_VSEC_DG2,
+	XE_VSEC_BMG,
+};
+
+static struct intel_vsec_platform_info xe_vsec_info[] = {
+	[XE_VSEC_DG2] = {
+		.caps = VSEC_CAP_TELEMETRY,
+		.headers = dg2_capabilities,
+		.quirks = VSEC_QUIRK_EARLY_HW | VSEC_QUIRK_P2SB_OFFSET,
+	},
+	[XE_VSEC_BMG] = {
+		.caps = VSEC_CAP_TELEMETRY,
+		.headers = bmg_capabilities,
+	},
+	{ }
 };
 
+#define PUNIT_AGGREGATOR 0
+#define OOBMSM_AGG0      1
+
+/*
+ * The telemetry memory space shares a common offset.  To get the appropriate
+ * data, set the index based on the GUID bits.
+ *
+ * The GUID will have the following bits to decode:
+ *   (2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
+ *   (2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
+ *   ... <other that are not currently relevant>
+ *
+ * Currently only the record-id is set.  Once the other bits are set, the
+ * decode path will get a little more complex.
+ */
+static int xe_pmt_telem_read(void *args, u32 guid, u64 *data, u32 count)
+{
+	struct xe_device *xe = pdev_to_xe_device((struct pci_dev *)args);
+	void __iomem *telem_addr = xe->tiles[0].mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 telem_region = guid & GUID_RECORD_MASK;
+	int ret = 0;
+
+	/* Update the base offset (if necessary) for the specific telementry region */
+	switch (telem_region) {
+	case PUNIT_AGGREGATOR:
+		telem_addr += 0x200;
+		break;
+	case OOBMSM_AGG0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&xe->pmt.lock);
+	if (xe_pm_runtime_get_if_active(xe) > 0) {
+		/* set SoC re-mapper index register based on guid memory region */
+		xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1, SG_REMAP_BITS,
+			      SG_REMAP_ACCESS(telem_region));
+
+		memcpy_fromio(data, telem_addr, count);
+
+		xe_pm_runtime_put(xe);
+
+		ret = count;
+	}
+	mutex_unlock(&xe->pmt.lock);
+
+	return ret;
+}
+
+struct pmt_callbacks xe_pmt_cb = {
+	.read_telem = xe_pmt_telem_read,
+};
+
+static const int vsec_platforms[] = {
+	[XE_DG2] = XE_VSEC_DG2,
+	[XE_BATTLEMAGE] = XE_VSEC_BMG,
+};
+
+static enum xe_vsec get_platform_info(struct xe_device *xe)
+{
+	if (xe->info.platform > XE_BATTLEMAGE)
+		return XE_VSEC_UNKNOWN;
+
+	return vsec_platforms[xe->info.platform];
+}
+
 /*
  * Access the DG2 PMT MMIO discovery table
  *
@@ -92,15 +203,35 @@ static int dg2_adjust_offset(struct pci_dev *pdev, struct device *dev,
  */
 void xe_vsec_init(struct xe_device *xe)
 {
-	struct intel_vsec_platform_info *info = &dg2_vsec_info;
+	struct intel_vsec_platform_info *info;
 	struct device *dev = xe->drm.dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
+	enum xe_vsec platform;
 	u32 ret;
 
-	ret = dg2_adjust_offset(pdev, dev, info);
-	if (ret)
+	platform = get_platform_info(xe);
+	if (platform == XE_VSEC_UNKNOWN)
+		return;
+
+	info = &xe_vsec_info[platform];
+	if (!info->headers)
 		return;
 
+	switch (platform) {
+	case XE_VSEC_DG2:
+		ret = dg2_adjust_offset(pdev, dev, info);
+		if (ret)
+			return;
+		break;
+
+	case XE_VSEC_BMG:
+		info->priv_data = &xe_pmt_cb;
+		break;
+
+	default:
+		break;
+	}
+
 	/*
 	 * Register a VSEC. Cleanup is handled using device managed
 	 * resources.
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 5a0dfc21eb0f..f59f8ac87b4e 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -341,7 +341,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 void intel_vsec_register(struct pci_dev *pdev,
 			 struct intel_vsec_platform_info *info)
 {
-	if (!pdev || !info)
+	if (!pdev || !info || !info->headers)
 		return;
 
 	intel_vsec_walk_header(pdev, info);
-- 
2.44.0

