Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C86CD343B
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17910EC72;
	Tue,  5 May 2026 23:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBNDxRh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F5E10E18F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024658; x=1809560658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Zx6VfKMGNQSCvkEzGAhl0pwtfuK/k8sEtQ3CrT0Vj8=;
 b=FBNDxRh9IIuLm1lgBNuLfxKLtA1tkZql3PFV99qz/pSerzENjIIIfV6n
 ukEJUqQvLbilVuPp6BrovfY/Ie/kfTqZqOGQFYFJbhkt2q3pCQ+seNNEB
 nVzr2ZiTfqRwELiHE3Iz5THR182iek+aChS4pgjcuA9Dw6cGJ4gTdY/Ow
 6Gae0Ilc9aSG69KUrf5f/rjV2ML9W3HtYmjwF6eyBj+3sY2mju9tYSBI3
 4BvcRU1IOwigr8jsw/hZ05JFrKq5DY71ocQHPrSzDkks3SPmQf5E1Y+Vc
 ftv5i0e/QcN74ncd5bs+hziptKSVzfh2bbcbhzakSuMkVBPQGAA4ejrYD Q==;
X-CSE-ConnectionGUID: osGD6CTkQ42FklkgoEKtnA==
X-CSE-MsgGUID: W7uFgk6mS1e2BeHcCWUEDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771100"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771100"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:17 -0700
X-CSE-ConnectionGUID: wdo+auvaTSe/Pm5RT6nbfA==
X-CSE-MsgGUID: SPR73Gr6RWS/A5HjuFeuuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569056"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 09/11] drm/xe/multi_queue: Add trace event for the multi
 queue timestamp
Date: Tue,  5 May 2026 16:44:18 -0700
Message-ID: <20260505234408.3552147-22-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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

Add a trace event for multi queue timestamp capture.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2:
- Split traces from original patch (Stuart)
- Print primary lrc in the trace (Niranjana)

v3:
- Include primary_lrc as well as lrc in the trace (Niranjana)
---
 drivers/gpu/drm/xe/xe_lrc.c       |  2 ++
 drivers/gpu/drm/xe/xe_trace_lrc.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 28060a3d4f11..ea65160a582a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2700,6 +2700,8 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 	*old_ts = lrc->queue_timestamp;
 	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
 
+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
+
 	return lrc->queue_timestamp;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
index d525cbee1e34..4f3c1a0de573 100644
--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_exec_queue_types.h"
 #include "xe_gt_types.h"
 #include "xe_lrc.h"
 #include "xe_lrc_types.h"
@@ -42,6 +43,34 @@ TRACE_EVENT(xe_lrc_update_timestamp,
 		      __get_str(device_id))
 );
 
+TRACE_EVENT(xe_lrc_update_queue_timestamp,
+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
+	    TP_ARGS(lrc, old),
+	    TP_STRUCT__entry(
+		     __field(struct xe_lrc *, lrc)
+		     __field(struct xe_lrc *, primary_lrc)
+		     __field(u8, pos)
+		     __field(u64, old)
+		     __field(u64, new)
+		     __string(name, lrc->fence_ctx.name)
+		     __string(device_id, __dev_name_lrc(lrc))
+		     ),
+
+	    TP_fast_assign(
+		   __entry->lrc = lrc;
+		   __entry->primary_lrc = lrc->multi_queue.primary_lrc;
+		   __entry->pos = lrc->multi_queue.pos;
+		   __entry->old = old;
+		   __entry->new = lrc->queue_timestamp;
+		   __assign_str(name);
+		   __assign_str(device_id);
+		   ),
+	    TP_printk("lrc=:%p primary_lrc:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
+		      __entry->lrc, __entry->primary_lrc, __entry->pos, __get_str(name),
+		      __entry->old, __entry->new,
+		      __get_str(device_id))
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.51.0

