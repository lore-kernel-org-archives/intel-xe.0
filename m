Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C153D6AAFD
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6005F10F2ED;
	Thu,  2 Apr 2026 19:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISMmc6qc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146F510F2ED
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157500; x=1806693500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ah3nbdXwlO3qrIQm8R23kORdU2Dx/GlaBglGBpJJ8FY=;
 b=ISMmc6qc5BAPC4OXgQQfsMBze6kHHpJkJg5TtlrMTKj9i4TWN0ziwGk4
 Vng3JwbxqumgZ4z07M1KKU/NB5VHvYVf81fDaJQfB/PnWUaDnKWPi0tTJ
 SLrMtqz6elwBuObS8lAzmHq5Mj0uSHS3vaRlP+vBaa6f5MnxMoYs61/wX
 /Xb/GjwhVWzd+g/KzzNQHebaUEGsQS9D+4Bo2tyTI9sfToionqOFaXLDv
 MfTlMy0J0/DYTjios1XT/Z992aPU9cttm7bvCO1uIlhXAHKKDOGRdX+br
 yeTxZDqgs7tCHxd9oni9aAduiNl33sMPsjSCyX0E6R2daUyI4i4zevd4d w==;
X-CSE-ConnectionGUID: 0WtA/45nQt6ndrgJCG95ZQ==
X-CSE-MsgGUID: H1LzCfS7RMeYSFA5jmMVWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241101"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:19 -0700
X-CSE-ConnectionGUID: KggAAdNOQuSr9r7sVt54DA==
X-CSE-MsgGUID: BWmGeJ1MRu+TAe1zy/9cYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222213047"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 08/13] drm/xe/pf: Check EQ/PT/PRIO when testing VF config
Date: Thu,  2 Apr 2026 21:17:21 +0200
Message-ID: <20260402191726.4932-9-michal.wajdeczko@intel.com>
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

In addition to the hard resources (like GGTT, CTXs, DBs) we should
also check if VF was already configured (by sysfs or debugfs) with
optional parameters like execution quantum (EQ), preemption timeout
(PT) or scheduling priority (PRIO) as otherwise we might miss to
send to the GuC updated latest values after a resume or GT reset.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 703a954d78d5..abc6b5e22048 100644
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
@@ -2603,6 +2625,13 @@ static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *c
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
@@ -2879,6 +2908,9 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 		valid_all = valid_all && valid_lmem;
 	}
 
+	/* also check optional EQ/PT/PRIO */
+	valid_any = valid_any || pf_non_default_sched(gt, vfid);
+
 	return valid_all ? 0 : valid_any ? -ENOKEY : -ENODATA;
 }
 
-- 
2.47.1

