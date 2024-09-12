Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50421EEE241
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9C110EC11;
	Thu, 12 Sep 2024 18:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLRjmQBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA3410EC10
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726166540; x=1757702540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Xx4h78XkRi2YX9j4V7zEPymKp/HefjTZqtEjBwQQ1ck=;
 b=dLRjmQBtg2l9qXvWKyfQ+rUD5XB3EHZUI4tyqSRNaranKHwbj0xW4oFJ
 Nyk1Ij4Ycy9qVo0UHrk5TgTM437W9o+GGd6v01D94u8ZHU3IG+ghj2S+W
 iICwol6izg6YBxtMFCLv3c32BYuxZ27ZvUJ0xZsCt9LFgw85RIhvPUSs5
 9uqYpFmc43u7Jhp22oKr7V6pRBbz8T3r2QEUavYV67ruK2RSbMiGt/AjV
 XFsh3qW0CCXhpM5nYZvHmnADn6V6p2j1h6GAfMks/anOupovSKAZDo+fS
 cpSkTfz8nBVdXpDNXlrq6L6erqATx8c31ZFHI7elo5OINChfv9+Pyed1R g==;
X-CSE-ConnectionGUID: rTAahetESFydY+iS3DMM0w==
X-CSE-MsgGUID: R2xolzqPRg66cFAKSmyztw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36183413"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="36183413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:42:20 -0700
X-CSE-ConnectionGUID: 1tAE+v9wQdyZidjZrFUqpw==
X-CSE-MsgGUID: 7aXXpH9ZRMmPJU32HAsL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="72399423"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:42:19 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 michael.j.ruhl@intel.com
Subject: [PATCH v13 4/4] drm/xe/vsec: Support BMG devices
Date: Thu, 12 Sep 2024 14:42:09 -0400
Message-ID: <20240912184210.914612-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240912184210.914612-1-michael.j.ruhl@intel.com>
References: <20240912184210.914612-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The Battlemage (BMG) discrete graphics card supports
the Platform, Monitoring Technology (PMT) feature
directly on the primary PCI device.

Utilize the PMT callback API to add support for the BMG
devices.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   5 +
 drivers/gpu/drm/xe/xe_device_types.h |   6 +
 drivers/gpu/drm/xe/xe_vsec.c         | 223 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  13 ++
 5 files changed, 248 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index edfd812e0f41..ce4da2b30db3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -109,6 +109,7 @@ xe-y += xe_bb.o \
 	xe_vm.o \
 	xe_vram.o \
 	xe_vram_freq.o \
+	xe_vsec.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
 	xe_wopcm.o
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..c3edb0f36d05 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -54,6 +54,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
 
