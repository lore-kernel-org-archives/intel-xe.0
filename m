Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF07C36019
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F91710E21B;
	Tue, 17 Sep 2024 12:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRS0Zcs4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC7110E211
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574636; x=1758110636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ezbA21SoH0fbRe8c0IB3fCrbwGK3SkZT6KpqVX6xq6U=;
 b=RRS0Zcs4ffJx8dnuU5I4Y+HR2bVIJoEeugbZUh16TC2IMltji+t8WOzM
 LcUqFzIXUXeza2NPp/qdtwoMleiDEbrgvJj+JUYrEVXsa0irxGQnLAkRM
 7z7VAU+Kg9Ttl3ph1OupoR7HqZtb/7BMhclhcq4d+MfS0eNTgh33FwyU4
 dIn3YaGuR77WoYrCDfzSGCwwMlD0sVfZ0qRQFTbqxHpolColqj58j1nFi
 P6l/DsQZ1ENzZKEXIFdjP1F0jDvv4c3tudaWg2fo8keF/OkVgPMZ0rN3B
 UAko5r+sENa70zNmkNf/1zMpooYA8DLXsQy8WZJkKXk5MIn87kNERJ9Ku g==;
X-CSE-ConnectionGUID: avInKBJ3TAm7xPSS+ho01w==
X-CSE-MsgGUID: xgIv0i0lSmawqGXp7v9WxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210654"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210654"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:03:50 -0700
X-CSE-ConnectionGUID: VjIFY+6bR06Ehoz5Dw8IIA==
X-CSE-MsgGUID: aAoFkrHIR2W/wkHAiAntHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388569"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:03:49 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 16/23] drm/xe/pat: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 17:51:19 +0530
Message-Id: <20240917122126.438448-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.
- don't use xe_assert() to report HW errors (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 56 ++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 6bd6adfdfc74..43a2448a8e42 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -15,6 +15,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_gt_printk.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
@@ -182,10 +183,11 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	xe_wakeref_t fw_ref;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		goto err_fw;
 
 	drm_printf(p, "PAT table:\n");
@@ -198,9 +200,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, !err);
+	xe_gt_WARN_ON(gt, !fw_ref);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -211,10 +213,11 @@ static const struct xe_pat_ops xelp_pat_ops = {
 static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	xe_wakeref_t fw_ref;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		goto err_fw;
 
 	drm_printf(p, "PAT table:\n");
@@ -229,9 +232,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, !err);
+	xe_gt_WARN_ON(gt, !fw_ref);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -242,10 +245,11 @@ static const struct xe_pat_ops xehp_pat_ops = {
 static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	xe_wakeref_t fw_ref;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		goto err_fw;
 
 	drm_printf(p, "PAT table:\n");
@@ -258,9 +262,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, !err);
+	xe_gt_WARN_ON(gt, !fw_ref);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -271,10 +275,11 @@ static const struct xe_pat_ops xehpc_pat_ops = {
 static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	xe_wakeref_t fw_ref;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		goto err_fw;
 
 	drm_printf(p, "PAT table:\n");
@@ -292,9 +297,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, !err);
+	xe_gt_WARN_ON(gt, !fw_ref);
 }
 
 /*
@@ -330,11 +335,12 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err;
+	xe_wakeref_t fw_ref;
 	u32 pat;
+	int i;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		goto err_fw;
 
 	drm_printf(p, "PAT table:\n");
@@ -374,9 +380,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, !err);
+	xe_gt_WARN_ON(gt, !fw_ref);
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
-- 
2.34.1

