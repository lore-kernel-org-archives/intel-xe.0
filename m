Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8890BC04E69
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4494A10E3EF;
	Tue,  8 Aug 2023 18:24:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA54210E3EB
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691519058; x=1723055058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yk5C6e29hEz10SVHPQ4tFr0M23GVFEy88Wf0V43KUm0=;
 b=DATRDqsUiM57jueCHAMOAHW1SB7QPG8oc2sE8HiU58JZ5qdEwqY3/P0P
 n+FsY3bGH6dAhQbwkgAL+ieanOXNLlLGr0J7ECKWgGsrbKoV7fVgcQ4sg
 aBJxEPVf1F4TcIs5kC8MLvQmPraJ1W0XbADGNoP2IcVmrLtoPWaLfokAd
 iVFj0JU+Mymqq3r8BvvFgNOg6RANOE+frUxSnh6Ba2BESKnd9L3W3qwpY
 3ozJE9OgobL4ZF1kWQEmMfroASf4ZZY6nrqpFImaXnAnbrucXvLXCZAzy
 j/C79P64VjXyaiilvP8Xy0zNjzgxn87g6jwbgJEBJezPh4cMWr0LykWLv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370907027"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="370907027"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731512584"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="731512584"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:24:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 11:24:08 -0700
Message-Id: <20230808182411.31354-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Simplify engine class sched_props
 setting
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

Shortens the too long code lines.

Fixes: ccafbcc61fa5 ("drm/xe: Add min/max cap for engine scheduler properties")
Fixes: ef811a09e28b ("drm/xe: Add sysfs for default engine scheduler properties")
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b8fcc6e985cf..c44540684462 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -362,22 +362,20 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->fence_irq = &gt->fence_irq[info->class];
 	hwe->engine_id = id;
 
-	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
-		gt->eclass[hwe->class].sched_props.job_timeout_ms = 5 * 1000;
-		gt->eclass[hwe->class].sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
-		gt->eclass[hwe->class].sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
-		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
-		gt->eclass[hwe->class].sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
-		gt->eclass[hwe->class].sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
-		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
-		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
-								XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
-		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
-								XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
+	hwe->eclass = &gt->eclass[hwe->class];
+	if (!hwe->eclass->sched_props.job_timeout_ms) {
+		hwe->eclass->sched_props.job_timeout_ms = 5 * 1000;
+		hwe->eclass->sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
+		hwe->eclass->sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
+		hwe->eclass->sched_props.timeslice_us = 1 * 1000;
+		hwe->eclass->sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
+		hwe->eclass->sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
+		hwe->eclass->sched_props.preempt_timeout_us = 640 * 1000;
+		hwe->eclass->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
+		hwe->eclass->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
 		/* Record default props */
-		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
+		hwe->eclass->defaults = hwe->eclass->sched_props;
 	}
-	hwe->eclass = &gt->eclass[hwe->class];
 
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
 	xe_wa_process_engine(hwe);
-- 
2.21.0.rc0.32.g243a4c7e27

