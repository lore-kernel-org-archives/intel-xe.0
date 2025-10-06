Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F891CCD189
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B6E10E3FE;
	Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7+Q22PO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C36710E344
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747493; x=1791283493;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nnz/k82xy5AY1h7EKo5RjCVk4jEE1adrn0Y4JkA8eYY=;
 b=e7+Q22PO6SQHpWkiXfjLlcngK20Mh/7ZkKqvD+Ye7PuglmDOoF/ZWgcR
 puxj9mlAIWXv84jz4WAD2D6NCgecYQlAPj658yJ2QkRD4Z6JC839dp+9a
 pXaavZiPYNt/fbiZ5KkcG906lKDTUlleGq3W1wD3S1ac812Rjt3RqRTmH
 CUc7ajzdhhTRAl/PP79YhcOpCyUEE28LQbVkGwL+AA+87KSk9P39sIsjw
 s4jVkbgOul85pWfKRKkrN0+7daesCU8woWNnLqjhO3bWu2EG6H64zNiwv
 yddFsMqj5Zsqgar7LdrdtpH7bL6hiOY6QUZ32gI/SBv5W06jAr1SYD/bG g==;
X-CSE-ConnectionGUID: TnoWzonxTIeZNW1DLMmKYQ==
X-CSE-MsgGUID: ejhMU+HsRRWq3r+x1AJYgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546331"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546331"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:53 -0700
X-CSE-ConnectionGUID: JMm/QzwqSGKqHY17z9Wn2A==
X-CSE-MsgGUID: PuKnVw4bR0OdNtbtWXt9cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589329"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 18/30] drm/xe/vf: Reset TLB invalidations during VF post
 migration recovery
Date: Mon,  6 Oct 2025 03:44:33 -0700
Message-Id: <20251006104445.2210624-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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

TLB invalidations requests can be lost during VF post-migration
recovery. Since the VF has migrated, these invalidations are no longer
needed.

Reset the TLB invalidation frontend, which will signal all pending
fences.

v3:
 - Move TLB invalidation reset after pausing submission (Tomasz)
 - Adjust commit message (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 768ab33d2486..36eedfc3c5eb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -35,6 +35,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_tile_sriov_vf.h"
+#include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -1113,6 +1114,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
-- 
2.34.1

