Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6FFCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8877110E677;
	Tue,  7 Oct 2025 11:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3GnLOFb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D6010E68C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836410; x=1791372410;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dJP0KZNDVKPsboEEz1IKCzRlCxR9Y4yoVpZhRMjfz8A=;
 b=P3GnLOFb2AcXmNBb903FvmDYGZKgvVg9+pMtOmL1JtzwDAQhl5FaUdDz
 H+aRMv7W5JQvbIJ8gCuAHkW6kPNH+H9wrUw68F7fsVeZ0+gLqLlKKYlq2
 m1eDiOHJmaHm3XNeQIq5CEkyGoFPVvTESE1kln7NExDaBOEOCCx8y08WC
 zLQIRLE7PC5IeJxQ2850ns0a6kX/CT5fVpHV4xApBlIxZmrIEGEHfdwge
 1bCMOtgNMMLQSSJX/QGC7IZ+7SRCcdm9b0xqeHa73S1XuGKz1jGveqWwf
 eE1pUPs+YZtjSv0C1N5YLDpefOWRaDDXPPaiG9eUTsoiGYUJ9ntGDsA+d Q==;
X-CSE-ConnectionGUID: FPtuvvhmQ+iX2hzQbQxv4Q==
X-CSE-MsgGUID: stcg5ZvcQIaZtiF7k8RiRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660689"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660689"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:50 -0700
X-CSE-ConnectionGUID: 5g25+2+gSeKurKUGYaCINg==
X-CSE-MsgGUID: X6VbEeO1Q/KStD+LoIS9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180924011"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 19/32] drm/xe/vf: Reset TLB invalidations during VF post
 migration recovery
Date: Tue,  7 Oct 2025 04:26:28 -0700
Message-Id: <20251007112641.2669655-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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
index 6856973cab9a..d5819cac1bc9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -35,6 +35,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_tile_sriov_vf.h"
+#include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -1102,6 +1103,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
-- 
2.34.1

