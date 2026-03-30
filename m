Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FBB1061B1E
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B206110E809;
	Mon, 30 Mar 2026 20:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaBbKWfS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D7F10E803
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903269; x=1806439269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SPVptiJkWnnGOV13N9msk5rkV4djt/csl3l0YypkufU=;
 b=YaBbKWfSJlZrLjwewRIGC9fvSgPMB5+WbnCnyODEn4dyTL8z/Nj7fgxQ
 J/RHGER1KdGLt7Th4q/xKlXIwOcRNbfzzR1vHcF591pfYUxWoqZPupvNg
 CFXk21eOc/XWsAbAWFryJc3CrDV9TywaHOCLzhxHmba1gRSV/S+Zo06/d
 uD9ySGcWqggPZsuOr/Thpr3D/QlLn2Cmi+obr5D76lDJ7laD+Xa1wDWoU
 jDzSs+iYrY0IhbJDti4fmswu5TcwsshHnOwrzcgJKdvBrzSQp659OlFlM
 +MxF3ljmu78xEpJr3/78+zrPli99qIgT1uFwv1ABluT4TrW4S7yJfsaoa w==;
X-CSE-ConnectionGUID: C+H4XEaeRoexhQX7Z9tPSw==
X-CSE-MsgGUID: 1hLDI3w6Ri2++yk6Jl2Q8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923711"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923711"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:09 -0700
X-CSE-ConnectionGUID: NcvPHzfRSf+2JIuLNPWh8g==
X-CSE-MsgGUID: zzfxJY9xR42kk+bmweD3pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329433"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 09/13] drm/xe/pf: Allow to change sched_if_idle policy under
 lock
Date: Mon, 30 Mar 2026 22:40:40 +0200
Message-ID: <20260330204046.567-10-michal.wajdeczko@intel.com>
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

In upcoming patch we will need to update sched_if_idle policy when
we already hold the provisioning mutex. Split existing function
into two variants to allow that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 23 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 63e6326d45f8..e8458d63742d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -192,7 +192,7 @@ static void pf_sanitize_sched_if_idle(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_sriov_pf_policy_set_sched_if_idle - Control the 'sched_if_idle' policy.
+ * xe_gt_sriov_pf_policy_set_sched_if_idle_locked() - Control the 'sched_if_idle' policy.
  * @gt: the &xe_gt where to apply the policy
  * @enable: the value of the 'sched_if_idle' policy
  *
@@ -200,12 +200,12 @@ static void pf_sanitize_sched_if_idle(struct xe_gt *gt)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
+int xe_gt_sriov_pf_policy_set_sched_if_idle_locked(struct xe_gt *gt, bool enable)
 {
 	u32 priority;
 	int err;
 
-	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	err = pf_provision_sched_if_idle(gt, enable);
 	if (err)
@@ -223,6 +223,23 @@ int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_pf_policy_set_sched_if_idle() - Control the 'sched_if_idle' policy.
+ * @gt: the &xe_gt where to apply the policy
+ * @enable: the value of the 'sched_if_idle' policy
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, enable);
+}
+
 /**
  * xe_gt_sriov_pf_policy_get_sched_if_idle_locked() - Retrieve value of 'sched_if_idle' policy.
  * @gt: the &xe_gt where to read the policy from
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index f437dc1f5e90..d667d66897b1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -14,6 +14,7 @@ struct drm_printer;
 struct xe_gt;
 
 int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable);
+int xe_gt_sriov_pf_policy_set_sched_if_idle_locked(struct xe_gt *gt, bool enable);
 bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt);
 bool xe_gt_sriov_pf_policy_get_sched_if_idle_locked(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
-- 
2.47.1

