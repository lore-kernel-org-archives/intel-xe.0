Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2FACD3436
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0262B10F65A;
	Sat,  2 May 2026 00:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNFi2gAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B202610E245
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683221; x=1809219221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQeK+XJfvooMkLrz9+FBqymxXizExVdbQFVoz3PCo20=;
 b=gNFi2gAisZF4X8z2OEPDqe/obxZT4UuagOFWXIwQuloK9B4LHCxfdg2F
 sav8PyZBLolcgbuZtMRMKuvQll//YzrznFGXSA6/v/lEPNNEqgxeI15ys
 vvbRLk/vP0yJeWYUJHCLBPY2kpKgg+pXnonaML6e7qXgjRPgTdY12XKhs
 eqy/pUuh4Ck7ySu/2SYBtOGrzucyS5lcX1NejEPl+ZC2JedSjEmgsItOV
 N9I/5qROUe7uNLGlLGbnf4AZGX8O4R1/UPnZ1VGr2vlWt6CwC5EwMpPYL
 DNBVer7A7prlqjOjyBMfk8niOE7n4qyZFi3DFD40vEJbc4JqpuxeWeqDP Q==;
X-CSE-ConnectionGUID: CwFDevj2Q42+1lN6LUtZvA==
X-CSE-MsgGUID: lf35P6cwQcKWQMdd1Aj2JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841562"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
X-CSE-ConnectionGUID: 66pR9ddxTJ+tqdmq3Ask7g==
X-CSE-MsgGUID: IjqH0tcrT5G/lwQoIywbmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510956"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 7/9] drm/xe/multi_queue: Add trace event for the multi
 queue timestamp
Date: Fri,  1 May 2026 17:53:40 -0700
Message-ID: <20260502005332.3135977-18-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_lrc.c       |  2 ++
 drivers/gpu/drm/xe/xe_trace_lrc.h | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 023202be5d52..6bd93803cb7f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2711,6 +2711,8 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 	*old_ts = lrc->queue_timestamp;
 	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
 
+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
+
 	return lrc->queue_timestamp;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
index d525cbee1e34..fdc77102fa77 100644
--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_exec_queue_types.h"
 #include "xe_gt_types.h"
 #include "xe_lrc.h"
 #include "xe_lrc_types.h"
@@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
 		      __get_str(device_id))
 );
 
+TRACE_EVENT(xe_lrc_update_queue_timestamp,
+           TP_PROTO(struct xe_lrc *lrc, uint64_t old),
+           TP_ARGS(lrc, old),
+           TP_STRUCT__entry(
+                    __field(struct xe_lrc *, lrc)
+                    __field(u8, pos)
+                    __field(u64, old)
+                    __field(u64, new)
+                    __string(name, lrc->fence_ctx.name)
+                    __string(device_id, __dev_name_lrc(lrc))
+           ),
+
+           TP_fast_assign(
+                  __entry->lrc = lrc->multi_queue.primary_lrc;
+                  __entry->pos = lrc->multi_queue.pos;
+                  __entry->old = old;
+                  __entry->new = lrc->queue_timestamp;
+                  __assign_str(name);
+                  __assign_str(device_id);
+                  ),
+           TP_printk("lrc=:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
+                     __entry->lrc, __entry->pos, __get_str(name),
+                     __entry->old, __entry->new,
+                     __get_str(device_id))
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.43.0

