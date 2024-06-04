Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE780C27C50
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 09:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7057E10E252;
	Tue,  4 Jun 2024 09:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k37XX26Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A74610E252
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717493966; x=1749029966;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YwRgf0TDIJVkI7CySxXdrZJlc7UiJfQKk6JGsO9Arfo=;
 b=k37XX26Z9Lr2ZrPfQqnffynwV7ZrMTCcbAudRcF4dCwvdlNSulrhU5bE
 BNqcnrTitTjsUXPwOTMCgASQf3uHh7aK5+72wjF4gCZGtaqBGWZ1aIu/8
 Be8QF/AgoaWPhCxhf74cunoAD8gxVX/FwsdDQ6fxd6Ou2kvXsi0nb+TlT
 EaI3qKOAFyPA5ba3IFTObRPrXPKAHPqw/23ZXgWrNMG6zlg4mhQkzrJb9
 /VxdjjxxfSDa3GKNQ1MQhKQFoCkcq/XGRWWbo7rHfH9p4aW/AXFbAKsdL
 1fcB+sRRot8I5NfdDFqG7hdrEtb5XWBNISS2lZ/IlYN/pNWaeYWGIDGgL Q==;
X-CSE-ConnectionGUID: /H56dqfVRJixW91e0TOwSQ==
X-CSE-MsgGUID: KWSo3Z8/SQqmecXDA+B5NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14185557"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="14185557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 02:39:26 -0700
X-CSE-ConnectionGUID: Jv1/RvnMR3CNJZaVKLeD3w==
X-CSE-MsgGUID: h+0LAaD+Rf+UGDCagfsibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37764226"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 02:39:06 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 04 Jun 2024 11:38:52 +0200
Subject: [PATCH v2 2/2] drm/xe: flush engine buffers before signalling user
 fence on all engines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240604-fix_user_fence_posted-v2-2-9276ecef973a@intel.com>
References: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
In-Reply-To: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=YwRgf0TDIJVkI7CySxXdrZJlc7UiJfQKk6JGsO9Arfo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmXuC1iunIttrDgGZO4fcEmbhmupmd0TcAEZLPCEWU
 oXUG40KJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZl7gtQAKCRAjYrKT3hD91zgsDA
 C1Ll5lShjNKG5gMZW9yh3Sum5unDkYdsVJXbJH1t8wDrvr+lWMuNPurYvMHenDAWCTxiiwQY9aRKQt
 ZvbotW8QWA6AWs5YA6vCnewun7zaxyOFq0JGAQEAnynFdTCmOWAak+ALqS6c55hYmuaH0W0IYTImvH
 yxQNLgPS6vOTYJA1TgJrq2QHE1XfzXI16jKLokqGHxgKXIN6/dvNFlcsoJ6ZxF4BNDFqyZm6N/R5QF
 NBuFsTRRKiwGbXjOvz7rktO/VJsafuuDhA0bJCQ1BPzivfq+bmVap3+P6BulrgK3M8ywtn/K5zFBvI
 vrKqrSOSNOCZvr4DscIxQZU+gN+JJ70ld2aUXMySo9cdIxcS7+BWXMLvhtMO8T/XFi2gUPe4UsxRBS
 vd8S+aTwP2I//+v+/u/jLFg/Q8rh00GZERuYuplja1AR/Vec5mjiqevZxgYywGiFOSdoKw/e1PP6tY
 uemJrF4oGDS4YRDxz7nanlWZ0v3aX4xRtJIAVRe4VrFcQ=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Tests show that user fence signalling requires kind of write barrier,
otherwise not all writes performed by the workload will be available
to userspace. It is already done for render and compute, we need it
also for the rest: video, gsc, copy.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index b11b3cd16b5e..db630d27beba 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -80,6 +80,16 @@ static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
 	return i;
 }
 
+static int emit_flush_dw(u32 *dw, int i)
+{
+	dw[i++] = MI_FLUSH_DW | MI_FLUSH_IMM_DW;
+	dw[i++] = 0;
+	dw[i++] = 0;
+	dw[i++] = 0;
+
+	return i;
+}
+
 static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
 			       u32 *dw, int i)
 {
@@ -234,10 +244,12 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
-	if (job->user_fence.used)
+	if (job->user_fence.used) {
+		i = emit_flush_dw(dw, i);
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
 						job->user_fence.value,
 						dw, i);
+	}
 
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
 
@@ -293,10 +305,12 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
-	if (job->user_fence.used)
+	if (job->user_fence.used) {
+		i = emit_flush_dw(dw, i);
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
 						job->user_fence.value,
 						dw, i);
+	}
 
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
 

-- 
2.34.1

