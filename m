Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97F0CCD18D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B9C10E129;
	Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdROd85B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8377810E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412329; x=1791948329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WTsZLHpHuB5gWc5lsO9/TTAu3d1crA8ow44M4aAhHsk=;
 b=WdROd85BYQiYBz0yvZRZwq9pCMBYN/LqcTX7eFeuHurbD+5FjERZkxq8
 fvlDi/Ha60nbnNd1XZYYpRA/B3jG6rd4BgJNPIOi4SbyftSyC74HAGhCO
 AF63M5iqLoqHFE8FKQAwHITMWbVntBW0D8v7B9ukFdxr5e/MZeh0N/6vY
 S5ekd9/EhF8jWRGUbOyPXhKHeZI1Tf3PSXsqKEIEquc548tI4pGTDKzpJ
 qx3wFhLn1/Rj+O+C+FjWZb72pxXY0v7axOpTViJfHx1EjCrQoYRAWolgw
 +skS0+rmYyQO+I2FL6mnh2X0/0XMCn8Kp/tNexZuI/JXHV7nd9SZhwtJW A==;
X-CSE-ConnectionGUID: pk+MHq2CQ4ikye/9enUWuA==
X-CSE-MsgGUID: gn4d4/3CQsC8SXlNBYv2kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414867"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414867"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:28 -0700
X-CSE-ConnectionGUID: SHdpn+CeQuKQsz0Ni8TdCQ==
X-CSE-MsgGUID: nBINmheFQIyCd4PGh0K4xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567271"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Brian Welty <brian.welty@intel.com>
Subject: [PATCH 03/23] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
Date: Mon, 13 Oct 2025 20:24:35 -0700
Message-ID: <20251013-xe3p-v1-3-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Brian Welty <brian.welty@intel.com>

Starting from Xe3p, there are two different copies of some of the GAM
registers:  the traditional MCR variant at their old locations, and a
new unicast copy known as "main_gamctrl."  The Xe driver doesn't use
these registers directly, but we need to instruct the GuC on which set
it should use.  Since the new, unicast registers are preferred (since
they avoid the need for unnecessary MCR synchronization), set a new GuC
feature flag, GUC_CTL_MAIN_GAMCTRL_QUEUES to convey this decision.  A
new helper function, xe_guc_using_main_gamctrl_queues(), is added for
use in the 3 independent places that need to handle configuration of the
new reporting queues.

The mmio write to enable the main gamctl is only done during the general
GuC upload.  The gamctrl registers are not accessed by the GuC during
hwconfig load.

Last, the ADS blob for communicating the queue addresses contains both a
DPA and GGTT offset. The GuC documentation states that DPA is now MBZ
when using the MAIN_GAMCTRL queues.

Signed-off-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.h           |  6 ++++++
 drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h          |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c      |  6 +++++-
 drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
 6 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 51f2a03847f9d..47e13a3fb9072 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -545,6 +545,9 @@
 #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
 #define   COMP_CKN_IN				REG_GENMASK(30, 29)
 
+#define MAIN_GAMCTRL_MODE			XE_REG(0xef00)
+#define   MAIN_GAMCTRL_QUEUE_SELECT		REG_BIT(0)
+
 #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
 #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
 #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 5df2ffe3ff838..9d710049da455 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -22,6 +22,12 @@
 
 #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
 
+#define GT_VER(gt) ({ \
+	typeof(gt) gt_ = (gt); \
+	struct xe_device *xe = gt_to_xe(gt_); \
+	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
+})
+
 extern struct fault_attr gt_reset_failure;
 static inline bool xe_fault_inject_gt_reset(void)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d94490979adc0..37e3735f34e63 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -91,6 +91,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
 		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
 
+	if (xe_guc_using_main_gamctrl_queues(guc))
+		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
+
 	return flags;
 }
 
@@ -1255,8 +1258,13 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 int xe_guc_upload(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
+
 	xe_guc_ads_populate(&guc->ads);
 
+	if (xe_guc_using_main_gamctrl_queues(guc))
+		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
+
 	return __xe_guc_upload(guc);
 }
 
@@ -1657,6 +1665,25 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
 	xe_guc_submit_wedge(guc);
 }
 
+/**
+ * xe_guc_using_main_gamctrl_queues() - Detect which reporting queues to use.
+ * @guc: The GuC object
+ *
+ * For Xe3p and beyond, we want to program the hardware to use the
+ * "Main GAMCTRL queue" rather than the legacy queue before we upload
+ * the GuC firmware.  This will allow the GuC to use a new set of
+ * registers for pagefault handling and avoid some unnecessary
+ * complications with MCR register range handling.
+ *
+ * Return: true if can use new main gamctrl queues.
+ */
+bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	return GT_VER(gt) >= 35;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_guc_g2g_test.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 1cca05967e621..e2d4c5f44ae34 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -52,6 +52,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
 void xe_guc_declare_wedged(struct xe_guc *guc);
+bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 22ac2a8b74c80..bcb85a1bf26d9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -820,16 +820,20 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 static void guc_um_init_params(struct xe_guc_ads *ads)
 {
 	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
+	struct xe_guc *guc = ads_to_guc(ads);
 	u64 base_dpa;
 	u32 base_ggtt;
+	bool with_dpa;
 	int i;
 
+	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
+
 	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
 	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
 
 	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
 		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
-			       base_dpa + (i * GUC_UM_QUEUE_SIZE));
+			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
 		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
 			       base_ggtt + (i * GUC_UM_QUEUE_SIZE));
 		ads_blob_write(ads, um_init_params.queue_params[i].size_in_bytes,
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 50c4c2406132e..c90dd266e9cf9 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -113,6 +113,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
 #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
 #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
+#define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
 
 #define GUC_CTL_DEBUG			3

-- 
2.51.0

