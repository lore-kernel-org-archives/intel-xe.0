Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562EEC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B5E10E744;
	Mon,  7 Sep 2026 09:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlkgqQ2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68BF10E744
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788774468; x=1820310468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QSy4N5+rjOo6Eaw6yCAbOuhYZq+ObIWJifhfw2E+IRA=;
 b=GlkgqQ2HccLTCqKoeXeClellYMYxK4sU/16/HI+lPyzWqlWZx5HklzUL
 mVgLu8VRddkIyKIQBRcxlFJQWLyHBORF2JJbxukgXCFUe15xYyS1ACQiR
 xkgGsDc/FhTimV/vJ4jREq33skSowjUQJE8LoqaWdGIkg+SolbClGuP8e
 R7JRKb5LimMrH5c7fq5Ojfz3QyxDaapn24y9B+qUEeVw5d8+iZ4BvAPy6
 viBtpn+FN4MOJsS0QghawDf2QuunSWcF/WbiMQNflJzGJ808xcZAoOW1D
 /emBt+nB6M6ycR9qYVDGiQCdEFChXaZSxNd6EvFG8U6hoI9n8lIq/ZSAu g==;
X-CSE-ConnectionGUID: 9KnfUJBIRyO0YCjTYIvgyA==
X-CSE-MsgGUID: yl3fujvBTuCGCYShY44gvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100532037"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100532037"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:48 -0700
X-CSE-ConnectionGUID: xUtW41pNRmigbsW8iigZnw==
X-CSE-MsgGUID: dZWFb3MySXGIJiHfayINpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274175772"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:46 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v2 3/6] drm/xe: Separate drm-ras netlink data from device and
 firmware RAS state
Date: Mon,  7 Sep 2026 15:17:09 +0530
Message-ID: <20260907094706.1407436-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260907094706.1407436-8-riana.tauro@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device_types.h  | 11 +++++++++--
 drivers/gpu/drm/xe/xe_drm_ras.c       | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 ---
 drivers/gpu/drm/xe/xe_hw_error.c      |  6 +++---
 drivers/gpu/drm/xe/xe_ras.c           | 15 +++++++--------
 drivers/gpu/drm/xe/xe_ras.h           |  6 ++++++
 drivers/gpu/drm/xe/xe_ras_types.h     | 10 ++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  3 ++-
 8 files changed, 45 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..f9dd65d94417 100644
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
@@ -550,8 +551,14 @@ struct xe_device {
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
index 648e46df831d..b5b0c1a3a663 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1126,19 +1126,18 @@ void xe_ras_init(struct xe_device *xe)
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
+	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
+	 * once the feature flag is plumbed through device info.
+	 */
+	xe->ras.state.disable_page_offline =
+		xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
+
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 0b8669f28d56..6e65443cd262 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -7,6 +7,7 @@
 #define _XE_RAS_H_
 
 #include <linux/types.h>
+#include "xe_device_types.h"
 #include "xe_ras_types.h"
 
 struct xe_device;
@@ -21,4 +22,9 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 
+static inline bool xe_ras_get_disable_page_offline(struct xe_device *xe)
+{
+	return xe->ras.state.disable_page_offline;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 7bfd86c9d135..ca459e785add 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -414,4 +414,14 @@ struct xe_ras_set_health_response {
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
+	/** @disable_page_offline: cached configfs policy, immutable after init */
+	bool disable_page_offline;
+};
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9a514d983e90..2c4722a956a0 100644
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
@@ -933,7 +934,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
 
-	if (xe->ras.disable_vram_page_offline) {
+	if (xe_ras_get_disable_page_offline(xe)) {
 		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
 		       addr);
 		return -EOPNOTSUPP;
-- 
2.47.1

