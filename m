Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58531D609B3
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 15:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0432010E974;
	Tue, 16 Dec 2025 15:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QP/0tIHQ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4177210E75D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c8RBn/gDwVn0t/UG+pL9hpR9qmbKuEC1VKOhxA4Fd4g=; b=QP/0tIHQP/ePg5lPS4VqzQ2bYw
 8wSH4rC6BO8OlhSBJYUIIf23FetqMWmh+P0xxtLxQtER7ZCGIEFvR/TMxw9htjLIy7dBaFPTPbFvh
 tMBZ7nDQPqmgCLBuEMKGwULLJYoA0LvS8OOBrz2F4vZ/YZvY4R1CMx4/DO5zJEENt/LqACLxVzD/5
 rBB0GKTTqK+XHxYMsaGHlS88+5qX6BNMj9EGRNrIHViGRvVA4/DHOTQEe5IqrIalbDDLHB/LZ7jxI
 L9E/8eBsF6jb71w6fHz3V8VvoDBofKvS/lP0v/VC6zxU22oBA5FdwfDNNSZifRkU2J1Kp5sLDERzz
 s6UUPNtg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vVX7x-00DRSA-Go; Tue, 16 Dec 2025 16:38:17 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v16 3/8] drm/xe/xelp: Quiesce memory traffic before
 invalidating AuxCCS
Date: Tue, 16 Dec 2025 15:38:00 +0000
Message-ID: <20251216153805.96056-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
References: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
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

According to i915 commit
ad8ebf12217e ("drm/i915/gt: Ensure memory quiesced before invalidation")
quiescing of the memory traffic is required before invalidating the AuxCCS
tables.

Add an extra pipe control flush to achieve that.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c       | 10 +++++++++-
 drivers/gpu/drm/xe/xe_ring_ops_types.h |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 02bb3e1f20b7..6f8b4dc39d3a 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -360,12 +360,20 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	const bool aux_ccs = has_aux_ccs(xe);
 	u32 mask_flags = 0;
 
 	*head = lrc->ring.tail;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
+	/*
+	 * On AuxCCS platforms the invalidation of the Aux table requires
+	 * quiescing the memory traffic beforehand.
+	 */
+	if (aux_ccs)
+		i = emit_render_cache_flush(job, dw, i);
+
 	dw[i++] = preparser_disable(true);
 	if (lacks_render)
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
@@ -376,7 +384,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
 
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
2.51.1

