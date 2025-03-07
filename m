Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11234C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 11:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD2D10E114;
	Fri,  7 Mar 2025 11:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GO74ORlK";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682BA10E994
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=evcDhlV7zPq8IyAq5G9zNu8EGnxpoiQV+h6aPvU+NSk=; b=GO74ORlKcTDCCH9nR72rQZX97p
 mNX5PEjvp9mcJF+LWHraoo6wCjtTyKwhST04WXVhcwYTeju2SLB7gRlFwJi4ZjkPUA2jV/hWAklzG
 eQdjX3NJxJFdrWRvHNQlnqmxXINjS0/Bx36A8c+tcpKsrmvm2cpIgG3H251VpR5HdHw2/HfmKvS5p
 EgMJG/JxJeHwh7Ku8L4APQ0u8RhP4FjkMD64HRy7JvCfpo/YqbhL5iytaboZc5ZIGgFIeRUhOO5tj
 QQ9HWKCdZa83us7nXUdZyiPvX7SdLOflhQKJn9071/TO7enJ0n8kS1g+PLIXP5SAp4mvbGzBOTwbj
 e+3Pcs/Q==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tqVeS-005Ji8-Ls; Fri, 07 Mar 2025 12:14:06 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/4] drm/xe: Fix ring flush invalidation
Date: Fri,  7 Mar 2025 11:14:00 +0000
Message-ID: <20250307111402.26577-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
References: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
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

Emit_flush_invalidate() is incorrectly marking the write to LRC_PPHWSP as
a GGTT write and also writing an atypical ~0 dword as the payload. Fix it.

While at it drop the unused flags argument.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index d2f604aa96fa..3d1b4d3d788f 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -111,16 +111,13 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
 	return i;
 }
 
-static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
+static int emit_flush_invalidate(u32 *dw, int i)
 {
-	dw[i] = MI_FLUSH_DW;
-	dw[i] |= flag;
-	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
-		MI_FLUSH_DW_STORE_INDEX;
-
-	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
+	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
+	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
+	dw[i++] = 0;
 	dw[i++] = 0;
-	dw[i++] = ~0U;
 
 	return i;
 }
@@ -413,7 +410,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
 		/* XXX: Do we need this? Leaving for now. */
 		dw[i++] = preparser_disable(true);
-		i = emit_flush_invalidate(0, dw, i);
+		i = emit_flush_invalidate(dw, i);
 		dw[i++] = preparser_disable(false);
 	}
 
-- 
2.48.0

