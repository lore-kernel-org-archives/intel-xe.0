Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1DFC982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECED10E5C2;
	Mon, 21 Sep 2026 09:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jt3RD6W9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1666310E5C2
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789982482; x=1821518482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=92ujABEU/3wutm2xkhvB2KZp+tS7zdl5pSp0aroXPMc=;
 b=Jt3RD6W9YB3hbJkgLkE49iiye+ZdlIRoi0sQ4FJWeQmpvh3ltU2qFa6B
 Tbx/+neKj6jLCWEI3vH7fwCt7QRCCpZCvl60FZ4b1cMJe1IShq1pg2l3X
 l9Y9defAdYpGHYn0k6nHYohgErNBGNj42GTFGCZPD+hw+Ri8TP7/8sRJf
 xgCgAWvU/wBxfz8o/55r1NVj3fhThRk7hZfmL0KHkxHA3uWusO6k4hYK1
 OyizIoanUPetSlXojYsjd5aDHRVHYUL/gFjxENvelD63SjN+ryL/idsim
 /xiqJDg9puICdHCz8thn1ghBGMvy4WuLJuuA30tanXpyYkEJ6FBbF6hmE g==;
X-CSE-ConnectionGUID: mFwuA2ViQfaaJFr/c6d9Hw==
X-CSE-MsgGUID: Vk6zIT+pTnSTy2D0koTOFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90606618"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90606618"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:21:22 -0700
X-CSE-ConnectionGUID: NpltMdFtQeaz4UmiTBWQ3w==
X-CSE-MsgGUID: fIUYbMZCSrub2vsbHkNjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3578425"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 02:21:21 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 07/10] drm/xe/vf: Add bounds checking for queried GGTT
 base and size
Date: Mon, 21 Sep 2026 14:51:06 +0530
Message-ID: <20260921092101.1243989-19-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
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

Add explicit bounds checks for GGTT base and size which can detect
and reject invalid configuration data from a misconfigured or
malfunctioning PF, preventing protocol violations and protecting VF
initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V9 -> V10:
- Updated vf_get_ggtt_alignment() function (Sashiko).

V8 -> V9:
- Align GGTT base and size to XE_PAGE_SIZE (Sashiko).

V7 -> V8:
- Align GGTT base and size to PAGE_SIZE (Michal W).

V6 -> V7:
- Added new helper to get ggtt alignment.
- Rearranged the base and sizes checks (Sashiko, Michal W).

V5 -> V6:
- Updated error codes for unaligned GGTT base and size (Michal W).
- Fixed review comments (Michal W).

V4 -> V5:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 45 ++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 715dfb04a1f3..1d79bde2ad73 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -15,6 +15,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_gtt_defs.h"
 #include "regs/xe_guc_regs.h"
 
 #include "xe_assert.h"
@@ -486,26 +487,62 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 	return value;
 }
 
+static u64 vf_get_ggtt_alignment(struct xe_gt *gt)
+{
+	return xe_sriov_ggtt_alignment(gt_to_xe(gt));
+}
+
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
+	u64 alignment = vf_get_ggtt_alignment(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_guc *guc = &gt->uc.guc;
-	u64 start, size, ggtt_size;
+	u64 start, size, ggtt_size, end;
+	u64 start_query, size_query;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
+	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start_query);
 	if (unlikely(err))
 		return err;
 
-	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
+	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size_query);
 	if (unlikely(err))
 		return err;
 
-	if (!size)
+	if (!size_query)
 		return -ENODATA;
 
+	start = ALIGN(start_query, alignment);
+	if (check_add_overflow(start_query, size_query, &end)) {
+		xe_gt_sriov_err(gt, "GGTT range overflow: base %#llx, size %#llx\n",
+				start_query, size_query);
+		return -ERANGE;
+	}
+
+	end = ALIGN_DOWN(end, alignment);
+	if (end <= start) {
+		xe_gt_sriov_err(gt, "GGTT range too small: base %#llx, size %#llx\n",
+				start_query, size_query);
+		return -ERANGE;
+	}
+
+	size = end - start;
+
+	if (start != start_query)
+		xe_gt_sriov_notice(gt, "Unaligned GGTT base %#llx aligned to %#llx\n",
+				   start_query, start);
+	if (size != size_query)
+		xe_gt_sriov_notice(gt, "Unaligned GGTT size %#llx aligned to %#llx\n",
+				   size_query, size);
+
+	if (start < xe_wopcm_size(gt_to_xe(gt)) || end > GUC_GGTT_TOP) {
+		xe_gt_sriov_err(gt, "Out of bounds GGTT configuration: base %#llx, size %#llx\n",
+				start, size);
+		return -ERANGE;
+	}
+
 	xe_tile_sriov_vf_ggtt_base_store(tile, start);
 	ggtt_size = xe_tile_sriov_vf_ggtt(tile);
 	if (!ggtt_size) {
-- 
2.53.0

