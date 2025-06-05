Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC04AC677C4
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BF810E955;
	Thu,  5 Jun 2025 15:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+XtogZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5427E10E8A8
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tfyNCampxCyg4VjGM1nrUn8nhyWuu2h9IlpPuEneQRs=;
 b=D+XtogZXbnO0IW2WI1E9U5mDJfYyfxyhxDD3heYexBiI+AHwip3kEzvc
 EcFhBGOpti/qRSJL9kQ0of5TzbvTABQ9mMUOJsh0PkX6+3TS/1jweEOFh
 adnU1yusVvepGLW/YwQas2rknUFfKv0mGXrx6/N6Jy5WUdh5WwEcPIUL6
 9MFz+3b/RnEtPT7bHtIw4YA/w/nwStBgBzhZO5Cfv0YNTcKQ7iuuUhz6C
 mdOLJIpgDFldL2E/DqZTGvO2iA7H5t09WurQhiMua+xbhWJZ27vMCOkJx
 CKo1b1rpmxG/miSBGW656tUZ0uiAN3ODHFn3xT4LakIgLiO/cDmNezIIX Q==;
X-CSE-ConnectionGUID: 3p+Y2fj4Qfiu/5CsBozamA==
X-CSE-MsgGUID: DzMWPvVPTc2tIZsmmioOFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529498"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: 7lZpO7hwSVaWo5P32MCf+g==
X-CSE-MsgGUID: wICoZnbcRRKkZK5blte/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502828"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 13/15] drm/xe: Set slpc freq to max on ULLS jobs
Date: Thu,  5 Jun 2025 08:32:21 -0700
Message-Id: <20250605153223.2789122-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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

ULLS jobs should run as fast as possible, as such, increase SLPC
frequency on the ULLS queue to the maximum.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f67dfdb69637..41ac0b41b09b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -451,6 +451,23 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
 }
 
+static void set_slpc_freq(struct xe_guc *guc, struct xe_exec_queue *q,
+			  bool high_freq)
+{
+	struct exec_queue_policy policy;
+	u32 slpc_exec_queue_freq_req = 0;
+
+	if (high_freq)
+		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
+
+	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
+	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
+							     slpc_exec_queue_freq_req);
+
+	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
+		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
+}
+
 static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
@@ -718,9 +735,14 @@ static void submit_exec_queue(struct xe_sched_job *job, struct xe_exec_queue *q)
 		return;
 
 	if (job->is_ulls) {
-		if (!job->is_ulls_first)
+		if (job->is_ulls_first)
+			set_slpc_freq(guc, q, true);
+		else
 			xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);
 
+		if (job->is_ulls_last)
+			set_slpc_freq(guc, q, false);
+
 		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
 	}
 
-- 
2.34.1

