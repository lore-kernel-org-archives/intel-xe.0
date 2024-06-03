Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3D4C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 08:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656AD10E301;
	Mon,  3 Jun 2024 08:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c58VkR4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1FC10E2F7
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717401991; x=1748937991;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=jevApkO8FCf8ziIlHY59r3N+qr/IsCLvsHwBH/K+iwI=;
 b=c58VkR4gA+v+xjv3HaTfjyWQHH3YTjR+d+tfSlsFgXOQdHIEdrxdclGi
 8y1SUWSwfOlncUALVYW13pbQte+Ue93Gno4lpv4B1V0fyopCatBgKaNie
 gi6Ul6gxt8/XFQrcu07jPGItuhbJenVsoI4voOxGp207LJ1Sbog7odpyV
 F+kGZgvjL2MDC1CpZTdU7PEdJYclDBZWvIdAtX4zQkbE4IXkd4qdg52z+
 7QV8PdpLPDVUxb8/KoAUfl4xPqWjyfDke2f4y95eg8ROIjTjpyd96a1JU
 d6d1jj12gZRyb1FZ62DnNBnWvqHMuH2PVkCTJzPvtHSo1N1cqKyQWJgfK w==;
X-CSE-ConnectionGUID: Pzl2XM7URLaFhbipWE+HeA==
X-CSE-MsgGUID: PLM24HvBR/6mt1DJMtLiCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14107871"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="14107871"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:06:30 -0700
X-CSE-ConnectionGUID: pxWiRjBdQb+V9/rAZ+w9fQ==
X-CSE-MsgGUID: lqxOgXH/Qm+gKNFX/KJlYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36807317"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:06:29 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 03 Jun 2024 10:06:20 +0200
Subject: [PATCH] drm/xe: use non-posted writes for user fence signalling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-fix_user_fence_posted-v1-1-61c76ef69cea@intel.com>
X-B4-Tracking: v=1; b=H4sIAHt5XWYC/x2M0QrCMAwAf2Xk2UKtWtFfESldmrk82JVkymDs3
 xd9PLi7FZSESeHerSD0ZeWpGhwPHeCY64scF2MIPpx99Cc38JI+FqWBKlJqk85UHOZLxOsNfYw
 BrG1CJv6/j6dxn5VcL7ni+LsVebuZG2zbDniq5TqBAAAA
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3633;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=jevApkO8FCf8ziIlHY59r3N+qr/IsCLvsHwBH/K+iwI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmXXmEL+SBp4PC3HsEG2A3eeIg8DcsFToE4xiE13Sd
 FPUqSemJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZl15hAAKCRAjYrKT3hD919gXDA
 CYE02GyG8RkHYwH2OKYqllMk3NDAT5rkd0BloXsNYE74GiNKDHIoVWn7DF/8DtlXUWG9heBsl2AkWz
 rqzjvAUd976XIPSPAYu2wBo8S0yaQ8ikbpnBd5NjdYMIvGxsSS091v2Dtlffaj/8NoC8zO8jm6Cwgr
 r+TlSyGu2fsSd+N0jj81R2SPoMAPyRZFBp8E4xueRjH9xW7VrXgE6Fsxo3SL9HnmTIukyMg8reZGIU
 ci1CKuZgeHFvSxEiZRQN9os1NqPk+yEbzV63SOL2TVE5FZBM86a9vo3nzOtPn5C6oM9/zHuyTmtN6/
 9KjLW0HCnr2o12SL+W+UYIX95S0j9/TNokBHZJvtgIh4i5tOd5krQVSLcb5k6U5KwkLbL/D4Dn04wt
 hYCkEwiLGsmNx7O4bbxYf4GeDbEY02nJIpjXDtCvymRogjKJuJ7up+yjnK/KZ8vj4kEfAdC3I1qx45
 qrwThjWEO9+UGdHtFO7t5izwiz4UzzNaqszN8ZG9nN4kE=
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

Moving flush before user fence signalling fixes issue with prior writes not
visible when fence is signalled. The change, however, should be also
accompanied with updating signalling to non-posted write, there is no
need for flush, as writes are coherent with CPU cache.

Fixes: 38007fa96419 ("drm/xe: flush gtt before signalling user fence on all engines")
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c                 | 23 +++++++++++------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c74ceb550dce..0712a8dee0e2 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -35,6 +35,7 @@
 
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
+#define   MI_SDI_FORCE_WRITE_COMPLETION	REG_BIT(10)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
 #define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
 #define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 2a607c141d65..00b2cbc15284 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -149,10 +149,9 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_SCRATCH_ADDR, 0);
 }
 
-static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
-				       u32 *dw, int i)
+static int emit_store_imm_ppgtt(u64 addr, u64 value, u32 flags, u32 *dw, int i)
 {
-	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
+	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1) | flags;
 	dw[i++] = lower_32_bits(addr);
 	dw[i++] = upper_32_bits(addr);
 	dw[i++] = lower_32_bits(value);
@@ -237,9 +236,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
 
 	if (job->user_fence.used)
-		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
-						job->user_fence.value,
-						dw, i);
+		i = emit_store_imm_ppgtt(job->user_fence.addr,
+					 job->user_fence.value,
+					 MI_SDI_FORCE_WRITE_COMPLETION, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
@@ -296,9 +295,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
 
 	if (job->user_fence.used)
-		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
-						job->user_fence.value,
-						dw, i);
+		i = emit_store_imm_ppgtt(job->user_fence.addr,
+					 job->user_fence.value,
+					 MI_SDI_FORCE_WRITE_COMPLETION, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
@@ -341,9 +340,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	i = emit_render_cache_flush(job, dw, i);
 
 	if (job->user_fence.used)
-		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
-						job->user_fence.value,
-						dw, i);
+		i = emit_store_imm_ppgtt(job->user_fence.addr,
+					 job->user_fence.value,
+					 0, dw, i);
 
 	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
 

---
base-commit: fe3d637a9c72b22297da0c731fa5e217bd182d2d
change-id: 20240603-fix_user_fence_posted-ca56c79c0662

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

