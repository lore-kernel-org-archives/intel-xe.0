Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF874E77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 18:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4B710E436;
	Fri, 13 Dec 2024 18:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0WDsOfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D27010E332
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734113423; x=1765649423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iEyEw3MTolRjfft1lOBXh5+ikQW2moTXddUgQkqZWeU=;
 b=N0WDsOfhXYWIR2ZOvEza7CupVfJT5HNcsiQ9mM9oBBigCv0FYz65VYlo
 efCuXANTTUX6uakkOZAhj4iD/fkWYS7Sa7qDlMpw+n1uPyWHJal4SklK2
 AGImZ3y2NNDjSnGxawraY8Jz3XJKHwuz7Y9Zl1bfXv3v1SnKHcmyMj97/
 C9eM2/4WIJtPNoTxxiYFYzVNLBaEh1jSDRvIdi311r3hyBmfw76CSFKFl
 F5MEFkw2WOlJUpI8akuEGEY8eO4qToWIh9aWLToGBq7n3Pummlcz6rAAo
 vSaE4naF0PAE/HeOkaeX8VwY8JKvL6OIjjQvM4LOec+kkI8WMoDBjg48q Q==;
X-CSE-ConnectionGUID: 6pAsThn7SLuTW16YGArIOg==
X-CSE-MsgGUID: F41T+1GoSbCBNjzIJiV6kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34304408"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34304408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 10:10:22 -0800
X-CSE-ConnectionGUID: CjG1FOxzRMWhfa6O+MBVhw==
X-CSE-MsgGUID: /Qz9t5VbQdiQ9YRhDrF9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101177902"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 10:10:22 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Jesus Narvaez <jesus.narvaez@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v3] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
Date: Fri, 13 Dec 2024 10:10:12 -0800
Message-ID: <20241213181012.2178794-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
on RCS and CCSes with different address spaces, which on DG2 is
required as a WA for an HW bug. On newer platforms, this block has
been moved in HW at the CS level, by stalling the RCS/CCS context
switch when one of the other RCS/CCSes is busy with a different
address space. While functionally correct, having a submission
stalled on the HW limits the GuC ability to shuffle things around and
can cause complications if the non-stalled submission runs for a long
time, because the GuC doesn't know that the stalled submission isn't
actually running and might declare it as hung. Therefore, we enable
the DUAL_QUEUE_WA on all newer platforms to move management back to
the GuC.

Note that the GuC specs also recommend enabling this for all platforms
starting from MTL that have a CCS.

v2: only apply the WA on GTs that have CCS engines
v3: split comment (Jonathan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Jesus Narvaez <jesus.narvaez@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4e2868efb620..408365dfe4ee 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -147,6 +147,34 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
 	return flags;
 }
 
+static bool needs_wa_dual_queue(struct xe_gt *gt)
+{
+	/*
+	 * The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
+	 * on RCS and CCSes with different address spaces, which on DG2 is
+	 * required as a WA for an HW bug.
+	 */
+	if (XE_WA(gt, 22011391025))
+		return true;
+
+	/*
+	 * On newer platforms, the HW has been updated to not allow parallel
+	 * execution of different address spaces, so the RCS/CCS will stall the
+	 * context switch if one of the other RCS/CCSes is busy with a different
+	 * address space. While functionally correct, having a submission
+	 * stalled on the HW limits the GuC ability to shuffle things around and
+	 * can cause complications if the non-stalled submission runs for a long
+	 * time, because the GuC doesn't know that the stalled submission isn't
+	 * actually running and might declare it as hung. Therefore, we enable
+	 * the DUAL_QUEUE_WA on all newer platforms on GTs that have CCS engines
+	 * to move management back to the GuC.
+	 */
+	if (CCS_MASK(gt) && GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
+		return true;
+
+	return false;
+}
+
 static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -159,7 +187,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 14014475959))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
-	if (XE_WA(gt, 22011391025))
+	if (needs_wa_dual_queue(gt))
 		flags |= GUC_WA_DUAL_QUEUE;
 
 	/*
-- 
2.43.0