@@ -373,6 +374,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
+	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err;
@@ -759,6 +762,8 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
+	xe_vsec_init(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c92df0a2423f..cf37af207210 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -487,6 +487,12 @@ struct xe_device {
 		struct mutex lock;
 	} d3cold;
 
+	/** @pmt: Support the PMT driver callback interface */
+	struct {
+		/** @pmt.lock: protect access for telemetry data */
+		struct mutex lock;
+	} pmt;
+
 	/**
 	 * @pm_callback_task: Track the active task that is running in either
 	 * the runtime_suspend or runtime_resume callbacks.
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
new file mode 100644
index 000000000000..1d82ef980b80
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 - 2024 Intel Corporation
+ */
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/intel_vsec.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_drv.h"
+#include "xe_mmio.h"
+#include "xe_platform_types.h"
+#include "xe_pm.h"
+#include "xe_vsec.h"
+
+#define SOC_BASE		0x280000
+
+#define BMG_PMT_BASE_OFFSET	0xDB000
+#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE_OFFSET)
+
+#define BMG_TELEMETRY_BASE_OFFSET	0xE0000
+#define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
+
+#define BMG_DEVICE_ID 0xE2F8
+
+#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
+#define SG_REMAP_BITS		GENMASK(31, 24)
+
+static struct intel_vsec_header bmg_telemetry = {
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 2,
+	.entry_size = 4,
+	.tbir = 0,
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
+	XE_VSEC_BMG,
+};
+
+static struct intel_vsec_platform_info xe_vsec_info[] = {
+	[XE_VSEC_BMG] = {
+		.caps = VSEC_CAP_TELEMETRY,
+		.headers = bmg_capabilities,
+	},
+	{ }
+};
+
+/*
+ * The GUID will have the following bits to decode:
+ *
+ * X(4bits) - {Telemetry space iteration number (0,1,..)}
+ * X(4bits) - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ * X(4bits) - SOC_SKU
+ * XXXX(16bits)– Device ID – changes for each down bin SKU’s
+ * X(2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
+ * X(2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
+ */
+#define GUID_TELEM_ITERATION	GENMASK(3, 0)
+#define GUID_SEGMENT		GENMASK(7, 4)
+#define GUID_SOC_SKU		GENMASK(11, 8)
+#define GUID_DEVICE_ID		GENMASK(27, 12)
+#define GUID_CAP_TYPE		GENMASK(29, 28)
+#define GUID_RECORD_ID		GENMASK(31, 30)
+
+#define PUNIT_TELEMETRY_OFFSET		0x0200
+#define PUNIT_WATCHER_OFFSET		0x14A0
+#define OOBMSM_0_WATCHER_OFFSET		0x18D8
+#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
+
+enum record_id {
+	PUNIT,
+	OOBMSM_0,
+	OOBMSM_1,
+};
+
+enum capability {
+	CRASHLOG,
+	TELEMETRY,
+	WATCHER,
+};
+
+static int guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+
+	if (device_id != BMG_DEVICE_ID)
+		return -ENODEV;
+
+	if (cap_type > WATCHER)
+		return -EINVAL;
+
+	*offset = 0;
+
+	if (cap_type == CRASHLOG) {
+		*index = record_id == PUNIT ? 2 : 4;
+		return 0;
+	}
+
+	switch (record_id) {
+	case PUNIT:
+		*index = 0;
+		if (cap_type == TELEMETRY)
+			*offset = PUNIT_TELEMETRY_OFFSET;
+		else
+			*offset = PUNIT_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_0:
+		*index = 1;
+		if (cap_type == WATCHER)
+			*offset = OOBMSM_0_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_1:
+		*index = 1;
+		if (cap_type == TELEMETRY)
+			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, u32 count)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	struct xe_mmio *mmio;
+	u32 mem_region;
+	u32 offset;
+	int ret;
+
+	ret = guid_decode(guid, &mem_region, &offset);
+	if (ret)
+		return ret;
+
+	telem_addr += offset;
+
+	guard(mutex)(&xe->pmt.lock);
+
+	/* indicate that we are not at an appropriate power level */
+	if (!xe_pm_runtime_get_if_active(xe))
+		return -ENODATA;
+
+	/* set SoC re-mapper index register based on GUID memory region */
+	mmio = &xe_device_get_root_tile(xe)->primary_gt->mmio;
+	xe_mmio_rmw32(mmio, SG_REMAP_INDEX1, SG_REMAP_BITS,
+		      FIELD_PREP(SG_REMAP_BITS, mem_region));
+
+	memcpy_fromio(data, telem_addr, count);
+	xe_pm_runtime_put(xe);
+
+	return count;
+}
+
+struct pmt_callbacks xe_pmt_cb = {
+	.read_telem = xe_pmt_telem_read,
+};
+
+static const int vsec_platforms[] = {
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
+/**
+ * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
+ * interface
+ * @xe: valid xe instance
+ */
+void xe_vsec_init(struct xe_device *xe)
+{
+	struct intel_vsec_platform_info *info;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	enum xe_vsec platform;
+
+	platform = get_platform_info(xe);
+	if (platform == XE_VSEC_UNKNOWN)
+		return;
+
+	info = &xe_vsec_info[platform];
+	if (!info->headers)
+		return;
+
+	switch (platform) {
+	case XE_VSEC_BMG:
+		info->priv_data = &xe_pmt_cb;
+		break;
+	default:
+		break;
+	}
+
+	/*
+	 * Register a VSEC. Cleanup is handled using device managed
+	 * resources.
+	 */
+	intel_vsec_register(pdev, info);
+}
+MODULE_IMPORT_NS(INTEL_VSEC);
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
new file mode 100644
index 000000000000..3fd29a21cad6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright © 2022 - 2024 Intel Corporation
+ */
+
+#ifndef _XE_VSEC_H_
+#define _XE_VSEC_H_
+
+struct xe_device;
+
+void xe_vsec_init(struct xe_device *xe);
+
+#endif
-- 
2.44.0

