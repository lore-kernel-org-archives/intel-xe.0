Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8860D44D78
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7957E10E70F;
	Wed,  6 Nov 2024 15:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWQAnfc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694C710E716
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730905995; x=1762441995;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KYmWKvNaKZg0JvmmU/KbHimx3SLec4ECrcWWvM39kT4=;
 b=GWQAnfc664QdErZ+HdM5aQ84R+DQndaRzHdBOmN9enZR78yuq5ZnvP5t
 xl62vmc9+HMlp+YRAC9ixao0+HRxZjY+skVq4jdC/cekB4C9C12edVgPZ
 mTjj4+5FXvnjP+PUcopJVv7+IQBWPEXVavDDREVGIqjH0/JKencFd3OEr
 ktE5SthiVASO0k6A6M/ZyFjT5QHf1FFgJcheNrC3afXFGhZfuylNim522
 HbsbHhPdc2GgZ2x7brff1yel80+lOx/rsr+jpthfjnYNsK+MFziXzXf0+
 S63kt6wkkvbhWlnmXDK6hNroIhGkhe1s72w6zTLMaE99lR/it8jXsDbZ6 A==;
X-CSE-ConnectionGUID: kwc4k9ZRTvexlFXSM81JCw==
X-CSE-MsgGUID: x8PrTIDwStGsOTjZdYGs7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30867694"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30867694"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:15 -0800
X-CSE-ConnectionGUID: j9WhhjzOQ7uqxoTl9VXP4Q==
X-CSE-MsgGUID: ec2eGvxKT4e+IGvACSrcog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84136794"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:14 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 5/5] drm/xe/pf: Adjust scheduling priority based on policy
 change
Date: Wed,  6 Nov 2024 16:13:01 +0100
Message-Id: <20241106151301.2079-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241106151301.2079-1-michal.wajdeczko@intel.com>
References: <20241106151301.2079-1-michal.wajdeczko@intel.com>
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

Local values of scheduling priorities need to be adjusted when
changing the schedule_if_idle policy as those are related.

Disabling schedule_if_idle policy forces the low priority, and
enabling schedule_if_idle policy forces the normal priority.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: s/priority/sched_priority (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 25 +++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index fae5be5a2a11..c00fb354705f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -135,14 +135,33 @@ static int pf_update_policy_u32(struct xe_gt *gt, u16 key, u32 *policy, u32 valu
 	return 0;
 }
 
+static void pf_bulk_reset_sched_priority(struct xe_gt *gt, u32 priority)
+{
+	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
+	unsigned int n;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	for (n = 0; n < total_vfs; n++)
+		gt->sriov.pf.vfs[n].config.sched_priority = priority;
+}
+
 static int pf_provision_sched_if_idle(struct xe_gt *gt, bool enable)
 {
+	int err;
+
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	return pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY,
-				     &gt->sriov.pf.policy.guc.sched_if_idle,
-				     enable);
+	err = pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY,
+				    &gt->sriov.pf.policy.guc.sched_if_idle,
+				    enable);
+
+	if (!err)
+		pf_bulk_reset_sched_priority(gt, enable ? GUC_SCHED_PRIORITY_NORMAL :
+					     GUC_SCHED_PRIORITY_LOW);
+	return err;
 }
 
 static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
-- 
2.43.0

