Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80EEC54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 19:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535F610ECAA;
	Fri, 23 Feb 2024 19:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5J5EgX4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D6610ECA9
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708717032; x=1740253032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A69252KFkwLpWIIKXxD5n6dZuDYUbjzj8L6P2gotpgA=;
 b=I5J5EgX4cyZKPQEcppp2htpZ4TDG3NHn/ufXY4Mlx7EjDVUdqHCygkDo
 xzbEWCrwrnzSFQ0EhuwuUQtD/2E4TF4HhUYtGHcfa/CW2km0biNqjl/A6
 wNvO7ZoiYBguryJCr1ims8S6rkXq8ilmqE6Kyd6vuwDfmSyX+NGedciNv
 8snnWdEWS2eDEUlfXDMRTQwaJk1KcjyHIKNy95cVwpdffaOl6ZGAtqkUY
 AhOlj+JfxQ+dAMZbsTYjRN9oAbQJbJ3q75avc3hZET7qdJzUcdvcm9856
 uvKAfZ7NsBlxvfDUi1xr4xbwmiMqA0eT6O3T+pN7w2+79FxQNMbxBcYbX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6866999"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6866999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 11:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6021882"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 11:37:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Use vmalloc for array of bind allocation in bind IOCTL
Date: Fri, 23 Feb 2024 11:37:19 -0800
Message-Id: <20240223193719.6495-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Use vmalloc in effort to allow a user pass in a large number of binds in
an IOCTL (mesa use case). Also use array allocations rather open coding
the size calculation.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e3bde897f6e8..45a12207ebf5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2778,8 +2778,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 __user *bind_user =
 			u64_to_user_ptr(args->vector_of_binds);
 
-		*bind_ops = kmalloc(sizeof(struct drm_xe_vm_bind_op) *
-				    args->num_binds, GFP_KERNEL);
+		*bind_ops = kvmalloc_array(args->num_binds,
+					   sizeof(struct drm_xe_vm_bind_op),
+					   GFP_KERNEL);
 		if (!*bind_ops)
 			return -ENOMEM;
 
@@ -2869,7 +2870,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 free_bind_ops:
 	if (args->num_binds > 1)
-		kfree(*bind_ops);
+		kvfree(*bind_ops);
 	return err;
 }
 
@@ -2957,13 +2958,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (args->num_binds) {
-		bos = kcalloc(args->num_binds, sizeof(*bos), GFP_KERNEL);
+		bos = kvcalloc(args->num_binds, sizeof(*bos), GFP_KERNEL);
 		if (!bos) {
 			err = -ENOMEM;
 			goto release_vm_lock;
 		}
 
-		ops = kcalloc(args->num_binds, sizeof(*ops), GFP_KERNEL);
+		ops = kvcalloc(args->num_binds, sizeof(*ops), GFP_KERNEL);
 		if (!ops) {
 			err = -ENOMEM;
 			goto release_vm_lock;
@@ -3104,10 +3105,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (i = 0; bos && i < args->num_binds; ++i)
 		xe_bo_put(bos[i]);
 
-	kfree(bos);
-	kfree(ops);
+	kvfree(bos);
+	kvfree(ops);
 	if (args->num_binds > 1)
-		kfree(bind_ops);
+		kvfree(bind_ops);
 
 	return err;
 
@@ -3131,10 +3132,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (q)
 		xe_exec_queue_put(q);
 free_objs:
-	kfree(bos);
-	kfree(ops);
+	kvfree(bos);
+	kvfree(ops);
 	if (args->num_binds > 1)
-		kfree(bind_ops);
+		kvfree(bind_ops);
 	return err;
 }
 
-- 
2.34.1

