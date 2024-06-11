Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A135C27C7B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4F210E680;
	Tue, 11 Jun 2024 14:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PY6cGBtr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A036010E685
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116833; x=1749652833;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VAbKhAVbhcHIpHKzf7aw9j0mJQZGTY+jLDlo+yh4Rz8=;
 b=PY6cGBtr/ZHsZr22c1LChEMTW4KrgXPvFKgRrJCq67dFdGmmUH3q36Jl
 5zIg68R8r8674m5FQ6Ety5aUkoWY9v0gn2ZmPXTnyUhH4Rtmy1frDQxcH
 v2fmnQjyT0omsc1+GURPjfMv3oerSh85rbSzcKtyoPT5s15fOy4lVpwx4
 wYMx3W0Vw8uvM6XROvmffVVPe2bHVKMWAyCZ4HFGM5ao8cmh180l6vyY3
 cP/iCgv0yH+CIrjLaaudmXOm4FebLI/UCz4WUk47fb3YYM+buVKA6ot4h
 C/4ERIBDFehe8PnWnz+BUofLyAt4WxVCZ1zZ0hdxwYMLcli745yPVtHUm A==;
X-CSE-ConnectionGUID: u5v5zwfhRYm/y7nNuU0Erg==
X-CSE-MsgGUID: AOJUClmPQnWhQHoJRykzLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14784566"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14784566"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:21 -0700
X-CSE-ConnectionGUID: +gtShwiDQpS/NVMMOQ6aug==
X-CSE-MsgGUID: vZDFOuMZSYq+AlML+osmbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44590319"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 07/11] drm/xe: Assert runnable state in handle_sched_done
Date: Tue, 11 Jun 2024 07:40:49 -0700
Message-Id: <20240611144053.2805091-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611144053.2805091-1-matthew.brost@intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
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

Ensure G2H and KMD GuC machine match.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index afd22a8d815d..ab0dc93d7740 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1592,16 +1592,21 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
 }
 
-static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
+static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
+			      u32 runnable_state)
 {
 	trace_xe_exec_queue_scheduling_done(q);
 
 	if (exec_queue_pending_enable(q)) {
+		xe_gt_assert(guc_to_gt(guc), runnable_state == 1);
+
 		q->guc->resume_time = ktime_get();
 		clear_exec_queue_pending_enable(q);
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
 	} else {
+		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
+
 		clear_exec_queue_pending_disable(q);
 		if (q->guc->suspend_pending) {
 			suspend_fence_signal(q);
@@ -1640,7 +1645,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		return -EPROTO;
 	}
 
-	handle_sched_done(guc, q);
+	handle_sched_done(guc, q, runnable_state);
 
 	return 0;
 }
-- 
2.34.1

