Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B92D66B9D
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 00:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BEC10E204;
	Wed, 27 Nov 2024 00:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSY6fgMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233D210E204
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 00:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732667494; x=1764203494;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nTymdIWRYlWWqp/bR4NTDRyBpcbIbtkXuhEYXcHyBGo=;
 b=mSY6fgMjltLEKVd1y25uTkoBfiWP7uiG0QXqmhLCZrNXOgbG+1PWO1aI
 izSedPojfjeDc0t01/EpfQ1cPAc7kyZlqDjh69OEVwd8GQEEulBz9czdW
 TjNgpyxJv7ZYWI7x05cOOzKiUSnHFTCwjFeKbdoYEsRAoqhQ/0WQVI5X5
 XB//aUanA1C+41HLU1GQ6R8wjuB+6KnyTBh/eQ2pOhPznar5gu9hqcXiB
 vn/1RrllglheUQ2vQeQa0vq2bsDcBlvyYKvY+uppDCkswbNu7QlTSwXM9
 diBPaxMDt88QLFWxStHJ5PujcbGv9lK5BxlfoFicelZZEw6JfWOY5R4rm A==;
X-CSE-ConnectionGUID: aFLPulHNSaukhB28nadG8w==
X-CSE-MsgGUID: DudJp7HySouIyogGbBos/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36517521"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="36517521"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 16:31:34 -0800
X-CSE-ConnectionGUID: tehPoGhnT1S18B7fiKTfXg==
X-CSE-MsgGUID: WCz0BX9EQYePcp0dgkf6XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="91875663"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 16:31:33 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 matthew.brost@intel.com
Subject: [PATCH 1/2] xe: Allow a GGTT mapped batch to be submitted to user
 exec queue
Date: Tue, 26 Nov 2024 16:31:26 -0800
Message-Id: <20241127003127.42560-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
References: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
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

For a OA use case, one of the HW registers needs to be modified by
submitting an MI_LOAD_REGISTER_IMM command to the users exec queue, so
that the register is modified in the user's hardware context. In order
to do this a batch that is mapped in GGTT, needs to be submitted to the
user exec queue. Since all user submissions use q->vm and hence PPGTT,
add some plumbing to enable submission of batches mapped in GGTT.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c        | 5 ++++-
 drivers/gpu/drm/xe/xe_sched_job.c       | 1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 0be4f489d3e1..9f327f27c072 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -221,7 +221,10 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 
 static u32 get_ppgtt_flag(struct xe_sched_job *job)
 {
-	return job->q->vm ? BIT(8) : 0;
+	if (job->q->vm && !job->ggtt)
+		return BIT(8);
+
+	return 0;
 }
 
 static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 1905ca590965..5710d9ab36fa 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -109,6 +109,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
+	job->ggtt = false;
 	job->q = q;
 	kref_init(&job->refcount);
 	xe_exec_queue_get(job->q);
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index f13f333f00be..d942b20a9f29 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -56,6 +56,8 @@ struct xe_sched_job {
 	u32 migrate_flush_flags;
 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
 	bool ring_ops_flush_tlb;
+	/** @ggtt: mapped in ggtt. */
+	bool ggtt;
 	/** @ptrs: per instance pointers. */
 	struct xe_job_ptrs ptrs[];
 };
-- 
2.34.1

