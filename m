Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0820D3E788
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C3810E6DF;
	Thu, 11 Dec 2025 01:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRuTXqEU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBF810E6C3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414978; x=1796950978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ER5vMbIiHkpA9uitgQCFiVywEi824f+t2EasdVM5dX8=;
 b=VRuTXqEU5yeIM+jaQ9qDCNHcAxmOurBTnK3KBIrcvIdX+TYnhNxNwPeQ
 7T3dXQN7FXGYks/T8F4Csvbu+bGiOgQRdZlNqOO3v/S5dM8ssKQ71xLgK
 sNnD8ej7+Jz1KjJZhRpue0bi1adujlbUcOGS3ulB17ld3tJcc9Qtyy+QG
 pOiCC0OdkyZNbRpsRPLm2BhrRqd6XI/XwoIbu4Ca6/DYlMW9KrBBmZdV3
 /TLXszAHxi+foo0KPbc6VMTpBgnKjKq47XMJi4o/5WN7NSrIh7X7IPuHY
 G9AO7+w5gna+SswJjK8lo/kUKTJXJDztjK1f29sjNNls7+X5h6KX0EySv Q==;
X-CSE-ConnectionGUID: U8EBD+ioSXCTFHqeFFSigg==
X-CSE-MsgGUID: HW+or/9mQfKk6HlaCL9WYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442864"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442864"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
X-CSE-ConnectionGUID: tt5jshLLQNOVh063sN6+tQ==
X-CSE-MsgGUID: 72fooZq+SKKJtmk38Rglfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664097"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 05/17] drm/xe/multi_queue: Handle invalid exec queue
 property setting
Date: Wed, 10 Dec 2025 17:02:53 -0800
Message-ID: <20251211010249.1647839-24-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

Only MULTI_QUEUE_PRIORITY property is valid for secondary queues of a
multi queue group. MULTI_QUEUE_PRIORITY only applies to multi queue group
queues. Detect invalid user queue property setting and return error.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 66 ++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index aa46d154d04a..d0082eb45a4a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -62,7 +62,7 @@ enum xe_exec_queue_sched_prop {
 };
 
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 extensions, int ext_number);
+				      u64 extensions);
 
 static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
 {
@@ -209,7 +209,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 		 * may set q->usm, must come before xe_lrc_create(),
 		 * may overwrite q->sched_props, must come before q->ops->init()
 		 */
-		err = exec_queue_user_extensions(xe, q, extensions, 0);
+		err = exec_queue_user_extensions(xe, q, extensions);
 		if (err) {
 			__xe_exec_queue_free(q);
 			return ERR_PTR(err);
@@ -790,9 +790,35 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 							exec_queue_set_multi_queue_priority,
 };
 
+static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
+{
+	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
+				  BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY);
+
+	/*
+	 * Only MULTI_QUEUE_PRIORITY property is valid for secondary queues of a
+	 * multi-queue group.
+	 */
+	if (xe_exec_queue_is_multi_queue_secondary(q) &&
+	    properties & ~secondary_queue_valid_props)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properties)
+{
+	/* MULTI_QUEUE_PRIORITY only applies to multi-queue group queues */
+	if ((properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY)) &&
+	    !(properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    struct xe_exec_queue *q,
-					    u64 extension)
+					    u64 extension, u64 *properties)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
 	struct drm_xe_ext_set_property ext;
@@ -818,20 +844,25 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	if (!exec_queue_set_property_funcs[idx])
 		return -EINVAL;
 
+	*properties |= BIT_ULL(idx);
+	err = exec_queue_user_ext_check(q, *properties);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
 	return exec_queue_set_property_funcs[idx](xe, q, ext.value);
 }
 
 typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 					       struct xe_exec_queue *q,
-					       u64 extension);
+					       u64 extension, u64 *properties);
 
 static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
 };
 
 #define MAX_USER_EXTENSIONS	16
-static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 extensions, int ext_number)
+static int __exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
+					u64 extensions, int ext_number, u64 *properties)
 {
 	u64 __user *address = u64_to_user_ptr(extensions);
 	struct drm_xe_user_extension ext;
@@ -852,13 +883,30 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 
 	idx = array_index_nospec(ext.name,
 				 ARRAY_SIZE(exec_queue_user_extension_funcs));
-	err = exec_queue_user_extension_funcs[idx](xe, q, extensions);
+	err = exec_queue_user_extension_funcs[idx](xe, q, extensions, properties);
 	if (XE_IOCTL_DBG(xe, err))
 		return err;
 
 	if (ext.next_extension)
-		return exec_queue_user_extensions(xe, q, ext.next_extension,
-						  ++ext_number);
+		return __exec_queue_user_extensions(xe, q, ext.next_extension,
+						    ++ext_number, properties);
+
+	return 0;
+}
+
+static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
+				      u64 extensions)
+{
+	u64 properties = 0;
+	int err;
+
+	err = __exec_queue_user_extensions(xe, q, extensions, 0, &properties);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
+	err = exec_queue_user_ext_check_final(q, properties);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
 
 	if (xe_exec_queue_is_multi_queue_primary(q)) {
 		err = xe_exec_queue_group_init(xe, q);
-- 
2.43.0

