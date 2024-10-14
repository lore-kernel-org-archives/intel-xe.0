Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942B6CFC501
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 07:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6187710E3A6;
	Mon, 14 Oct 2024 07:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjyWSN9y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1344410E3A9
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 07:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728891482; x=1760427482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=brprc0M83BI2AUlTj0gPoK7hRVQzFCzVZmklaPt1hp0=;
 b=hjyWSN9yre8uCnwzHW0dGNAPBEYe6FZ8l5+2nzG5UeNtDMHaabsnClYM
 qn3GFLmaPk2Z9Bos7Ko7jgeyRyohJdoNXcB0I/RNHIJOtfyp4M+1+MLiK
 TmNjrLJJr/UostXT6VRYaXUSoQ5bGffH8ci7JwLphfhOJoveAE4orrJ+h
 xKuorfsB28QDsGmf4brZrtz4fxpjGqNe701Kx1lAQmJ5LFAYE4TJHBSCF
 GU8QG1O49Gm8Pg4Ns42ikXdMuLaFuOvhI3kUsUIHPNt1wBD2AlmjHdRTg
 i6C0d7M5ISPooG9K6dqkHXbv8oMLYzXQxZrErYhvFvhB/xiEMwgzn4WZP A==;
X-CSE-ConnectionGUID: l6e3th3PRs2Xr5uqu+bu1g==
X-CSE-MsgGUID: v5qI69MYTJKYUEs5y2vsjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27686811"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="27686811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 00:38:01 -0700
X-CSE-ConnectionGUID: HiX28HytSsWss9HpaeEHlA==
X-CSE-MsgGUID: JNahKLpET/m95A4ja3//ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82268746"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 00:37:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v9 19/26] drm/xe/pat: Update handling of xe_force_wake_get
 return
Date: Mon, 14 Oct 2024 13:25:54 +0530
Message-Id: <20241014075601.2324382-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Update the return handling of xe_force_wake_get()
to reflect this behavior, and ensure that the return value is passed as
input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.
- don't use xe_assert() to report HW errors (Michal)

v5
- return unsigned int from xe_force_wake_get()
- remove redundant warns

v7
- Fix commit message
- Remove redundant header

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 65 +++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index b16473818173..30fdbdb9341e 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -182,11 +182,12 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	unsigned int fw_ref;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -198,9 +199,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -211,11 +210,12 @@ static const struct xe_pat_ops xelp_pat_ops = {
 static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	unsigned int fw_ref;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -229,9 +229,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -242,11 +240,12 @@ static const struct xe_pat_ops xehp_pat_ops = {
 static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	unsigned int fw_ref;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -258,9 +257,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -271,11 +268,12 @@ static const struct xe_pat_ops xehpc_pat_ops = {
 static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	unsigned int fw_ref;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -292,9 +290,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /*
@@ -330,12 +326,13 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	unsigned int fw_ref;
 	u32 pat;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err_fw;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return;
 
 	drm_printf(p, "PAT table:\n");
 
@@ -374,9 +371,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
-- 
2.34.1

