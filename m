Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEBFEE3F39
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 23:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F5610E0A7;
	Tue, 12 Sep 2023 23:52:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBBF10E09F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694562723; x=1726098723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XyLj7tw5lwo5WeAPmm4z8iVMwQL7CO33+C2qdt8pSuY=;
 b=WXSr3oE4tWSkbAC2xPFuU4tju8lG+G7nDjyDN4e48pF0tlEXafGL2hSI
 9rnnsBfKZg8Jsm8VdWrsyaxWuI3DUwPof2J0QkRH3mR858UPmu65fku8P
 GI+gKyKYyolPDhLhCoGaUZB9NQ6v4yBTjkfaDibaCHMO6c/ivizU6aOFV
 m0MYG2HhJF5M0P1WRygYfcS1N61YQIj+fiQUIo3k2BSa8S3XaB3VuGH4v
 hVlLhpcAI2rWnVSZ/DccjvP5jLXFjAU2XsxchckCUFj7PhKBUChEuWFwl
 3S7vCzjs5pliEA96Z6VHY2t0Jb3zcFFH/cU0W55bOmy/ncytOK+lWSs3i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381224954"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="381224954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 16:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720608409"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="720608409"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 16:51:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 12 Sep 2023 16:51:59 -0700
Message-Id: <20230912235159.2111118-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912235159.2111118-1-matthew.brost@intel.com>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Remove
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE deprecate in
previous patch, drop from uAPI.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
 include/uapi/drm/xe_drm.h          | 19 ++++++-------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ac392bcf7bc8..c0c0e799b278 100644
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
index 00d5cb4ef85e..8b05573cecfd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -707,21 +707,14 @@ struct drm_xe_exec_queue_set_property {
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

