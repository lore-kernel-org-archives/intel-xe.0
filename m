Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD22CC98306
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77E10E27F;
	Fri, 16 Jan 2026 22:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mA4hlV0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820DA10E277
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601868; x=1800137868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MX41m7uGdxtHXdS+qbm1GgtGN+p2a+83z7YktazPCnI=;
 b=mA4hlV0cxA2a89+WctSw7T4q31SCf9lDeeSWmKHYFIZUN3Q3LIurARqz
 UtL/3pX7GtyOXZ07VpsKO4mC8KeSBqR/GKdPvcs3plXXiUeAJeJqF8i/t
 6uStqrttUUwE4BsGC1LQx8W8gAFbcyNIPVUjSTJn55z199+k/3HovHL9a
 R5rqEnVcjffNcLfyl/m2Fog3U6FR/0b3wJGBiqgIGO1zH+ILnm0CZ/Fuh
 DoGnEjSIGf+jreBVhxzMG9zLnZP5pbXiDTeIpNcqtP7L0OlxfaQWmwzyR
 +LEP7BlfSTqxEWO4YPWmUhOB5DSopm9rhk28Ve9GVElhmXqEcb8I4rQ5y g==;
X-CSE-ConnectionGUID: FgJ+0fy6QrSje0xvF8cTYw==
X-CSE-MsgGUID: Mbui6CmzT52qGUF2BB6WVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123355"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123355"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:46 -0800
X-CSE-ConnectionGUID: +ONygvxnRLO+meft4P6bZg==
X-CSE-MsgGUID: A6Vj/oWdQxObNgSSZYQ9Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962711"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 07/11] drm/xe: Rename send_tlb_inval_ppgtt to
 send_tlb_inval_asid_ppgtt
Date: Fri, 16 Jan 2026 14:17:27 -0800
Message-Id: <20260116221731.868657-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116221731.868657-1-matthew.brost@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
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

Context-based TLB invalidations have their own set of GuC TLB
invalidation operations. Rename the current PPGTT invalidation function,
which operates on ASIDs, to a more descriptive name that reflects its
purpose.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Tested-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 43f6dbcb2bc2..a6a1c371a28e 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -150,9 +150,9 @@ static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
  */
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
-static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-				u64 start, u64 end, u32 asid,
-				struct drm_suballoc *prl_sa)
+static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+				     u64 start, u64 end, u32 asid,
+				     struct drm_suballoc *prl_sa)
 {
 #define MAX_TLB_INVALIDATION_LEN	7
 	struct xe_guc *guc = tlb_inval->private;
@@ -219,7 +219,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
-	.ppgtt = send_tlb_inval_ppgtt,
+	.ppgtt = send_tlb_inval_asid_ppgtt,
 	.initialized = tlb_inval_initialized,
 	.flush = tlb_inval_flush,
 	.timeout_delay = tlb_inval_timeout_delay,
-- 
2.34.1

