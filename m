Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A27606A32C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kp+TG2rE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A075610E120;
	Fri, 20 Nov 2026 16:04:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446E310E120
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795190636; x=1826726636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B2t7SuwKi5LNC2J4iP7RtVLStTPZKkjXjsQe+Zi9UA8=;
 b=kp+TG2rEINcnGUjnhJ/YUixdtnpW3VNH9juPmtPcGlNsm71fMvb5Mi2b
 5ek+uFSiD4GOCD3RUH3ZsZvrBssilY+roMtw9kRXpTBBlGhDPYZbznUoc
 ipEBJkXTVeODyEYWgC3JO/jB+8Ak9qtaaK94KsBjoiA6HCzqTZ+b+AkxX
 e1CUPXwDtLL4iOdj5UPvL9IAjwKYCOkr2HCsscQyzWtFn5XduYI5L2S6O
 eItXEQiZYgMt768Yw3e3NcMUfVuQ6IReIkTJTpOWI7XBCiCX56liDUDdx
 tKyASiws6GtaYlyZZ7BTQAavecRVZ/TA+zJ9eWAO4aCXiTsfHamTn47k6 w==;
X-CSE-ConnectionGUID: IWqo9t3YRnWlNB2Sf5D45w==
X-CSE-MsgGUID: AiwDuWphQYmdUca1LDmj/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4075511"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4075511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 08:03:55 -0800
X-CSE-ConnectionGUID: Umj3geO8RpG03mONaquY3w==
X-CSE-MsgGUID: qE6gBTsJRZOhlEdn/XFNSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10850561"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2026 08:03:53 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/1] drm/xe/guc: Scale suspend wait timeout with preempt
 timeout
Date: Fri, 20 Nov 2026 21:38:27 +0530
Message-ID: <20261120160826.2045426-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The suspend wait uses a fixed 5s timeout, but preempt_timeout_us can be
set up to 10s via sysfs, causing queues to be banned while GuC is still
legitimately preempting. Extend the timeout by preempt_timeout_us and
min_run_period_ms.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e7c2778029c..0898ee29f460 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2532,8 +2532,20 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
+	long timeout;
 	int ret;
 
+	/*
+	 * The SUSPEND worker may sleep up to min_run_period_ms before disabling,
+	 * and GuC may then take up to preempt_timeout_us (sysfs tunable up to
+	 * XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX) to preempt the context. Keep the
+	 * historical 5s as slack on top of both.
+	 */
+	timeout = HZ * 5 +
+		usecs_to_jiffies(READ_ONCE(q->sched_props.preempt_timeout_us));
+	if (q->vm)
+		timeout += msecs_to_jiffies(q->vm->preempt.min_run_period_ms);
+
 	/*
 	 * A kill does not clear suspend_pending, the queue may still be running
 	 * on the hardware, so exec_queue_killed() is what ends the wait in that
@@ -2546,16 +2558,16 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
 retry:
 	if (blocking) {
 		if (IS_SRIOV_VF(xe))
-			ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
+			ret = wait_event_timeout(guc->ct.wq, WAIT_COND, timeout);
 		else
 			ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND,
-						 HZ * 5);
+						 timeout);
 	} else if (IS_SRIOV_VF(xe)) {
 		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
-						       vf_recovery(guc), HZ * 5);
+						       vf_recovery(guc), timeout);
 	} else {
 		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
-						       WAIT_COND, HZ * 5);
+						       WAIT_COND, timeout);
 	}
 
 	if (!blocking && vf_recovery(guc) && !xe_wedged(xe))
-- 
2.43.0

