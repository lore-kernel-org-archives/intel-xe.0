Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D48D2A00F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 13:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A794810E60D;
	Wed, 14 Jan 2026 13:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTR9w3Sk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F3410E616
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768395604; x=1799931604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iZsU3p/eRTUSj09pORiGQZTTfMrKx6oF1FVuIDFIp+A=;
 b=cTR9w3Sk4rC37Tx+P11Bq4598yDGSUXYeQJk6sON9kH+MaUARfoFe+9Q
 n53z1+6l7kfC2SiYSAEZiWrVl2jVLb1+xEbHbbu3byUAoOtopAr7aaG8D
 M6SVt8qCo+M7Nk9Lp31iPUaSdwPqmiBde103pJVUvIxBEF6+VlAW9WGPf
 Fs7f5bbsdpeMwKv8yfCQOQrAZZbEAH71QHonMNvm1Ff3W65o9xA77jOh5
 IuWte0PAhFgbVA/tztLZbggBFzNx58cXe95wa8hmCeJ1hTs3TB7tskzJh
 blGAjd5/Ox0nf8Kt/6J/F6lhkhbPoUvIfr9k9JR+fdLgB158QQZskcVlj Q==;
X-CSE-ConnectionGUID: 8yCBQejSR7uQX2qjg3eQOQ==
X-CSE-MsgGUID: TwQ+DTNkQieGk7WJFn26/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92361681"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="92361681"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 05:00:04 -0800
X-CSE-ConnectionGUID: MJ7a3JVWQ5KJNifP9amOKQ==
X-CSE-MsgGUID: foqYkfXZTv+VqAPMx9qf3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="203810663"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:59:59 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 daniele.ceraolospurio@intel.com, nishanth.p.reddy@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
Date: Wed, 14 Jan 2026 18:30:18 +0530
Message-ID: <20260114130015.3917770-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130015.3917770-4-sk.anirban@intel.com>
References: <20260114130015.3917770-4-sk.anirban@intel.com>
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

Prevent GuC firmware DMA failures during GuC-only reset by disabling
idle flow and verifying SRAM handling completion. Without this, reset
can be issued while SRAM handler is copying WOPCM to SRAM,
causing GuC HW to get stuck.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.c           | 37 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 87984713dd12..2f38fd231083 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -40,6 +40,9 @@
 #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
 #define   GS_MIA_IN_RESET			REG_BIT(0)
 
+#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
+#define   GUC_BOOT_HASH_CHK			REG_BIT(31)
+
 #define GUC_HEADER_INFO				XE_REG(0xc014)
 
 #define GUC_WOPCM_SIZE				XE_REG(0xc050)
@@ -83,7 +86,12 @@
 #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
 #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
 #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
+
+#define GUC_SRAM_STATUS				XE_REG(0xc398)
+#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
+
 #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
+#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
 #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
 #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 44360437beeb..b5ec08a16aaf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -900,6 +900,35 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 	return xe_guc_submit_enable(guc);
 }
 
+/*
+ * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
+ * SRAM save/restore operations are complete before reset.
+ */
+static int guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 boot_hash_chk, guc_status, sram_status;
+
+	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
+	if (REG_FIELD_GET(GS_UKERNEL_MASK, guc_status) != XE_GUC_LOAD_STATUS_READY)
+		return 0;
+
+	boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
+	if (!(boot_hash_chk & GUC_BOOT_HASH_CHK))
+		return 0;
+
+	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
+
+	sram_status = xe_mmio_read32(&gt->mmio, GUC_SRAM_STATUS);
+	if (sram_status & GUC_SRAM_HANDLING_MASK) {
+		xe_gt_err(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
+			  sram_status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 int xe_guc_reset(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -909,6 +938,12 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
+	if (XE_GT_WA(gt, 14025883347)) {
+		ret = guc_prevent_fw_dma_failure_on_reset(guc);
+		if (ret)
+			goto err_out;
+	}
+
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return xe_gt_sriov_vf_bootstrap(gt);
 
@@ -931,7 +966,7 @@ int xe_guc_reset(struct xe_guc *guc)
 	return 0;
 
 err_out:
-
+	xe_gt_err(gt, "custom GuC reset failed with %pe\n", ERR_PTR(ret));
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 5cd7fa6d2a5c..ff2efc7a68cc 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -73,3 +73,12 @@
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
 14020316580    MEDIA_VERSION(1301)
+
+14025883347	MEDIA_VERSION(1301)
+		MEDIA_VERSION(2000)
+		MEDIA_VERSION(3000)
+		MEDIA_VERSION(3002)
+		MEDIA_VERSION(3500)
+		MEDIA_VERSION(3503)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION_RANGE(3003, 3005)
-- 
2.43.0

