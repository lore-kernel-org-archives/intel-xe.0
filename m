Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B4AD6AAF8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB9010F28D;
	Thu,  2 Apr 2026 19:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLua9xGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0C810F28D
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157495; x=1806693495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V9DbS1lSkiFctFu0eAtkBKeshbxwPwPv67xESK3xk+s=;
 b=iLua9xGx1+SNfKP9CDxd6AGBtSHgibA8Af3pJ4Rh8rUHS9XQ4LyyI6N+
 KakbSdbM/YZYi91hC4dSH0nxWsOfs19KcOOoYF+nN8PY707YarZI9UFUk
 m4QeikqupL1Fgrz53D0H+mcuGgA9YpiwYH2GBFMJkwM5fgsxjATFxTU8H
 tLyZL3Gq6X8o8rOxsPlryCr2AAE3lTkQkp41jKapKWWzqfrxa6P5CbGHY
 cmIvcVZN5wYc0hZkm/sXPqyfnc+N0y45YQRlWEcit6OhKaefFeckSNF5t
 pX3rrEraXSopzBTHm/7M1VQa5eSOE9EjMjQBDaiDs3E/c6qzar98g3kBM w==;
X-CSE-ConnectionGUID: KZTqv2/LTQeK0aT7j1Dz8Q==
X-CSE-MsgGUID: n22MofkyS7ebXoeAmvDkDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241095"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241095"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:14 -0700
X-CSE-ConnectionGUID: 1QZSnBf4Quuh5LGmA8S3cA==
X-CSE-MsgGUID: jgx2hVcZQxC8wJYxbZcdBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222212996"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 05/13] drm/xe/pf: Reprovision policy settings after GT reset
Date: Thu,  2 Apr 2026 21:17:18 +0200
Message-ID: <20260402191726.4932-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402191726.4932-1-michal.wajdeczko@intel.com>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
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

In addition to the reprovisioning of individual VFs configurations,
we should also reprovision GuC global policy settings. Note that we
already had a draft function for that but we missed to call it once
we started handling GT reset. Reuse it now but don't take extra RPM
as this is now a caller responsibility and drop unused parameter.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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

