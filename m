Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118D0C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28AD10E13C;
	Thu, 29 May 2025 18:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjjvHPas";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06F710E0BC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748541792; x=1780077792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v0pwmS3knBtqjyMnUb3YqVr3F5E0axzqDhgoOvgyN5c=;
 b=bjjvHPasvorNxfYqdkT4Et2F6xQ6GPlcjX5wVkr4IURiD3t7/0nhDE/C
 JDfObDHZLpD/gN4DWPqKE9z2m8DRdY/aXaPG6fBXgYauqoKwcc/2nzrIS
 GzX6pkCjg2YE/r2QgPjZMcvyqJGhn59qqCwKjqT4lwu2aPVCRqo7LdURg
 Tzt4Pt/2HMR0KNKmwUzVRxAeYXJbABUJQcr3Uszj5itP+iboFLOOeR9+r
 C+EeQo78GZQURJI38O5OgWrri2Qt9Xm28IlqyzYmZjYUf+j9/KXhjTopX
 SPB+FWn9VHCRbot3dAfC4UxyqpEoY90xneyFeAHAKjtVUl9lfszrpdDNX Q==;
X-CSE-ConnectionGUID: BpMtjFh8SueKyfWGowwsOg==
X-CSE-MsgGUID: aXBm7PRGSiSb/8qyl2F8zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50542965"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50542965"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:03:11 -0700
X-CSE-ConnectionGUID: iOFBPGcfTiCGWn/GiWo0vw==
X-CSE-MsgGUID: DGwuGjIRTJuxnpZ6cv0YYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143661834"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:03:09 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 2/3] drm/xe/xe_debugfs: Exposure of G-State residency
 counter through debugfs
Date: Thu, 29 May 2025 23:27:51 +0530
Message-Id: <20250529175752.1222913-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529175752.1222913-1-soham.purkait@intel.com>
References: <20250529175752.1222913-1-soham.purkait@intel.com>
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

Add a debugfs node named dgfx_pkg_residencies in order to obtain the
G-State residency counter values for G2, G6, G8, G10 & ModS.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 61 +++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..98e9f3ab6c5e 100644
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
@@ -185,12 +188,67 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	return size;
 }
 
+static int read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
+                                  u64 *dst, u32 offset, char *name)
+{	
+	int ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				dst, offset, sizeof(u64));
+	if (ret != sizeof(u64)) {
+		drm_warn(&xe->drm, "%s residency counter failed to read, ret %d\n", name, ret);
+	}
+	return 0;
+}
+
+
+static ssize_t dgfx_pkg_residencies_show(struct file *f, char __user *ubuf,
+				 size_t size, loff_t *pos)
+{
+	u64 g_states;
+	char buf[256];
+	int len = 0;
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+
+	xe = file_inode(f)->i_private;
+	xe_pm_runtime_get(xe);
+	mmio = xe_root_tile_mmio(xe);	
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &g_states, BMG_G2_RESIDENCY_OFFSET, "G2");
+	len = scnprintf(buf, sizeof(buf), "Package G2: %llu\n", g_states);
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &g_states, BMG_G6_RESIDENCY_OFFSET, "G6");
+	len += scnprintf(buf + len, sizeof(buf) - len, "Package G6: %llu\n", g_states);
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &g_states, BMG_G8_RESIDENCY_OFFSET, "G8");
+	len += scnprintf(buf + len, sizeof(buf) - len, "Package G8: %llu\n", g_states);
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &g_states, BMG_G10_RESIDENCY_OFFSET, "G10");
+	len += scnprintf(buf + len, sizeof(buf) - len, "Package G10: %llu\n", g_states);
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &g_states, BMG_MODS_RESIDENCY_OFFSET, "ModS");
+	len += scnprintf(buf + len, sizeof(buf) - len, "Package ModS: %llu\n", g_states);
+
+	xe_pm_runtime_put(xe);
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
 static const struct file_operations wedged_mode_fops = {
 	.owner = THIS_MODULE,
 	.read = wedged_mode_show,
 	.write = wedged_mode_set,
 };
 
+static const struct file_operations dgfx_pkg_residencies_fops = {
+	.owner = THIS_MODULE,
+	.read = dgfx_pkg_residencies_show,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +269,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("dgfx_pkg_residencies", 0444, root, xe,
+			    &dgfx_pkg_residencies_fops);
+    
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
-- 
2.34.1

