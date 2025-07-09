Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8686BC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 19:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8EF10E35B;
	Wed,  9 Jul 2025 19:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkHziA7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D7910E35B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752089029; x=1783625029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p1x3nBKee9QxVIfj4qs+kbjI3C/x7UKGr4wZjDt4Y3M=;
 b=jkHziA7SORpx7JW0IqDOKAOJsZib3/cQS/58/zyfKDkLGDi8bm+S3TDh
 I/8urBYPNVH6EqYwGHJ69RTlmNQP+uzxq2xpVCvOr9oga0LKKR9NwJROf
 K3/kw10AOy2gq/othk7uK9LcCukjn3wFxg/bnjOvUQ93DnKjr7O6jGml7
 YhqA331cANUODj8l3FjXeSorrePGWjIRzQxnHU0OR+turTVxg1ga1TVTU
 /mmqOE+9BN5Qdxu5BTKActsDklo64O7i/gRETbH3DewUw6P2H25FSD1/x
 txENyEjQs5VYxmN1wZbpqyiPmy4FFrnSo6RihGyVFrOm2Vvk+WXVu4MrN w==;
X-CSE-ConnectionGUID: to1fF94fS5C2mQGES4cGfQ==
X-CSE-MsgGUID: H4WjTdMPTq6z+VKUw7GoHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53575621"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="53575621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:23:49 -0700
X-CSE-ConnectionGUID: TUpeUtLJQYq3n54rBJdKKQ==
X-CSE-MsgGUID: p38wDxdvRTiit2vyesGK4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156585719"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:23:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Juston Li <justonli@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI] drm/xe/bo: add GPU memory trace points
Date: Wed,  9 Jul 2025 12:23:14 -0700
Message-ID: <20250709192313.479336-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.49.0
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

From: Juston Li <justonli@chromium.org>

Add TRACE_GPU_MEM tracepoints for tracking global GPU memory usage.

These are required by VSR on Android 12+ for reporting GPU driver memory
allocations.

v5:
 - Drop process_mem tracking
 - Set the gpu_id field to dev->primary->index (Lucas, Tvrtko)
 - Formatting cleanup under 80 columns

v3:
 - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
   per-driver Kconfig (Lucas)

v2:
 - Use u64 as preferred by checkpatch (Tvrtko)
 - Fix errors in comments/Kconfig description (Tvrtko)
 - drop redundant "CONFIG" in Kconfig

Signed-off-by: Juston Li <justonli@chromium.org>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f8470b22dc99..4e0355d0f406b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -19,6 +19,8 @@
 
 #include <kunit/static_stub.h>
 
+#include <trace/events/gpu_mem.h>
+
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -418,6 +420,19 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
 }
 
+static void update_global_total_pages(struct ttm_device *ttm_dev,
+				      long num_pages)
+{
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
+	u64 global_total_pages =
+		atomic64_add_return(num_pages, &xe->global_total_pages);
+
+	trace_gpu_mem_total(xe->drm.primary->index, 0,
+			    global_total_pages << PAGE_SHIFT);
+#endif
+}
+
 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 				       u32 page_flags)
 {
@@ -525,6 +540,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 	xe_tt->purgeable = false;
 	xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
+	update_global_total_pages(ttm_dev, tt->num_pages);
 
 	return 0;
 }
@@ -541,6 +557,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 
 	ttm_pool_free(&ttm_dev->pool, tt);
 	xe_ttm_tt_account_subtract(xe, tt);
+	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 78c4acafd268b..5b48b9604fc0d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -632,6 +632,14 @@ struct xe_device {
 		unsigned int fsb_freq, mem_freq, is_ddr3;
 	};
 #endif
+
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+	/**
+	 * @global_total_pages: global GPU page usage tracked for gpu_mem
+	 * tracepoints
+	 */
+	atomic64_t global_total_pages;
+#endif
 };
 
 /**
-- 
2.49.0

