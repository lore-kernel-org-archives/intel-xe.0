Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201381061B21
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D435410E80C;
	Mon, 30 Mar 2026 20:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkWayoyl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6688210E802
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903265; x=1806439265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k0NmaRml/QjfQNUTBARV+h5IjW0jMCCKcU9ciGH4AA8=;
 b=BkWayoylG4Bi4IsCKiP2DU2GUl8mKhFLZkvRPC+pEkFyjZ3iHGikfoLH
 rXoirRCwXB+jw5VkNFY8IhcJZnWgjduZWhrFt4fz+FY83mzLLwL6LG0JN
 VAMhp84Ps943RZCzZL4sl3L+wDTZAynPBbPrIXj6BOdSGrvLM6/3cGFG1
 fHVujCfrV9ID467qp1S8InFSeT44OdxoNzEXQ/p+hcGPCXQltf1H2hUZ1
 FrqhjDeOjBw1elTCnwJnurFm5pcLcDkXY1KWLK9O7L2D9B1J6eTpR7gem
 NjWTiLGi9xytmVf6xlz1ZkVpYYn2He/GOGD8d+OGoaYhBO+jFt4AhggfU Q==;
X-CSE-ConnectionGUID: 9Cn149/AS56UEzOz1Mwwig==
X-CSE-MsgGUID: mseg2v8bQDmxLaImxLL9YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923702"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923702"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:05 -0700
X-CSE-ConnectionGUID: fVubLjLYQ0OJoydac8b/yQ==
X-CSE-MsgGUID: G5A56SFuTPqpQs/XicMLyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329391"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 05/13] drm/xe/pf: Reprovision policy settings after GT reset
Date: Mon, 30 Mar 2026 22:40:36 +0200
Message-ID: <20260330204046.567-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330204046.567-1-michal.wajdeczko@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
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

In addition to the reprovisioning of individual VFs configurations,
we should also reprovision GuC global policy settings. Note that we
already had a draft function for that but we missed to call it once
we started handling GT reset. Reuse it now but don't take extra RPM
as this is now a caller responsibility and drop unused parameter.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 14 +++-----------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  2 +-
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index fb5c9101e275..7868056841b3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -219,6 +219,7 @@ static void pf_restart(struct xe_gt *gt)
 
 	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
 
+	xe_gt_sriov_pf_policy_restart(gt);
 	xe_gt_sriov_pf_config_restart(gt);
 	xe_gt_sriov_pf_control_restart(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index c88c4e6a9b61..aa80b4abd42f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -17,7 +17,6 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_submit.h"
-#include "xe_pm.h"
 
 /*
  * Return: number of KLVs that were successfully parsed and saved,
@@ -692,30 +691,23 @@ void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_sriov_pf_policy_reprovision - Reprovision (and optionally reset) policy settings.
+ * xe_gt_sriov_pf_policy_restart() - Reprovision policy settings.
  * @gt: the &xe_gt
- * @reset: if true will reprovision using default values instead of latest
  *
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
+int xe_gt_sriov_pf_policy_restart(struct xe_gt *gt)
 {
 	int err = 0;
 
-	xe_pm_runtime_get_noresume(gt_to_xe(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
-	if (reset)
-		pf_sanitize_guc_policies(gt);
 	err |= pf_reprovision_sched_if_idle(gt);
 	err |= pf_reprovision_reset_engine(gt);
 	err |= pf_reprovision_sample_period(gt);
 	err |= pf_reprovision_sched_groups(gt);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
-	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return err ? -ENXIO : 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index bd73aa58f9ca..c9d4c4aaaf5d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -29,7 +29,7 @@ bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
 
 void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
-int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
+int xe_gt_sriov_pf_policy_restart(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
 
 #endif
-- 
2.47.1

