Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB305C54E5D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 01:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA93E10EDE7;
	Wed, 13 Mar 2024 01:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRNaBeDX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F9010EDE7
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 01:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710294642; x=1741830642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+src8m3DJgv8oJ4NUKwzKA6ijsjKwRZnyvucbvGUXdg=;
 b=JRNaBeDXvjVrNk2sF5Th0g0Kg9Tnq+DvABUOSQu/2NXp+Wdja4NBhQBx
 3bqsoPUmIXnpAztiG9Hpinl0BesCh/wy0OtBEw5YdLcNYJzFTLKlVRVDD
 RhL/huoroWfMk7xl/SeBuH9yfmXAWGAsuIzTAnrKH22hdsZl51tHSUSEe
 gtN/fU+p7d03B90FD1aU/uv4Hr8ytgjJ1vayY0Coocl4v1PtwK2R+Vlyl
 k20Ms9EwjsbPMwJ0DkUShXxDETHytwd0Ulx3Y8hOLuBUk3fGL9kAFerva
 wx82MC0ibsSB5VD/YVbLS58jUq+Pquc/uEeR9ONd6xv75Y7CgdSyjYj91 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4905682"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4905682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 18:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11783817"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by orviesa009.jf.intel.com with ESMTP; 12 Mar 2024 18:50:41 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, De@freedesktop.org,
	Marchi@freedesktop.org, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/xe_tracer: Align fence output format in ftrace log
Date: Wed, 13 Mar 2024 01:49:15 +0000
Message-Id: <20240313014915.1400077-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

The fence print in xe_gt_tlb_invalidation_fence and xe_hw_fence
is with "%p", change fence print in xe_sched_job to "%p" also.
Add the "0x" prefix as the "%p" is with hex format.

Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 4ddc55527f9a..9214c6add766 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -36,7 +36,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			   __entry->seqno = fence->seqno;
 			   ),
 
-		    TP_printk("fence=%p, seqno=%d",
+		    TP_printk("fence=0x%p, seqno=%d",
 			      __entry->fence, __entry->seqno)
 );
 
@@ -258,7 +258,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			     __field(u32, guc_state)
 			     __field(u32, flags)
 			     __field(int, error)
-			     __field(u64, fence)
+			     __field(struct dma_fence *, fence)
 			     __field(u64, batch_addr)
 			     ),
 
@@ -269,11 +269,11 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   atomic_read(&job->q->guc->state);
 			   __entry->flags = job->q->flags;
 			   __entry->error = job->fence->error;
-			   __entry->fence = (unsigned long)job->fence;
+			   __entry->fence = job->fence;
 			   __entry->batch_addr = (u64)job->batch_addr[0];
 			   ),
 
-		    TP_printk("fence=0x%016llx, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
+		    TP_printk("fence=0x%p, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
 			      __entry->fence, __entry->seqno, __entry->guc_id,
 			      __entry->batch_addr, __entry->guc_state,
 			      __entry->flags, __entry->error)
@@ -359,7 +359,7 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 			   __entry->fence = fence;
 			   ),
 
-		    TP_printk("ctx=0x%016llx, fence=%p, seqno=%u",
+		    TP_printk("ctx=0x%016llx, fence=0x%p, seqno=%u",
 			      __entry->ctx, __entry->fence, __entry->seqno)
 );
 
-- 
2.25.1

