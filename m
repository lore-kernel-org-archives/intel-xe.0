Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892C2CAC5B6
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E547B10E69B;
	Wed, 24 Sep 2025 01:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXM354zD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FFF10E698
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676569; x=1790212569;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TXaID5BIP4vDsaBj8/L/ZI628LuCi7FQse9JpP+Wrzc=;
 b=KXM354zDiS3UyiCloy0eqwLjFMsdNTbdk/8dfZHQIpVCHCFH+S0XIer4
 P6C4GL5BnkRum4RT/LSWiNMgzYzex9d+Emvot1xfO7thENgjYoYrMsxZQ
 ZuRl2qHTig5RHbE236RtKiUm98gAQuAaE2cSviVWBjz/nndhiPZfRYip9
 yPGvEJmCt5LwlbGS8im2hKeiPZkR0SPz3tyHXp8Fc90JxXziQdytf7J9N
 j0OwBF08tdu5podOcJFsUjOIcGIjDwXLpOoHH1yxP0Klx3nj+yhkmAu/F
 xvguL3a2ove6kyExVUmxoEMfE/UI7Z3Owa/3Ra6IhFkaw4eCY84H9qxZ1 w==;
X-CSE-ConnectionGUID: L58ms8nQR7CDsqbY2/LxGQ==
X-CSE-MsgGUID: CMYeMxy/QfqdQgMCSDNAeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908253"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908253"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:08 -0700
X-CSE-ConnectionGUID: l8NmKkYkRZSMLC0LDhxdsg==
X-CSE-MsgGUID: 7Uf64Q0nS7WMulw7xEj8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841787"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 08/34] drm/xe: Don't change LRC ring head on job
 resubmission
Date: Tue, 23 Sep 2025 18:15:35 -0700
Message-Id: <20250924011601.888293-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

Now that we save the job's head during submission, it's no longer
necessary to adjust the LRC ring head during resubmission. Instead, a
software-based adjustment of the tail will overwrite the old jobs in
place. For some odd reason, adjusting the LRC ring head didn't work on
parallel queues, which was causing issues in our CI.

v6:
 - Also set LRC tail to head so queue is idle coming out of reset

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3a534d93505f..70306f902ba5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned_or_wedged(q)) {
+		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		int i;
 
 		trace_xe_exec_queue_resubmit(q);
-		for (i = 0; i < q->width; ++i)
-			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
+		if (job) {
+			for (i = 0; i < q->width; ++i) {
+				q->lrc[i]->ring.tail = job->ptrs[i].head;
+				xe_lrc_set_ring_tail(q->lrc[i],
+						     xe_lrc_ring_head(q->lrc[i]));
+			}
+		}
 		xe_sched_resubmit_jobs(sched);
 	}
 
-- 
2.34.1

