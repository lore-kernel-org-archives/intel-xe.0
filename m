Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F25AC6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 02:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F4C10E42E;
	Thu, 23 Mar 2023 02:58:01 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB71B10E432
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 02:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679540278; x=1711076278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzF6CxdldV3B7/MOTdJ+zxq8TOjWC+w/ymq/Z6kiDXw=;
 b=LQSQIwaAt2LLxPpqert736UkS3AXhhnqXmW8CdiFC5kJQKOghQ/17IQK
 Enz3k0dGc9G9ldB7k1ykL7Xu+JVNGLOnQNbQnMQzCYd2r8A7oC3djOa+V
 vH/X2FE0+TShV7zQJuOtVD7lpSDXP+K97L+M7JyQFwyxrZxoec3ppfb+5
 D5qcjEYkWxTifmvwmRK2FbZsN2Dx8H/J8XBUtEvuij8Iw/fLc836Eo0p4
 h7gS7wcv72W1Qjn7aP52U1ySYFLtpPAHn8Yx9Q+Hkom8r9O42+22JAqiM
 V/y+4afxOOK5fRRMKWw3Lnu30ULOvjfLQKHu0JKEL7Bf6X1HQJEFSPrDo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338103033"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="338103033"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675538697"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="675538697"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:57:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 22 Mar 2023 19:58:00 -0700
Message-Id: <20230323025801.822678-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323025801.822678-1-matthew.brost@intel.com>
References: <20230323025801.822678-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v3 1/2] drm/xe/uapi: Use hw prefix for
 hardware engines
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

To make the difference clear between user engines (execution queue) and
hardware engines (physical part of GPU) prefix all hardware engine
references with 'hw'.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c          | 12 ++++++------
 drivers/gpu/drm/xe/xe_query.c           | 12 ++++++------
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  8 ++++----
 include/uapi/drm/xe_drm.h               |  8 ++++----
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index a4fc5afdf688..9834728bb305 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -401,7 +401,7 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
 
 static struct xe_hw_engine *
 find_hw_engine(struct xe_device *xe,
-	       struct drm_xe_engine_class_instance eci)
+	       struct drm_xe_hw_engine_class_instance eci)
 {
 	u32 idx;
 
@@ -420,7 +420,7 @@ find_hw_engine(struct xe_device *xe,
 }
 
 static u32 bind_engine_logical_mask(struct xe_device *xe, struct xe_gt *gt,
-				    struct drm_xe_engine_class_instance *eci,
+				    struct drm_xe_hw_engine_class_instance *eci,
 				    u16 width, u16 num_placements)
 {
 	struct xe_hw_engine *hwe;
@@ -449,7 +449,7 @@ static u32 bind_engine_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 }
 
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
-				      struct drm_xe_engine_class_instance *eci,
+				      struct drm_xe_hw_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
 {
 	int len = width * num_placements;
@@ -505,8 +505,8 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_engine_create *args = data;
-	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
-	struct drm_xe_engine_class_instance __user *user_eci =
+	struct drm_xe_hw_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
+	struct drm_xe_hw_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
 	struct xe_vm *vm, *migrate_vm;
@@ -525,7 +525,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	err = __copy_from_user(eci, user_eci,
-			       sizeof(struct drm_xe_engine_class_instance) *
+			       sizeof(struct drm_xe_hw_engine_class_instance) *
 			       len);
 	if (XE_IOCTL_ERR(xe, err))
 		return -EFAULT;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 0f70945176f6..fbba245f63c4 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -40,16 +40,16 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 			i++;
 		}
 
-	return i * sizeof(struct drm_xe_engine_class_instance);
+	return i * sizeof(struct drm_xe_hw_engine_class_instance);
 }
 
-static int query_engines(struct xe_device *xe,
-			 struct drm_xe_device_query *query)
+static int query_hw_engines(struct xe_device *xe,
+			    struct drm_xe_device_query *query)
 {
 	size_t size = calc_hw_engine_info_size(xe);
-	struct drm_xe_engine_class_instance __user *query_ptr =
+	struct drm_xe_hw_engine_class_instance __user *query_ptr =
 		u64_to_user_ptr(query->data);
-	struct drm_xe_engine_class_instance *hw_engine_info;
+	struct drm_xe_hw_engine_class_instance *hw_engine_info;
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	struct xe_gt *gt;
@@ -357,7 +357,7 @@ static int query_gt_topology(struct xe_device *xe,
 
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
-	query_engines,
+	query_hw_engines,
 	query_memory_usage,
 	query_config,
 	query_gts,
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 15c2e5aa08d2..98b1ffd4a53e 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -59,7 +59,7 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
 };
 
 static int check_hw_engines(struct xe_device *xe,
-			    struct drm_xe_engine_class_instance *eci,
+			    struct drm_xe_hw_engine_class_instance *eci,
 			    int num_engines)
 {
 	int i;
@@ -90,8 +90,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
 	struct drm_xe_wait_user_fence *args = data;
-	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
-	struct drm_xe_engine_class_instance __user *user_eci =
+	struct drm_xe_hw_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
+	struct drm_xe_hw_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
 	struct xe_vm *vm = NULL;
 	u64 addr = args->addr;
@@ -122,7 +122,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 	if (!no_engines) {
 		err = copy_from_user(eci, user_eci,
-				     sizeof(struct drm_xe_engine_class_instance) *
+				     sizeof(struct drm_xe_hw_engine_class_instance) *
 			     args->num_engines);
 		if (XE_IOCTL_ERR(xe, err))
 			return -EFAULT;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 661d7929210c..89596d353d3e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -136,7 +136,7 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
-struct drm_xe_engine_class_instance {
+struct drm_xe_hw_engine_class_instance {
 	__u16 engine_class;
 
 #define DRM_XE_ENGINE_CLASS_RENDER		0
@@ -236,7 +236,7 @@ struct drm_xe_device_query {
 	/** @query: The type of data to query */
 	__u32 query;
 
-#define DRM_XE_DEVICE_QUERY_ENGINES	0
+#define DRM_XE_DEVICE_QUERY_HW_ENGINES	0
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
 #define DRM_XE_DEVICE_QUERY_CONFIG	2
 #define DRM_XE_DEVICE_QUERY_GTS		3
@@ -559,7 +559,7 @@ struct drm_xe_engine_create {
 
 	/**
 	 * @instances: user pointer to a 2-d array of struct
-	 * drm_xe_engine_class_instance
+	 * drm_xe_hw_engine_class_instance
 	 *
 	 * length = width (i) * num_placements (j)
 	 * index = j + i * width
@@ -733,7 +733,7 @@ struct drm_xe_wait_user_fence {
 	 */
 	__u64 num_engines;
 	/**
-	 * @instances: user pointer to array of drm_xe_engine_class_instance to
+	 * @instances: user pointer to array of drm_xe_hw_engine_class_instance to
 	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
 	 */
 	__u64 instances;
-- 
2.34.1

