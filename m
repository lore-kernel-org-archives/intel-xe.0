Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39F9C3ABD9
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 08:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB14E10E23A;
	Wed, 14 May 2025 08:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dl1SkPg9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C1510E2BB
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747210340; x=1778746340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wf4Bt9BFXsecsIHWdOfu0QHVX0i6dfKVDvd85HF8ef4=;
 b=Dl1SkPg9LzyC+NHfWiO7xlNkKIvaeFeGaPtWnTG7JREH0YzcVyxs9QRo
 CpYC8GwSwUznlMJolouqSbj7XuWobJfDzBWmWZDJ9D3myvrlIwPPeBoY1
 70X/S7+Mk8MEhPiCVzZcFNRMi5TZGIbtlSANkIqVwiFGrJZ+MNQsUd2Gx
 g3fSPcbvhPZneEYcZ9q6U61F9F/xb5xweXhpCvhWhs7IAGR0+Y0YTnI+j
 KzQ8bWz9zBMshfWEPdwwFZ0Vc1U1ENIu2l3sKosKUPWwL7uPrjFAg7pj3
 yPl6uw7ujxjAq3FTP4bw6vz5qK2yZZu7OvFBVAGZQ2XfdZss3LUd8XY3x g==;
X-CSE-ConnectionGUID: y86F8MWIRByDQmHjtj9Yuw==
X-CSE-MsgGUID: aGzQmxAMQsSMl1UkUhLMzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48344089"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="48344089"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:19 -0700
X-CSE-ConnectionGUID: oTDQ2VqTQUSb9gYZWGFGaw==
X-CSE-MsgGUID: 46ixD30KSj2LkriZjyUXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="137841692"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:17 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com
Subject: [PATCH 2/4] drm/xe/xe_debugfs: Exposure of G8 residency counter
Date: Wed, 14 May 2025 13:37:19 +0530
Message-Id: <20250514080721.265515-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514080721.265515-1-soham.purkait@intel.com>
References: <20250514080721.265515-1-soham.purkait@intel.com>
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

Add a debugfs node named g8_residency in order to obtain the G8
residency counter value.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 37 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..f9ab6a03af29 100644
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
@@ -185,12 +188,43 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	return size;
 }
 
+static ssize_t g8_residency_show(struct file *f, char __user *ubuf,
+				 size_t size, loff_t *pos)
+{
+	u64 reg_val;
+	char buf[32];
+	int len = 0;
+	int ret = 0;
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+
+	xe = file_inode(f)->i_private;
+	mmio = xe_root_tile_mmio(xe);
+	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				&reg_val,
+				BMG_G8_RESIDENCY_OFFSET,
+				sizeof(reg_val));
+
+	drm_warn(&xe->drm, "G8 Residency read from mbx 0x%016llx, ret %d\n",
+		 reg_val, ret);
+
+	len = scnprintf(buf, sizeof(buf), "%llu\n", reg_val);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
 static const struct file_operations wedged_mode_fops = {
 	.owner = THIS_MODULE,
 	.read = wedged_mode_show,
 	.write = wedged_mode_set,
 };
 
+static const struct file_operations g8_residency_fops = {
+	.owner = THIS_MODULE,
+	.read = g8_residency_show,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +245,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("g8_residency", 0444, root, xe,
+			    &g8_residency_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 17f4c2f1b5e4..86868a3cd379 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -8,6 +8,8 @@
 
 struct xe_device;
 
+#define BMG_G8_RESIDENCY_OFFSET			(0x540)
+
 #ifdef CONFIG_DEBUG_FS
 void xe_debugfs_register(struct xe_device *xe);
 #else
-- 
2.34.1

