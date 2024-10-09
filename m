Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6484CCEE330
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 17:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D3C10E79C;
	Wed,  9 Oct 2024 17:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5GsiL8l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FD410E79B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 17:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728494508; x=1760030508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KMYELvSi+mZx6dryumrFw/Z3SWw2FEtuPAuEGHpJJc4=;
 b=A5GsiL8l8N9go2IJOC8USqIHkKEKlchhLex5+8s1suQyt+nYpBeHHpJy
 OVI4OGzn5vqVk8xYPBgufPQ92Uv3eGrSYECb/t+2L+uZv4IoBce8VqbDZ
 unmMmxSS/dPXPU9eneBXuD2Lcf4/uVxGBDM4ohza9nBMuhe7lS63Htot+
 suFlhSmdnxb8enOlYIJPqwRaPfiy7hLdOpYvHIz9kBCczv1UKtMkAvxa6
 xKdeP1jZIHvZ49zOD5YsNuVnvACQv3V+7blQ1V0+uCgE6VryLRN/AnP9c
 oMLjwPjSxjTL8nwsKW0rOuYbS+IFY8jqoDDrGWMt9Ivjxcc3IAZBxX+5R A==;
X-CSE-ConnectionGUID: she1nMtETgShoBzhm4awCg==
X-CSE-MsgGUID: Bog5Yr+SRNSgtm541Kt6zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27292671"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27292671"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:48 -0700
X-CSE-ConnectionGUID: l0907yUKSJa69ayBuVvKyQ==
X-CSE-MsgGUID: QuVJS6KQSsuq3gPJzcuv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76265773"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/5] drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
Date: Wed,  9 Oct 2024 19:21:25 +0200
Message-Id: <20241009172125.1539-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241009172125.1539-1-michal.wajdeczko@intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 67 +++++++++++-----------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a863e50b756e..4035822de276 100644
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
+		void *klvs = xe_guc_buf_sync(buf);
 		struct drm_printer p = xe_gt_info_printer(gt);
 		char name[8];
 
@@ -125,13 +105,35 @@ static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
 		struct drm_printer p = xe_gt_info_printer(gt);
+		void *klvs = xe_guc_buf_sync(buf);
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
+	CLASS(xe_guc_buf_from_data, buf)(gt->sriov.pf.buf_cache, klvs, num_dwords * sizeof(u32));
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
@@ -299,16 +301,17 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	CLASS(xe_guc_buf, buf)(gt->sriov.pf.buf_cache, SZ_4K);
 	u32 max_cfg_dwords = SZ_4K / sizeof(u32);
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
 
@@ -323,11 +326,11 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
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
2.43.0

