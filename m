Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDBCC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF3B10E1E9;
	Fri, 21 Feb 2025 10:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ADG6WvE/";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C0510E1F8
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xgLR1TTRYZnSuoOyVusy5uyTuqvDytb+PJIlvw4Agv8=; b=ADG6WvE/oGuYbOr7ON+Spyxa38
 +agLKw+9cRjPOV4XH27iPfjNvP8GdfKlAhaUhCAXadGtosdFQtLWG0KMXbJ6g6x+I0aug9VYTu8di
 zttxybHywTcFoqAlK9K3RotBBUNp8IBJlwDc1mkxhXhx2hHhTdQR19AAXWUYQ6KBSdAvRSvohqEPa
 Tov/yzB6Cnuln4j71kWa4LaohtytBvt66GukK1PcukYxPfJeKmV7KqWqlpXK9iNuVc0VnI/muBKIc
 7EPW42SJXh3O2aIGco7xHDgs5jRE7/Q1TLJ3uRDudBUybWN2psinknLGzQ+CpfIzegke67Gfu+Yy4
 JB9fVRcg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tlQ6B-00G2ax-1U; Fri, 21 Feb 2025 11:17:40 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 02/12] drm/xe: Fix ring flush invalidation
Date: Fri, 21 Feb 2025 10:17:21 +0000
Message-ID: <20250221101736.78986-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
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
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 0c230ee53bba..a2d1fb8f0adf 100644
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
@@ -409,7 +406,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
 		/* XXX: Do we need this? Leaving for now. */
 		dw[i++] = preparser_disable(true);
-		i = emit_flush_invalidate(0, dw, i);
+		i = emit_flush_invalidate(dw, i);
 		dw[i++] = preparser_disable(false);
 	}
 
-- 
2.48.0

