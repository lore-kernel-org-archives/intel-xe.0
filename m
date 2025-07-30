Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B61C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 17:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7CE10E37D;
	Wed, 30 Jul 2025 17:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CofQ6v4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1FC10E225
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 17:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753897768; x=1785433768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IzOiYfakgSHjV9V++A43UrL1R2CF4Q2vo+YIYOUJXc=;
 b=CofQ6v4RfhibQf4g2ffGL8dtr9y0dcO/PWqB2cg1tHlGRdHv4f2uLyJP
 PPG7OX9ROINtAkBuMv8aFqaSplkrQZlEmZkMgPGsXCLMSis7R26GfjZWE
 rPzA4NJfDeJuCkhJ/9kOBdkoat4sw9u3pxcvXxWm9uKyxhhuYWoS4eJx6
 0ABtC4KFBUiuejLFlznx6wWts6bgybWqShjdF3joSk17q42VNlMDVVPGU
 ykeey5bWIE09LBKOUVifXS/dnD583i7DxgNl/tXjAcZh+O7se/vfhSnHb
 BkeCfob/cx7K5zb1YYkX+PoCZkARC6oa3L/jHGCHfKkt98vsOuovHnyiM g==;
X-CSE-ConnectionGUID: EAazkhrGRLSwfH8RR3esug==
X-CSE-MsgGUID: FaZqEaDQShyCPL1uV45NZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56297921"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56297921"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:49:28 -0700
X-CSE-ConnectionGUID: Xms9edCaRk6SqcGJs+qFYg==
X-CSE-MsgGUID: GnTNgDkHRDyezXqS6C/4FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186744689"
Received: from jroznova-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.96.116])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:49:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
Date: Wed, 30 Jul 2025 19:49:13 +0200
Message-ID: <20250730174913.178434-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730174913.178434-1-michal.wajdeczko@intel.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
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

The PF's restart worker shouldn't attempt to resume the device on
its own, since its goal is to finish PF and VFs reprovisioning on
the recently reset GuC. Take extra RPM reference while scheduling
a work and release it from the worker or when we cancel a work.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 8bc7d7f9f47a..0c9012fb625d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -53,7 +53,11 @@ static void pf_init_workers(struct xe_gt *gt)
 
 static void pf_fini_workers(struct xe_gt *gt)
 {
-	disable_work_sync(&gt->sriov.pf.workers.restart);
+	if (disable_work_sync(&gt->sriov.pf.workers.restart)) {
+		xe_gt_sriov_dbg_verbose(gt, "pending restart disabled!\n");
+		/* release a rpm reference taken on the worker behalf */
+		xe_pm_runtime_put(gt_to_xe(gt));
+	}
 }
 
 /**
@@ -205,8 +209,11 @@ static void pf_cancel_restart(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 
-	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
+	if (cancel_work_sync(&gt->sriov.pf.workers.restart)) {
 		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
+		/* release a rpm reference taken on the worker behalf */
+		xe_pm_runtime_put(gt_to_xe(gt));
+	}
 }
 
 /**
@@ -224,9 +231,12 @@ static void pf_restart(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	xe_pm_runtime_get(xe);
+	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
+
 	xe_gt_sriov_pf_config_restart(gt);
 	xe_gt_sriov_pf_control_restart(gt);
+
+	/* release a rpm reference taken on our behalf */
 	xe_pm_runtime_put(xe);
 
 	xe_gt_sriov_dbg(gt, "restart completed\n");
@@ -245,8 +255,13 @@ static void pf_queue_restart(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
-	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
+	/* take a rpm reference on behalf of the worker */
+	xe_pm_runtime_get_noresume(xe);
+
+	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart)) {
 		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
+		xe_pm_runtime_put(xe);
+	}
 }
 
 /**
-- 
2.47.1

