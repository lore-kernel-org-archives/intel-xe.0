Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915ABC48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 14:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8FE10EA63;
	Thu, 22 Feb 2024 14:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjxfRLZb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563AD10EA5A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708612876; x=1740148876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8VUu9vpug1QzaQBS5KH8ZD4oU87swp6Y+fiMByZ8ztA=;
 b=EjxfRLZbVj31swt+q16+pgN0+6zQUV8sTwGygTQR/YCWE22SQZ7vXidy
 gieNK8IF4t363b7w0f2EthVYKJerhyPmAVu7ANHpbOjj12Sn5Et6Z9Qhj
 kNQ2SCJtiPL1XcKJJMlu639QBuuOaFcenCeNjWgu3VOw6PkTBMLbb+vP3
 G3/bHJ3KsmVXzZ3gMlJHjWbIKkXK0aPTmZqZQjXqMA2PCKb11ezLjhhs0
 ekfzAQJvRJMn95aAZFSTAZgn/3e7ezaLxIwAXZlrUGOHOG/Tt+1KIOwbw
 aTSCj3NztIZLWiSXmuWMgBJK8BJLGYUbgei2YhrKcgM4XIbYtTBqnogHa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2713477"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2713477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 06:41:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5715841"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 06:41:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Use pointers in trace events
Date: Thu, 22 Feb 2024 06:41:24 -0800
Message-ID: <20240222144125.2862546-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Commit a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
inadvertently reverted commit 8d038f49c1f3 ("drm/xe: Fix cast on trace
variable"), breaking the build on 32bits.

As noted by Ville, there's no point in converting the pointers to u64
and add casts everywhere. In fact, it's better to just use %p and let
the address be hashed. Convert all the cases in xe_trace.h to use
pointers.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 0cce98a6b14b7..3b97633d81d85 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -27,16 +27,16 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 		    TP_ARGS(fence),
 
 		    TP_STRUCT__entry(
-			     __field(u64, fence)
+			     __field(struct xe_gt_tlb_invalidation_fence *, fence)
 			     __field(int, seqno)
 			     ),
 
 		    TP_fast_assign(
-			   __entry->fence = (u64)fence;
+			   __entry->fence = fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
-		    TP_printk("fence=0x%016llx, seqno=%d",
+		    TP_printk("fence=%p, seqno=%d",
 			      __entry->fence, __entry->seqno)
 );
 
@@ -83,16 +83,16 @@ DECLARE_EVENT_CLASS(xe_bo,
 		    TP_STRUCT__entry(
 			     __field(size_t, size)
 			     __field(u32, flags)
-			     __field(u64, vm)
+			     __field(struct xe_vm *, vm)
 			     ),
 
 		    TP_fast_assign(
 			   __entry->size = bo->size;
 			   __entry->flags = bo->flags;
-			   __entry->vm = (unsigned long)bo->vm;
+			   __entry->vm = bo->vm;
 			   ),
 
-		    TP_printk("size=%zu, flags=0x%02x, vm=0x%016llx",
+		    TP_printk("size=%zu, flags=0x%02x, vm=%p",
 			      __entry->size, __entry->flags, __entry->vm)
 );
 
@@ -346,16 +346,16 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 		    TP_STRUCT__entry(
 			     __field(u64, ctx)
 			     __field(u32, seqno)
-			     __field(u64, fence)
+			     __field(struct xe_hw_fence *, fence)
 			     ),
 
 		    TP_fast_assign(
 			   __entry->ctx = fence->dma.context;
 			   __entry->seqno = fence->dma.seqno;
-			   __entry->fence = (unsigned long)fence;
+			   __entry->fence = fence;
 			   ),
 
-		    TP_printk("ctx=0x%016llx, fence=0x%016llx, seqno=%u",
+		    TP_printk("ctx=0x%016llx, fence=%p, seqno=%u",
 			      __entry->ctx, __entry->fence, __entry->seqno)
 );
 
@@ -384,7 +384,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 		    TP_ARGS(vma),
 
 		    TP_STRUCT__entry(
-			     __field(u64, vma)
+			     __field(struct xe_vma *, vma)
 			     __field(u32, asid)
 			     __field(u64, start)
 			     __field(u64, end)
@@ -392,14 +392,14 @@ DECLARE_EVENT_CLASS(xe_vma,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->vma = (unsigned long)vma;
+			   __entry->vma = vma;
 			   __entry->asid = xe_vma_vm(vma)->usm.asid;
 			   __entry->start = xe_vma_start(vma);
 			   __entry->end = xe_vma_end(vma) - 1;
 			   __entry->ptr = xe_vma_userptr(vma);
 			   ),
 
-		    TP_printk("vma=0x%016llx, asid=0x%05x, start=0x%012llx, end=0x%012llx, ptr=0x%012llx,",
+		    TP_printk("vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
 			      __entry->vma, __entry->asid, __entry->start,
 			      __entry->end, __entry->ptr)
 )
@@ -484,16 +484,16 @@ DECLARE_EVENT_CLASS(xe_vm,
 		    TP_ARGS(vm),
 
 		    TP_STRUCT__entry(
-			     __field(u64, vm)
+			     __field(struct xe_vm *, vm)
 			     __field(u32, asid)
 			     ),
 
 		    TP_fast_assign(
-			   __entry->vm = (unsigned long)vm;
+			   __entry->vm = vm;
 			   __entry->asid = vm->usm.asid;
 			   ),
 
-		    TP_printk("vm=0x%016llx, asid=0x%05x",  __entry->vm,
+		    TP_printk("vm=%p, asid=0x%05x",  __entry->vm,
 			      __entry->asid)
 );
 
-- 
2.43.0

