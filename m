Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B660CF8841
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 10:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECDA89EB1;
	Thu, 20 Nov 2025 10:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/a/07ek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33B910E74E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763635493; x=1795171493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OWV+7rl+rAT3x2a1VpZhPw5H/26V4cNRsmS/Q4dbS8s=;
 b=J/a/07ekWZvikqnbQ+pOXs0GJ1E65E2gDjwFAnSRPALoNzAFmROfoz46
 apgUm8BgZY1gwWgk+PBGKvWTvyNjO3Owrj5UuPWm/AzfYxgLTgpRhc5oY
 x1jd7NtWkNtU8Rl3q8LFJfJ2UIBS+nYQx/lk/wDyDd+CT8UaXHiC+36cX
 qJprClvIlZfMvrEWVJYicizaFPRpQSsIviZ89W3cMLlKoB7ON/vq2xsxU
 WStdWZcSSy7C/yG1t0biYl983NbchHoiNUq284s+ESB9xVM+jVV2ttgVL
 nNkAmxOfliMSvRY4Yit4iTy93/pQrzu4ZcMf6aGsC/5eo8cuOmB4wxfPL g==;
X-CSE-ConnectionGUID: VqRLK3sHQ7K/aFwps0z0LA==
X-CSE-MsgGUID: S0oVFQZCTTWLyeTMACA4OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65737817"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65737817"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:44:53 -0800
X-CSE-ConnectionGUID: /XYN6bW3SlOQI1bpqkF75Q==
X-CSE-MsgGUID: qP4GqkPaQ1+INlf+cwCbhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="222262813"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.4])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:44:52 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/2] drm/xe/migrate: Add tracepoint during VRAM copy
Date: Thu, 20 Nov 2025 11:43:38 +0100
Message-ID: <20251120104436.1438720-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120104436.1438720-1-francois.dugast@intel.com>
References: <20251120104436.1438720-1-francois.dugast@intel.com>
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

Add a new tracepoint when migrating memory to/from VRAM.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c |  3 +++
 drivers/gpu/drm/xe/xe_trace.h   | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2184af413b91..d3e1b05c4600 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -35,6 +35,7 @@
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
+#include "xe_trace.h"
 #include "xe_trace_bo.h"
 #include "xe_validation.h"
 #include "xe_vm.h"
@@ -2079,6 +2080,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	unsigned long i, j;
 	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
+	trace_xe_migrate_vram(xe, len, vram_addr, dir);
+
 	if (!xe->info.has_mem_copy_instr &&
 	    drm_WARN_ON(&xe->drm,
 			(!IS_ALIGNED(len, pitch)) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 79a97b086cb2..965b334bf348 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -16,6 +16,7 @@
 #include "xe_gpu_scheduler_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
+#include "xe_migrate.h"
 #include "xe_sched_job.h"
 #include "xe_tlb_inval_types.h"
 #include "xe_vm.h"
@@ -464,6 +465,37 @@ TRACE_EVENT(xe_exec_queue_reach_max_job_count,
 		      __entry->class, __entry->logical_mask, __entry->guc_id)
 );
 
+DECLARE_EVENT_CLASS(xe_migrate,
+		    TP_PROTO(struct xe_device *xe, unsigned long len,
+			     u64 vram_addr, u8 dir),
+		    TP_ARGS(xe, len, vram_addr, dir),
+
+		    TP_STRUCT__entry(
+			    __string(dev, __dev_name_xe(xe))
+			    __field(u32, len)
+			    __field(u64, vram_addr)
+			    __field(u8, dir)
+			    ),
+
+		    TP_fast_assign(
+			    __assign_str(dev);
+			    __entry->len = len;
+			    __entry->vram_addr = vram_addr;
+			    __entry->dir = dir;
+			    ),
+
+		    TP_printk("dev=%s len=%x vram_addr=%llx dir=%s",
+			      __get_str(dev), __entry->len, __entry->vram_addr,
+			      __entry->dir == XE_MIGRATE_COPY_TO_VRAM ?
+			      "TO_VRAM" : "TO_SRAM")
+);
+
+DEFINE_EVENT(xe_migrate, xe_migrate_vram,
+	     TP_PROTO(struct xe_device *xe, unsigned long len, u64 vram_addr,
+		      u8 dir),
+	     TP_ARGS(xe, len, vram_addr, dir)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.43.0

