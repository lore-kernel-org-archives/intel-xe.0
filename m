Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15900C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 01:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE17010E4D0;
	Thu, 27 Jul 2023 01:40:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EB810E0B0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 01:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690422006; x=1721958006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mMzXeUrFZla0G1gDkreLIdNv7zicie2JChUdXyAaOns=;
 b=b45av9ekX+o2lFzFHe/Ksbr6pXiB0xluRd/5VRXpf1b3krjC7RZ+Up7i
 0XSTf5GJD3Mf/ewynw2vwsNzGP4xjte7Fmk+aNl8U+Wuvk9J2BUNPr2sQ
 Jdn0mj4XljqSnRv9eyZTOEjyU9eBOT7zHaPmxGygSTEoPsZ7mFKGGNg8L
 3wwEggxvnWKSxNVLvgc7VMlTryeCL56mfUKztekVP73WFE0HP488t6NEK
 0C/A4a95edw5DOchGEowsR5puUvF08/zVOPSuXNwc/IjTE+Clzc/O66O/
 dWaLhAKA6L1x+Hj1jbQXIOK2QZib0vSAPTtZv94t9xHWeQAaCqlFdwOZ6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371788086"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="371788086"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057459547"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="1057459547"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 18:39:56 -0700
Message-Id: <20230727013958.456502-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727013958.456502-1-matthew.brost@intel.com>
References: <20230727013958.456502-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] drm/xe: Allow num_binds == 0 in VM bind IOCTL
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

The idea being out-syncs can signal indicating all previous operations
on the bind queue are complete. An example use case of this would be
support for implementing vkQueueWaitForIdle easily.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 39 +++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3e420b2c12b4..874ef9afbecf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2717,7 +2717,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int i;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, !args->num_binds) ||
 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
 		return -EINVAL;
 
@@ -2855,7 +2854,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto put_engine;
 		}
 
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
 				 !!(e->flags & ENGINE_FLAG_VM_ASYNC))) {
 			err = -EINVAL;
 			goto put_engine;
@@ -2869,7 +2868,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (!args->engine_id) {
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
 				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
 			err = -EINVAL;
 			goto put_vm;
@@ -2885,17 +2884,20 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto release_vm_lock;
 	}
 
-	if (XE_IOCTL_DBG(xe, vm->ops_state.error && !reclaim)) {
+	if (XE_IOCTL_DBG(xe, args->num_binds &&
+			 vm->ops_state.error && !reclaim)) {
 		err = -EALREADY;
 		goto release_vm_lock;
 	}
 
-	if (XE_IOCTL_DBG(xe, !vm->ops_state.error && reclaim)) {
+	if (XE_IOCTL_DBG(xe, args->num_binds &&
+			 !vm->ops_state.error && reclaim)) {
 		err = -EINVAL;
 		goto release_vm_lock;
 	}
 
-	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
+	if (args->num_binds &&
+	    VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
 		if (XE_IOCTL_DBG(xe, args->num_syncs))
 			err = EINVAL;
 		if (XE_IOCTL_DBG(xe, !err && !vm->ops_state.error))
@@ -2931,16 +2933,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
-	if (!bos) {
-		err = -ENOMEM;
-		goto release_vm_lock;
-	}
+	if (args->num_binds) {
+		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
+		if (!bos) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 
-	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
-	if (!ops) {
-		err = -ENOMEM;
-		goto release_vm_lock;
+		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
+		if (!ops) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -2995,6 +2999,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_syncs;
 	}
 
+	if (!args->num_binds) {
+		err = -ENODATA;
+		goto free_syncs;
+	}
+
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
-- 
2.34.1

