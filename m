Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DE6CD3440
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5004510EC75;
	Tue,  5 May 2026 23:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wma/zl2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ED710E4C5
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024658; x=1809560658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7eGWP45OJ49NjTj4LiFlsvTbfpxc4LfwO/JOIojed4o=;
 b=Wma/zl2l4N5XWbj0jaWtG9KJBJFZJkekQgEHoX5h2Lpo8xRtOuNjJJCK
 JXT877+avvqHFcHDeZTBagA1ydQfNezPYFajxtwRn1AQzu9Cha7TD90vn
 GPUs2RNXrgatwIIUuVQoW0CxjV3FixF0btBxrRgEVHltf7foz7Y9fABmg
 nbzYBsNKObdKxeUZgVz4zsCGt5K+AB6BaIGZUBi5n+Kqcychdx3vApwGp
 4xSHElX8OlPfql0xf+beF+mqCRUJaRGByYJQ4eRWayJSksD4RUV8CCCh+
 r+HYQ/NPx2guZZmFqhR696jhRYuE2bLF/wIrvm2JpAUrd5nImcuqbcAOn g==;
X-CSE-ConnectionGUID: 9U9Bv6HDQQqjCAevZiaG4g==
X-CSE-MsgGUID: fwcpJB5RQjuzZZn03xqqlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771102"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771102"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:17 -0700
X-CSE-ConnectionGUID: hXH2BX+RRJ2EbbBoOVsSOA==
X-CSE-MsgGUID: tI7jS17XTqGl9FQjfp4l0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569063"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 11/11] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP
 register
Date: Tue,  5 May 2026 16:44:20 -0700
Message-ID: <20260505234408.3552147-24-umesh.nerlige.ramappa@intel.com>
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

In a multi-queue use case, when a job is running on the secondary queue,
the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
the QUEUE TIMESTAMP to check how long the job ran. For user space to see
the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
register.

Compute PR: https://github.com/intel/compute-runtime/pull/923

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Whitelist QUEUE_TIMESTAMP only for copy and compute engines (Niranjana)
v3: (Niranjana)
- s/multiq/multi_queue/
- Base the condition on multi_queue_engine_class_mask
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 8cc313182968..6f96bf84df66 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -9,6 +9,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_gt_printk.h"
 #include "xe_platform_types.h"
@@ -33,6 +34,13 @@ static bool match_has_mert(const struct xe_device *xe,
 	return xe_device_has_mert((struct xe_device *)xe);
 }
 
+static bool match_multi_queue_class(const struct xe_device *xe,
+				    const struct xe_gt *gt,
+				    const struct xe_hw_engine *hwe)
+{
+	return xe_gt_hwe_class_supports_multi_queue(gt, hwe->class);
+}
+
 static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
@@ -54,6 +62,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multi_queue_class)),
+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 	{ XE_RTP_NAME("16014440446"),
 	  XE_RTP_RULES(PLATFORM(PVC)),
 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
-- 
2.51.0

