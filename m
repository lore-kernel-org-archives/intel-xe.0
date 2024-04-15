Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BEAC04FF9
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A23112785;
	Mon, 15 Apr 2024 19:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hP2hvrx9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7B5112785
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713207688; x=1744743688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OXarESXwzn0qiEsuhZs0NfF28YuymPNbtqvEOzlRyBI=;
 b=hP2hvrx9UIFVeyjKdfTjSNHflD1LYQfG63MS/CqE+IGFru3AFMTuXlfq
 kWyf8/wWpD9GzsdgRaShFKTFgvVlVLH1mo64JY61Kh5rakMt+gB3Mwa4n
 k+mtIB9dEHCVl0XF3E3GYlgeXIQYfhcJc4EfOoE6A/eePlC1pRbecrQa8
 5BKw+qgc96JQ9BjuXjycmPXgTdUtVA4xdU/fTJQFp1r8/RcZw9fxI95Zz
 UyDlKNLUV7KIJX0+MS0E9Rzne2qTundEDjkH6mpsSS7RGtsFUo/Yw92gd
 OPzUDNuvr9EiX0C6nh3QDdiaZwnUE7dNSkBk5KdchL9rpRp384NdTj2zd A==;
X-CSE-ConnectionGUID: x6aTcYUmTvG4hAAi/Qe5dQ==
X-CSE-MsgGUID: tMWpLNxgRVW9G+j4qxtdJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19765670"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19765670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:01:27 -0700
X-CSE-ConnectionGUID: 3u5NmcQ5QbeV8RcbyVPvbQ==
X-CSE-MsgGUID: iBuZw7jDT8mC+NOvwIluBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22094967"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:01:27 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v5 3/4] drm/xe/xe_guc_submit: Allow lr exec queues to be banned
Date: Mon, 15 Apr 2024 11:46:07 -0700
Message-Id: <20240415184608.2918959-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
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
---

v2:
- Fix Subject line
- Modify change slightly to remove need for "ban" boolean

v3: Revert change involving "ban" boolean to version 1

v4: Add missing semicolon and remove whitespace

v5: Use new xe_lrc_ring_tail function

 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7b6c033a5496b..82406637c6c5a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1422,15 +1422,23 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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

