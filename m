Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEE5C7115B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 17:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBEC10E770;
	Tue, 17 Jun 2025 17:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGPtFqIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177A410E770
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 17:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750180914; x=1781716914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jw5DPZhPLB8Gia4fv+r77hYBYoUxIYt0PBiGRMN/d1Q=;
 b=FGPtFqIfM6NshIv3Coz5hHMTJn3swsKYsivNQWrn/Mr1IyPDNfWV5fc+
 q2RQJ5AAbE+oO+dtcuvlR7+dtIzTpTL98ASw2tH3iGPwgNEeBTjs3ztfB
 NSCCoZcxpodzphHeJHNsvlMtFbo2FIQxmZb6+3a1QGbrgoOYTpa+YIPQT
 qCNBgAU1LANWIGUF9HsnwpPgCvHRToyW+NihmA0/HndZXQN4w5wsdslex
 JMsmXvpsWOmbyMiM0oAnNRBNY2l+9aC1AgWo0BaNRajvpJec5stFRAQKm
 Yje2zUFqkYonD94RwC1XNx0tuwJJTR5uK0QazUyUSq/ARlUzmoGX+dEdn g==;
X-CSE-ConnectionGUID: IeZvMs0jSByN5FkMPwz7BA==
X-CSE-MsgGUID: XGwPp1N6SE+a1jpI275gtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="77774362"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="77774362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:21:54 -0700
X-CSE-ConnectionGUID: wVfGrM2TRFKorSuWCHetkQ==
X-CSE-MsgGUID: h+pdZTUrT0CQ5CaI1xWQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="153796230"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:21:51 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com, jani.nikula@intel.com
Subject: [PATCH v4 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie link
 state residency counters through debugfs
Date: Tue, 17 Jun 2025 22:45:59 +0530
Message-Id: <20250617171600.2905682-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617171600.2905682-1-soham.purkait@intel.com>
References: <20250617171600.2905682-1-soham.purkait@intel.com>
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

Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_residencys
in order to obtain the G-State residency counter values for G2, G6, G8, G10 &
ModS and the pcie link state residency counter values for L0, L1 & L1.2
respectively.

V1 : Expose all G-State residency counter values under dgfx_pkg_residencies. (Anshuman)
     Included runtime_get/put and removed drm_warn. (Riana)

v2 : Moved dgfx_pkg_residencies from "/sys/kernel/debug/gtidle/" to "/sys/kernel/debug/".
     Included dgfx_link_state_residencys for dgfx_link_state_residencys.       (Anshuman)

v3 : Included check for BMG and dgfx and helper function for repetitive code.  (Riana)
     Used drm_info_list to create the debugfs. (Karthik)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..39c5fce3e4fd 100644
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
 
+static int read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
+				  u32 offset, char *name, struct drm_printer *p)
+{
+	u64 residency = 0;
+	int ret;
+
+	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				&residency, offset, sizeof(residency));
+	drm_printf(p, "%s : %llu\n", name, residency);
+
+	if (ret != sizeof(residency))
+		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
+
+	return 0;
+}
+
 static struct xe_device *node_to_xe(struct drm_info_node *node)
 {
 	return to_xe_device(node->minor->dev);
@@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data)
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
+
+	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2", &p);
+	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6", &p);
+	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8", &p);
+	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10", &p);
+	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package ModS", &p);
+	xe_pm_runtime_put(xe);
+	return 0;
+}
+
+static int dgfx_link_state_residencies_show(struct seq_file *m, void *data)
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
+	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
+			       "PCIE LINK L0 RESIDENCY", &p);
+	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
+			       "PCIE LINK L1 RESIDENCY", &p);
+	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
+			       "PCIE LINK L1.2 RESIDENCY", &p);
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
+	{ .name = "dgfx_link_state_residencies", .show = dgfx_link_state_residencies_show, },
+};
+
 static int forcewake_open(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode->i_private;
@@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
+	if (IS_DGFX(xe) && xe->info.platform == XE_BATTLEMAGE)
+		drm_debugfs_create_files(debugfs_residencies,
+					 ARRAY_SIZE(debugfs_residencies),
+					 root, minor);
+
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
 
-- 
2.34.1

