Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A16CD1297
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F2810EB8A;
	Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1LDtyUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C43210EB7F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i5VzLU8bmKQZDt/akF15lewevDIqXe+35WmdW+Fxlew=;
 b=R1LDtyUN67hYuuIbWyCW71qsRAAx61j8fvpW61BmUBfxJn04s7mbXlwx
 J/YrMJFRiTow7B1WRGfxQjErKATVW575thqI8qBKzi+YvblXFwAMKPjAV
 ZvxULq3p3MH+yeVkgVWGY4MnwwyKnyyuqZcd73pyPzoLGWlDq83wyGmvv
 cGTx0O0XasnDNe/1RhLH3cBEV6vzo4rpLX/L0YFslWXxhFJmoo5BK4tSj
 xudmDMYNt5xeKBAKnkS04JjF3Fe5O3BxlmlTTUcTIA3jHU16PvKtNW4uo
 v/ydOdFrfbcRFRNm30XPdsiowmHtH0Uj8c2diRSn9w16GbJ3yAbFJcalE Q==;
X-CSE-ConnectionGUID: w9+Jmu/YTqulBU1uwyELiA==
X-CSE-MsgGUID: RE+iPk3qT/eeFn+KxEyL2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733147"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733147"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
X-CSE-ConnectionGUID: S/0PLnIISXSSyZovyzuwbQ==
X-CSE-MsgGUID: Q6fYmbfkThKhO/wt6G7JCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271189"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 14/33] drm/xe/pat: Use scope-based forcewake
Date: Fri,  7 Nov 2025 10:13:30 -0800
Message-ID: <20251107181315.631642-49-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake in the PAT code to slightly
simplify the code.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 2a963b8ff807..97b5e995f7d7 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -233,10 +233,9 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_force_wake_ref fw_ref;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
@@ -250,7 +249,6 @@ static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -262,10 +260,9 @@ static const struct xe_pat_ops xelp_pat_ops = {
 static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_force_wake_ref fw_ref;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
@@ -281,7 +278,6 @@ static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -293,10 +289,9 @@ static const struct xe_pat_ops xehp_pat_ops = {
 static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_force_wake_ref fw_ref;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
@@ -310,7 +305,6 @@ static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -322,10 +316,9 @@ static const struct xe_pat_ops xehpc_pat_ops = {
 static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_force_wake_ref fw_ref;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
@@ -344,7 +337,6 @@ static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -361,11 +353,10 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_force_wake_ref fw_ref;
 	u32 pat;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
@@ -406,7 +397,6 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -419,11 +409,10 @@ static const struct xe_pat_ops xe2_pat_ops = {
 static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_force_wake_ref fw_ref;
 	u32 pat;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
@@ -456,7 +445,6 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
-- 
2.51.1

