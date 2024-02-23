Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF8C5478C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 12:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67C210EBEE;
	Fri, 23 Feb 2024 12:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e76s85Eb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201A410EBEE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708691808; x=1740227808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9mzKP6nr1A9wPjiqeEInXUwNXBkqU1SUnZdvYW60k1w=;
 b=e76s85EbNc7irXlaJKebZCuOcpO47widixnYJElA2hUvemMm5yW6jRj3
 zhTZTSPfN+vCfqmzCuaBe+ccIgw7boMyjzhwR2xJnzHyJGO3d7sixcMpl
 hRvTzgtXLbVNp6FsOsUhAm1yvyDOmiKwWJCEgia+kVkew2tchsiFQcqWi
 yI0s/T0XlZnRbzzIAwtORjZSj+jijKjk2c2MP/SU6K3UYgNTXAGEtuKb3
 I6ghiTOqX+mM95z144yeqPepG9oRrp6ikPf/0oKqkC/OihKtcLRkXETPs
 Ka8gcHJ6MzJw8c+0liAsk4obmCfFtEWnaqgHlmZAHxgksQ25fTGRggm++ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="25477406"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="25477406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 04:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6299716"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 04:36:47 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe: Remove unused 'create' parameter from queue property
 logic
Date: Fri, 23 Feb 2024 13:23:11 +0100
Message-ID: <20240223122311.7238-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

The 'create' parameter in exec_queue_user_extensions was always true.
This commit removes the dead parameter and all the relevant dead code.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 56 +++++++++---------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4bb8f897bf15..969c82d20e79 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -31,7 +31,7 @@ enum xe_exec_queue_sched_prop {
 };
 
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 extensions, int ext_number, bool create);
+				      u64 extensions, int ext_number);
 
 static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 						   struct xe_vm *vm,
@@ -79,7 +79,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 		 * may set q->usm, must come before xe_lrc_init(),
 		 * may overwrite q->sched_props, must come before q->ops->init()
 		 */
-		err = exec_queue_user_extensions(xe, q, extensions, 0, true);
+		err = exec_queue_user_extensions(xe, q, extensions, 0);
 		if (err) {
 			kfree(q);
 			return ERR_PTR(err);
@@ -268,7 +268,7 @@ xe_exec_queue_device_get_max_priority(struct xe_device *xe)
 }
 
 static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q,
-				   u64 value, bool create)
+				   u64 value)
 {
 	if (XE_IOCTL_DBG(xe, value > XE_EXEC_QUEUE_PRIORITY_HIGH))
 		return -EINVAL;
@@ -276,9 +276,6 @@ static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q
 	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
 		return -EPERM;
 
-	if (!create)
-		return q->ops->set_priority(q, value);
-
 	q->sched_props.priority = value;
 	return 0;
 }
@@ -336,7 +333,7 @@ xe_exec_queue_get_prop_minmax(struct xe_hw_engine_class_intf *eclass,
 }
 
 static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *q,
-				    u64 value, bool create)
+				    u64 value)
 {
 	u32 min = 0, max = 0;
 
@@ -347,16 +344,12 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	    !xe_hw_engine_timeout_in_range(value, min, max))
 		return -EINVAL;
 
-	if (!create)
-		return q->ops->set_timeslice(q, value);
-
 	q->sched_props.timeslice_us = value;
 	return 0;
 }
 
 static int exec_queue_set_preemption_timeout(struct xe_device *xe,
-					     struct xe_exec_queue *q, u64 value,
-					     bool create)
+					     struct xe_exec_queue *q, u64 value)
 {
 	u32 min = 0, max = 0;
 
@@ -367,21 +360,15 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 	    !xe_hw_engine_timeout_in_range(value, min, max))
 		return -EINVAL;
 
-	if (!create)
-		return q->ops->set_preempt_timeout(q, value);
-
 	q->sched_props.preempt_timeout_us = value;
 	return 0;
 }
 
 static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 value, bool create)
+				      u64 value)
 {
 	u32 min = 0, max = 0;
 
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
 	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
 				      XE_EXEC_QUEUE_JOB_TIMEOUT, &min, &max);
 
@@ -395,11 +382,8 @@ static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue
 }
 
 static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 value, bool create)
+				      u64 value)
 {
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 		return -EINVAL;
 
@@ -409,11 +393,8 @@ static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue
 }
 
 static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue *q,
-				     u64 value, bool create)
+				     u64 value)
 {
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 		return -EINVAL;
 
@@ -423,11 +404,8 @@ static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue
 }
 
 static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_queue *q,
-					  u64 value, bool create)
+					  u64 value)
 {
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 		return -EINVAL;
 
@@ -441,7 +419,7 @@ static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_q
 
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
-					     u64 value, bool create);
+					     u64 value);
 
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
@@ -455,8 +433,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    struct xe_exec_queue *q,
-					    u64 extension,
-					    bool create)
+					    u64 extension)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
 	struct drm_xe_ext_set_property ext;
@@ -476,13 +453,12 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	if (!exec_queue_set_property_funcs[idx])
 		return -EINVAL;
 
-	return exec_queue_set_property_funcs[idx](xe, q, ext.value,  create);
+	return exec_queue_set_property_funcs[idx](xe, q, ext.value);
 }
 
 typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 					       struct xe_exec_queue *q,
-					       u64 extension,
-					       bool create);
+					       u64 extension);
 
 static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
@@ -490,7 +466,7 @@ static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
 
 #define MAX_USER_EXTENSIONS	16
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 extensions, int ext_number, bool create)
+				      u64 extensions, int ext_number)
 {
 	u64 __user *address = u64_to_user_ptr(extensions);
 	struct drm_xe_user_extension ext;
@@ -511,13 +487,13 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 
 	idx = array_index_nospec(ext.name,
 				 ARRAY_SIZE(exec_queue_user_extension_funcs));
-	err = exec_queue_user_extension_funcs[idx](xe, q, extensions, create);
+	err = exec_queue_user_extension_funcs[idx](xe, q, extensions);
 	if (XE_IOCTL_DBG(xe, err))
 		return err;
 
 	if (ext.next_extension)
 		return exec_queue_user_extensions(xe, q, ext.next_extension,
-					      ++ext_number, create);
+						  ++ext_number);
 
 	return 0;
 }
-- 
2.42.0

