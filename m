Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABDECD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 21:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FECB112065;
	Thu, 28 Mar 2024 21:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MU8jU00W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E845F10F1D2
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711662558; x=1743198558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vxwaFgh3ktwUXq/nyaD779HA6AU+IThHePrRTJmFIW0=;
 b=MU8jU00WhwT6T0bKL6wqeRFEC/cOx92Jvpt8gHmB6klGDVijs19Lp53B
 YnXoCmgAODjA2UqQq3vmJJyH46ydVUNakqNKIgVlkC5NXXf82+yqaYbED
 DcyvnVWj9WywuMJL2DZPgxW1vUgUgeZgKaQMDslhfI46gKtFq8R3hq7Hz
 RQCMBSkeu0UFZP4Hp56Mo+gb4u96jP00yVt9fv10T0p1flY4PwaoYQW/o
 HqrvTyH8XH6GhiPh15rmQ2yxi82G9DZRY/b82TRPqwQsqU97yOtWXkVoQ
 iLJ+uWTiMwWNW/CQ20Yktg38CVjwr/qkdnkgRvq65eWYmuScRBF8NcRcH w==;
X-CSE-ConnectionGUID: Dwk8+J7HRvGPjjR+vpJZAQ==
X-CSE-MsgGUID: fkau95rzQS2xVRVawEYpgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24339692"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="24339692"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 14:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16823567"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 14:49:17 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH 2/2] drm/xe/xe_guc_status: Allow lr exec queues to be banned
Date: Thu, 28 Mar 2024 14:33:58 -0700
Message-Id: <20240328213358.3506490-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328213358.3506490-1-jonathan.cavitt@intel.com>
References: <20240328213358.3506490-1-jonathan.cavitt@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 294f40ab6aaf1..bc0b5ec0b2ebd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1424,15 +1424,23 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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
+			   (xe_lrc_ring_head(q->lrc) != q->lrc->ring.tail)) {
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

