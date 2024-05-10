Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D3EC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 20:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5186E10E0E7;
	Fri, 10 May 2024 20:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wi1Nbr2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68210ECF2
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 20:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715371258; x=1746907258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aC22jCXrvAQHZqET5F0e79gZ/RCegwLmXumtoi7Wrlc=;
 b=Wi1Nbr2BLtFJSCoxl8CncLaZdt4CZIYaorsxAoKs+mrwS5ppcfg1Z4RT
 IVloDbpuv93sqljhtYSYgQJvDiFY/YF8Lg5w7acRPsFre6vdQptyyLAf3
 xcE0jbVmIEWZghWdMQx8adaClJpHD7ZIJFJw2W+0AExWyf66cqCvRDNwn
 308moBICZd0iW5UqQTMDXHzlgCcMWfii8UXLweTVE385oAexe+IswjXXx
 J3crTtKmOW3Nd2UB4LYX9UNEMLKoE4MhuPT6TjeeMkG9TXFo+mXFfTF6Y
 yzj01HmH9q1V0MUxC0aFUQL3nhU9/zbD+I6pENOQ+C2tYRCrsGJ4Ne3Mn g==;
X-CSE-ConnectionGUID: whI6yiAPSdm92Nwp2x7Baw==
X-CSE-MsgGUID: vpvkPopsRJmz9tRM4HRkdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="21948547"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="21948547"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:00:56 -0700
X-CSE-ConnectionGUID: bzP9khBXTPmr6kEgi73JDg==
X-CSE-MsgGUID: tIY94keTTWWB3amBJOl9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29566569"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:00:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com
Subject: [PATCH v7 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be banned
Date: Fri, 10 May 2024 12:45:39 -0700
Message-Id: <20240510194540.3246991-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240510194540.3246991-1-jonathan.cavitt@intel.com>
References: <20240510194540.3246991-1-jonathan.cavitt@intel.com>
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

LR queues currently don't get banned during a GT/GuC reset because they
lack a job.  Though they don't have a job to detect the reset status of,
it's still possible to tell when they should be banned by looking at the
LRC: if the LRC head and tail don't match, then the exec queue should be
banned and cleaned up.

This also requires swapping the usage of xe_sched_tdr_queue_imm with
xe_guc_exec_queue_trigger_cleanup, as the former is specific to non-lr
exec queues.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3a8e501f2bc25..bd507a916c1cf 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1485,15 +1485,23 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	 */
 	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
+		bool ban = false;
 
 		if (job) {
 			if ((xe_sched_job_started(job) &&
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				set_exec_queue_banned(q);
-				xe_sched_tdr_queue_imm(&q->guc->sched);
+				ban = true;
 			}
+		} else if (xe_exec_queue_is_lr(q) &&
+			   (xe_lrc_ring_head(q->lrc) != xe_lrc_ring_tail(q->lrc))) {
+			ban = true;
+		}
+
+		if (ban) {
+			set_exec_queue_banned(q);
+			xe_guc_exec_queue_trigger_cleanup(q);
 		}
 	}
 }
-- 
2.25.1

