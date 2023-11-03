Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B6EC0032E
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E12410EA09;
	Fri,  3 Nov 2023 14:36:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4DF10EA0F
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022164; x=1730558164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fUqAXCulNVdGBFi8D8YDiRKdNpGJQ7f1qKPO/eMKaH0=;
 b=mpefVQ+XBLfX1zkUZXx2UliavJHT5+yPZkFQekZTx3bXUjBnCIm2aDd3
 xkee0vEA4JOecEcgy3+G1fL69RduXuR9Nmdko3ojpB9ySmA+3ygoCycnS
 /3rNIYGMOnW9uMeuvZnuQ0auN/ImJRKgOjiABrObQgrrzpfWjythJrofo
 cI01h1dEX796PwBhjknt9j/i3GsfQ0TtRo8Gqz5gJNX6rCeV4cALAfMiW
 OuhEQQM9b2/8YJlitHt1Q/qQTA9w7dBCZun9bjCmlc2lzrWb/Z8vIsJ3A
 XqkptiO4RdV3sAv2BDi698FCpstE0Q5gbUVKrHyJY/hosNXBo8YzUoqsB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843539"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843539"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832551"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832551"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:00 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:49 +0000
Message-Id: <20231103143456.7-44-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 43/50] squash! drm/xe/uapi: Rename couple
 exec_queue items
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

(squash instead of the fixup so the commit message can be updated)

(new full commit message with new subject)

drm/xe/uapi: Exec queue documentation and variable renaming

Rename 'placement' to num_eng_per_bb and 'width' to num_bb_per_exec, and
give a graphical documentation to it.

Let's make it obvious and straight forward. Not only because it is important
to have variable names that are clear and descriptive, but also because
'placement' is now used in many terms around the memory_region selection
where the BO or the page table will live and 'width' is so generic and with
so many other common meaning in the graphics world.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 16 +++----
 include/uapi/drm/xe_drm.h          | 70 ++++++++++++++++++++++++++++--
 2 files changed, 74 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 15fe709384e7..e30363bb5152 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -513,7 +513,7 @@ find_hw_engine(struct xe_device *xe,
 
 static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 					struct drm_xe_engine_class_instance *eci,
-					u16 num_bb_per_exec, u16 num_dispositions)
+					u16 num_bb_per_exec, u16 num_eng_per_bb)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
@@ -521,7 +521,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 
 	if (XE_IOCTL_DBG(xe, num_bb_per_exec != 1))
 		return 0;
-	if (XE_IOCTL_DBG(xe, num_dispositions != 1))
+	if (XE_IOCTL_DBG(xe, num_eng_per_bb != 1))
 		return 0;
 	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
 		return 0;
