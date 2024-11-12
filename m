Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8DBD597AF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507AB10E671;
	Tue, 12 Nov 2024 21:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3dnx8Ml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3C910E1D0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448523; x=1762984523;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Qn4UOt4lnhlyxqpnNeoSHjtuBp8KofrMPOH2kV3mcwg=;
 b=Y3dnx8Ml0GgqDq8vzcMsiXZgrQ2NPyRsTIuMXQsuiKOrcGw5D2WkHnhs
 uDxrahmK8ygTHVvSeuTR5oV5Ty0J28PYaNAhyl5kI3meStBFg98EWsv0L
 9R/E4341qp7UyU0bP2u2rgr6/L9LLOH/F/jW9zuXzde0Fq0Tzg7lElbYn
 upm4QY9pS4/29NJbR3H/NfhwBt4ZhH6b1hBA3NPTQzHNWr3Fp3VwkPQv2
 iupw7v6Pbha7Grr0VX1CzsorhSOaVAgr+6tZHBTvL2vIlntR9AgJThR3K
 bC+fKDdF6i2R4vwwSYeC321OhardY6Xs2MpfhITd1GmnkCU6Pspme/txJ g==;
X-CSE-ConnectionGUID: PZB67mXLSb+6uLFkYYqCag==
X-CSE-MsgGUID: GL2TlySlQ+SYMvxyF1v5Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31190110"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31190110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
X-CSE-ConnectionGUID: GQxktEnhRLqy7mPFiDz2+w==
X-CSE-MsgGUID: yERRpttOQz6qtX5kWKEkqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88050235"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/xe: Add ring start to LRC snapshot
Date: Tue, 12 Nov 2024 13:55:50 -0800
Message-Id: <20241112215553.1369146-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112215553.1369146-1-matthew.brost@intel.com>
References: <20241112215553.1369146-1-matthew.brost@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_lrc.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index cc77e5132157..22e58c6e2a35 100644
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
index 37ca321ed492..b459dcab8787 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -28,6 +28,7 @@ struct xe_lrc_snapshot {
 	u32 ring_addr;
 	u32 indirect_context_desc;
 	u32 head;
+	u32 start;
 	struct {
 		u32 internal;
 		u32 memory;
-- 
2.34.1

