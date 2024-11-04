Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9F4D1BDDB
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 18:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FB210E3EE;
	Mon,  4 Nov 2024 18:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="No8cvkV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF7310E3EE
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730744667; x=1762280667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kHrxpas9VQxG++BQKjz+dy9NYmRl7jvLW55aeAK2s7E=;
 b=No8cvkV4oAAXplYUOEBdjGXoicbSVIs/IDfMLwo0zXzPxLNuThV8ybJv
 QGkDxPUyL6d2I2SJJwOs3z5Ga+UBuk7bfzHqp5r7ALTsrIv89oYt2tC1t
 IuXKDhzQyVP3UYQL4Fp1kjKoDQKHg87wEH8O1xNv/G+rCfQ2P7Rb6s6Zn
 rh1ivMfgsC11gOYNulkVetM/h2mLnM3OSV3edT7DFfFPLN54C94auDu4A
 aIlPqf4HK6NhHZ3z3RNghPgIEtjc0dEYP8kyoxBEgz7f62hDIcVO8SdyT
 kF6LS/H/paUHuLc6KKayPY/cx9h4vP8MLolO8DrqGN7l9ObLHswA8OF+w g==;
X-CSE-ConnectionGUID: d0b0MCDVSAujBCvGbKAM6g==
X-CSE-MsgGUID: HxTUvcc6Sm+aX0Y1kPZy6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41564907"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41564907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:24:27 -0800
X-CSE-ConnectionGUID: P6hLTG+ORRqep2GyR2mxNA==
X-CSE-MsgGUID: bELAFX1ZSQer+wkfdWso/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83413208"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2024 10:24:27 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v2] drm/xe/guc: Fix missing init value and add register order
 check
Date: Mon,  4 Nov 2024 10:24:25 -0800
Message-Id: <20241104182425.162007-1-zhanjun.dong@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes from prior revs:
 v2:- Correct the fix tag pointed commit
      Add examples in comments for warning
      Add 1 missing hi condition check
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 80 +++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index cc72446a5de1..8e534471b566 100644
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
 
@@ -1701,29 +1702,76 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
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
-		}
+			}
+			break;
+
+		case REG_32BIT:
+			if (low32_ready) {
+				/* Incorrect 64bit register order. Possible missing high.
+				 * for example:
+				 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
+				 *  { XXX_REG(0), REG_32BIT, 0, 0, "XXX_REG"},
+				 */
+				XE_WARN_ON(!low32_ready);
+				low32_ready = false;
+				break;
+			}
 
-		if (is_ext) {
-			int dss, group, instance;
+			if (is_ext) {
+				int dss, group, instance;
 
-			group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
-			instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
-			dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
+				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
+				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
+				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
 
-			drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
-		} else {
-			drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
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

