Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808101061B23
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F147B10E80F;
	Mon, 30 Mar 2026 20:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wl61LQhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1839210E802
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903268; x=1806439268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MWGxEdHfQodkVSvTiGsO2kqMEmRuAWN8+QgW0/uJMbI=;
 b=Wl61LQhy2pY9ZcO+AUZ1nge9pQaKEsMeylqp6g7OnbhiC/x6aH9w2lDV
 PNg0f6inbOHkyoHzVSYzSNk1fmFdhJnj3GiSO5cKlHeP6F/s8NjIlkYFb
 hRLxxNSgnKhUYhi5p7NyMV1l/h7hPSVCccTkNSyTB9QuVHTLdBbNuXgsZ
 glG2dMfgqgExcI9rqVUrKjCjO3W2EBV+309gessNHCZaT5LklWrspj7uU
 lDWXnQ8BDuBZr7KCBSksWKPOkq+PsgiM7WLUoYFvTgV5xkGjJzQBtlrax
 pcQYkp2EY479BmHUn//Q+AFMd86hIuAj8VnCb/ZLLHu7sm7FFml7OpUFA A==;
X-CSE-ConnectionGUID: QjCCxZHoQ9OTWaKv+XuhCw==
X-CSE-MsgGUID: xhYvqJHVQgGPv6IYtfySqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923710"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923710"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:08 -0700
X-CSE-ConnectionGUID: RLaVhCl4S26KZ8KiswsW/A==
X-CSE-MsgGUID: Snjfxr+nSm6UXKqar5wodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329428"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/13] drm/xe/pf: Check EQ/PT/PRIO when testing VF config
Date: Mon, 30 Mar 2026 22:40:39 +0200
Message-ID: <20260330204046.567-9-michal.wajdeczko@intel.com>
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

In addition to the hard resources (like GGTT, CTXs, DBs) we should
also check if VF was already configured (by sysfs or debugfs) with
optional parameters like execution quantum (EQ), preemption timeout
(PT) or scheduling priority (PRIO) as otherwise we might miss to
send to the GuC updated latest values after a resume or GT reset.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b05034d3fdf2..e673e96a147a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2090,6 +2090,17 @@ static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 	return config->exec_quantum[0];
 }
 
+static bool pf_non_default_exec_quantum(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++)
+		if (config->exec_quantum[i])
+			return true;
+	return false;
+}
+
 /**
  * xe_gt_sriov_pf_config_set_exec_quantum_locked() - Configure PF/VF execution quantum.
  * @gt: the &xe_gt
@@ -2305,6 +2316,17 @@ static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
 	return config->preempt_timeout[0];
 }
 
+static bool pf_non_default_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(config->preempt_timeout); i++)
+		if (config->preempt_timeout[i])
+			return true;
+	return false;
+}
+
 /**
  * xe_gt_sriov_pf_config_set_preempt_timeout_locked() - Configure PF/VF preemption timeout.
  * @gt: the &xe_gt
@@ -2602,6 +2624,13 @@ static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *c
 	}
 }
 
+static bool pf_non_default_sched(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_non_default_exec_quantum(gt, vfid) ||
+	       pf_non_default_preempt_timeout(gt, vfid) ||
+	       custom_sched_priority(gt, pf_get_sched_priority(gt, vfid));
+}
+
 static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
 				  enum xe_guc_klv_threshold_index index, u32 value)
 {
@@ -2878,6 +2907,9 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 		valid_all = valid_all && valid_lmem;
 	}
 
+	/* also check optional EQ/PT/PRIO */
+	valid_any = valid_any || pf_non_default_sched(gt, vfid);
+
 	return valid_all ? 0 : valid_any ? -ENOKEY : -ENODATA;
 }
 
-- 
2.47.1

