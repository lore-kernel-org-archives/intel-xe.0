Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF0BD68BD7
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 21:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395D110E17C;
	Fri, 15 Nov 2024 21:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlDlwuB/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F0210E17C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 21:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731704450; x=1763240450;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HxmqrJ+WTz3lO9nITWw61wMhbJk9piiNS7HAWsldcNA=;
 b=ZlDlwuB/nTJBYt5jWFEt5n6OXPdmmI+eRnW8PFZDJmVps2BxEYEcwnwF
 BmUf9WqTD8k5ItoP7B00CkKHwj0oAh2NI0FIQ1GYxPCsha9jxg/R52Fu7
 Ngg1aBSsea1xiE2sPvX6debfsSuC7YvyJYhAivRUUuO+KBtNicafvUJUf
 Xp5ttzaomchtsyMhrR7OuFr4xlywptcc+ApiK+Q4grbdnU+5J3MuzH8tR
 7gmk3B1Ps4h1/SHHZ3gJqAXF8wCzQBZ1BkPD/aiY0NJ7oxvsx91zt0zMZ
 AYy1KxLNoaJhymiJ/rzwmDJJqTf2UuG2IR/EhZLyVceIi2RHXxshftDvI Q==;
X-CSE-ConnectionGUID: EtOcizMwQ123aH2l9Z+/Hw==
X-CSE-MsgGUID: eVC/ja9uRVGAe764N2B2uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31830686"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31830686"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 13:00:49 -0800
X-CSE-ConnectionGUID: XZve0ZzHRy+GBGUJ7UpMiw==
X-CSE-MsgGUID: /5yr50fUS8qeVCrVZAqooQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="93501750"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.66])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 13:00:48 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/vf: Print assumed values of the MOCS entries if VF
Date: Fri, 15 Nov 2024 22:00:25 +0100
Message-Id: <20241115210025.2343-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

VF drivers can't access the MOCS registers so their values can't
be printed as part of the gt0/mocs debugfs attribute, but since
MOCS settings are part of the Bspec and SLA between PF and VFs,
we can print assumed MOCS values instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 42 +++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 54d199b5cfb2..9ad5366f4370 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -257,6 +257,14 @@ static const struct xe_mocs_entry gen12_mocs_desc[] = {
 		   L3_1_UC)
 };
 
+static u32 get_entry_control(const struct xe_mocs_info *info, unsigned int index);
+static u32 get_combined_entry_l3cc(const struct xe_mocs_info *info, unsigned int index);
+
+static bool regs_are_not_available(struct xe_gt *gt)
+{
+	return IS_SRIOV_VF(gt_to_xe(gt));
+}
+
 static bool regs_are_mcr(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -275,7 +283,9 @@ static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct d
 	drm_printf(p, "LNCFCMOCS[idx] = [ESC, SCC, L3CC] (value)\n\n");
 
 	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
-		if (regs_are_mcr(gt))
+		if (regs_are_not_available(gt))
+			reg_val = get_combined_entry_l3cc(info, i);
+		else if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
 			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
@@ -307,7 +317,9 @@ static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 		drm_printf(p, "GLOB_MOCS[idx] = [LeCC, TC, LRUM, AOM, RSC, SCC, PFM, SCF, CoS, SSE] (value)\n\n");
 
 		for (i = 0; i < info->num_mocs_regs; i++) {
-			if (regs_are_mcr(gt))
+			if (regs_are_not_available(gt))
+				reg_val = get_entry_control(info, i);
+			else if (regs_are_mcr(gt))
 				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 			else
 				reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
@@ -380,7 +392,9 @@ static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flags,
 	drm_printf(p, "LNCFCMOCS[idx] = [UCL3LOOKUP, GLBGO, L3CC] (value)\n\n");
 
 	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
-		if (regs_are_mcr(gt))
+		if (regs_are_not_available(gt))
+			reg_val = get_combined_entry_l3cc(info, i);
+		else if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
 			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
@@ -425,7 +439,9 @@ static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct
 	drm_printf(p, "LNCFCMOCS[idx] = [ L3CC ] (value)\n\n");
 
 	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
-		if (regs_are_mcr(gt))
+		if (regs_are_not_available(gt))
+			reg_val = get_combined_entry_l3cc(info, i);
+		else if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
 			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
@@ -507,7 +523,9 @@ static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L4_CACHE_POLICY] (value)\n\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
-		if (regs_are_mcr(gt))
+		if (regs_are_not_available(gt))
+			reg_val = get_entry_control(info, i);
+		else if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
 			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
@@ -550,7 +568,9 @@ static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L3_CLOS, L3_CACHE_POLICY, L4_CACHE_POLICY] (value)\n\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
-		if (regs_are_mcr(gt))
+		if (regs_are_not_available(gt))
+			reg_val = get_entry_control(info, i);
+		else if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
 			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
@@ -713,6 +733,13 @@ static u32 l3cc_combine(u16 low, u16 high)
 	return low | (u32)high << 16;
 }
 
+static u32 get_combined_entry_l3cc(const struct xe_mocs_info *info,
+				   unsigned int index)
+{
+	return l3cc_combine(get_entry_l3cc(info, 2 * index),
+			    get_entry_l3cc(info, 2 * index + 1));
+}
+
 static void init_l3cc_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
@@ -722,8 +749,7 @@ static void init_l3cc_table(struct xe_gt *gt,
 	mocs_dbg(gt, "l3cc entries: %d\n", info->num_mocs_regs);
 
 	for (i = 0; i < (info->num_mocs_regs + 1) / 2; i++) {
-		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
-				    get_entry_l3cc(info, 2 * i + 1));
+		l3cc = get_combined_entry_l3cc(info, i);
 
 		mocs_dbg(gt, "LNCFCMOCS[%d] 0x%x 0x%x\n", i,
 			 XELP_LNCFCMOCS(i).addr, l3cc);
-- 
2.43.0

