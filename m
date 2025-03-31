Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85805C36010
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 14:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EDF10E414;
	Mon, 31 Mar 2025 14:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNccYI6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F7810E401
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743431087; x=1774967087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QK8rKZsef4fDGqnX/LFeodiksMUHvET4dR+1MaIaswU=;
 b=LNccYI6sYd1pQQ3E2/2xs0hPX9Y+9jU3vkXgVmaxvEnTbwK6w1C/qTb4
 SdnZ/lRGDl7K/+hNa6v3R6wyI0Voyaium1kBd78r91xQeSnv5YNbJTr8P
 pqKMQVo1wDm7LA/0WL0WRs2LUP2mnALbwJk5EBI1+N9+92Yt59jVwOQVQ
 SYh83zuqlsV3XOwQcaTyXgYTy20dWkma+6ORhM40aNUglc1W9ds16T85b
 hv+OEx9od3oyan7gJhhlUzaOnuKbQv4dgW6zEDWcUzP2ckCDjJKZrJiZS
 ZmxF/RonFkWczOnpfSadJUsUAVukbnEiFn2mnOjaPjI7vCQxdDkv+L2km Q==;
X-CSE-ConnectionGUID: hL74gzVjTN202lfGe6pkBQ==
X-CSE-MsgGUID: es7FlwI8SYa2zO5oICZQIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44606201"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44606201"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:24:46 -0700
X-CSE-ConnectionGUID: 1oW6BPNyRCKNwj0Epys0Mg==
X-CSE-MsgGUID: yYJB/1mDT4CAGj0kX2PZ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130808255"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2025 07:24:44 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/2] drm/xe/debugfs: Expose PCIe Gen5 update telemetry
Date: Mon, 31 Mar 2025 19:53:35 +0530
Message-Id: <20250331142336.640226-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250331142336.640226-1-raag.jadav@intel.com>
References: <20250331142336.640226-1-raag.jadav@intel.com>
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

Expose debugfs telemetry required for PCIe Gen5 firmware update for
discrete GPUs.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c   | 93 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++
 2 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..67c941abf4fe 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -17,6 +17,9 @@
 #include "xe_gt_debugfs.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
+#include "xe_mmio.h"
+#include "xe_pcode_api.h"
+#include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
@@ -191,6 +194,89 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+/**
+ * DOC: PCIe Gen5 Update Limitations
+ *
+ * Default link speed of discrete GPUs is determined by FIT parameters stored
+ * in their flash memory, which are subject to override through user initiated
+ * firmware updates. It has been observed that devices configured with PCIe
+ * Gen5 as their default speed can come across link quality issues due to host
+ * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
+ * faced with unstable link at Gen5. The users are required to ensure that the
+ * device is capable of auto-downspeeding to PCIe Gen4 before pushing the image
+ * with Gen5 as default configuration. This can be done by reading
+ * ``pcie_gen4_downspeed_capable`` debugfs entry, which will denote PCIe Gen4
+ * auto-downspeed capability of the device with boolean output value of ``0``
+ * or ``1``, meaning `incapable` or `capable` respectively.
+ *
+ * .. code-block:: shell
+ *
+ *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_capable
+ *
+ * Pushing PCIe Gen5 update on a auto-downspeed incapable device and facing
+ * link instability due to host or motherboard limitations can result in driver
+ * not being able to successfully bind to the device, making further firmware
+ * updates impossible with RMA being the only last resort.
+ *
+ * Link downspeed status of auto-downspeed capable devices is available through
+ * ``pcie_gen4_downspeed_status`` debugfs entry with boolean output value of
+ * ``0`` or ``1``, with ``0`` meaning no downspeeding was required during link
+ * training (which is the optimal scenario) and ``1`` meaning the device has
+ * downsped to PCIe Gen4 due to unstable Gen5 link.
+ *
+ * .. code-block:: shell
+ *
+ *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_status
+ */
+
+static ssize_t pcie_gen4_downspeed_capable_show(struct file *f, char __user *ubuf,
+						size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	char buf[16];
+	u32 len, val;
+
+	xe_pm_runtime_get(xe);
+	val = xe_mmio_read32(mmio, PCODE_SCRATCH(16));
+	xe_pm_runtime_put(xe);
+
+	len = scnprintf(buf, sizeof(buf), "%u\n",
+			REG_FIELD_GET(PCIE_GEN4_DOWNGRADE, val) == DOWNGRADE_CAPABLE ? 1 : 0);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static const struct file_operations pcie_gen4_downspeed_capable_fops = {
+	.owner = THIS_MODULE,
+	.read = pcie_gen4_downspeed_capable_show,
+};
+
+static ssize_t pcie_gen4_downspeed_status_show(struct file *f, char __user *ubuf,
+					       size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	char buf[16];
+	u32 len, val;
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(DGFX_PCODE_STATUS,
+			    DGFX_GET_INIT_STATUS, 0), &val, NULL);
+	xe_pm_runtime_put(xe);
+	if (ret)
+		return ret;
+
+	len = scnprintf(buf, sizeof(buf), "%u\n", REG_FIELD_GET(REG_BIT(31), val));
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static const struct file_operations pcie_gen4_downspeed_status_fops = {
+	.owner = THIS_MODULE,
+	.read = pcie_gen4_downspeed_status_show,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +297,13 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	if (IS_DGFX(xe)) {
+		debugfs_create_file("pcie_gen4_downspeed_capable", 0400, root, xe,
+				    &pcie_gen4_downspeed_capable_fops);
+		debugfs_create_file("pcie_gen4_downspeed_status", 0400, root, xe,
+				    &pcie_gen4_downspeed_status_fops);
+	}
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index e622ae17f08d..1f802d9793ad 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -66,6 +66,10 @@
 /* Auxiliary info bits */
 #define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
 
+/* PCIe Gen4 downgrade capability bits */
+#define   PCIE_GEN4_DOWNGRADE		REG_GENMASK(1, 0)
+#define      DOWNGRADE_CAPABLE		2
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
-- 
2.34.1

