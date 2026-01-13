Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000EFD2F33D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D9E89EFF;
	Tue, 13 Jan 2026 16:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3PawKU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1B210E357
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768321936; x=1799857936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=weLzHqCLkqA/kFc3xBkiJih9ujw+y8wFHVU9xmh7dZI=;
 b=L3PawKU9mxrzFT42elz3dj6EVdMRnHacOugwCz2e8GFHAYdPINdD2Krj
 vW7q3AJGeuNE5aZxtDXI27qTyFF/tvhz1YPXjrGo/IC+MO1iMQz9i3K0p
 YcfpVEqk0+782uI6z4LHNiKgJxwqQCEXCrzVzG10hFdGFkCwpYjQlvz6r
 lx5IkT1GjcARqT9Hel4okIuN7L9CNybafATKMpFratf6cPOwwFcUXL3Bb
 0aBLHFQUrwl9nmTDUHPy2TCiHNzH6jUOcbnb1f+p+Q0g2/bSmsYpTLH0B
 StVia1xrueTx+HLtrv/htmfGDittydjcd9icruyDdg+0PwXyHhPtqQoA/ Q==;
X-CSE-ConnectionGUID: qz9LLtpnQ2GBXZsiCABQsg==
X-CSE-MsgGUID: 4xRigxxxQ3Si6pfJKnm5ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69521022"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69521022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:15 -0800
X-CSE-ConnectionGUID: sxFptwIfSramcC3FbHyPdA==
X-CSE-MsgGUID: X1IMI4fcSq6h3YrnvU2i8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204060131"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:11 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com, matthew.auld@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com
Subject: [PATCH v6 04/12] drm/xe/vrsr: Detect VRSR Capability
Date: Tue, 13 Jan 2026 22:12:05 +0530
Message-ID: <20260113164200.1151788-18-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113164200.1151788-14-badal.nilawar@intel.com>
References: <20260113164200.1151788-14-badal.nilawar@intel.com>
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

Detect VRAM Self Refresh(vrsr) Capability.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_pm.c           | 26 ++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ad93c57edd17..153c0a3c98d2 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -57,6 +57,9 @@
 #define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
 #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
 
+#define VRAM_SR_CAPABILITY                         XE_REG(0x138144)
+#define   VRAM_SR_SUPPORTED                        REG_BIT(0)
+
 #define VF_CAP_REG				XE_REG(0x1901f8, XE_REG_OPTION_VF)
 #define   VF_CAP				REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a7e9d981618c..17a577772794 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -576,6 +576,9 @@ struct xe_device {
 		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
+		/** @d3cold.vrsr_capable: Indicates if d3cold VRAM Self Refresh is supported */
+		bool vrsr_capable;
+
 		/**
 		 * @d3cold.vram_threshold:
 		 *
@@ -586,6 +589,7 @@ struct xe_device {
 		 * Default threshold value is 300mb.
 		 */
 		u32 vram_threshold;
+
 		/** @d3cold.lock: protect vram_threshold */
 		struct mutex lock;
 	} d3cold;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index fa607be299a7..18a44b395559 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -13,15 +13,18 @@
 #include <drm/ttm/ttm_placement.h>
 
 #include "display/xe_display.h"
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
+#include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
@@ -318,6 +321,28 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
 	return true;
 }
 
+static bool xe_pm_vrsr_capable(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	unsigned int fw_ref;
+	struct xe_gt *gt;
+	u32 val;
+
+	gt = xe_root_mmio_gt(xe);
+
+	if (!xe->info.probe_display)
+		return false;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!fw_ref)
+		return false;
+
+	val = xe_mmio_read32(mmio, VRAM_SR_CAPABILITY);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+	return val & VRAM_SR_SUPPORTED;
+}
+
 static void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -462,6 +487,7 @@ int xe_pm_init(struct xe_device *xe)
 		err = xe_pm_set_vram_threshold(xe, vram_threshold);
 		if (err)
 			goto err_unregister;
+		xe->d3cold.vrsr_capable = xe_pm_vrsr_capable(xe);
 	}
 
 	xe_pm_runtime_init(xe);
-- 
2.52.0

