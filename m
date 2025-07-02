Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AE2C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2606D10E7B3;
	Wed,  2 Jul 2025 23:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWXaMS7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C5910E7B3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751499644; x=1783035644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V2+vdxM6sUqlDCh8Klonng1VGGYVIeHQwHc2NQWydF4=;
 b=LWXaMS7OOjxImK4YDrG1GjuGHlgIr4N4OatNcGAolwiqCFkLAOYV+26D
 +l02lJlqBWF2rpgWBNft/LKYI/JUCFQOOXp/YtRWbKkX8rlMFb/2fS/oz
 +QiUaijGYPQmf88Xp3zWgmAWjqXmTwuOS2Ykqsz3Zvauh7Ei3DRvO56hF
 YxiKDwWe3epG8zAFzjnVTEw6EW7abhw9ifScK8s58LQ8MasPfgSqtnyh5
 oUvsb0d03o5slulHnA3iRZkq5aNqTuShpHFmojt+AjTRFbvX4J7qP+rjy
 +dxYNm2CPf5BIZyz3m2eVDZJ1Fu7AwY95ed0nMEqKFGSx8ri2P6mjx5TK Q==;
X-CSE-ConnectionGUID: SKGZBNGwTimQrHntveIXwg==
X-CSE-MsgGUID: FDBFfVxVRE+sVJJvmS3fnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57489479"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57489479"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:42 -0700
X-CSE-ConnectionGUID: c+aVm76FRH2k10Zmark7hw==
X-CSE-MsgGUID: H93NJ7csREatVu8xP42r+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153624547"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 9/9] drm/xe: Remove unused GT TLB invalidation trace points
Date: Wed,  2 Jul 2025 16:42:22 -0700
Message-Id: <20250702234222.3278264-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702234222.3278264-1-matthew.brost@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
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
GT TLB invalidation jobs. Tracepoint removed were used during early
bring up of unstable driver, with a stable driver no need to replace
with new tracepoints.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
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

