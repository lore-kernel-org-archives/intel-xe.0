Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D6EC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 10:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8149810E7AA;
	Wed, 23 Jul 2025 10:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RpMmxW6o";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071C510E7A4
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hJUoXUC6bsjcfx2+OqSpohDIYuOiTMZxRYpWVT/2iNg=; b=RpMmxW6oxXuZfM/5Y+B+H7oJLR
 Irm+Hc9JVA1fpPV3g9+6zkVuRNcj4DxVGSBPtveXObPLQvLJKyZseuqQdq9NbBzByIyjnO4/GUEUh
 e9F2hQAUVpX0STR4yatCaMXU7ApS5lsS7ObDTYkEXal5XVly6zLB4iFV6iua4I73qBg0nd543R8G5
 7xjGIzVCRTS0x2Ic3VB87j1kR6ucTIr941iZLqcN5QNsLy5dFtms4uBJ3YZwNFREu5Oe4ic8Wdp2D
 5a1lcZluWHWvGQHIYXZI69oxUbwjNGVnkaKbTB/mR8YyGU4gRlcyPAaDjBsZB475hOWy7tI/QTcF7
 enu+tiGw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ueWhL-002XyY-9o
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 12:27:43 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 04/14] drm/xe/xelp: Quiesce memory traffic before invalidating
 auxccs
Date: Wed, 23 Jul 2025 11:27:26 +0100
Message-ID: <20250723102739.50425-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250723102739.50425-1-tvrtko.ursulin@igalia.com>
References: <20250723102739.50425-1-tvrtko.ursulin@igalia.com>
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

According to i915 before invalidating auxccs we must quiesce the memory
traffic by an extra flush.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c       | 7 ++++++-
 drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 09a9b31d2e12..c5e2e3b8aa2c 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -358,10 +358,15 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	const bool aux_ccs = has_aux_ccs(xe);
 	u32 mask_flags = 0;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
+	/* hsdes: 1809175790 */
+	if (aux_ccs)
+		i = emit_render_cache_flush(job, dw, i);
+
 	dw[i++] = preparser_disable(true);
 	if (lacks_render)
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
@@ -372,7 +377,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe))
+	if (aux_ccs)
 		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
 
 	dw[i++] = preparser_disable(false);
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index d7e3e150a9a5..477dc7defd72 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -8,7 +8,7 @@
 
 struct xe_sched_job;
 
-#define MAX_JOB_SIZE_DW 58
+#define MAX_JOB_SIZE_DW 70
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
 /**
-- 
2.48.0

