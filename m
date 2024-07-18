Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8DC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 13:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2458410E830;
	Thu, 18 Jul 2024 13:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iybVaJMO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EE710E830
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721308592; x=1752844592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kbET98PsXXRp0tZpP2iDkCMAWDZiNRXHaHsuyNU/0Jk=;
 b=iybVaJMOfDMAvNGe5lw3zZdrFjxqUV5PQbKxNQQXDI//0O8iSTpy44nf
 0M37vDephHgP6WKqJFAAwjUv4wlBffKWeo34kQUEeQ4PAcnVXcx8nChzF
 vAo/qLfgEEo4EpfTS7KTxuLa5uZRDYOETWFf3B3RPDmaSvgqzwAy8lWoK
 oywx/uBxP94a21qz+NHs7yNOrrK6JN4P/QlV82b/zA+8sQIq/8PRpSFi8
 H4Udv2e5qOHNUIvceKPVh7J4edue6CScve4JVVdJoNAw3XUXm90todR12
 thzySRyC04bqqadoaTitgUVS/AW2EbjYL9nFxu/l7djkvGhl5dx/QsOYN g==;
X-CSE-ConnectionGUID: NDE5b0KYSa+yqUOk//eUWw==
X-CSE-MsgGUID: igq/1lTlQ6SNYlxLNC+dLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19001812"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="19001812"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 06:16:32 -0700
X-CSE-ConnectionGUID: 6r3yxQF8Tn6kzJhe6AvEbQ==
X-CSE-MsgGUID: +VEUrwGHThu6ZBuor36cfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="54946648"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2024 06:16:30 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Unlink client during vm close
Date: Thu, 18 Jul 2024 18:47:52 +0530
Message-Id: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

We have async call which does not know if client
unlinked from vm by the time it is accessed. Set
client unlink early during xe_vm_close() so that
async API do not touch closed client info.

Also, debugs related to job timeout is not useful
when its "no process" or client already unlinked.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
 drivers/gpu/drm/xe/xe_vm.c         | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 860405527115..1de141cb84c6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1166,10 +1166,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			process_name = task->comm;
 			pid = task->pid;
 		}
+		xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
+			     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+			     q->guc->id, q->flags, process_name, pid);
 	}
-	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
-		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-		     q->guc->id, q->flags, process_name, pid);
+
 	if (task)
 		put_task_struct(task);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cf3aea5d8cdc..660b20e0e207 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1537,6 +1537,7 @@ static void xe_vm_close(struct xe_vm *vm)
 {
 	down_write(&vm->lock);
 	vm->size = 0;
+	vm->xef = NULL;
 	up_write(&vm->lock);
 }
 
-- 
2.25.1

