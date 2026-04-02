Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB8DD6AAF8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B0F10F2E7;
	Thu,  2 Apr 2026 19:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyk1m3hH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF4310F2E7
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157498; x=1806693498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u4VYb9F+Tb0/kKGoIzQapwUxdp/lt09cYbdGjG7HD6U=;
 b=nyk1m3hHIshlobSqbWr34EBOu55v8T+dAJpSEEpvWjAwhHFue4RVdpbf
 ZQTRHXDSov5ucpiBiZEUKKy8+QHux9EmsJH5bJSivm9QDBStYQxk3jx0j
 r5NtOICcSvwN6XH2PxPB37sP/44+OKxLjImP3AD4g/TgWdE6tjmLV9d3t
 kEuWygvdHrlQest3wUA1KZE1YqsTYbgUpw6oGLMkSABVVjZDG/OcaGEvk
 xpL3xddz2cqrwWwkNq+sGdZ79IyrOy02Hd+yULVq4ijOmbc84WPBn7nw6
 knMeNMeVhg28soJPNB4pLOoUN6WEhJol4N9o6mLCV1gPnIydrUsF3pgDy A==;
X-CSE-ConnectionGUID: Z6uzUTOlRriSqrqqGcvdWg==
X-CSE-MsgGUID: kOKpHKlpTS+RVDyakMAM9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241099"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241099"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:18 -0700
X-CSE-ConnectionGUID: ZDRNvtLuSZqNzWSBzkq/Hg==
X-CSE-MsgGUID: tu4Gszs8QIuMCpWkcTGbUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222213031"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 07/13] drm/xe/pf: Encode scheduling priority KLV if needed
Date: Thu,  2 Apr 2026 21:17:20 +0200
Message-ID: <20260402191726.4932-8-michal.wajdeczko@intel.com>
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

After a reset we missed to reprovision VFs scheduling priority config.
But as of today, the GuC firmware allows to change scheduling priority
using config SCHED_PRIORITY KLV only for the PF and configuration of
all VFs relies on the previously applied value of the SCHED_IF_IDLE
policy. Use this policy value to check and decide whether we need to
encode VF priority KLV while reprovisioning this VF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 25 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
 3 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c74745642a92..703a954d78d5 100644
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

