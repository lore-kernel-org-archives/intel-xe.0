Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AE3CAC593
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0706E10E4E6;
	Tue, 17 Sep 2024 17:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReCjKKe9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5F910E4ED
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595813; x=1758131813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ezbA21SoH0fbRe8c0IB3fCrbwGK3SkZT6KpqVX6xq6U=;
 b=ReCjKKe94WhtdiErEJJTBlAvW2hm2Ej7ARhy7OxN3tn0MtzqToaAaO45
 dqWrSFytpEtUplM2cS95Co92wpuCpg9xQldq7xDHIERntiaLGnrVjt9/F
 qBSgsxI8jcjTB+mtHbuT5SOgNlZC9zwVTta9HRsyHqbcogHJ7pIi6I5z1
 hMbd0AmW8cLVwc22+JWartONkMLP1JTwiRLpDxfLT8wpJ0704nC1SuOM1
 Dds89smA1hubJ4hCHtyGkl2rkJho+bdYdZD5wgs/JsZbY8AqxU2kNpVoB
 aJG0n7mll8cEHsK2Z+J8SJwO4fXSFvyKoaSsC58BDwVCXzUIb9ARZd8vu A==;
X-CSE-ConnectionGUID: msEpsNj1QtuP0W3wFa/LQQ==
X-CSE-MsgGUID: gItziJRBRwyHfriBVlKXuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562022"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:56:53 -0700
X-CSE-ConnectionGUID: IoPrRHtWQHq4nAKKqfotmg==
X-CSE-MsgGUID: mvPOq1UBTzqhpYHB0HOQ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926529"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:56:51 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 16/23] drm/xe/pat: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 23:44:18 +0530
Message-Id: <20240917181425.515871-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

