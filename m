Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC38C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91AF10E961;
	Thu, 10 Jul 2025 20:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGkpeRFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D5610E053
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752179725; x=1783715725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fU4Bt2SAVGKylSGZRE8Q7JPM7TFEH1OIO12k2fkRdX0=;
 b=eGkpeRFuoPaQfk8fDHXD5ClH30Wgud1vIBYmlWo2a7ktkbbL5Vrl2ap1
 vMqHWCO3KXFNYvlwcDUWoVnWaS7anUt9eGXnc+wxltdbJ14/3Z1ApibmA
 RHyGYTMSn5oGjlBbNo656EJ8gxYevriHPRWBpHQe+spEXCRhmeY60t87j
 sFMwKcJY5y1JukpdgmS4CvTFi2KgFf7eFqZu2HTimh2ehpMez40ACin2a
 O+jZx1ebezA+aBzPspXQbYuscp/m1KkWSEPZODt3EYk0lod6qjsmdhZh7
 aCtBmoknLDtCdacOOili/ny1PWHUyaTvrC4iwrbVJiUDAjzeyk3xbpJVK Q==;
X-CSE-ConnectionGUID: GvdvurAXRE+Mbd/NDHbAyg==
X-CSE-MsgGUID: xnP4tfV0Qz6Po3K8WEniZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79908471"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="79908471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:24 -0700
X-CSE-ConnectionGUID: xb4JRdRESL+p/CVzXfY4ag==
X-CSE-MsgGUID: ydtPio8ERce8sH2IctHKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156744244"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 2/7] drm/xe: Count dwords before allocating
Date: Thu, 10 Jul 2025 13:33:47 -0700
Message-ID: <20250710-lrc-refactors-v2-2-a5e2ca03f6bd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
References: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

The bb allocation in emit_wa_job() is wrong in 2 ways: first it's
allocating enough space for the 3DSTATE or hardcoding 4k depending on
the engine. In the first case it doesn't account for the WAs and in the
former it may not be sufficient. Secondly it's using the size instead of
number of dwords, causing the buffer to be 4x bigger than needed:
xe_bb_new() receives number of dwords as parameter and its declaration
was also not following its implementation.

Lastly, reword the debug message since it's not only about the LRC WAs
anymore as it also include the 3DSTATE for render.

While it's unlikely this is causing any real issue, let's calculate the
needed space and allocate just enough.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.h |  2 +-
 drivers/gpu/drm/xe/xe_gt.c | 38 ++++++++++++++++++++++++--------------
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index fafacd73dcc38..b5cc65506696a 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -14,7 +14,7 @@ struct xe_gt;
 struct xe_exec_queue;
 struct xe_sched_job;
 
-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
+struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d397df056e4cd..25907c4423e5d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -189,16 +189,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	long timeout;
 	int count_rmw = 0;
 	int count = 0;
-
-	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
-		/* Big enough to emit all of the context's 3DSTATE */
-		bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
-	else
-		/* Just pick a large BB size */
-		bb = xe_bb_new(gt, SZ_4K, false);
-
-	if (IS_ERR(bb))
-		return PTR_ERR(bb);
+	size_t bb_len = 0;
 
 	/* count RMW registers as those will be handled separately */
 	xa_for_each(&sr->xa, idx, entry) {
@@ -208,11 +199,30 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 			++count_rmw;
 	}
 
-	if (count || count_rmw)
-		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
+	if (count)
+		bb_len += count * 2 + 1;
+
+	if (count_rmw)
+		bb_len += count_rmw * 20 + 7;
+
+	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
+		/*
+		 * Big enough to emit all of the context's 3DSTATE via
+		 * xe_lrc_emit_hwe_state_instructions()
+		 */
+		bb_len += xe_gt_lrc_size(gt, q->hwe->class) / sizeof(u32);
+
+	xe_gt_dbg(gt, "LRC %s WA job: %zu dwords\n", q->hwe->name, bb_len);
+
+	bb = xe_bb_new(gt, bb_len, false);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
 
 	if (count) {
-		/* emit single LRI with all non RMW regs */
+		/*
+		 * Emit single LRI with all non RMW regs: 1 leading dw + 2dw per
+		 * reg + 1
+		 */
 
 		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
 
@@ -236,7 +246,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	}
 
 	if (count_rmw) {
-		/* emit MI_MATH for each RMW reg */
+		/* Emit MI_MATH for each RMW reg: 20dw per reg + 7 trailing dw */
 
 		xa_for_each(&sr->xa, idx, entry) {
 			if (entry->reg.masked || entry->clr_bits == ~0)

-- 
2.49.0

