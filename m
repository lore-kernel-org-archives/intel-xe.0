Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2517CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 19:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C4510E08B;
	Fri, 31 Oct 2025 19:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJsHcFNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D2B10E08B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 19:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761940413; x=1793476413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JV7/kHFhUK20OSMZCNRb/0IacjAah4ypnf8QC0mQPCg=;
 b=CJsHcFNKXAa4dP8U0ZqEPzbUs/AJb2IdCYzNep5GDk4W8qCliNBpncQj
 iaaSCosI+OO8oPAcRzmaX5HfcTL0yuLIkMI6Z/UPEytphAzrlmt8ej6yp
 hUvIhtVbVzaOKvxJydqE9w2OTpXE5+3979/rq7PwxOugRYmmmzBNQjlpn
 PNJRr6n0XFJ9Uo8+fWf0mf8v1ciByoFeKlAOVZ4r8TEfgdw806+kbnzQq
 mVePCxpsuA3vmNB0411d8A8OGXid5BUAt4EiSAL/R5fs/VwL42SEoTDM5
 AVPyi+ZyKFfKlAnCbDESF3li1+er05MKDu7xVkwAYY920aHPGk4x3zy/9 A==;
X-CSE-ConnectionGUID: +seF/vFiTsy3KM7wRStI2w==
X-CSE-MsgGUID: OBs2TcQ1SiCfsRVE9JIJUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81738040"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="81738040"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 12:53:33 -0700
X-CSE-ConnectionGUID: 8q+zWF/uTIaiWd5riCCG8w==
X-CSE-MsgGUID: L3Ae67zzSeGID1LoIaG2sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="186651053"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 12:53:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tomasz.lis@intel.com
Subject: [PATCH] drm/xe/vf: Skip signaled jobs during VF migration re-emission
Date: Fri, 31 Oct 2025 12:53:27 -0700
Message-Id: <20251031195327.2997606-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The LRC software ring tail is reser to the first unsignaled pending
job's head. Fix the re-emission logic to skip signaled jobs, as it
currently scans all pending jobs, potentially causing imbalance.

Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d4ffdb71ef3d..bee76d1b0836 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2241,11 +2241,17 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 					   struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct drm_sched_job *s_job;
 	struct xe_sched_job *job = NULL;
 
-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
-		job = to_xe_sched_job(s_job);
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		struct drm_sched_fence *s_fence = job->drm.s_fence;
+		struct dma_fence *hw_fence = s_fence->parent;
+
+		/*
+		 * First pending job in guc_exec_queue_pause skips signaled jobs
+		 */
+		if (hw_fence && !dma_fence_is_signaled(hw_fence))
+			continue;
 
 		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
 			  q->guc->id, xe_sched_job_seqno(job));
-- 
2.34.1

