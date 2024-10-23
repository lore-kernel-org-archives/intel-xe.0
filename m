Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8266ED0BB47
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 23:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC8610E876;
	Wed, 23 Oct 2024 23:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qe95km4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9071D10E877
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 23:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729725133; x=1761261133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uLpQYS6M09p8BGlgKfXnfadJdprUNZ39QXCYvWxKRMI=;
 b=Qe95km4z5Q0uPIkMJKBcGdzbHNgbpn7sbBiwUNVZ1/EZ2NFOcnc47u/j
 qfI3j02Iwv5oOw/wks2sS+3GT0cGrBqSfdpg5czjqkK2MQTlFwCF1C5dc
 BvyTqyLM+mJQy8W4zE8gNZEo2/WPhznlsMZ9FZx/4/sR3ndOGZJvd9gc9
 fOxCFmfBaFtgppmAAr9iPamDrWajy/rYMRhL4gil390i/vUZqFLpvFVPc
 ax9gAs/RrAJvr8MD4nMHcin8sB436l+Y9Bg2Vw00SU05zcbGQiRaxFtz3
 IIEVIZWCQORZQ/I8YZA0q0ufvwXUt9FK2xDsI1U3cffQmp3z0Wp/+7UFz Q==;
X-CSE-ConnectionGUID: HDW+FazsS/K2U1MX7UYx/Q==
X-CSE-MsgGUID: q/H7nafFQiqAt9rX5TiKdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28775161"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="28775161"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:12 -0700
X-CSE-ConnectionGUID: wPhQKrwhQpSN3vOmadYFGA==
X-CSE-MsgGUID: pngKqvKuQBqVvz9e5lVOqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="111217996"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.97.255])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/5] drm/xe/pf: Adjust scheduling priority based on policy
 change
Date: Thu, 24 Oct 2024 01:11:52 +0200
Message-Id: <20241023231152.1815-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241023231152.1815-1-michal.wajdeczko@intel.com>
References: <20241023231152.1815-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 25 +++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index fae5be5a2a11..c49983ceac39 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -135,14 +135,33 @@ static int pf_update_policy_u32(struct xe_gt *gt, u16 key, u32 *policy, u32 valu
 	return 0;
 }
 
+static void pf_bulk_reset_priority(struct xe_gt *gt, u32 priority)
+{
+	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
+	unsigned int n;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	for (n = 0; n < total_vfs; n++)
+		gt->sriov.pf.vfs[n].config.priority = priority;
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
+		pf_bulk_reset_priority(gt, enable ? GUC_SCHED_PRIORITY_NORMAL :
+				       GUC_SCHED_PRIORITY_LOW);
+	return err;
 }
 
 static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
-- 
2.43.0

