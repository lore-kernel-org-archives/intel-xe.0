Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348B5CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E667A10E406;
	Mon, 12 Oct 2026 05:41:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE0210E406
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791783675; x=1823319675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2i+tFDmdD40sIgZKf02JUYRt0pt8NpGCihKfKaP5LOg=;
 b=DCLuB0kFNl8jsGWaj5IJRE7deMLi9CqH+ARR6IPdsd2t2J/XW8mSXmgM
 e0o+klrwdg4HPOJxsZ45URnMRdzhSBShLpgUbrLaLhqrpRjb4lYjtdA/5
 JcSZV+h2K+UHcc5keeuCilESAaaxDIJ24Y11KFrZxp8CRDeLNuSKhzBYy
 bb0sZmu9POd3sHSaoFQK/IyhfxKoqcI+xfpVJPGgMdolWR5VI/FNqlpXF
 EETj4e/Ou4kV+lzBBJzENLtsmehfCBjf/2HowouBOg5DpRfiLhYL5vgjd
 aodWM4qtNokkqM+GOIRpdEzp2FpP0HQo9UqiAwpzaeJ0QlRZCM7vH5aIO A==;
X-CSE-ConnectionGUID: hu+mxvOmT2Ozoywyub5bfQ==
X-CSE-MsgGUID: NobwTqkgQ6CycYg5SkbUKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="367826"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="367826"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:41:15 -0700
X-CSE-ConnectionGUID: Ri+BaeoBQJaVLAKseY5HlQ==
X-CSE-MsgGUID: iWlMVzZEReCzke6CNbvRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="787103"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:41:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 1/6] drm/xe: Separate drm-ras netlink data from device and
 firmware RAS state
Date: Mon, 12 Oct 2026 11:10:57 +0530
Message-ID: <20261012054056.2272869-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261012054056.2272869-8-riana.tauro@intel.com>
References: <20261012054056.2272869-8-riana.tauro@intel.com>
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

Keep the DRM RAS data used for netlink reporting separate from the
device and firmware RAS state in xe_device.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
v2: remove inline function (Himal)

v3: rename variable to disable_vram_page_offline (Tejas)
---
 drivers/gpu/drm/xe/xe_device_types.h  | 11 +++++++++--
 drivers/gpu/drm/xe/xe_drm_ras.c       | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 ---
 drivers/gpu/drm/xe/xe_hw_error.c      |  6 +++---
 drivers/gpu/drm/xe/xe_ras.c           | 26 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_ras.h           |  2 ++
 drivers/gpu/drm/xe/xe_ras_types.h     | 10 ++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  3 ++-
 8 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 41f703a87916..d267fb4e4d81 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -21,6 +21,7 @@
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
 #include "xe_pt_types.h"
+#include "xe_ras_types.h"
 #include "xe_sriov_pf_types.h"
 #include "xe_sriov_types.h"
 #include "xe_sriov_vf_types.h"
@@ -576,8 +577,14 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
-	/** @ras: RAS structure for device */
-	struct xe_drm_ras ras;
+	/** @ras: RAS (Reliability, Availability, Serviceability) structures */
+	struct {
+		/** @ras.nl_data: drm-ras netlink data */
+		struct xe_drm_ras nl_data;
+
+		/** @ras.state: RAS device and firmware state */
+		struct xe_ras_state state;
+	} ras;
 
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index 7f3695707611..38d77561facf 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
 			       enum drm_xe_ras_error_severity severity,
 			       u32 error_id, const char **name, u32 *val)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 
 	if (!info || !info[error_id].name)
@@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
 			       enum drm_xe_ras_error_severity severity,
 			       u32 error_id)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 
 	if (!info || !info[error_id].name)
@@ -90,7 +90,7 @@ static int query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
 					     const char **name, u32 *threshold)
 {
 	struct xe_device *xe = ep->priv;
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
 
 	if (!info || !info[error_id].name)
@@ -106,7 +106,7 @@ static int query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
 static int set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id, u32 threshold)
 {
 	struct xe_device *xe = ep->priv;
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
 
 	if (!info || !info[error_id].name)
@@ -142,7 +142,7 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
 			      const enum drm_xe_ras_error_severity severity)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	const char *device_name;
 
 	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
@@ -190,7 +190,7 @@ static void cleanup_node(struct drm_device *drm, void *node)
 
 static int register_nodes(struct xe_device *xe)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct drm_ras_node *node;
 	int i, ret;
 
@@ -230,7 +230,7 @@ static int register_nodes(struct xe_device *xe)
  */
 void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 value)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 	struct drm_ras_node *node;
 	int ret;
@@ -260,7 +260,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
  */
 int xe_drm_ras_init(struct xe_device *xe)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct drm_ras_node *node;
 	int err;
 
diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
index 0be218ba2db7..8d729ad6a264 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -43,9 +43,6 @@ struct xe_drm_ras {
 
 	/** @info: info array for all types of errors */
 	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
-
-	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
-	bool disable_vram_page_offline;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 5f2abc9485ff..f53a6b3055de 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
 {
 	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 	const char *name;
 
@@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 {
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 	struct xe_mmio *mmio = &tile->mmio;
 	unsigned long err_stat = 0;
@@ -422,7 +422,7 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
 	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 	unsigned long flags, err_src;
 	u32 err_bit;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..b2ccb0281d8f 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -906,6 +906,17 @@ static const struct attribute_group gpu_health_group = {
 	.attrs = gpu_health_attrs,
 };
 
+/**
+ * xe_ras_get_vram_page_offline - Get the vram page offline user policy
+ * @xe: xe device instance
+ *
+ * Return: true if the vram page offline policy is disabled, false otherwise.
+ */
+bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe)
+{
+	return xe->ras.state.disable_vram_page_offline;
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
@@ -916,19 +927,18 @@ void xe_ras_init(struct xe_device *xe)
 {
 	int ret;
 
-	/*
-	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
-	 * once the feature flag is plumbed through device info.
-	 */
-	if (xe->info.platform == XE_CRESCENTISLAND)
-		xe->ras.disable_vram_page_offline =
-			xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
-
 	xe_drm_ras_init(xe);
 
 	if (!xe->info.has_sysctrl)
 		return;
 
+	/*
+	 * TODO: Replace with xe->info.has_disable_vram_page_offline once the feature flag is
+	 * plumbed through device info.
+	 */
+	xe->ras.state.disable_vram_page_offline =
+		xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
+
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 0b8669f28d56..1a2545f962c4 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -7,6 +7,7 @@
 #define _XE_RAS_H_
 
 #include <linux/types.h>
+
 #include "xe_ras_types.h"
 
 struct xe_device;
@@ -20,5 +21,6 @@ int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *t
 int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
+bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index fe6f3658a2a4..698f73c63393 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -336,4 +336,14 @@ struct xe_ras_set_health_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[2];
 } __packed;
+
+/* Device structures */
+
+/**
+ * struct xe_ras_state - RAS device and firmware state
+ */
+struct xe_ras_state {
+	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
+	bool disable_vram_page_offline;
+};
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 8bf6bbc2f0ae..dd03b1fe8423 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -24,6 +24,7 @@
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
+#include "xe_ras.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
@@ -953,7 +954,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
 
-	if (xe->ras.disable_vram_page_offline) {
+	if (xe_ras_get_disable_vram_page_offline(xe)) {
 		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
 		       addr);
 		return -EOPNOTSUPP;
-- 
2.47.1

