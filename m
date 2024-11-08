Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791CCD64072
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273A710EA1E;
	Fri,  8 Nov 2024 17:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ja8CJ0LX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAEA10EA1E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731087763; x=1762623763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FZu3Gp/HG+28tApDAfkVWZv51EI+pATT2mPORhRQfCY=;
 b=Ja8CJ0LXJwRXmveGjVHb4swkkxkRoKEO2QzfcgRaocr7W9to6qzYs0et
 AvGwiv+nzx3Dv15/9kur3liDevIuFOwzR64VAma30gbHCH378uDV5ymHj
 afjur4hlOqHphtjJaW2nlUtxdx9rSMoXXYZYRVPWTKMSG3hJn6ysPOEh1
 syoxOGNoLa2mlfbSELJk6adjb2f/GNox005Uefyk7voWAIhmG97qJVVOG
 xoPnkwSopyucONm6g/t9Wy3E/O92KsrJiyBfIB/N1QhM2xPW+i4RfnMc2
 04qxt1DF4nspoyYbacSRx73xuTMIXTzOrOn96nlBryK6lnYHxzGTaYH/T g==;
X-CSE-ConnectionGUID: u9lU7QgiQXu2Nf3dYO8pdw==
X-CSE-MsgGUID: Xl9YchL3RsGSLiIvQAZL3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41598610"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41598610"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
X-CSE-ConnectionGUID: V6AqdOU5Q12BN/oi5M07pQ==
X-CSE-MsgGUID: Zau6S6EtQ1+ePja9j/GOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86001291"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com, zhanjun.dong@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 3/7] drm/xe: Add ring start to LRC snapshot
Date: Fri,  8 Nov 2024 09:43:08 -0800
Message-Id: <20241108174312.272792-4-matthew.brost@intel.com>
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

Add LRC ring start register to LRC snapshot to verify no LRC register
corruption upon hang. This could be possible if the indirect ring state
was mapped to user space or via an internal KMD memory corruption.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_lrc.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index afb0f4f44748..80cb0e7e2d22 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1061,6 +1061,14 @@ u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
 		return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) & TAIL_ADDR;
 }
 
+static u32 xe_lrc_ring_start(struct xe_lrc *lrc)
+{
+	if (xe_lrc_has_indirect_ring_state(lrc))
+		return xe_lrc_read_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START);
+	else
+		return xe_lrc_read_ctx_reg(lrc, CTX_RING_START);
+}
+
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
 {
 	if (xe_lrc_has_indirect_ring_state(lrc))
@@ -1641,6 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
 	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
+	snapshot->start = xe_lrc_ring_start(lrc);
 	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
 	snapshot->seqno = xe_lrc_seqno(lrc);
 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
@@ -1701,6 +1710,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
 	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
 		   snapshot->tail.internal, snapshot->tail.memory);
+	drm_printf(p, "\tRing start: (memory) 0x%08x\n", snapshot->start);
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
 	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index a2058a501353..a1b227440d1d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -28,6 +28,7 @@ struct xe_lrc_snapshot {
 	u32 ring_desc;
 	u32 indirect_context_desc;
 	u32 head;
+	u32 start;
 	struct {
 		u32 internal;
 		u32 memory;
-- 
2.34.1

