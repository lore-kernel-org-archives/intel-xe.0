Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8B3E77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2A510E2DC;
	Thu, 12 Dec 2024 01:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d17YFtR6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A9D10E2DC
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965334; x=1765501334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ma3yqk8dlpYVD6pU40QJSxVQKf0O4dtxYMHpcUY6RaQ=;
 b=d17YFtR6sFqmJqGyQBP3D/MujhtjjkXgTgClo+qfmOZsYa1qruweN2mh
 j++ehJlstXuii6Q89kkwsFw16xnpkmqdmb1C5lqKgpkxvnM8ARmpcf15x
 Enku7NKEn7gmOJFpFK6ps0zIy3CpJ/osdvMTrIXNjtkp4cRh7vCNcdnD8
 f/xc35XZaGHNMqCblCPxWDLmt8bbE36aHILdjHyjTOXGSkC9fBnRoRrKR
 9PDg5/0st/U8wZCs5vpu/jLA+z/r3AZvArwGVUXY+KovGGVicZT/x/tfG
 JFSghzHKUqedUuKJMCrKh/hfyfNGyenFfR4xKE58I9PwuFxv9otYDgMO2 A==;
X-CSE-ConnectionGUID: OYygou0uT1Of5PVxusBOfw==
X-CSE-MsgGUID: 14J3LpV4SheeRHUL15nbuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379809"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:14 -0800
X-CSE-ConnectionGUID: pJXd5HhKSOylZCDUSUxztA==
X-CSE-MsgGUID: cl2u9IXvR4GJHwotmqF4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856673"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 11/13] drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
Date: Thu, 12 Dec 2024 02:01:39 +0100
Message-Id: <20241212010141.389-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

Start using GuC buffer cache for the VF's configuration actions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: rebased (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 69 +++++++++++-----------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 65082f12f1a8..8f756f81bc20 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -20,6 +20,7 @@
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc.h"
+#include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_db_mgr.h"
 #include "xe_guc_fwif.h"
@@ -71,48 +72,27 @@ static int pf_send_vf_cfg_reset(struct xe_gt *gt, u32 vfid)
  * Return: number of KLVs that were successfully parsed and saved,
  *         negative error code on failure.
  */
-static int pf_send_vf_cfg_klvs(struct xe_gt *gt, u32 vfid, const u32 *klvs, u32 num_dwords)
+static int pf_send_vf_buf_klvs(struct xe_gt *gt, u32 vfid, struct xe_guc_buf buf, u32 num_dwords)
 {
-	const u32 bytes = num_dwords * sizeof(u32);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_bo *bo;
-	int ret;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(bytes, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	xe_map_memcpy_to(xe, &bo->vmap, 0, klvs, bytes);
-
-	ret = guc_action_update_vf_cfg(guc, vfid, xe_bo_ggtt_addr(bo), num_dwords);
-
-	xe_bo_unpin_map_no_vm(bo);
-
-	return ret;
+	return guc_action_update_vf_cfg(guc, vfid, xe_guc_buf_gpu_addr(buf), num_dwords);
 }
 
 /*
  * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO if reply was malformed,
  *         negative error code on failure.
  */
-static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
-			       const u32 *klvs, u32 num_dwords)
+static int pf_push_vf_buf_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
+			       struct xe_guc_buf buf, u32 num_dwords)
 {
 	int ret;
 
-	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
-
-	ret = pf_send_vf_cfg_klvs(gt, vfid, klvs, num_dwords);
+	ret = pf_send_vf_buf_klvs(gt, vfid, buf, num_dwords);
 
 	if (ret != num_klvs) {
 		int err = ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
+		void *klvs = xe_guc_buf_cpu_ptr(buf);
 		struct drm_printer p = xe_gt_info_printer(gt);
 		char name[8];
 
@@ -125,13 +105,35 @@ static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
 		struct drm_printer p = xe_gt_info_printer(gt);
+		void *klvs = xe_guc_buf_cpu_ptr(buf);
+		char name[8];
 
+		xe_gt_sriov_info(gt, "pushed %s config with %u KLV%s:\n",
+				 xe_sriov_function_name(vfid, name, sizeof(name)),
+				 num_klvs, str_plural(num_klvs));
 		xe_guc_klv_print(klvs, num_dwords, &p);
 	}
 
 	return 0;
 }
 
+/*
+ * Return: 0 on success, -ENOBUFS if no free buffer for the indirect data,
+ *         negative error code on failure.
+ */
+static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
+			       const u32 *klvs, u32 num_dwords)
+{
+	CLASS(xe_guc_buf_from_data, buf)(&gt->uc.guc.buf, klvs, num_dwords * sizeof(u32));
+
+	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
+
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	return pf_push_vf_buf_klvs(gt, vfid, num_klvs, buf, num_dwords);
+}
+
 static int pf_push_vf_cfg_u32(struct xe_gt *gt, unsigned int vfid, u16 key, u32 value)
 {
 	u32 klv[] = {
@@ -304,16 +306,17 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	u32 max_cfg_dwords = SZ_4K / sizeof(u32);
+	u32 max_cfg_dwords = xe_guc_buf_cache_dwords(&gt->uc.guc.buf);
+	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, max_cfg_dwords);
 	u32 num_dwords;
 	int num_klvs;
 	u32 *cfg;
 	int err;
 
-	cfg = kcalloc(max_cfg_dwords, sizeof(u32), GFP_KERNEL);
-	if (!cfg)
-		return -ENOMEM;
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
 
+	cfg = xe_guc_buf_cpu_ptr(buf);
 	num_dwords = encode_config(cfg, config, true);
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
 
@@ -328,11 +331,11 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 		num_dwords += encode_config_ggtt(cfg + num_dwords, other, true);
 	}
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
+	xe_guc_buf_flush(buf);
 
 	num_klvs = xe_guc_klv_count(cfg, num_dwords);
-	err = pf_push_vf_cfg_klvs(gt, vfid, num_klvs, cfg, num_dwords);
+	err = pf_push_vf_buf_klvs(gt, vfid, num_klvs, buf, num_dwords);
 
-	kfree(cfg);
 	return err;
 }
 
-- 
2.47.1

