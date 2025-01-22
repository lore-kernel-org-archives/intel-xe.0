Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48114C02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A5210E066;
	Wed, 22 Jan 2025 21:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VT9ddtAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9094110E1CD
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737582644; x=1769118644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l088ILMvoodZZdVGMThceOyHMlAPPiR2/osn956Y3M0=;
 b=VT9ddtAoXwx1BpB2D+VCwgGAaO6ZTyCnWnNinhMOZCy8IwDsFl0Cwlma
 NLvJaJCQCL4rHBqsueRUgEmzICY7fNVsRwsAbnxYhvI0nhGhE3M/uCTj1
 WKFEJx623f+JHYwz+J/R3edVAfH6loNI3rdgs7tWOvQJmsVPEXku5pE/7
 Bl0aKLcA2ChHSCDX6AvNksRIlrzTY0e+g1qMKkIRlAWFYXSQueBIkhihs
 oijTZsFYDw4cAK9I66trNZ3tS8AhC+jT+mlzEb8jAqHw5mM+Pl1g5vhLr
 73986yxOLvu0LrPe7kPpxA4UVzXOHYCPgdPT+XrYDZPPfPl+SBvgJVx9D w==;
X-CSE-ConnectionGUID: iIzgM5dwTz2qDK/Bov2qhw==
X-CSE-MsgGUID: OTmGs3eySHa/f2lgnIDuRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41730977"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="41730977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:50:44 -0800
X-CSE-ConnectionGUID: E5wlEV25QEewqAktzFhfww==
X-CSE-MsgGUID: GqtrTXdUSnCNMF0+XnGwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112365829"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:50:42 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Use GuC Buffer Cache during policy provisioning
Date: Wed, 22 Jan 2025 22:49:53 +0100
Message-Id: <20250122214955.632-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250122214955.632-1-michal.wajdeczko@intel.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Start using GuC buffer cache for the SRIOV policy configuration
actions. This is a required step before we could declare SRIOV
PF as being a reclaim safe.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 50 +++++++++++-----------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index c00fb354705f..4445f660e6d1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -10,6 +10,7 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_printk.h"
+#include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_klv_helpers.h"
 #include "xe_pm.h"
@@ -34,48 +35,28 @@ static int guc_action_update_vgt_policy(struct xe_guc *guc, u64 addr, u32 size)
  * Return: number of KLVs that were successfully parsed and saved,
  *         negative error code on failure.
  */
-static int pf_send_policy_klvs(struct xe_gt *gt, const u32 *klvs, u32 num_dwords)
+static int pf_send_policy_klvs(struct xe_gt *gt, struct xe_guc_buf buf, u32 num_dwords)
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
-				  XE_BO_FLAG_GGTT);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	xe_map_memcpy_to(xe, &bo->vmap, 0, klvs, bytes);
-
-	ret = guc_action_update_vgt_policy(guc, xe_bo_ggtt_addr(bo), num_dwords);
-
-	xe_bo_unpin_map_no_vm(bo);
-
-	return ret;
+	return guc_action_update_vgt_policy(guc, xe_guc_buf_flush(buf), num_dwords);
 }
 
 /*
  * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO if reply was malformed,
  *         negative error code on failure.
  */
-static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
-			       const u32 *klvs, u32 num_dwords)
+static int pf_push_policy_buf_klvs(struct xe_gt *gt, u32 num_klvs,
+				   struct xe_guc_buf buf, u32 num_dwords)
 {
 	int ret;
 
-	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
-
-	ret = pf_send_policy_klvs(gt, klvs, num_dwords);
+	ret = pf_send_policy_klvs(gt, buf, num_dwords);
 
 	if (ret != num_klvs) {
 		int err = ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
 		struct drm_printer p = xe_gt_info_printer(gt);
+		void *klvs = xe_guc_buf_cpu_ptr(buf);
 
 		xe_gt_sriov_notice(gt, "Failed to push %u policy KLV%s (%pe)\n",
 				   num_klvs, str_plural(num_klvs), ERR_PTR(err));
@@ -86,6 +67,23 @@ static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
 	return 0;
 }
 
+/*
+ * Return: 0 on success, -ENOBUFS if there is no free buffer for the indirect data,
+ *         negative error code on failure.
+ */
+static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
+			       const u32 *klvs, u32 num_dwords)
+{
+	CLASS(xe_guc_buf_from_data, buf)(&gt->uc.guc.buf, klvs, num_dwords * sizeof(u32));
+
+	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
+
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	return pf_push_policy_buf_klvs(gt, num_klvs, buf, num_dwords);
+}
+
 static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
 {
 	u32 klv[] = {
-- 
2.47.1

