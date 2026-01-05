Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8029BC2A062
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F26F10E1FF;
	Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7mRXvFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9162710E232
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AVSfLy3O3noTjD7xjdz5GvNWdJGuKpXkiT86mIKH570=;
 b=T7mRXvFkP2uNYcUrD9uMSmmTUNJqVvuyCJMdexzCtb9yzZAM3rh/Ry6k
 hd6XJGxvSuOtogUBtmQr3Ht1BhtDBFHIHYV7U06ZCJjBoFdJ6bv+6Oblq
 RP9ry/lrrCC9FlR30Y9MeX/QJjtMwGLbg5CAMjkPlVac+3O7erqmzrMb8
 9DiN61eynRVoEMuSkkh86gSszYb8VMvOXGAbimlh3jTk8z0E+GEHvMgEE
 cx3PprKBiXcky4HfsujK+FeHXzbWMo3c/RD7Sxa9cWU2BDxn9p5Y1v5PR
 L66xbVUAyHYQYX+L63TtV/Vfr/gAcaO0FolfLZdBxJ/yk1CZnHyyGo+us g==;
X-CSE-ConnectionGUID: d3AlCnrHTEaq8w9hhuTiVA==
X-CSE-MsgGUID: rH0ymKNtRM6lsgehQOS5Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856260"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856260"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: m3Fd/xckQkmDkd0Avy9tHw==
X-CSE-MsgGUID: K13Xf/SWREK3hdNs+SofRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060666"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 08/22] drm/xe: Initialize deadline manager on exec queues
Date: Sun,  4 Jan 2026 20:02:23 -0800
Message-Id: <20260105040237.1307873-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Initialize a per-exec-queue deadline manager to allow deadlines to be
associated with exported scheduler fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index a9b981591773..30c2e5ce83ec 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -14,6 +14,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_bo.h"
+#include "xe_deadline_mgr.h"
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
@@ -266,6 +267,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 		}
 	}
 
+	/*
+	 * Must be done after extension processing so the deadline manager can
+	 * detect whether the queue is supported.
+	 */
+	xe_deadline_mgr_init(&q->deadline_mgr, q);
+
 	return q;
 }
 
@@ -332,6 +339,7 @@ static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
 
+	xe_deadline_mgr_fini(&q->deadline_mgr);
 	q->ops->fini(q);
 
 	for (i = 0; i < q->width; ++i)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ac860f3f042e..3366f10108a3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/gpu_scheduler.h>
 
+#include "xe_deadline_mgr_types.h"
 #include "xe_gpu_scheduler_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
@@ -220,6 +221,9 @@ struct xe_exec_queue {
 		struct list_head link;
 	} pxp;
 
+	/** @deadline_mgr: Deadline manager */
+	struct xe_deadline_mgr deadline_mgr;
+
 	/** @ufence_syncobj: User fence syncobj */
 	struct drm_syncobj *ufence_syncobj;
 
-- 
2.34.1

