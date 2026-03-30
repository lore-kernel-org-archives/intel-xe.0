Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E84B1061B26
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A8710E811;
	Mon, 30 Mar 2026 20:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbCN3ffI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AA910E803
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903265; x=1806439265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E9a9+7upZkmj2VgSekrNKshVDtgMTuIHOAdyWQ8Iljw=;
 b=gbCN3ffICG5WqO5a7gCkkOliBNwGC799bnp9He5aFW+qn5+6DYHqcEfP
 3110GoLF8JVKO/3z/bm8cdNG2gUeSUlyFb5zwaYanNOs7NSShrR5KoEuT
 VgFn+mzfGmP2SOH06gmCcZM9UEh9A8ZQx9tS1x0Q6TC8koBaZe+oIVfU6
 2gCBXsFNjxetGSmg/V3x4qwTJpHuJBYdHyAS0ATu7r5gjDEc5HV72GAlP
 NXzveCnvzbuPPLvsLnnsLGjcbWtjrch+IovhbTqEfY67lgA8cyMled7Da
 hTN8+yG+osHk3Mw4pDo60u06dVhR7dCMWCz6PV7kYy5ij2kq9fbg0F8Vw g==;
X-CSE-ConnectionGUID: Y6nlR1+0QW+YpicoQFl91A==
X-CSE-MsgGUID: sOr1iMT0RT6Zkto1VT4Ykg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923704"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923704"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:05 -0700
X-CSE-ConnectionGUID: JW6+mBdnTimmiiLczcgDaA==
X-CSE-MsgGUID: cJU/96JLRmux2sVhc6Ez4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329413"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 06/13] drm/xe/pf: Don't reprovision policies if already default
Date: Mon, 30 Mar 2026 22:40:37 +0200
Message-ID: <20260330204046.567-7-michal.wajdeczko@intel.com>
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

There is no need to send policy updates to the GuC if policies
were not changed from the default settings (usually zero value).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index aa80b4abd42f..0007ed7e0d38 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -177,6 +177,9 @@ static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
+	if (!gt->sriov.pf.policy.guc.sched_if_idle)
+		return 0;
+
 	return pf_provision_sched_if_idle(gt, gt->sriov.pf.policy.guc.sched_if_idle);
 }
 
@@ -255,6 +258,9 @@ static int pf_reprovision_reset_engine(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
+	if (!gt->sriov.pf.policy.guc.reset_engine)
+		return 0;
+
 	return pf_provision_reset_engine(gt, gt->sriov.pf.policy.guc.reset_engine);
 }
 
@@ -321,6 +327,9 @@ static int pf_reprovision_sample_period(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
+	if (!gt->sriov.pf.policy.guc.sample_period)
+		return 0;
+
 	return pf_provision_sample_period(gt, gt->sriov.pf.policy.guc.sample_period);
 }
 
-- 
2.47.1

