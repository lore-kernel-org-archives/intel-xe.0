Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BC9C54E5D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 02:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE36F10F54C;
	Wed, 13 Mar 2024 02:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HisdO61M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7EB10F54C
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 02:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710298337; x=1741834337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sQW3XHRqmP3nmRttYeimUt57U5bwELxeExGj47du93o=;
 b=HisdO61Mm0UYGzePgP0IxMJ4HxfaEQn2LNVX9ULv8DXP8hP1jISDzlrV
 qdUxCVyxCxn7x7PgntIhJIUM7GLhdthkibcZD6n863GeVpI8DQ5zOH7ci
 wAO4avyFTZhIvaTG+GzphYoJ5A3ONf85ecpmYUyFjUYI9vaSmoBaei/wg
 HTi9guSC0me2Q7QkjUOlTdAIjPn+gjNnRAXLR+GFfer7i0ivJFHawmrHs
 cIQYG1VzrKXYV3VKSh1EAK4vcgxhr7aUaqI17Xa9gIfxlxLQVVuGb5aJa
 d/q9fsH//44fROPoIqTwAg2kE+CmZ0S9RD0DRwGrtglpc+7eNBuU1y8Dk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27516678"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="27516678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 19:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11828335"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2024 19:52:14 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/xe_tracer: Align fence output format in ftrace log
Date: Wed, 13 Mar 2024 02:50:52 +0000
Message-Id: <20240313025052.1410833-1-shuicheng.lin@intel.com>
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 4ddc55527f9a..2d3beaffc308 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
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
+		    TP_printk("fence=%p, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
 			      __entry->fence, __entry->seqno, __entry->guc_id,
 			      __entry->batch_addr, __entry->guc_state,
 			      __entry->flags, __entry->error)
-- 
2.25.1

