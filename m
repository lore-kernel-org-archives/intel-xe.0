Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2DECCD183
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01DB10E3A8;
	Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTgPtfij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C28310E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114551; x=1790650551;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8Fk3/TBXrCmqh6wGDLHW2qEx4MudIWUipQU6CnxqXWY=;
 b=UTgPtfijpYlW4rud26YuYdxuZUQl3cANNHb8B2/PiAaT4D+sRxhrpGoS
 p1YDk/lm4IxfIfbrgjxlmmhrnQW2vtF0Sd7ZRCuAySdvdybiWzMVBZy6v
 k2Cjt8SYjR7zrxhK50ajH4utCOdGCz1Q4M6xo5e40GujOW8t2r7+dq4cW
 4ufE1gsZGDg/al47tKR68TdkvSR9L3ZBaT5O9562KAaP5EeCpTZ1g2EOM
 ikyABgOMbLEKFgBFRP8jeXZYMOH0/+XIPRD4EAuiVZXPNTAYwS3ajZaK5
 ByMsHrf7cy65RDJ8FYCSdqFf13hOUmRlF5XN6uTqmEieqBEosnPki5MLx A==;
X-CSE-ConnectionGUID: YWIoKTEuSPKXpp33CdRITA==
X-CSE-MsgGUID: mohxv6J7QnWLVOO1Xc9FBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398540"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:51 -0700
X-CSE-ConnectionGUID: upVw7hI5Qs+hwThZItmhJQ==
X-CSE-MsgGUID: 1NgjwTP6R8aOXhraSAeyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529274"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 24/36] drm/xe/vf: Reset TLB invalidations during VF post
 migration recovery
Date: Sun, 28 Sep 2025 19:55:30 -0700
Message-Id: <20250929025542.1486303-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 37ef1c42bacb..c9d94620d197 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -35,6 +35,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_tile_sriov_vf.h"
+#include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -1188,6 +1189,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
-- 
2.34.1

