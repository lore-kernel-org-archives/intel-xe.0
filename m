Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CB5CCD19F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 21:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61CB10E52C;
	Mon, 20 Oct 2025 21:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9bK6QmA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04C210E52B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 21:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760996733; x=1792532733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tL64BQJ3gnuKfcXJLjCoDrEJ430riC/rIk1umwH1t5Q=;
 b=g9bK6QmARqGwrYocesLx8OQocQqmXA+G9tBD318wE9sCs2Ewg+8qzGMd
 5luJG370w6apFefbFYr9tXdDwCK9S6laquReJ1vKeJYNfoylyy5P14hq7
 59A5vDNaHVto2G/uYteepZqcDURKcbVJYhoHNHR+OVpEZwZvOEQv4ETDr
 NeHS7nzhWbi1my7BVWe8N0zf2zjpgP/n1pgis41ouPIG42bE9y0qCQ9mJ
 AM/UNHZxTUXwF8790zvrdrfgtxRNDIJHTDG7Xritt2VMi/tmEdkWMUpDi
 sOQeoqI/E2YzL6DCMOZ0elgO+GFVkdU7FoqD19/NSH6puKsu4i7+jMvIw Q==;
X-CSE-ConnectionGUID: C4VgddXwR8GlFt/5/n6maQ==
X-CSE-MsgGUID: A+HfxeeUTxiQooiIlWMqbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63160722"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63160722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:32 -0700
X-CSE-ConnectionGUID: DAxNViMXRGSy/HXGd04Hpw==
X-CSE-MsgGUID: +IjId761SYa9VIidv20l0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183451177"
Received: from dut4084arlh.fm.intel.com ([10.105.10.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:32 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/7] drm/xe: Add additional trace points for LRCs
Date: Mon, 20 Oct 2025 21:45:23 +0000
Message-Id: <20251020214529.354365-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020214529.354365-1-stuart.summers@intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
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

Add trace points to indicate when an LRC has been
created and destroyed or get and put.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       |  4 +++
 drivers/gpu/drm/xe/xe_lrc.h       |  3 +++
 drivers/gpu/drm/xe/xe_trace_lrc.h | 42 ++++++++++++++++++++++++++++++-
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b5083c99dd50..42d1c861fe18 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1575,6 +1575,8 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 		return ERR_PTR(err);
 	}
 
+	trace_xe_lrc_create(lrc);
+
 	return lrc;
 }
 
@@ -1589,6 +1591,8 @@ void xe_lrc_destroy(struct kref *ref)
 {
 	struct xe_lrc *lrc = container_of(ref, struct xe_lrc, refcount);
 
+	trace_xe_lrc_destroy(lrc);
+
 	xe_lrc_finish(lrc);
 	kfree(lrc);
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 2fb628da5c43..fd67810f9812 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 
 #include "xe_lrc_types.h"
+#include "xe_trace_lrc.h"
 
 struct drm_printer;
 struct xe_bb;
@@ -61,6 +62,7 @@ void xe_lrc_destroy(struct kref *ref);
 static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
 {
 	kref_get(&lrc->refcount);
+	trace_xe_lrc_get(lrc);
 	return lrc;
 }
 
@@ -73,6 +75,7 @@ static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
  */
 static inline void xe_lrc_put(struct xe_lrc *lrc)
 {
+	trace_xe_lrc_put(lrc);
 	kref_put(&lrc->refcount, xe_lrc_destroy);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
index d525cbee1e34..e8daa5d323e7 100644
--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
@@ -13,7 +13,6 @@
 #include <linux/types.h>
 
 #include "xe_gt_types.h"
-#include "xe_lrc.h"
 #include "xe_lrc_types.h"
 
 #define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)->fence_ctx.gt)->drm.dev)
@@ -42,6 +41,47 @@ TRACE_EVENT(xe_lrc_update_timestamp,
 		      __get_str(device_id))
 );
 
+DECLARE_EVENT_CLASS(xe_lrc,
+	    TP_PROTO(struct xe_lrc *lrc),
+	    TP_ARGS(lrc),
+
+	    TP_STRUCT__entry(
+		     __field(struct xe_lrc *, lrc)
+		     __string(name, lrc->fence_ctx.name)
+		     __string(device_id, __dev_name_lrc(lrc))
+	    ),
+
+	    TP_fast_assign(
+		   __entry->lrc	= lrc;
+		   __assign_str(name);
+		   __assign_str(device_id);
+		   ),
+
+	    TP_printk("lrc=:%p lrc->name=%s device_id:%s",
+		      __entry->lrc, __get_str(name),
+		      __get_str(device_id))
+);
+
+DEFINE_EVENT(xe_lrc, xe_lrc_create,
+	     TP_PROTO(struct xe_lrc *lrc),
+	     TP_ARGS(lrc)
+);
+
+DEFINE_EVENT(xe_lrc, xe_lrc_destroy,
+	     TP_PROTO(struct xe_lrc *lrc),
+	     TP_ARGS(lrc)
+);
+
+DEFINE_EVENT(xe_lrc, xe_lrc_get,
+	     TP_PROTO(struct xe_lrc *lrc),
+	     TP_ARGS(lrc)
+);
+
+DEFINE_EVENT(xe_lrc, xe_lrc_put,
+	     TP_PROTO(struct xe_lrc *lrc),
+	     TP_ARGS(lrc)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.34.1

