Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8705CC87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 20:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4C110E716;
	Tue, 22 Jul 2025 20:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dkb5zBPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AAA10E714
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753215734; x=1784751734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MVmGXVahI7YltrfROl44vFwyMt/8TrbLhMVcUPs8DKw=;
 b=Dkb5zBPqZuH0beOwTvqCZ064uZ3aqxb1GpqYN2z2GpZ5dPsneZ7+GAsr
 XNE5hv858JUsE86jtd9mN1BkijH9VN2Wmpt7y9JamfVUmQigwBbKLa3NK
 RvwdKAcOrvI4F4YdqmIxu6riqy2EuV3p1uid0LdFH4TCsaLBvkQIXEe9F
 ImmneuQLdvIG3a4mqPPxZ1JsbHn3tLuOO+J3+qH1daZ1BKAZRbywLvhDT
 damSlpKrOfo/G/2dgkGJScM05ksivwfVxjsYNXI6QAF1IsswUkxlmssHK
 3N7w2YVnDS7VVJEjK4N4FQR+W9pKlPc3FVpMDs4P4MhR28CyykeFEsgS/ g==;
X-CSE-ConnectionGUID: VV8K69ktR2a4ilphny7d1w==
X-CSE-MsgGUID: d9MyJHKiR7CWQLBVHN6lJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="58098055"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="58098055"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:14 -0700
X-CSE-ConnectionGUID: Ab07E57nS3eBSrv2m3xGjw==
X-CSE-MsgGUID: z6CX9dDWSEypFTJRWqUEvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="182947271"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 7/7] drm/xe: Remove unused GT TLB invalidation trace points
Date: Tue, 22 Jul 2025 13:23:57 -0700
Message-Id: <20250722202357.3718853-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722202357.3718853-1-matthew.brost@intel.com>
References: <20250722202357.3718853-1-matthew.brost@intel.com>
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

Remove unused GT TLB invalidation trace points after converting to used
GT TLB invalidation jobs. The trace points removed were used during
early bring up of unstable driver, with a stable driver no need to
replace with new tracepoints.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index b4a3577df70c..21486a6f693a 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -45,22 +45,6 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			      __get_str(dev), __entry->fence, __entry->seqno)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(xe, fence)
-);
-
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence,
-	     xe_gt_tlb_invalidation_fence_work_func,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(xe, fence)
-);
-
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_cb,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(xe, fence)
-);
-
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
 	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
 	     TP_ARGS(xe, fence)
-- 
2.34.1

