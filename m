Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ABFCD3447
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409510F204;
	Thu,  7 May 2026 16:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HH8s0ob1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C9710F1F7
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170826; x=1809706826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ACwVSdC+vZfXIOg3Q9g35sSsGGwIIZNF7ofhwspkYb0=;
 b=HH8s0ob1tCn9Fl0FgUkPtsJXCSSs+CqtAUWue4bvkhQalgjkyGkI9JSd
 VCTfsSOBAbB8/4uch33QaTicaPm2fElAnJkmvAvKqZvD1vCnePaitVVJJ
 L4owrMiVZMMss/U4Zm/gd4fcQe7mtv4txVbWBewyIWgh+tDqcaFH6v9Bb
 7pfGMfhUAljEQiH/VqB+93RAU56QvW1zHusavcccpuzWaBFeV727aZiMR
 F7amrRl4Zyb7Nsa/YZcuO5G3n/7caMUpUvdXDfdEE756Nd6xhIlzGhr+e
 +yBNYycsitxWzRghRSRg77getK1LyjbWP2sxIjpWB24l7G988lBinHP9Y g==;
X-CSE-ConnectionGUID: naLe1DmDQd2gMHDsxeMzzw==
X-CSE-MsgGUID: futx/DouS6Oe7UmJfc1apw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063607"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063607"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: fCKMmCYyRT2mn3xDljVW0Q==
X-CSE-MsgGUID: VO3Fg7wyTNWXVbYYstLtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876587"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 09/11] drm/xe/multi_queue: Add trace event for the multi
 queue timestamp
Date: Thu,  7 May 2026 09:20:26 -0700
Message-ID: <20260507162016.3888309-22-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
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
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
v2:
- Split traces from original patch (Stuart)
- Print primary lrc in the trace (Niranjana)

v3:
- Include primary_lrc as well as lrc in the trace (Niranjana)

v4: (Niranjana)
- Drop pos from trace
- Drop ':' before the pointer value
---
 drivers/gpu/drm/xe/xe_lrc.c       |  2 ++
 drivers/gpu/drm/xe/xe_trace_lrc.h | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2e7316c2207b..a4292a11391d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2712,6 +2712,8 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 	*old_ts = lrc->queue_timestamp;
 	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
 
+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
+
 	return lrc->queue_timestamp;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
index d525cbee1e34..5c4cfa0c1fe9 100644
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
+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
+	    TP_ARGS(lrc, old),
+	    TP_STRUCT__entry(
+		     __field(struct xe_lrc *, lrc)
+		     __field(struct xe_lrc *, primary_lrc)
+		     __field(u64, old)
+		     __field(u64, new)
+		     __string(name, lrc->fence_ctx.name)
+		     __string(device_id, __dev_name_lrc(lrc))
+		     ),
+
+	    TP_fast_assign(
+		   __entry->lrc = lrc;
+		   __entry->primary_lrc = lrc->multi_queue.primary_lrc;
+		   __entry->old = old;
+		   __entry->new = lrc->queue_timestamp;
+		   __assign_str(name);
+		   __assign_str(device_id);
+		   ),
+	    TP_printk("lrc=%p primary_lrc=%p lrc->name=%s old=%llu new=%llu device_id:%s",
+		      __entry->lrc, __entry->primary_lrc, __get_str(name),
+		      __entry->old, __entry->new,
+		      __get_str(device_id))
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.51.0

