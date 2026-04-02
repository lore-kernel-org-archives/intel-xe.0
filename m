Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D68D6AAFF
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591D710F2FA;
	Thu,  2 Apr 2026 19:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNYb59M7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF0410F2FA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157501; x=1806693501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5cxuGCzodUxMUTitQ+zq/n8SjlLty6kEMQpBxkxqROA=;
 b=jNYb59M77jA0wWFItIvtptrl/c1qYB6qqAnE0npDTSSbS8oX+QP6x9YD
 hr04ml7sigfG2hWBmfi4K/jfoZi2y4Pw+BMBGIYXwWjttCxJozNm1Ksu9
 JOf7KGRkhL3Pyft+gPKs52AAPac+8PwopM8gs7rAmVt8Ekhzq0nF2rTQl
 A+Pme5jX9A6aZDQZ7oRS8zvVznIj9KwzOL4g4ISl2hJznrcxikiIf7QMk
 PzXA8XR7VTxjuJhvYAyNg+ArQxpetAfaZhG5oFrpjwWu05mekkWbhXUS4
 J3YzHTsg3x7NvJNiW/K+9pomflxCofPnL+XpbGuH9jw30tYPhexN1RwHF g==;
X-CSE-ConnectionGUID: 7RcP4uj0TpOhGqKANEUeAA==
X-CSE-MsgGUID: W78ONT6TRwGrkyeEwjC8oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241106"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:21 -0700
X-CSE-ConnectionGUID: MX3GXJUxSqaY20jkArNyPA==
X-CSE-MsgGUID: VCergZDFTIOfBQtwgxm+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222213062"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:19 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 09/13] drm/xe/pf: Allow to change sched_if_idle policy
 under lock
Date: Thu,  2 Apr 2026 21:17:22 +0200
Message-ID: <20260402191726.4932-10-michal.wajdeczko@intel.com>
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

In upcoming patch we will need to update sched_if_idle policy when
we already hold the provisioning mutex. Split existing function
into two variants to allow that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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

