Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D4DC27C53
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 07:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF9A10E705;
	Wed,  5 Jun 2024 07:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVdWwzrc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C0A10E6CB
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 07:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717572630; x=1749108630;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=9DfUDfn0PofNz1AxtC+rVu+mzcNyaXLm2jvh5vzwuO8=;
 b=EVdWwzrc3TIbZ1Kl7OilRikBEiGcHFNHgorVxoy66ygzuoxGpVYCVInA
 6jNT8qxtbkHZgqKPpm7Hg9BHjf3TN7mbH7OStBouw2/5jeqeMYTG8uxgs
 +B2HqmhLiEW4CEwyl9ImgAuU//GW7f5NFgGT8e7O6VvRIyszubaG+yBDN
 IazGXNTChKS/MKOt3octSMsKJCIllI8k7ijur+o49IfdcDrmQCEnPT67q
 RrOIRrM0y735entLqdTtx+blOQluqvCykBprEZFSsowJSWeHRhHMIYf+q
 ClRkT1dhj5VMyAY2qnh0Dm6fRQ1BQYY9qUZGclgjEwTUV5FN6g0YkiHsy A==;
X-CSE-ConnectionGUID: zpv1VvK+SR6mv2yVAnir7A==
X-CSE-MsgGUID: vfOh3E92Sty4SCZOkXlZpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24789021"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="24789021"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:30:05 -0700
X-CSE-ConnectionGUID: DblNQdCmQp6ekuvmZTYHmw==
X-CSE-MsgGUID: oYwfu4l8S3iLDYqaeioXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="42453200"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:30:03 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 05 Jun 2024 09:29:48 +0200
Subject: [PATCH v3 2/2] drm/xe: flush engine buffers before signalling user
 fence on all engines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240605-fix_user_fence_posted-v3-2-06e7932f784a@intel.com>
References: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
In-Reply-To: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2054;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=9DfUDfn0PofNz1AxtC+rVu+mzcNyaXLm2jvh5vzwuO8=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmYBP2aZgvGFfuWtX6cWyBu0TKVmDHtRJU+puRTDBU
 OS8FRPaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZmAT9gAKCRAjYrKT3hD912PGC/
 wJ+taeEqpPHTUeNY5Tcw37Gd2w0E68o7sgfd/u8ANvWOKhf1KHC/xrKQKacBkiuhOJakPMqXbzKzzI
 6Gjs2fhLXKqG2vHCFsMo92pM8MqFMvTcHMJsgco3zkz0jTfD5uILyrETPCIkPRA54Zq8SI97UuF34w
 mWqjv52Xt2KaWFECGqNmvGa/Hjy1GSzehA/G1IBhD+I3UGn0BEY6HGjeCsqJuOb8mryifAkggqpSpx
 xrZzKY6K+ZJ1WEc57rySQaoxonTiJ71nYneQwMwcamBKRg2DJVhk7N9tZ8vpP+zJ7tZiM6Vko420Ig
 RSOndkEgLjrlz8stc4gPpuQOH9nTR6fqdKowxXbSKx7bfjVKgp6ZF6nNa1yMfKYjWtwXEgFhB30erz
 eXjfZuFm+QXnCufMNRdfVU3nFAG+m6HY0EczKzvdPE8g1MPgYvquWkKQTlMs+OnERWcbR5WeLz219X
 xqOCo6soNy+X56ibu8FEJ3UK2xMxZAyGhukOZLgl3RRm8=
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
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

