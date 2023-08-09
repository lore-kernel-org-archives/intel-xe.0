Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4EEC001B0
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 08:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E7310E3FC;
	Wed,  9 Aug 2023 08:16:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D6E10E245
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691568994; x=1723104994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A/FZ8MZGDvQijHaoLjmaemd8Dbo7tiK00crdl8C/YHc=;
 b=dQl7y3Y+JbAo92kmldYjDWi9v0RUIF7G9gTBt78kMKb5t4vQNBeoRHc/
 XjIUzDl2HB5L6l/Je0tXgSgdEvT3hi5mnqo2rAHpLWadIANj/mIjLlXzQ
 /UrtTaLJuMoj6a5Bfa/HGgMJUbTp8315+VZsxu4Oeo+ZgLCz3IeQxepbM
 cY7fB6LFGGb6KoLED07hl3S3m2LB/UC2iOu1RF89zPqhQcJ04eUEV06JA
 GnwtbFxIHNT8tV2e9m1fBx5dMU7D2TNT97xG8moYPwZhRCkrrjwgA8ssa
 PHZb0Jw0+vPePRAJJSSVSMgZ1OeDUSdhR4uCSGk8FPuoYLKgDjhoAfJko A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457434508"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="457434508"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 01:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731710063"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="731710063"
Received: from cwilso3-mobl.fi.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.2.31])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 01:16:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 09:16:18 +0100
Message-ID: <20230809081617.181257-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe/guc_submit: fixup deregister in job
 timeout
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

Rather check if the engine is still registered before proceeding with
deregister steps. Also the engine being marked as disabled doesn't mean
the engine has been disabled or deregistered from GuC pov, and here we
are signalling fences so we need to be sure GuC is not still using this
context.

v2:
 - Drop the read_stopped() for this path. Since we are signalling
   fences on error here, best play it safe and wait for the GT reset to
   mark the engine as disabled, rather than it just being queued.
v3 (Matt Brost):
 - Keep the read_stopped() on the wait event, since there is no need to
   wait for an already scheduled GT reset. If it is set we can then just
   bail without signalling anything.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 52c61f78b083..90ed47cb509b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -881,15 +881,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	/* Engine state now stable, disable scheduling if needed */
-	if (exec_queue_enabled(q)) {
+	if (exec_queue_registered(q)) {
 		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
 		if (exec_queue_reset(q))
 			err = -EIO;
 		set_exec_queue_banned(q);
-		xe_exec_queue_get(q);
-		disable_scheduling_deregister(guc, q);
+		if (!exec_queue_destroyed(q)) {
+			xe_exec_queue_get(q);
+			disable_scheduling_deregister(guc, q);
+		}
 
 		/*
 		 * Must wait for scheduling to be disabled before signalling
@@ -903,7 +905,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		ret = wait_event_timeout(guc->ct.wq,
 					 !exec_queue_pending_disable(q) ||
 					 guc_read_stopped(guc), HZ * 5);
-		if (!ret) {
+		if (!ret || guc_read_stopped(guc)) {
 			XE_WARN_ON("Schedule disable failed to respond");
 			sched->timeout = MIN_SCHED_TIMEOUT;
 			list_add(&drm_job->list, &sched->pending_list);
-- 
2.41.0

