Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85125E92FDE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E75A10E0BB;
	Fri,  6 Oct 2023 10:00:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED8510E06B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586408; x=1728122408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PlnyHBjncXns8adRwcbF3XcDL7iGJXGMYQQOvkTxg/E=;
 b=aOliG7wyPwpWTbnpHmIj+zFOwkGoPNm9x1cqolFOMeVcJfrfvcoYKWL8
 NZjit/n4W6wqjhDAcK9xQh4pyJAMMgXKgQRyTbu0m81ZOgVuZ0XBSZzcy
 SeBkH0waZM+vVxIuHwN0J4AQpZ8KyWIZ2/oRG+V3VkmqgQ1Ju0Yh6ere6
 YpzPny53UVmpXp25+SRrPGGqDrPbkFZJ6684D/qF3HTm3yT7/rWHgQU1U
 twBvjkAm4cVBe1efEi56plgGxH+4Qwn2pkQpiQl7Tq3rZdatYztQuP4Io
 rr5EJvUwGQ0UhRsGVisU19NijMlrLg+sw6h2JckN0rVzhMIsn0+Xvr6Ir g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907172"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907172"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815887"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815887"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:06 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:33 +0000
Message-Id: <20231006095943.7-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 10/20] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE deprecated in a
previous patch, drop from uAPI. The property is just simply inherented
from the VM.

v2:
 - Update commit message (Niranjana)

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
 include/uapi/drm/xe_drm.h          | 19 ++++++-------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 170d9d9c48d2..f70332986c73 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -320,12 +320,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 	return q->ops->set_preempt_timeout(q, value);
 }
 
-static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
-				       u64 value, bool create)
-{
-	return 0;
-}
-
 static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 value, bool create)
 {
@@ -411,7 +405,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
-	[XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE] = exec_queue_set_compute_mode,
 	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
 	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ad21ba1d6e0b..2a9e04024723 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -781,21 +781,14 @@ struct drm_xe_exec_queue_set_property {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
 
-#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
+#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-	/*
-	 * Long running or ULLS engine mode. DMA fences not allowed in this
-	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
-	 * as a sanity check the UMD knows what it is doing. Can only be set at
-	 * engine create time.
-	 */
-#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
-#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
-#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
+#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
 	/** @property: property to set */
 	__u32 property;
 
-- 
2.34.1

