Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25EBCF649D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B257310E2C8;
	Mon, 30 Sep 2024 05:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fn3gT1FX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7026810E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673242; x=1759209242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rKFmX3r6njewa0oIhn5w7QpcdZH5ygy+MVPugKakKmo=;
 b=Fn3gT1FXJk1bXB9GM0Xk7NMI9Ao44GUfs8UPeP0ryRb/VQ85sb5nesEc
 NOEZgz9IF3pmRayTD8ynChcwGpx7EZ+WMMDNncP4tL5L143yszvoD8aqq
 IEtfJpqBE7lq4icIM8s8HVNtcsxSrxTltGkfiDfsNpEh/BTjXXbiVsIkL
 E0EqufqU8iDN7GHFOOvyCzWsctj0bfJa8PBuB5fXzGqxry903+w9Ggt+2
 k66ztaD/C/NbHgB0VMIFbiAWZbgtnNyRS0fpUls2xaYHfGhxe7W/YbqWG
 J2sp1Hui+tVVAwM8CK7E2UVxrko5X081+H+wnzvRFieorP4INAyZ7xLYO g==;
X-CSE-ConnectionGUID: pdSYcxyJSVKxGvFv4IGfwQ==
X-CSE-MsgGUID: aEVTrULZTQKp1CIrtQHMOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367981"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367981"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:14:01 -0700
X-CSE-ConnectionGUID: Ndj7WS6BQTO5CNMCs9njoQ==
X-CSE-MsgGUID: hp3tiWK3RluKg7bNv3Tb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752238"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 18/25] drm/xe/pat: Update handling of xe_force_wake_get
 return
Date: Mon, 30 Sep 2024 11:01:42 +0530
Message-Id: <20240930053149.1246339-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

v5
- return unsigned int from xe_force_wake_get()
- remove redundant warns

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 66 +++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 6bd6adfdfc74..ecfe868248bc 100644
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
@@ -182,11 +183,12 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
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
 
@@ -198,9 +200,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -211,11 +211,12 @@ static const struct xe_pat_ops xelp_pat_ops = {
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
 
@@ -229,9 +230,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -242,11 +241,12 @@ static const struct xe_pat_ops xehp_pat_ops = {
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
 
@@ -258,9 +258,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -271,11 +269,12 @@ static const struct xe_pat_ops xehpc_pat_ops = {
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
 
@@ -292,9 +291,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-err_fw:
-	xe_assert(xe, !err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /*
@@ -330,12 +327,13 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
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
 
@@ -374,9 +372,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
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

