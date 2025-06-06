Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C19C5B555
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 00:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB7810EA86;
	Fri,  6 Jun 2025 00:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ofbtmlt6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFCD10E910
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 00:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749169121; x=1780705121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IIxEes6Uv9mRhxW/nwF1qQFO0u53LRV70CdYwI8t0eU=;
 b=Ofbtmlt6096ncYu5uUG7n2wKzuNi48rNv9r4R9oKeMxqcUVcyD+k35vR
 r1/T+TcrULsWs/s/GfrjXjPCKEscd/WDJ2wE5IIOgeK1ddzjZoJnvi5dT
 UKZHFbhsyb5Vm1dml1chUqXw19GNdjTYSPaz3GFlivg64z17OQuobVUjo
 YnClTnlRatOJtixeD0LKjPyHtQ6gIVx6O0j2qxfEbwy4OLiMGQLOXibrY
 ACf41ZyWXwo7OROhMgUXzt7B4OyIfKQvzpePtNPI8YYqm0ko3VODOpvLO
 O/MY2RX7GS8uY6XFMPxgpU8q0yahdccjpeK/oZKOmnzXMsqByrMyK9I9f A==;
X-CSE-ConnectionGUID: WBJaeGbnS3OYxPsGNzf7Yw==
X-CSE-MsgGUID: BJ2TtttJQVKupZDXfFFdOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61973486"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="61973486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 17:18:41 -0700
X-CSE-ConnectionGUID: MCiXHzScQ/eQemEV7wqYSA==
X-CSE-MsgGUID: mj13EyphRj63f/oaU7Laig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="149507906"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2025 17:18:39 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 8/8] drm/xe/vf: Refresh utilization buffer during migration
 recovery
Date: Fri,  6 Jun 2025 02:18:23 +0200
Message-Id: <20250606001823.1010994-9-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606001823.1010994-1-tomasz.lis@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
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
 drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 4 ++--
 drivers/gpu/drm/xe/xe_lrc.h        | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d5ffb550bde7..63190aab0a1f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1041,6 +1041,7 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
 	for (i = 0; i < q->width; ++i) {
 		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe);
 		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
+		xe_lrc_setup_utilization(q->lrc[i]);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c74856f3974a..21cc99935ebe 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -951,7 +951,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
 }
 
-/*
+/**
  * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
  * context run ticks.
  * @lrc: Pointer to the lrc.
@@ -979,7 +979,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * store it in the PPHSWP.
  */
 #define CONTEXT_ACTIVE 1ULL
-static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
+void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 {
 	u32 *cmd;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 801a6b943f6e..681b859f57e9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -127,6 +127,7 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
 u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
+void xe_lrc_setup_utilization(struct xe_lrc *lrc);
 
 /**
  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
-- 
2.25.1

