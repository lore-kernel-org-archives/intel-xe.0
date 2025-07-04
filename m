Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25CFC8303D
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 17:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E0B10E359;
	Fri,  4 Jul 2025 17:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMd04cBz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F5610E359
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 17:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751649748; x=1783185748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M2Q04Cu+jW5haNGLVf6b0a1bHZ8IEhOgN5jtxzY3n70=;
 b=mMd04cBzW3lf8s2xzTJs1e+5rASkJflpw6NJfzUDStTnpNqYIvUY4ryN
 k3wuT3BPhHUO2CncCG+e357nEiQsMZ+f7PNLK06JwAfy42ewDh31WZFPC
 yRCV2JPd54jGQpzqPlZ8HlRaC1DA+1zxtnXVbJCEwipum7cC/1w/GvMxz
 U1Q7KWj1RgpWIgm9MS0UHAOZxDsnNM743tSxTH1sLCvAcGhUcbobGvmlr
 EuCa6dWJf6Di+DSsflgJfwbKU/xAFOST/MT9vyxOOmRn5p9NMdqITCjBx
 24DSb6Jy3bd2Ije34pU4gj+W5JcrRENBRZEJLGWI3f/7gXuYfogwxD8o2 g==;
X-CSE-ConnectionGUID: p0PV/BbXRIqSSXrHIxJZaQ==
X-CSE-MsgGUID: uV/XT+HPTAm+azuTlIwdGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64234104"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64234104"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 10:22:28 -0700
X-CSE-ConnectionGUID: /vXM4UOzSx2sVDU9zLx1qA==
X-CSE-MsgGUID: f/otBdIWRKeSwiq2bYJRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="159030289"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 10:22:26 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com,
 riana.tauro@intel.com, jonathan.cavitt@intel.com
Cc: soham.purkait@intel.com, ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v9 1/1] drm/xe/xe_debugfs: Exposure of G-State and pcie link
 state residency counters through debugfs
Date: Fri,  4 Jul 2025 22:46:10 +0530
Message-Id: <20250704171610.1294466-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704171610.1294466-1-soham.purkait@intel.com>
References: <20250704171610.1294466-1-soham.purkait@intel.com>
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
index b0efd9b48d1e..038f34698206 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -21,4 +21,14 @@
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
 
+#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
+#define BMG_G2_RESIDENCY_OFFSET			(0x530)
+#define BMG_G6_RESIDENCY_OFFSET			(0x538)
+#define BMG_G8_RESIDENCY_OFFSET			(0x540)
+#define BMG_G10_RESIDENCY_OFFSET		(0x548)
+
+#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
+#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
+#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..7f740f5e1e5b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -11,16 +11,19 @@
 
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
 #include "xe_step.h"
+#include "xe_vsec.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -30,6 +33,23 @@
 
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
@@ -82,11 +102,71 @@ static int sriov_info(struct seq_file *m, void *data)
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
+	for (int i = 0; ARRAY_SIZE(residencies); i++)
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
+	for (int i = 0; ARRAY_SIZE(residencies); i++)
+		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+
+	xe_pm_runtime_put(xe);
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
 	{ .name = "sriov_info", .show = sriov_info, },
 };
 
+static const struct drm_info_list debugfs_residencies[] = {
+	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
+	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
+};
+
 static int forcewake_open(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode->i_private;
@@ -240,6 +320,11 @@ void xe_debugfs_register(struct xe_device *xe)
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

