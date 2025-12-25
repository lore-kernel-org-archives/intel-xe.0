Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28339E784B5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A172E113F77;
	Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRoMXPn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFB5112ACD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L29gEngRPV11ARAIUm1V2sDyklm7xNbCwfANsJciMoo=;
 b=WRoMXPn/1vH6TMCBqOvdIZFyhDehOJcG8SIrNUmPdm+QPazm/uVUIF5E
 2KG9ZmnPlJAT51R1i+6/qAuW4+7TdvhUvyguWYqqfUWr/MVUj0LEO45Vj
 1Yb5Oa3y8GsW3RZVi+NROB7e6UEiNjHQeL6+DX8MilAlzTchpZLjd9d7S
 piSAOIbS43Osft/ktulJvBK2PH5P6pqXb89YylFJChlEuvLLlGhiLOS10
 zcZ5VCZDcMdpCMKoa0w9gT7Lu4dz4FeSXobIR12uvey3kNxg2xcdRrFxI
 UaqiD7ORgPwb4U9AB7Nm9cfqnc0EF7vat1goIsoDD3RUmRs2zV85lFGMP w==;
X-CSE-ConnectionGUID: 2yY0IiowT9a597+kARf5eQ==
X-CSE-MsgGUID: ofWBt0l/T8K6ESl+5DfoKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866361"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: hJPopsTVT+WJLoKz4GgnQw==
X-CSE-MsgGUID: ZUvyXU5dTwSD+PTLI0KbWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629137"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 07/13] drm/xe: Add deadline manager to user exec queues
Date: Wed, 24 Dec 2025 17:17:28 -0800
Message-Id: <20251225011734.341683-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

User exec queues can set deadlines in exported scheduler fences.
Initialize the deadline manager to facilitate this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 4 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index a9b981591773..6015b2334a0f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -14,6 +14,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_bo.h"
+#include "xe_deadline_mgr.h"
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
@@ -266,6 +267,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 		}
 	}
 
+	xe_deadline_mgr_init(&q->deadline_mgr, q);
+
 	return q;
 }
 
@@ -332,6 +335,7 @@ static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
 
+	xe_deadline_mgr_fini(&q->deadline_mgr);
 	q->ops->fini(q);
 
 	for (i = 0; i < q->width; ++i)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ceb0dcea6dfc..318c577786f7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/gpu_scheduler.h>
 
+#include "xe_deadline_mgr_types.h"
 #include "xe_gpu_scheduler_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
@@ -219,6 +220,9 @@ struct xe_exec_queue {
 		struct list_head link;
 	} pxp;
 
+	/** @deadline_mgr: Deadline manager */
+	struct xe_deadline_mgr deadline_mgr;
+
 	/** @ufence_syncobj: User fence syncobj */
 	struct drm_syncobj *ufence_syncobj;
 
-- 
2.34.1

