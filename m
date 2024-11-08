Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85451D64074
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499FD10EA27;
	Fri,  8 Nov 2024 17:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpEJOPuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531C210E25E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731087763; x=1762623763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mwFfRXLMNByv0zL2M+0wz7JaCS2uDy2oSVpYgkjX270=;
 b=dpEJOPuQywwoHJkOlXL2j56rDy5eavin/ClwTPg+GC2NM27M/s3aH8up
 5P8yJTn/Omz+S0FIS2xjtbSWeUvH5h/60CV31dPsohAF5DyTxexU5GA4p
 g6qrTnhPPUteA6RXb95clWKo1okWKaF5XVsygpeHdKeKaupQcLpkhs2i6
 vwTtQCz1totjkS/VTmWK8Deqj2PBFf7T8r33TT5M4VbS4CB4a6/DNB75r
 PFC3g+U/VC8Mnk9IVWwKynLhmPxyFk0Go6ETPRGH4wr0RcbLJ7FnwvgnW
 i4nPYrdYFLm8v8SnIVluwz1HBSr/TbqwB41WdD07R74kVo5wxV+Bu8M/h Q==;
X-CSE-ConnectionGUID: miVJDi/YTvWxnudouENzjA==
X-CSE-MsgGUID: 3AkxdArMRH+WDZcCuL4MAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41598608"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41598608"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
X-CSE-ConnectionGUID: YL2FQzHpQheg8/iPDNpPDQ==
X-CSE-MsgGUID: NNZA92ayS6qtvYNLZaWoXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86001288"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com, zhanjun.dong@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Date: Fri,  8 Nov 2024 09:43:07 -0800
Message-Id: <20241108174312.272792-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108174312.272792-1-matthew.brost@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
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

The ring is currently in LRC BO but this may change going forward.
Include the ring address in the snapshot protecting again any future
changes.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 3 +++
 drivers/gpu/drm/xe/xe_lrc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e219657535cf..afb0f4f44748 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 		xe_vm_get(lrc->bo->vm);
 
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
+	snapshot->ring_desc = __xe_lrc_ring_ggtt_addr(lrc);
 	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
@@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 		return;
 
 	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
+	drm_printf(p, "\tHW Ring: 0x%08x\n",
+		   snapshot->ring_desc);
 	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
 		   snapshot->indirect_context_desc);
 	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 9d64cedc4d14..a2058a501353 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
 	unsigned long lrc_size, lrc_offset;
 
 	u32 context_desc;
+	u32 ring_desc;
 	u32 indirect_context_desc;
 	u32 head;
 	struct {
-- 
2.34.1

