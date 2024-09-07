Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724A1E6FE49
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3883110EB27;
	Sat,  7 Sep 2024 00:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHnQL5XR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CDC10EB25
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667675; x=1757203675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=odx+mNCh8jU3zhNMZnrLpsZE5yZbZW/dcVB7Lsv1CyU=;
 b=cHnQL5XR8xdThNyHCY0SlJqtMVkEMNPvOznKUzYGzILn/+XpncIZp0M9
 cK3PvZeNqDmHCGdsIMWqpzHjpHBIZWpx20uLzlSQ0TXpnbVzSwCwT53k6
 F6V/VS0bXMf6xKgyuT4PK1k/qNirlISDIjZ+YtCBprgu+w53AYQ1ZZFai
 yJSIdyZv9EeOUcKQ+AS6iTfpQ6Qa9Al/ffxdjdGq8A6TQMLouT6EWEvBU
 RDwTElAmpFSGpJ5C8rE0dyFh1DXTP7gNErkYo0bBNf4ERFVPkf98+6dO8
 gM5eGJpjZ2VE5861D2FzqiQmRc5tko+rJlscDrdxz3LlETIeubZtxTy+H A==;
X-CSE-ConnectionGUID: assMToPcTDKS+Fs4183XTg==
X-CSE-MsgGUID: OLG2AIh0QnCzIVE/Pl6wTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855291"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855291"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: sgO3LZzhSCyY5/IMTBoudg==
X-CSE-MsgGUID: 6JthWbmfT/mL3ptuICwzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792619"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 01/43] drm/xe: Move forcewake to 'gt.pm' substructure
Date: Fri,  6 Sep 2024 17:07:50 -0700
Message-ID: <20240907000748.2614020-46-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Forcewake is a general GT power management concept that isn't specific
to MMIO register access.  Move the forcewake information for a GT out of
the 'mmio' substruct and into a 'pm' substruct.  Also use the gt_to_fw()
helper in a few more places where it was being open-coded.

v2:
 - Kerneldoc tweaks.  (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h   |  2 +-
 drivers/gpu/drm/xe/xe_gt_types.h | 15 ++++++++++++---
 drivers/gpu/drm/xe/xe_reg_sr.c   |  9 +++++----
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 894f04770454..ec726dcd5f99 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -138,7 +138,7 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 
 static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 {
-	return &gt->mmio.fw;
+	return &gt->pm.fw;
 }
 
 void xe_device_assert_mem_access(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 3d1c51de0268..dd6bbef0bbcd 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -145,11 +145,9 @@ struct xe_gt {
 	/**
 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
 	 * register space, but have their own copy of GSI registers at a
-	 * specific offset, as well as their own forcewake handling.
+	 * specific offset.
 	 */
 	struct {
-		/** @mmio.fw: force wake for GT */
-		struct xe_force_wake fw;
 		/**
 		 * @mmio.adj_limit: adjust MMIO address if address is below this
 		 * value
@@ -159,6 +157,17 @@ struct xe_gt {
 		u32 adj_offset;
 	} mmio;
 
+	/**
+	 * @pm: power management info for GT.  The driver uses the GT's
+	 * "force wake" interface to wake up specific parts of the GT hardware
+	 * from C6 sleep states and ensure the hardware remains awake while it
+	 * is being actively used.
+	 */
+	struct {
+		/** @pm.fw: force wake for GT */
+		struct xe_force_wake fw;
+	} pm;
+
 	/** @sriov: virtualization data related to GT */
 	union {
 		/** @sriov.pf: PF data. Valid only if driver is running as PF */
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 440ac572f6e5..fb209f1e0f1e 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -15,6 +15,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -194,14 +195,14 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 
 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
-	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_force_wake;
 
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
 
-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 
 	return;
@@ -227,7 +228,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 
 	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
 
-	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_force_wake;
 
@@ -253,7 +254,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
 	}
 
-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 
 	return;
-- 
2.45.2

