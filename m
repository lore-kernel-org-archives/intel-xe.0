Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81296C27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 07:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFF410E181;
	Wed,  5 Jun 2024 07:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKh3Ag6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0569510E6C7
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717572615; x=1749108615;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=fi8r30iwfGb/NJEPMQDjulUaxTBz39KFgu9e9N3/9x4=;
 b=PKh3Ag6NhT7hTjPLgQ31xFflKwstUOM5VR8rwdyOxzzQ7HCu56DrNMp5
 jigh2b7x6RbxEiB0TgPiQ52xn7GjcAxVjtHs7tF0G5Al85r+wD9gfFb1F
 PJyjiXXKn1nKJbEvCDfpvnGMhOGMxu9AbcX/r6HzOEudNPJx8zTU+/yOD
 bJt3GJsbpQA3+idNxvyfRLLhxhruBJYUK321iFr3HBkvDyIAvmMjxLgXB
 CLjORlMaWVd5Nazozgqmd8wODOW9k5cB38EKKeEaMh6jNW6+DctjLmxlv
 PgHIAUU6/nGsYNEZsjwJyf3Vs906SDhVeacBtPOxOX1tfDsduw1VmP866 A==;
X-CSE-ConnectionGUID: byJYxedgRRKlfuZ+2Edzig==
X-CSE-MsgGUID: h8/RLfuRSpqFQWMFs+gwkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24789018"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="24789018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:30:03 -0700
X-CSE-ConnectionGUID: VQoGmLkNQqKylIjTlIchaw==
X-CSE-MsgGUID: V5xI8JiVQG2Ly20cAFN3lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="42453175"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:30:01 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 05 Jun 2024 09:29:47 +0200
Subject: [PATCH v3 1/2] Revert "drm/xe: flush gtt before signalling user
 fence on all engines"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240605-fix_user_fence_posted-v3-1-06e7932f784a@intel.com>
References: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
In-Reply-To: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=fi8r30iwfGb/NJEPMQDjulUaxTBz39KFgu9e9N3/9x4=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmYBP2EJZn6KwY0lcfvqy67VkNaLSJS5jbFbhLybMk
 Ds8WvemJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZmAT9gAKCRAjYrKT3hD914HxC/
 45J6WfeIxwv9jtz1d9bexfurRA8sVe7lCsHT26IEstBKCIRN9XVBnaFAVGqRWmWj/uXXuGT5TFeKEY
 Lk1svyUdT5Y6NYlkYmVWY65ltNEyGEPS0yYhiCqmDEiwcc+vFKKPVdwJ0s8K0ObWB2LAmoVJa4BV7f
 Fu4e7kNscza/s6RvSt62TCmV905ss2g2JlQDQkbRDKJ5IvrakMQ2Opnh0scRDqg8wWDqFkyz+nIda8
 lMFPMynVB1BYoru9hqZ58ghaa6FDhpdPjpZD3bPTLfuMb2IOQqATz9/tjC3RV+ZXWFLJoDdWP+1M5S
 KMACGH+XayOz/r9tDIGFyvrXO2ydrxOa6CKavnzKkeF9ToG5gTWsZsBu7oeYuUTovw0JF68+QZ0Qi0
 h6zUOUygrG2yIPhtwtJgyvG9Ar/reX4KhgqZMxFmhNn3REi5mP5JGdhAEPjrBB2Sp8mACVFIz8k4mh
 ecN/5LQ/XnG3oZ+slv5XWGH7SJjBCBBrnSrxxx2sFgw6k=
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

v2: added fixes tag in case reverted patch gets backported to stable

Fixes: 38007fa96419 ("drm/xe: flush gtt before signalling user fence on all engines")
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

