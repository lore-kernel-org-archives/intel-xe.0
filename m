Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470FFD6C2AF
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 23:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FCB10E06C;
	Tue, 19 Nov 2024 23:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJmLSn+8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E6810E06C
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 23:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732058039; x=1763594039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aOV1DrYDOcMM+7lMfzPfgcxGBYhXtmX+roRX/nF6yTA=;
 b=FJmLSn+8WyBSPTVfX20fwr3pYVUkL1UMiSpDc/tFyUSTL5mWLeF3B1YL
 RYyTToxzqg30OfANQnht6lYycP217Q8R0TYcmGtcI8qUDrn+ZnjPPZRkx
 lelaS1jih7KIjpNchurFyOEDo/eOnAgw4d0Gq8KBg0jY7i0COgG+K8tXM
 wpaeG+4Ii/RdnCeYoE64ICSgzJjY87CG45vPyiQx2LSFIEUSpp5yTk5n9
 tCIoRHr5bnpxaKOLdc2HCBtJNRG1JKy+8+f/urYsaaHs0z3uMat9OOs7C
 skWqolsfzljuKfNqbb/2rMLs1iluoGfigRmpFqBM9KIeE5KIYjDIDSIu2 g==;
X-CSE-ConnectionGUID: lcSeSxiVRu2OLk3sf550fA==
X-CSE-MsgGUID: aSGqB5ERQjCawYBVCrRFjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="36001850"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="36001850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 15:13:58 -0800
X-CSE-ConnectionGUID: 1/lb4SE5Tm2ONiqzdk3KwQ==
X-CSE-MsgGUID: 2Hqjgdk2QqqoOmy5M8QG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="94533239"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 19 Nov 2024 15:13:58 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4] drm/xe/guc: Fix missing init value and add register order
 check
Date: Tue, 19 Nov 2024 15:13:56 -0800
Message-Id: <20241119231356.1473342-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fix missing initial value for last_value.
For GuC capture register definition, it is required to define 64bit
register in a pair of 2 consecutive 32bit register entries, low first,
then hi. Add code to check this order.

Fixes: ecb633646391 ("drm/xe/guc: Plumb GuC-capture into dev coredump")

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Changes from prior revs:
 v4:- Fix warn on condition and remove skipping
 v3:- Move break inside brace
 v2:- Correct the fix tag pointed commit
      Add examples in comments for warning
      Add 1 missing hi condition check
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 74 +++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index f87755af545f..b06811a822f5 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -102,6 +102,7 @@ struct __guc_capture_parsed_output {
  *                   A 64 bit register define requires 2 consecutive entries,
  *                   with low dword first and hi dword the second.
  *     2. Register name: null for incompleted define
+ *     3. Incorrect order will trigger XE_WARN.
  */
 #define COMMON_XELP_BASE_GLOBAL \
 	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	"FORCEWAKE_GT"}
@@ -1675,10 +1676,10 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 	struct xe_devcoredump *devcoredump = &xe->devcoredump;
 	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
 	struct gcap_reg_list_info *reginfo = NULL;
-	u32 last_value, i;
-	bool is_ext;
+	u32 i, last_value = 0;
+	bool is_ext, low32_ready = false;
 
-	if (!list || list->num_regs == 0)
+	if (!list || !list->list || list->num_regs == 0)
 		return;
 	XE_WARN_ON(!devcore_snapshot->matched_node);
 
@@ -1701,29 +1702,72 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			continue;
 
 		value = reg->value;
-		if (reg_desc->data_type == REG_64BIT_LOW_DW) {
+		switch (reg_desc->data_type) {
+		case REG_64BIT_LOW_DW:
 			last_value = value;
+
+			/*
+			 * A 64 bit register define requires 2 consecutive
+			 * entries in register list, with low dword first
+			 * and hi dword the second, like:
+			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
+			 *  { XXX_REG_HI(0), REG_64BIT_HI_DW,  0, 0, "XXX_REG"},
+			 *
+			 * Incorrect order will trigger XE_WARN.
+			 *
+			 * Possible double low here, for example:
+			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
+			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
+			 */
+			XE_WARN_ON(low32_ready);
+			low32_ready = true;
 			/* Low 32 bit dword saved, continue for high 32 bit */
-			continue;
-		} else if (reg_desc->data_type == REG_64BIT_HI_DW) {
+			break;
+
+		case REG_64BIT_HI_DW: {
 			u64 value_qw = ((u64)value << 32) | last_value;
 
+			/* Incorrect 64bit register order. Possible missing low.
+			 * for example:
+			 *  { XXX_REG(0), REG_32BIT, 0, 0, NULL},
+			 *  { XXX_REG_HI(0), REG_64BIT_HI_DW, 0, 0, NULL},
+			 */
+			XE_WARN_ON(!low32_ready);
+			low32_ready = false;
+
 			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
-			continue;
+			break;
 		}
 
-		if (is_ext) {
-			int dss, group, instance;
+		case REG_32BIT:
+			/* Incorrect 64bit register order. Possible missing high.
+			 * for example:
+			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
+			 *  { XXX_REG(0), REG_32BIT, 0, 0, "XXX_REG"},
+			 */
+			XE_WARN_ON(low32_ready);
 
-			group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
-			instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
-			dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
+			if (is_ext) {
+				int dss, group, instance;
 
-			drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
-		} else {
-			drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
+				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
+				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
+				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
+
+				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
+			} else {
+				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
+			}
+			break;
 		}
 	}
+
+	/* Incorrect 64bit register order. Possible missing high.
+	 * for example:
+	 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
+	 *  } // <- Register list end
+	 */
+	XE_WARN_ON(low32_ready);
 }
 
 /**
-- 
2.34.1

