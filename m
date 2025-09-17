Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE4BCAC5AD
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0670E10E728;
	Wed, 17 Sep 2025 03:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnmrPLH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0A310E647
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080783; x=1789616783;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iBE5ka6N7D10s/9U2jmAz649R/rv3owBscK/oHFIj+I=;
 b=ZnmrPLH1h4D3Tu+juZ0U73E9H5J1SmxE9rdTJzbfBNiIxk+g4iHLGd9P
 iRRT1t9xgT0Fr/K5Bw2AJ5kmmAEF7f/LMRJJZkZwoOW23Swow17javfl+
 AtlipbRWxTvf00gQMUUkzFpZ6vCaWlchXNiZxy59PnCsI9zV1badjK8Fv
 +59bhSialKzypZml2jsvDgeJ8pqTC1yQkjW+4sI6LB8dB9jBXXdk92Uyq
 rY/Zg4ZYWX01GbulhaPm7KfLNlfeagrdZTdCKrR1QSe8LsO4ACx/Sl2D6
 1VLwPX/CglGbUPP14/0g1FV/k+XFtIU5YNznzM8c6YQO8YJVfkrAcNkc1 A==;
X-CSE-ConnectionGUID: hz4mzY1FQKyrj4iNTTw+dQ==
X-CSE-MsgGUID: MMRTnxz0TMKuUj9pjANF4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060803"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
X-CSE-ConnectionGUID: VDjOnYEUSkSSZTRQ582wGA==
X-CSE-MsgGUID: Ybn+9HKrTCWHE5rbFpnT7A==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 21/28] drm/xe/vf: Reset TLB invalidations during VF post
 migration recovery
Date: Tue, 16 Sep 2025 20:46:08 -0700
Message-Id: <20250917034615.3977603-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

TLB invalidations can be lost during VF post-migration recovery. Since
the VF has migrated, these invalidations are no longer needed.

Reset the TLB invalidation frontend, which will signal all pending
fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 64c41056389c..f76c278670aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -35,6 +35,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_tile_sriov_vf.h"
+#include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -1196,6 +1197,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 	spin_unlock(&gt->sriov.vf.migration.lock);
 
 	xe_guc_ct_flush(&gt->uc.guc.ct);
+	xe_tlb_inval_reset(&gt->tlb_inval);
 	xe_guc_submit_pause(&gt->uc.guc);
 }
 
-- 
2.34.1

