Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D89C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 09:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF0310E24F;
	Tue,  4 Jun 2024 09:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gS6Vmvdm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9BE10E24F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717493966; x=1749029966;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=RYeuNtdblfDPv3qOIlDRJ0Hm/8UYMnLXMWCzEpS5Aes=;
 b=gS6Vmvdm+c/LBHR9arLQKk8SSblDWvjcPckiww50L8gLb7x5mTTVwIqQ
 uVu24hUg/2W3ESGhUn7FZ/j4iz3RYVxsL3xhXgsQAd3rb7adwyFtTKGX/
 Y0ima6rZMiOf3ogHrTjuIlDk+Uhj0xDXbBxminJ1Ss9DNRGfwUzZbh/0P
 U/FdVKSyoaz1cm22Qkw+rz+21Jb2aMahNsfhGzzYw/DePW3nTrbdiZoLp
 rSnvNXoJ7IYpxkJosuLLPFcxW/dKMF+Gz4XZ7QFmjFbqMRzoBqZini2Cv
 xdd2rgiqMrD5CAsvHruwjgosvt4ZffMzmnta0Soz0G/sYzp5Svu5IDe0b g==;
X-CSE-ConnectionGUID: C1vy8r8wRxuB6bv0og+/vQ==
X-CSE-MsgGUID: DwiZMPjCTb+I+vb8JOGS1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14185548"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="14185548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 02:39:25 -0700
X-CSE-ConnectionGUID: Mg28+guETZOzi52JB8Q5QA==
X-CSE-MsgGUID: d1t5i4XSRDeaAQgCaOXzlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37764219"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 02:39:04 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 04 Jun 2024 11:38:51 +0200
Subject: [PATCH v2 1/2] Revert "drm/xe: flush gtt before signalling user
 fence on all engines"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240604-fix_user_fence_posted-v2-1-9276ecef973a@intel.com>
References: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
In-Reply-To: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=RYeuNtdblfDPv3qOIlDRJ0Hm/8UYMnLXMWCzEpS5Aes=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmXuC1q0rb6K1sQx5pFbCyLOfyMiJGbjvFiPF1dxqe
 okjcHF6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZl7gtQAKCRAjYrKT3hD914zqDA
 C1H9M90hhuKSkaraApOXs60FBmMAhjfnmavlmvQcyH/ErcJg7oQB8smtGM/5MiqrdTvg7HcwxYmj8Z
 xCPWAqlC9mx6bzs6AuMcV2a9Oe1tOOZ+lnXVd4k5/0gr2saG/Jb0DFNelFg+JIQgOea856PgXF3qwZ
 zOFhjeXpmU5LnanRwemDhDo7YLP7kHEmkEpPB5amy5DpGTiWXlNoa1vM92vfgHuD0mV69VUVFl3Rtx
 bWWUzWJRj1KYhks2qejjdMwp1USV/JawC+X0FYH/9c5iPncuTJSFHbXodKWGiOyWShdLpDU+fCRtkX
 nd2uwQHL0hreNbLbY/ic8k7nVMvXjRSQV+qJ/vx1Pvv0PF4SJNctLAcRPgtCiZ/m5ADXhi9KJBvOyo
 G8aApEItZgq1qvXMa8nKmoEM29E8mXwjeQvnVrn3+l2A0MY4MUaE0YAx60ZDwU65TiHfTL6MRG+130
 9bi5SCYrmc86R6V4z6mD24a/n5eU2Kc6Ud5qym6lZFhtw=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

This reverts commit 38007fa96419a9db9719f170b9e8a7877821cdd1.

Signaling user-fence after seqno write does not seem to be good solution.
Instead of changing order separate barrier should be put before user-fence,
this will be done in separate patch.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 2a607c141d65..b11b3cd16b5e 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -234,13 +234,13 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
-
 	if (job->user_fence.used)
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
 						job->user_fence.value,
 						dw, i);
 
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+
 	i = emit_user_interrupt(dw, i);
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
@@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
-
 	if (job->user_fence.used)
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
 						job->user_fence.value,
 						dw, i);
 
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+
 	i = emit_user_interrupt(dw, i);
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);

-- 
2.34.1

