Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECEBC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ABB10E7CD;
	Thu, 12 Jun 2025 10:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLmckXu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE1610E7CE
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749723907; x=1781259907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mPxRiIav2Ph+ynqW5YhhMAjhoAT+d0h1e4dxTsMs68o=;
 b=fLmckXu79042mkl4FFN4/S+lHpLLkPyTWhcedKKQ6PnSWMPw9iAXlwr5
 NQ035ZUua7UEVS2OlAzg577reemieWJofO2x0TpYtAYyPYA5L+vQWjJgB
 nloDM2iBLV5kgNWhmnb9iafXO9z7gGEMkpG/BX3prO2nryVbUWv7pf0fr
 2Tn3znMxDTxSK5kxcBB3ASOpIwxADMUiyluCqXqy8fR7BEJVj85O463X2
 DKYW6NaFgvB8doPiUEwDlTEzrS7ZnKURlkClV5gbuLxqVix3YSrhA/bfx
 nERHkHh95I3AqO3hE1dbSjtRrHqMG3Um2ob7UaBhAEcn2+7Xk4pOaVHjY Q==;
X-CSE-ConnectionGUID: tubOmOsWSP2bNQTTBwf37Q==
X-CSE-MsgGUID: 3xbdVw4sQouVGRd6IPwqtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51608614"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51608614"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:25:07 -0700
X-CSE-ConnectionGUID: mixmmBVwQHq+MUAYbghivg==
X-CSE-MsgGUID: 83eQBGMjR4qXtxLx4zlKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152382919"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2025 03:25:04 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 8/8] drm/xe/vf: Refresh utilization buffer during migration
 recovery
Date: Thu, 12 Jun 2025 12:24:49 +0200
Message-Id: <20250612102449.1412058-9-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250612102449.1412058-1-tomasz.lis@intel.com>
References: <20250612102449.1412058-1-tomasz.lis@intel.com>
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

The WA buffer we use to capture context utilization contains GGTT
references. This means its instructions have to be either fixed or
re-emitted during VF post-migration recovery.

This patch adds re-emitting content of the utilization WA BB during
the recovery.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 10 ++++++++--
 drivers/gpu/drm/xe/xe_lrc.h        |  1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d5ffb550bde7..dc2bcda1d636 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1041,6 +1041,7 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
 	for (i = 0; i < q->width; ++i) {
 		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe);
 		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
+		xe_lrc_setup_wa_bb(q->lrc[i], q->hwe);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8b08c416ccf0..9f3331779dae 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1011,7 +1011,13 @@ struct wa_bb_setup {
 			 u32 *batch, size_t max_size);
 };
 
-static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+/**
+ * xe_lrc_setup_wa_bb - Execute all wa bb setup callbacks.
+ * @lrc: the &xe_lrc struct instance
+ * @hwe: the &xe_hw_engine struct instance
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_lrc_setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	const size_t max_size = lrc->bb_per_ctx_bo->size;
 	static const struct wa_bb_setup funcs[] = {
@@ -1218,7 +1224,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
-	err = setup_wa_bb(lrc, hwe);
+	err = xe_lrc_setup_wa_bb(lrc, hwe);
 	if (err)
 		goto err_lrc_finish;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 801a6b943f6e..8f05620fc0f0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -127,6 +127,7 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
 u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
+int xe_lrc_setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe);
 
 /**
  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
-- 
2.25.1

