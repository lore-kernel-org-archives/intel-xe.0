Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E548C1061B1E
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F3010E803;
	Mon, 30 Mar 2026 20:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUF8MZ8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE33A10E802
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903267; x=1806439267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H09V6/X4j/L9fbtIem5YCYxT9gZZOR0Icm3tYwBP27k=;
 b=cUF8MZ8bPKU8fzUpYU+ZVyyIV23VQ2sKUwfQvqvjOwST/i3/br8b5QV/
 RsHA45WuIxcbNVL+6G7bXIBMmhCS62mJ8sUY8yI8p3NZ+FFiiojp3srOC
 vpZEO8PrX9BSCu1GbdfukTh2FdJia8DD5jC8SlfINAYk9PlV2jedcG9zz
 7KcEpqf81xM2W5TSUVp+hBttI5+E7kZ4u425RDcYISIX4hocbnu5R1DK3
 3V82IHAIjjRhdfJC8+9qdXN6Xwh+OzHkmdToBMSyr9RTyEnKiJJ0ZGRv6
 i8jcsASfVi3jr+Tttm25Sb5cWZcG0yIXOhqqHJWjS+Kdy+2Es9EaWbym0 A==;
X-CSE-ConnectionGUID: 8N1R1XOgSs6BD5crrJd01A==
X-CSE-MsgGUID: s0jeeYBFSyeNv9JLiyrFoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923707"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923707"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:07 -0700
X-CSE-ConnectionGUID: VNwfh2gjRrGQ8fiQNEud2Q==
X-CSE-MsgGUID: 71m3LVNARxyvL7BySqLn6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329423"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 07/13] drm/xe/pf: Encode scheduling priority KLV if needed
Date: Mon, 30 Mar 2026 22:40:38 +0200
Message-ID: <20260330204046.567-8-michal.wajdeczko@intel.com>
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

After a reset we missed to reprovision VFs scheduling priority config.
But as of today, the GuC firmware allows to change scheduling priority
using config SCHED_PRIORITY KLV only for the PF and configuration of
all VFs relies on the previously applied value of the SCHED_IF_IDLE
policy. Use this policy value to check and decide whether we need to
encode VF priority KLV while reprovisioning this VF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 25 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
 3 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e1c028176eb8..b05034d3fdf2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -285,6 +285,13 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 	return encode_ggtt(cfg, xe_ggtt_node_addr(node), xe_ggtt_node_size(node), details);
 }
 
+static bool custom_sched_priority(struct xe_gt *gt, u32 priority)
+{
+	return xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt) ?
+		priority != GUC_SCHED_PRIORITY_NORMAL :
+		priority != GUC_SCHED_PRIORITY_LOW;
+}
+
 static u32 encode_config_sched(struct xe_gt *gt, u32 *cfg, u32 n,
 			       const struct xe_gt_sriov_config *config)
 {
@@ -313,6 +320,11 @@ static u32 encode_config_sched(struct xe_gt *gt, u32 *cfg, u32 n,
 		cfg[n++] = config->preempt_timeout[0];
 	}
 
+	if (custom_sched_priority(gt, config->sched_priority)) {
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_SCHED_PRIORITY);
+		cfg[n++] = config->sched_priority;
+	}
+
 	return n;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 0007ed7e0d38..63e6326d45f8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -223,6 +223,22 @@ int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_pf_policy_get_sched_if_idle_locked() - Retrieve value of 'sched_if_idle' policy.
+ * @gt: the &xe_gt where to read the policy from
+ *
+ * This function can only be called on PF.
+ *
+ * Return: last value of 'sched_if_idle' policy applied.
+ */
+bool xe_gt_sriov_pf_policy_get_sched_if_idle_locked(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return gt->sriov.pf.policy.guc.sched_if_idle;
+}
+
 /**
  * xe_gt_sriov_pf_policy_get_sched_if_idle - Retrieve value of 'sched_if_idle' policy.
  * @gt: the &xe_gt where to read the policy from
@@ -233,15 +249,10 @@ int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
  */
 bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt)
 {
-	bool enable;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
-	enable = gt->sriov.pf.policy.guc.sched_if_idle;
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
-	return enable;
+	return xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt);
 }
 
 static int pf_provision_reset_engine(struct xe_gt *gt, bool enable)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index c9d4c4aaaf5d..f437dc1f5e90 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -15,6 +15,7 @@ struct xe_gt;
 
 int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable);
 bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt);
+bool xe_gt_sriov_pf_policy_get_sched_if_idle_locked(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
 bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
-- 
2.47.1

