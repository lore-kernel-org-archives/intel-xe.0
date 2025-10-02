Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CDACAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D786210E861;
	Thu,  2 Oct 2025 23:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLeMcia+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4735010E858
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759446288; x=1790982288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=obcnOkVt8YfKUQ6jfa6NhTHp1SRP3yNF/b5fHuCQt+0=;
 b=WLeMcia+G7tWAG4r6/pXQh+8LnCNfju5ViDHSIZBrpCzCkIv08qk7o93
 Iq3gmBXIpWWJTRsGEGsbCThKX2Nd8a1AUk0420co20qVwrWLYz8FZEp6K
 YnRwMGaAU4AVCU2pWRd4BYqyDlhgkdqhAJmY7eS4Gf10rst459S4oBbgo
 pVD8jSmji9T/oIXbhbAV7Yzoml5CD8ruljcJaAZNJ56Aiwu9S8ZRkAU41
 NRUPPIblLEFtd55sdc89g2QOReJYZDPtf+aAt6KE2OCh5eb+drdk//7EX
 rkt5P7qGlH3Npo89AB1OdRB/uUaDfHnZcVOsuchJwqy0lFKHx1G5NCLeP Q==;
X-CSE-ConnectionGUID: rJazsqTaS1itOhxC7PdPSg==
X-CSE-MsgGUID: 1uwSyZESTDKGSXLXw+5+JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79165577"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79165577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:47 -0700
X-CSE-ConnectionGUID: v7Rv0+vwSAqZX8RrQXAUXg==
X-CSE-MsgGUID: Od8LteFySNKrdfz4KxRQLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179566716"
Received: from dut4351arlh.fm.intel.com ([10.105.10.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/7] drm/xe: Add additional trace points for LRCs
Date: Thu,  2 Oct 2025 23:04:38 +0000
Message-Id: <20251002230444.313505-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
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
index 47e9df775072..4c54f24b7a8f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1569,6 +1569,8 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 		return ERR_PTR(err);
 	}
 
+	trace_xe_lrc_create(lrc);
+
 	return lrc;
 }
 
@@ -1583,6 +1585,8 @@ void xe_lrc_destroy(struct kref *ref)
 {
 	struct xe_lrc *lrc = container_of(ref, struct xe_lrc, refcount);
 
+	trace_xe_lrc_destroy(lrc);
+
 	xe_lrc_finish(lrc);
 	kfree(lrc);
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..8deb43b86f19 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 
 #include "xe_lrc_types.h"
+#include "xe_trace_lrc.h"
 
 struct drm_printer;
 struct xe_bb;
@@ -59,6 +60,7 @@ void xe_lrc_destroy(struct kref *ref);
 static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
 {
 	kref_get(&lrc->refcount);
+	trace_xe_lrc_get(lrc);
 	return lrc;
 }
 
@@ -71,6 +73,7 @@ static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
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

