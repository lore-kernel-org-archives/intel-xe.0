Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74788C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 17:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377CB10E21D;
	Wed, 23 Apr 2025 17:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsKBJLRX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B6A10E21D
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745429955; x=1776965955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HxTDBpCHCwwMS6cxJibeHND0PzdCAxHK+0TTOUjZjxE=;
 b=dsKBJLRXp7KRSBttDRsDGUqQbbbpqFH6aKM7QbCaFl0mnMZ3ZoBc+XNL
 N6teuYLuDg/7CkoBpYhdYFZWdir3o5+FSCRYCrQZACCIX4BbTVknIreAp
 CmG/MsTINW2c/KVUIDUbK5XNFyOEhNojUO5Blw4UPopDtbqyGO6h9oFnN
 V/dOX5nt3/S/lg4HSVc+qHU2F5xcvIZ3PR4lcTTsfV39zwpz7XzTr3WYQ
 KjvOYs42CwpIuFqGQJGdg2h0judqjdWQyD0mWagQkaG4jE6otPDx78STI
 bHjQ0OzOJDMe8Hzvs3HI/XnGAlLw+FTARx8i+6QxjpdODnCzW5eTamDq2 w==;
X-CSE-ConnectionGUID: MMXEfz0cRXSAWPmMRCOBnw==
X-CSE-MsgGUID: KTGyT8X7S7q1yeIF/iaHSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="49702120"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="49702120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:39:14 -0700
X-CSE-ConnectionGUID: t6tW7kpTQ/WuohysOqWy/w==
X-CSE-MsgGUID: 7h5CdkVnTtuQEqveZ6C2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132361461"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:39:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [CI] drm/xe/vf: Fix guc_info debugfs for VFs
Date: Wed, 23 Apr 2025 10:39:08 -0700
Message-ID: <20250423173908.1571412-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The guc_info debugfs attempta to read a bunch of registers that the VFs
doesn't have access to, so fix it by skipping the reads.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4775
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c5aace59b62c..bac5471a1a78 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1510,30 +1510,32 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_uc_fw_print(&guc->fw, p);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return;
+	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
+			return;
+
+		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
+
+		drm_printf(p, "\nGuC status 0x%08x:\n", status);
+		drm_printf(p, "\tBootrom status = 0x%x\n",
+			   REG_FIELD_GET(GS_BOOTROM_MASK, status));
+		drm_printf(p, "\tuKernel status = 0x%x\n",
+			   REG_FIELD_GET(GS_UKERNEL_MASK, status));
+		drm_printf(p, "\tMIA Core status = 0x%x\n",
+			   REG_FIELD_GET(GS_MIA_MASK, status));
+		drm_printf(p, "\tLog level = %d\n",
+			   xe_guc_log_get_level(&guc->log));
+
+		drm_puts(p, "\nScratch registers:\n");
+		for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
+			drm_printf(p, "\t%2d: \t0x%x\n",
+				   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
+		}
 
-	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
-
-	drm_printf(p, "\nGuC status 0x%08x:\n", status);
-	drm_printf(p, "\tBootrom status = 0x%x\n",
-		   REG_FIELD_GET(GS_BOOTROM_MASK, status));
-	drm_printf(p, "\tuKernel status = 0x%x\n",
-		   REG_FIELD_GET(GS_UKERNEL_MASK, status));
-	drm_printf(p, "\tMIA Core status = 0x%x\n",
-		   REG_FIELD_GET(GS_MIA_MASK, status));
-	drm_printf(p, "\tLog level = %d\n",
-		   xe_guc_log_get_level(&guc->log));
-
-	drm_puts(p, "\nScratch registers:\n");
-	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
-		drm_printf(p, "\t%2d: \t0x%x\n",
-			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	drm_puts(p, "\n");
 	xe_guc_ct_print(&guc->ct, p, false);
 
-- 
2.43.0

