Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D030CCD1A3
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FB610E8A7;
	Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgOD1toB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A92210E886
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946709; x=1791482709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UTBL9UCvFAK7zlQdjFJ9bBEpYUaGHF9jGcunciW1DhI=;
 b=NgOD1toBCQhpuPaSPMD8952AFOj/zMs2xoKQ7lIVtqpRXvCnxKT8aBaX
 X8HiyKq+aWOdsU221BxOWlPUvTJjlA10xLO4B+qJ2HZ6DFvcw/qI3uGTD
 z9T1T5OGfACkHb/qR1nPLrwyjcl7xODUjStXBwXXLmzuzH0vobnzOd1eC
 jD26WzkWNdJfzE+La0sB0wXQTCqz7Spx1pJNHUK3jisIIF35+q8OLg/e/
 iGWS/98GX70FyDUQ1Yz95djFkou0+xbCFdkHe6Z2ytDeOM8InfNBH2wUg
 ypI4tkak1fgIKAyb5XMZmw8Ow6fUAMnDakQGkBbBa/Lqro9dfZJbDx6mZ A==;
X-CSE-ConnectionGUID: j9Abl4bqSoShSnLnFz+fxw==
X-CSE-MsgGUID: 3XpxYiUpRriL0RNSi/ysbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067531"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: GPUJwbdxRCSwPNOsFojafg==
X-CSE-MsgGUID: HrTvDtHfR9GwgQwJXC2H9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593738"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 21/34] drm/xe/vf: Reset TLB invalidations during VF post
 migration recovery
Date: Wed,  8 Oct 2025 11:04:47 -0700
Message-Id: <20251008180500.3261209-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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
index 3d072cb3c544..5680b1201eb8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -35,6 +35,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_tile_sriov_vf.h"
+#include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -1100,6 +1101,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
-- 
2.34.1

