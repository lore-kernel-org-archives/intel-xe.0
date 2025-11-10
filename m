Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0330DCD13D8
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC5A10E4A0;
	Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgWMiq7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A31410E385
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816833; x=1794352833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3gs6qClGAD1tH/XBvbAfO5dil3A384uyEoHYG7Q66o8=;
 b=AgWMiq7f/YbFzzuHmXVZbCxpB7UuIDGcqMsLdCmrReGOd/GrLcSe0le3
 tfymwa98TpmeY8lkeuu8O9BpLd+eBYdO2et52lZGyzazCIkhXII+8s8Cl
 g0Jjv+sNkWSbpv5NfEzvFmThR44KWa1VdiNEEEyixnEa5oiRGx+ziNAw0
 VMsDXxvmqgDCA13UU7Il6Xj/P27ZoTjxOOOOilrBamFesz3Nt16EHPRsx
 garfwPC4XQHUIauj+Tgg+w8OMcuUZLQgyJwMjTpzvhT5t+tM4f8S4peUI
 C5XhtNoIHTSx7g1JEP6QfFSxBifxXg1V9oRipqXuh/7IQQfugHKKDEyoc Q==;
X-CSE-ConnectionGUID: WAlqIrIIR96kdQHtbYQvTA==
X-CSE-MsgGUID: swdQuslaS5y9ew9vu4tREg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486447"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: B2q0Y/xmQP6/0I1Vr8sWRg==
X-CSE-MsgGUID: Pqfdu8uiS/uCvvloNM0zdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243979"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 11/30] drm/xe/pat: Use scope-based forcewake
Date: Mon, 10 Nov 2025 15:20:29 -0800
Message-ID: <20251110232017.1475869-43-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_pat.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 68171cceea18..97b5e995f7d7 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -233,11 +233,10 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
@@ -250,7 +249,6 @@ static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
@@ -262,11 +260,10 @@ static const struct xe_pat_ops xelp_pat_ops = {
 static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
@@ -281,7 +278,6 @@ static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
@@ -293,11 +289,10 @@ static const struct xe_pat_ops xehp_pat_ops = {
 static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
@@ -310,7 +305,6 @@ static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
@@ -322,11 +316,10 @@ static const struct xe_pat_ops xehpc_pat_ops = {
 static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
@@ -344,7 +337,6 @@ static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
@@ -361,12 +353,11 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	u32 pat;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table: (* = reserved entry)\n");
@@ -406,7 +397,6 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
@@ -419,12 +409,11 @@ static const struct xe_pat_ops xe2_pat_ops = {
 static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	u32 pat;
 	int i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table: (* = reserved entry)\n");
@@ -456,7 +445,6 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
-- 
2.51.1

