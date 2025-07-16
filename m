Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A47C83F22
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 10:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAC010E788;
	Wed, 16 Jul 2025 10:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STCJ51zL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281E810E788
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752661250; x=1784197250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h4wB5Hnd6VESuv2fcvS57MVADM5HhWpeG182MQEadbw=;
 b=STCJ51zL9u7B2etSEao7V52TULTav3NSyg1McXSIuuS48yeY39erP+J2
 eq/yZ+c5t6tRMOdpg/6vjpB39/4GdljWZrhg6hzbsGuoz/Z5yHsD7vgvb
 XjCcwLiCjvnnchRQBPEP8Wq92Rulun0xAxcY8P2Pj3lS0LgJvch0sKVgV
 CSdaSr9sdKxFaMrhpZFKzpwKrze0n7r2SxNkwKqeMPMOMlafvuwtUMKdj
 k+njSyZ5tld+NOBhyw1lAFMvjIrobH127qcWnXtYY6FXtSgtRfIhxa0f9
 C7IPqegqLuAFBqBcP9pJbET5necqPh4r0XyQFkAH6I2M6SHgOgANYgwuq g==;
X-CSE-ConnectionGUID: UHe9OZPDSSKzr7lTMWVPCg==
X-CSE-MsgGUID: /KmWMNxfRZCBSOg5R0zijA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55046452"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="55046452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:20:49 -0700
X-CSE-ConnectionGUID: /qxiUB3GQWSJ/VbPPoo1tg==
X-CSE-MsgGUID: IEsjDki2T/id2vt11rizBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="157818930"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:20:45 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com,
 riana.tauro@intel.com, jonathan.cavitt@intel.com
Cc: soham.purkait@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 1/1] drm/xe/xe_debugfs: Exposure of G-State and pcie link
 state residency counters through debugfs
Date: Wed, 16 Jul 2025 15:44:12 +0530
Message-Id: <20250716101412.3062780-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716101412.3062780-1-soham.purkait@intel.com>
References: <20250716101412.3062780-1-soham.purkait@intel.com>
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

Add debug nodes, "dgfx_pkg_residencies" for G-states (G2, G6, G8, G10,
ModS) and "dgfx_pcie_link_residencies" for PCIe link states(L0, L1, L1.2)
residency counters.

v1:
 - Expose all G-State residency counter values under
   dgfx_pkg_residencies. (Anshuman)
 - Include runtime_get/put. (Riana)
v2:
 - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
v3:
 - Include debugfs node "dgfx_pcie_link_residencies" for pcie link
   residency counter values.  (Anshuman)
v4:
 - Include check for BMG and add helper function for repetitive
   code. (Riana)
 - Add for loop and local struct to avoid repetition. (Riana)
 - Use "drm_debugfs_create_files" to create debugfs. (Karthik)
v5:
 - Reorder commits to reflect the correct dependency hierarchy.  (Jonathan)
 - Simplification of commit message and rectified register offset.(Karthik)
 - Error handling and return before printing.                       (Riana)
v6:
 - Remove check for DGFX as BMG is discrete. (Karthik)
 - Rearrange residency offsets in ascending order. (Riana)
v7:
 - Squash the macros into the patch they are used in. (Lucas)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 85 ++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 2995d72c3f78..81136aaced23 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -21,4 +21,14 @@
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
 
+#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
+#define BMG_G2_RESIDENCY_OFFSET		(0x530)
+#define BMG_G6_RESIDENCY_OFFSET		(0x538)
+#define BMG_G8_RESIDENCY_OFFSET		(0x540)
+#define BMG_G10_RESIDENCY_OFFSET		(0x548)
+
+#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
+#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
+#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 26e9d146ccbf..17845733eca0 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -11,18 +11,21 @@
 
 #include <drm/drm_debugfs.h>
 
+#include "regs/xe_pmt.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_debugfs.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
+#include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_step.h"
 #include "xe_wa.h"
+#include "xe_vsec.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -32,6 +35,23 @@
 
 DECLARE_FAULT_ATTR(gt_reset_failure);
 
+static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
+				   u32 offset, char *name, struct drm_printer *p)
+{
+	u64 residency = 0;
+	int ret;
+
+	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				&residency, offset, sizeof(residency));
+	if (ret != sizeof(residency)) {
+		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
+		return;
+	}
+
+	drm_printf(p, "%s : %llu\n", name, residency);
+}
+
 static struct xe_device *node_to_xe(struct drm_info_node *node)
 {
 	return to_xe_device(node->minor->dev);
@@ -102,12 +122,72 @@ static int workaround_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
+{
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+	struct drm_printer p;
+
+	xe = node_to_xe(m->private);
+	p = drm_seq_file_printer(m);
+	xe_pm_runtime_get(xe);
+	mmio = xe_root_tile_mmio(xe);
+	struct {
+		u32 offset;
+		char *name;
+	} residencies[] = {
+		{BMG_G2_RESIDENCY_OFFSET, "Package G2"},
+		{BMG_G6_RESIDENCY_OFFSET, "Package G6"},
+		{BMG_G8_RESIDENCY_OFFSET, "Package G8"},
+		{BMG_G10_RESIDENCY_OFFSET, "Package G10"},
+		{BMG_MODS_RESIDENCY_OFFSET, "Package ModS"}
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
+		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+
+	xe_pm_runtime_put(xe);
+	return 0;
+}
+
+static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
+{
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+	struct drm_printer p;
+
+	xe = node_to_xe(m->private);
+	p = drm_seq_file_printer(m);
+	xe_pm_runtime_get(xe);
+	mmio = xe_root_tile_mmio(xe);
+
+	struct {
+		u32 offset;
+		char *name;
+	} residencies[] = {
+		{BMG_PCIE_LINK_L0_RESIDENCY_OFFSET, "PCIE LINK L0 RESIDENCY"},
+		{BMG_PCIE_LINK_L1_RESIDENCY_OFFSET, "PCIE LINK L1 RESIDENCY"},
+		{BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET, "PCIE LINK L1.2 RESIDENCY"}
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
+		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+
+	xe_pm_runtime_put(xe);
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
 	{ .name = "sriov_info", .show = sriov_info, },
 	{ .name = "workarounds", .show = workaround_info, },
 };
 
+static const struct drm_info_list debugfs_residencies[] = {
+	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
+	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
+};
+
 static int forcewake_open(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode->i_private;
@@ -261,6 +341,11 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
+	if (xe->info.platform == XE_BATTLEMAGE)
+		drm_debugfs_create_files(debugfs_residencies,
+					 ARRAY_SIZE(debugfs_residencies),
+					 root, minor);
+
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
 
-- 
2.34.1

