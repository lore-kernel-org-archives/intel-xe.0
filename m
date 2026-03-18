Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2564FCD0BE
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A42910E6AE;
	Wed, 18 Mar 2026 07:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TU7Qugcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3735410E6A7
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817836; x=1805353836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0WWavA0X65XHa2OJpBvdu+8LDbSnuuL4GX3zgyEc1jY=;
 b=TU7Qugcl/Zx1thwgZVFnQeVaiuqx2OrEm+CU5vxTuunhFwqW3JfS6M2V
 zxX9mLkX8O92OgN9mSchAgVPPHOSwCGRdJaZeA+dg75YVgE0NyL519mGk
 2woVBwwh2UyVoYEFOfMmRFTSEcORXFyalcItffHhSQhLOqlSOq6toB4Fm
 Y0m4+6RWhhL18QptNz8fDdCTCCqrwfft8fVrP1Mc6s+Sq50PzVI8Q1/7w
 eCk9mKt2j3eblM/ItP9xl1zSG+z2szsV6ggUckYiASfMSxRKgQrpXjqZy
 Frr6lh66l5G2OMHwXps3NaDXPTbupOGxYa1Lr6vppjnn83Z39CFEjD4xl A==;
X-CSE-ConnectionGUID: v9s5DnsBQdiOFqntXwa6hA==
X-CSE-MsgGUID: 6wPuXl69Q2WQeZykBLDn2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764276"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764276"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:36 -0700
X-CSE-ConnectionGUID: yiTMpoWcQ9uiSG21as/chQ==
X-CSE-MsgGUID: G6uG2fYJRPKfLcubFSYcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424090"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 12/15] drm/xe/uapi: Add access counter parameter extension for
 exec queue
Date: Wed, 18 Mar 2026 13:14:53 +0530
Message-Id: <20260318074456.2839499-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Introduce DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension to allow
userspace to configure access counter notifications per exec queue.

The extension provides:
- trigger: Access counter trigger threshold
- notify: Access counter notify threshold
- granularity: Access counter granularity level

These parameters control hardware access counter behavior for memory
access pattern tracking and optimization hints. Userspace can configure
different thresholds per exec queue based on workload characteristics.

UAPI changes:
- Add drm_xe_exec_queue_set_acc_param structure
- Add DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension ID

KMD changes:
- Add exec_queue_user_ext_set_acc_param() handler
- Store parameters in xe_exec_queue.acc structure
- Register handler in extension function table

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 27 ++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  9 ++++++
 include/uapi/drm/xe_drm.h                | 39 ++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b287d0e0e60a..815e82011c6d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1080,6 +1080,32 @@ static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properti
 	return 0;
 }
 
+static int exec_queue_user_ext_set_acc_param(struct xe_device *xe,
+					     struct xe_exec_queue *q,
+					      u64 extension, u64 *properties)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_exec_queue_set_acc_param ext;
+	int err;
+
+	if (!xe->info.has_access_counter)
+		return -EINVAL;
+
+	err = copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad1 || ext.pad2))
+		return -EINVAL;
+
+	/* Store access counter parameters in exec queue */
+	q->acc.trigger = ext.trigger;
+	q->acc.notify = ext.notify;
+	q->acc.granularity = ext.granularity;
+
+	return 0;
+}
+
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    struct xe_exec_queue *q,
 					    u64 extension, u64 *properties)
@@ -1123,6 +1149,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 
 static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
+	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM] = exec_queue_user_ext_set_acc_param,
 };
 
 #define MAX_USER_EXTENSIONS	16
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 8ce78e0b1d50..3f10e3371e5a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -239,6 +239,15 @@ struct xe_exec_queue {
 
 	/** @replay_state: GPU hang replay state */
 	void *replay_state;
+	/** @acc: Access counter parameters */
+	struct {
+		/** @acc.trigger: Access counter trigger threshold */
+		u16 trigger;
+		/** @acc.notify: Access counter notify threshold */
+		u16 notify;
+		/** @acc.granularity: Access counter granularity */
+		u8 granularity;
+	} acc;
 
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f8b2afb20540..19447ba10b1d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1337,6 +1337,7 @@ struct drm_xe_vm_bind {
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
@@ -1377,6 +1378,44 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
+/** enum drm_xe_access_counter_granularity - Xe access counter granularity */
+enum drm_xe_access_counter_granularity {
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_128K,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_16M,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_64M,
+};
+
+/**
+ * struct drm_xe_exec_queue_set_acc_param - Access counter parameters extension
+ *
+ * Extension to configure access counter notifications for an exec queue.
+ * Used with DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM.
+ */
+struct drm_xe_exec_queue_set_acc_param {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @trigger: Access counter trigger threshold */
+	__u16 trigger;
+
+	/** @notify: Access counter notify threshold */
+	__u16 notify;
+
+	/** @granularity: granularity, enum @drm_xe_access_counter_granularity */
+	__u8 granularity;
+
+	/** @pad1: MBZ */
+	__u8 pad1;
+
+	/** @pad2: MBZ */
+	__u16 pad2;
+};
+
 /**
  * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
  */
-- 
2.34.1

