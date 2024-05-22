Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE6EC25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 07:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BEC10E562;
	Wed, 22 May 2024 07:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrQAWnNo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E199D10F3B9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716362883; x=1747898883;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=0Hn2553Wrqg23Ic03xIM7GhlhtlsPNM9k/rsht/qwcM=;
 b=YrQAWnNo4OP20GcOT4RjoDOvRJI2xW+2suVbjUKGgNY0kdry0v3O9A3J
 69MpTZDG+/Y1nOKOV3/W2NIOSI4sqxZ16KXiiH5f4zC/DRnndTk7qjsUh
 fmWyszVza0nqtpo5apDnttnok4vDACVfIB8UbvEFLljROcjY70XqLEDo6
 r4xMKfbLPfBAAqAEHkwfM0eHVvLDbjEWJckJWtFLXl7kvndqmzYsoETE6
 QLc3mTOgNM4whMY4Vqq/IXFK2EQnD8Y8TBK7ojcPzBE2axxy7KcG+agrw
 EtYBpfccwJlqzqzpok+7GY41MuKYSWDgb7geFXigT5ICld/+b3cUyVc46 A==;
X-CSE-ConnectionGUID: MA6/HNxwTSCdA9kXR3JTjA==
X-CSE-MsgGUID: hTECS2pSQVqDbE4OA4ZEBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16385471"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="16385471"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 00:28:02 -0700
X-CSE-ConnectionGUID: 8XOivgT0Q8GX4lr20ZikWA==
X-CSE-MsgGUID: BRFCtvkdSGSOdf8zccyiug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38149111"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 00:28:01 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 22 May 2024 09:27:27 +0200
Subject: [PATCH v2] drm/xe: flush gtt before signalling user fence on all
 engines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
X-B4-Tracking: v=1; b=H4sIAF6eTWYC/42OTQ6DIBhEr2JYl0ZQW+2q92gM4eejkCg0oITGe
 PeiJ+jyJTNvZkMRgoWIHtWGAiQbrXcF6KVC0nD3BmxVYURr2tYdJTivTE9rNCzJyARoH4CtGpw
 EzO+i7dTQSt00qAg+AbTNp/w1FhY8AhaBO2kOpQozzoAd5OVIGxsXH77nk0SOzl+jiWCCFaimF
 91N9nJ4WrfAdJV+RuO+7z8Hb9TS4gAAAA==
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2431;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=0Hn2553Wrqg23Ic03xIM7GhlhtlsPNM9k/rsht/qwcM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmTZ6Ai112/QrgpRTfT4fgpzxelbtXaItyUhSdSMRB
 LvXzCHeJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZk2egAAKCRAjYrKT3hD913V5DA
 CDF8gmTerw1+lmKI68QzOS2EYoWLWokGzo+zwrI7dt9ljsUS2tSLgQNUt+wnO5YBg4Boh/A/baqAFo
 GycBSSqdmEHiwDKzLOtuk9lvoLvZW6SYEGTAlWRSwavByXGtBRnHhttaTYg/3Kp5oBee+TI9SV6VYC
 GxFgr4CxjvG1et/KhoguOnR+ujAep6AiKu4oBXC9N/7qSlA5hDCFVk3LXwCEvX6N+MgZjbImCZAVHF
 QT3fL0+rqFe1WTu2KxTKQF2waixsIrqLXBTb8Ui3UflufqlLpqe7x+4GThtDrc6RenzRiDHr+xQCP9
 gOw/N9tgffDs+PtrFPvCrIPrtWSkj6U88vrXGgs6eig8/TC7vQ3ZBLTJ76Mge+E+T06jVo1nrWXQk9
 1Eii4Nc4kSHJkdqytbXfr9Xm4+kalYYi1DeVTwql24suc48uyutGyRMUgZCJD6MII0qMpc5H8W6GkJ
 3YbPmEazbk0nTJ+A2nbc+x0wF3ZM72UIwgX2M96GBMz3A=
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

Tests show that user fence signalling requires kind of write barrier,
otherwise not all writes performed by the workload will be available
to userspace. It is already done for render and compute, we need it
also for the rest: video, gsc, copy.

v2: added gsc and copy engines, added fixes and r-b tags

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
Changes in v2:
- Added fixes and r-b tags
- Link to v1: https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com
---
Matthew,

I have extended patch to copy and gsc engines. I have kept your r-b,
since the change is similar, I hope it is OK.
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a3ca718456f6..a46a1257a24f 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -234,13 +234,13 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+
 	if (job->user_fence.used)
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
 						job->user_fence.value,
 						dw, i);
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
-
 	i = emit_user_interrupt(dw, i);
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
@@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+
 	if (job->user_fence.used)
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
 						job->user_fence.value,
 						dw, i);
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
-
 	i = emit_user_interrupt(dw, i);
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);

---
base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

