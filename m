Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BE0C2BA15
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D1510E400;
	Mon, 17 Jun 2024 14:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbSKhz/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF98410E400
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718634885; x=1750170885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fkgVG1gNPNi/N2vLunfOCvLNGo/AoHJiVCgQ3+iis8U=;
 b=RbSKhz/9suqXzbLYW10e2XWzAZSrDsErZY5Mokmty/tZbWFHsOdjuFtR
 1iVABj5iVdp94KC73yKLbRV1adft/9oPyHwbEY7pM1JlSgaf8ytVW2A33
 JOF47AC+wGUbcv6uKEVscNUpG4TomMO4TF/3KJd5dCh+/1zVp5rbA091a
 sjPsxg8tH0gUn/ObC/rMJASh3+02lOO3RBoXLRwrMfV0ELU13VtAOPcQd
 VIF6oGyl4xlaUsC+zkYKkz+bGwi5P+6LwoD54Nb/6GD6zvbpNpd2cJUau
 me6BOtZILwhzwLWi7lt/W5vSswEAjgU08z5o/Qa93hYPBAJ8jEYNlDZ0l w==;
X-CSE-ConnectionGUID: Cll38KEQSw+RlOJSF4pDAQ==
X-CSE-MsgGUID: xkZwhcA1S7CxQ50todOWAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19247223"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="19247223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:34:44 -0700
X-CSE-ConnectionGUID: grlYTeDXRR6pcvHWqOl2eA==
X-CSE-MsgGUID: UaB6/dAgS9eyC+Qn26vHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45647296"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:34:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [RFC 3/3] drm/xe: Use new FW guard in xe_pat.c
Date: Mon, 17 Jun 2024 16:34:30 +0200
Message-Id: <20240617143430.641-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240617143430.641-1-michal.wajdeczko@intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
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

Start using new FW guard to minimize risk of leaking force-wake
references.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 60 +++++++++++++------------------------
 1 file changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 4ee32ee1cc88..b96395694b4b 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -173,12 +173,12 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 
 static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
+	CLASS(xe_fw, guard)(gt_to_fw(gt), XE_FW_GT);
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	if (!guard.fw)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -189,10 +189,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
-
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -202,12 +198,12 @@ static const struct xe_pat_ops xelp_pat_ops = {
 
 static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
+	CLASS(xe_fw, guard)(gt_to_fw(gt), XE_FW_GT);
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	if (!guard.fw)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -220,10 +216,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
-
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -233,12 +225,12 @@ static const struct xe_pat_ops xehp_pat_ops = {
 
 static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
+	CLASS(xe_fw, guard)(gt_to_fw(gt), XE_FW_GT);
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	if (!guard.fw)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -249,10 +241,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
-
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -262,12 +250,12 @@ static const struct xe_pat_ops xehpc_pat_ops = {
 
 static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 {
+	CLASS(xe_fw, guard)(gt_to_fw(gt), XE_FW_GT);
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	if (!guard.fw)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -283,10 +271,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
-
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
 }
 
 /*
@@ -321,13 +305,13 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
 
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
+	CLASS(xe_fw, guard)(gt_to_fw(gt), XE_FW_GT);
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	int i;
 	u32 pat;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	if (!guard.fw)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -365,10 +349,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_L4_POLICY, pat),
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
-
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
-- 
2.43.0

