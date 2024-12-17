Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2330BE77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 00:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E041210E80A;
	Tue, 17 Dec 2024 00:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbbIh4GO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B7710E807
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 00:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734397104; x=1765933104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OvuaCQqyVosqO4Gj91CxmIxDonPLcHQz8iORLLW8x5c=;
 b=UbbIh4GOxAp8xxqQ+qiH9HmjIdkrFL8wPZ8JAUYXzhqwL71OcJByPFdE
 Mtwk0vSSH4GstboN/H33+XNO4hZcg5GQgoi4HamnT+C6dob42NLZMvGNK
 ylEE/uvf4C/znRSULWhzKxcKe0lYoji6vL6MUhHOpRgejqym94L1TN4uv
 bLINLeMJZv+1Yrbn0NIRtbnmLGyeqehpP2L/PklurLOU04BfGU8EHuqAw
 lf4CouuYTMygRKgT1Kd9tn3vN7jPQffNnG62drrE6IRl6sEFjv1vBse2a
 Lh3AJxPLTEAOx7oq1lADnWFvPn3HOe5GEsYr46ADAEUJWoqI43xoPhpmC g==;
X-CSE-ConnectionGUID: servBIHJQ9WkWL7kbcdShQ==
X-CSE-MsgGUID: INZRlsYnSiKPZOThyKymhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46202040"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46202040"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 16:58:23 -0800
X-CSE-ConnectionGUID: kuXedTKQQni0fSQKVFZuIg==
X-CSE-MsgGUID: lkgd+AoaTHelc4CVw7NMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97220170"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 16:58:23 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 1/2] xe: Allow a GGTT mapped batch to be submitted to user
 exec queue
Date: Mon, 16 Dec 2024 16:58:17 -0800
Message-Id: <20241217005818.25205-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
References: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
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

v2: ggtt is zero-initialized, so no need to set it false (Matt Brost)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c        | 5 ++++-
 drivers/gpu/drm/xe/xe_sched_job_types.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

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

