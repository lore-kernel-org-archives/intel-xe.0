Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198B6D47CD0
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 10:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F7310E85A;
	Fri, 16 Jan 2026 10:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7lMNYPN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A2110E85A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768559683; x=1800095683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g8s9DT0oSZyf7gfdVg4fQiGAGvqvlr//ZvCXspgUgSs=;
 b=l7lMNYPNapmvGWP3RIpKfKoY+103APy+e3l8kRLUwhm9wF3tblq8B8Ns
 2A1UiAYtzypjDfmzPVnllu99gqk8mytj5lwSm4FYmQ9XpIrl6Hy1njuAh
 ziBzSMiyafeUW6BoRSjcz5eZhBZQNbGhyJYFL16aMSOv8sc0NbuX6OPsa
 JqaIy1/WUicwnp89cCQpPn59mejqMCdjeC8Jn5nJicXGEPGUVIGSr4gKA
 E9QxDUV4Wv5NaK8zKisRQPcyEpD3mJbdW/O2TuZqAuarEg0Bjn9Sa5I2E
 Yl6FG4vpWVEe1z/l0J5H7YAVmtsAW333xaTgHLw55p0NaTjyC9ceJlfm4 g==;
X-CSE-ConnectionGUID: 1NHrpZhETdSb3ZdSeoiedQ==
X-CSE-MsgGUID: mj0osxCdQXOwV1xI01D6oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80990439"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80990439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:34:42 -0800
X-CSE-ConnectionGUID: 5vXdEwcPQoSfM8j7sj9+jw==
X-CSE-MsgGUID: 8JlpLJaqRciAmMNavOn7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="242758129"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:34:39 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 daniele.ceraolospurio@intel.com, nishanth.p.reddy@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
Date: Fri, 16 Jan 2026 16:04:54 +0530
Message-ID: <20260116103451.304716-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116103451.304716-4-sk.anirban@intel.com>
References: <20260116103451.304716-4-sk.anirban@intel.com>
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

v2: Modify error message (Badal)
    Rename reg bit name (Daniele)
    Update WA skip condition (Daniele)
    Update SRAM handling logic (Daniele)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
 drivers/gpu/drm/xe/xe_guc.c           | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 87984713dd12..c9cb02f32f5a 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -40,6 +40,9 @@
 #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
 #define   GS_MIA_IN_RESET			REG_BIT(0)
 
+#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
+#define   GUC_BOOT_UKERNEL_VALID		REG_BIT(31)
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
index 44360437beeb..42658a409556 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -900,6 +900,33 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 	return xe_guc_submit_enable(guc);
 }
 
+/*
+ * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
+ * SRAM save/restore operations are complete before reset.
+ */
+static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 boot_hash_chk, guc_status, sram_status;
+	int ret;
+
+	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
+	if (guc_status & GS_MIA_IN_RESET)
+		return;
+
+	boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
+	if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
+		return;
+
+	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
+
+	ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, GUC_SRAM_HANDLING_MASK,
+			     0, 5000, &sram_status, false);
+	if (ret)
+		xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
+			   sram_status);
+}
+
 int xe_guc_reset(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -909,6 +936,9 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
+	if (XE_GT_WA(gt, 14025883347))
+		guc_prevent_fw_dma_failure_on_reset(guc);
+
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return xe_gt_sriov_vf_bootstrap(gt);
 
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

