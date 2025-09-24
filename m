Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC92DCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F3610E691;
	Wed, 24 Sep 2025 01:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCSJPaKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D485A10E69C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676571; x=1790212571;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=d5135lzBiYNkgBKFEo0+9ELWsd8ZAgJg7wrmx4ixgUE=;
 b=LCSJPaKPfKx3gKPcw0I+PcIDCN7MZ9uRlFBY4iYISfxoVp69d4w+ghmv
 +65LIq+yUXaGN4YFLiTp3oQVHxx9JQ966cisKvLlTkEhoxr+LMsUfS/HR
 8ykKxpXm5EPaDkr9gSBLuyw0sCjoudg1DVfktlRZ937b8Loj6KfpHZXvE
 UlfM6Y+pNZjqdjZGnvjduHPcLwID08l3DeQv3H5FywOU4oRnQFP8BEVtV
 Io0mmshHFNRz6OUVyGNw63BYXY5TPyWjQjzk3ezH1ah+Wkpt05/YR7uiM
 XajvuSB1PZRrz5JZ02YeZw8kzbVEilryYifV77Ey/7J8TkM1UjNJNsrnu w==;
X-CSE-ConnectionGUID: QRiLZc+1QUmAGd6irNiiKg==
X-CSE-MsgGUID: FNX7W1phRnetLO4lIoiuLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908272"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
X-CSE-ConnectionGUID: wxby6c76SDW95HyLQ2LhKg==
X-CSE-MsgGUID: F1oMqFOfRCeFIpxur3czLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841802"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 22/34] drm/xe/vf: Reset TLB invalidations during VF post
 migration recovery
Date: Tue, 23 Sep 2025 18:15:49 -0700
Message-Id: <20250924011601.888293-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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
index 071c2c5e0d0a..01399a871f12 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -35,6 +35,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_tile_sriov_vf.h"
+#include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -1187,6 +1188,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
 	xe_guc_ct_flush(&gt->uc.guc.ct);
+	xe_tlb_inval_reset(&gt->tlb_inval);
 	xe_guc_submit_pause(&gt->uc.guc);
 }
 
-- 
2.34.1