@@ -542,9 +542,9 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
-				      u16 num_bb_per_exec, u16 num_dispositions)
+				      u16 num_bb_per_exec, u16 num_eng_per_bb)
 {
-	int len = num_bb_per_exec * num_dispositions;
+	int len = num_bb_per_exec * num_eng_per_bb;
 	int i, j, n;
 	u16 class;
 	u16 sched_group_id;
@@ -557,7 +557,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 	for (i = 0; i < num_bb_per_exec; ++i) {
 		u32 current_mask = 0;
 
-		for (j = 0; j < num_dispositions; ++j) {
+		for (j = 0; j < num_eng_per_bb; ++j) {
 			struct xe_hw_engine *hwe;
 
 			n = j * num_bb_per_exec + i;
@@ -614,7 +614,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	len = args->num_bb_per_exec * args->num_dispositions;
+	len = args->num_bb_per_exec * args->num_eng_per_bb;
 	if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
 		return -EINVAL;
 
@@ -640,7 +640,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			eci[0].sched_group_id = gt->info.id;
 			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
 								    args->num_bb_per_exec,
-								    args->num_dispositions);
+								    args->num_eng_per_bb);
 			if (XE_IOCTL_DBG(xe, !logical_mask))
 				return -EINVAL;
 
@@ -681,7 +681,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		gt = xe_device_get_gt(xe, eci[0].sched_group_id);
 		logical_mask = calc_validate_logical_mask(xe, gt, eci,
 							  args->num_bb_per_exec,
-							  args->num_dispositions);
+							  args->num_eng_per_bb);
 		if (XE_IOCTL_DBG(xe, !logical_mask))
 			return -EINVAL;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c541efc80e5d..690d18e07650 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1012,6 +1012,68 @@ struct drm_xe_sync {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: Execution Queue
+ *
+ * The Execution Queue abstracts the Hardware Engine that is going to be used
+ * with the execution of the Batch Buffers in &DRM_IOCTL_XE_EXEC
+ *
+ * In a regular usage of this execution queue, only one hardware engine pointer
+ * would be given as input of the @instances below and both @num_bb_per_exec and
+ * @num_eng_per_bb would be set to '1'.
+ *
+ * Regular execution example::
+ *
+ *                    ┌─────┐
+ *                    │ BB0 │
+ *                    └──┬──┘
+ *                       │     @num_bb_per_exec = 1
+ *                       │     @num_eng_per_bb = 1
+ *                       │     @instances = {Engine0}
+ *                       ▼
+ *                   ┌───────┐
+ *                   │Engine0│
+ *                   └───────┘
+ *
+ * However this execution queue is flexible to be used for parallel submission or
+ * for load balancing submission (a.k.a virtual load balancing).
+ *
+ * In a parallel submission, different batch buffers will be simultaneously
+ * dispatched to different engines listed in @instances, in a 1-1 relationship.
+ *
+ * Parallel execution example::
+ *
+ *               ┌─────┐   ┌─────┐
+ *               │ BB0 │   │ BB1 │
+ *               └──┬──┘   └──┬──┘
+ *                  │         │     @num_bb_per_exec = 2
+ *                  │         │     @num_eng_per_bb = 1
+ *                  │         │     @instances = {Engine0, Engine1}
+ *                  ▼         ▼
+ *              ┌───────┐ ┌───────┐
+ *              │Engine0│ │Engine1│
+ *              └───────┘ └───────┘
+ *
+ * On a load balancing submission, each batch buffer is virtually dispatched
+ * to all of the listed engine @instances. Then, underneath driver, firmware, or
+ * hardware can select the best available engine to actually run the job.
+ *
+ * Virtual Load Balancing example::
+ *
+ *                    ┌─────┐
+ *                    │ BB0 │
+ *                    └──┬──┘
+ *                       │      @num_bb_per_exec = 1
+ *                       │      @num_eng_per_bb = 2
+ *                       │      @instances = {Engine0, Engine1}
+ *                  ┌────┴────┐
+ *                  │         │
+ *                  ▼         ▼
+ *              ┌───────┐ ┌───────┐
+ *              │Engine0│ │Engine1│
+ *              └───────┘ └───────┘
+ */
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  */
@@ -1027,10 +1089,10 @@ struct drm_xe_exec_queue_create {
 	__u16 num_bb_per_exec;
 
 	/**
-	 * @num_dispositions: Indicates how the batch buffers will be
-	 * distributed to the hardware engines listed on @instance.
+	 * @num_eng_per_bb: Indicates how many possible engines are available
+	 * at @instances for the Xe to distribute the load.
 	 */
-	__u16 num_dispositions;
+	__u16 num_eng_per_bb;
 
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
@@ -1047,7 +1109,7 @@ struct drm_xe_exec_queue_create {
 	 *
 	 * Every engine in the array needs to have the same @sched_group_id
 	 *
-	 * length = num_bb_per_exec (i) * num_dispositions (j)
+	 * length = num_bb_per_exec (i) * num_eng_per_bb (j)
 	 * index = j + i * num_bb_per_exec
 	 */
 	__u64 instances;
-- 
2.34.1

