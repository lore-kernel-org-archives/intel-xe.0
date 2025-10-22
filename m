Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D5ECCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 00:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2E510E66A;
	Wed, 22 Oct 2025 00:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsczyyoF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5490510E672
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761094543; x=1792630543;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tqABsyQuealhbdOiio2l4aRScQ9Dpl069ZWhPgEA6Wc=;
 b=fsczyyoFlYksmQzN1pg4MvXqI3dmqsdqYl9HBHTl6wkM2IKUMcnyeh4U
 1eEuTebeW4eqpvYv3FRzh9c/ymt5NNblDJ3LzVN2IjaV1OhnSuQvMmWhH
 cAAvRPXh654B6G0w4vSFu431PfOqvyT7l79P9E2a5ZDcZOzzdL6NEISqq
 rBsP43eMTEHdmYKfgQKIyVgmW/SX66a3I5D1OMar1B1tOEzg9hYmZneNd
 XrtnSCXOZslWlzzBrvme3fKQrwu+mLr2UGe28dhdTmgyqd/34RDgbIqY2
 Au0aYUJnV0EhlW0f8j4jp7bLHfWTTMPL/IscsqWmrUp19/yunQyE4LdGt Q==;
X-CSE-ConnectionGUID: KYeOj1tgSCeRMHHpns2QZQ==
X-CSE-MsgGUID: gEZdpm2VR42Zm2Hos9dXtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50807414"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="50807414"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 17:55:42 -0700
X-CSE-ConnectionGUID: FNP0S/fjQqCSEC5l173r2Q==
X-CSE-MsgGUID: 2KGjI1GRRlee95xv+pTGVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="182938778"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 17:55:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: Avoid PM wake reference during VF migration
Date: Tue, 21 Oct 2025 17:55:38 -0700
Message-Id: <20251022005538.828980-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022005538.828980-1-matthew.brost@intel.com>
References: <20251022005538.828980-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Virtual Functions (VFs) do not use runtime PM. Avoid taking PM
references during VF migration, as lockdep may get confused—VF migration
occurs in the reclaim path, and waking a PM reference can trigger memory
allocation warnings.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 46518e629ba3..d0b102ab6ce8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -31,7 +31,6 @@
 #include "xe_lrc.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
-#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_sriov_vf_ccs.h"
@@ -1218,7 +1217,6 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 
 	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
 
-	xe_pm_runtime_get(xe);
 	retry = vf_post_migration_shutdown(gt);
 	if (retry)
 		goto queue;
@@ -1241,12 +1239,10 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 
 	vf_post_migration_kickstart(gt);
 
-	xe_pm_runtime_put(xe);
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
 fail:
 	vf_post_migration_abort(gt);
-	xe_pm_runtime_put(xe);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
 	xe_device_declare_wedged(xe);
 	return;
@@ -1254,7 +1250,6 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 queue:
 	xe_gt_sriov_info(gt, "Re-queuing migration recovery\n");
 	queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
-	xe_pm_runtime_put(xe);
 }
 
 static void migration_worker_func(struct work_struct *w)
-- 
2.34.1

