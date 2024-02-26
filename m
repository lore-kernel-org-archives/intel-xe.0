Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA07C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 15:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F5410E78F;
	Mon, 26 Feb 2024 15:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5eRpJWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D42010E791
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708962943; x=1740498943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ghf2+FymL4AscVMiwUBh9lSi4QU8Ss0r5DPZL4WBxL4=;
 b=k5eRpJWjqAgT9fqErvuCZTgZ4QoRv5e1kjubkixB7F4wIiHO3cWmfTzw
 3v4065W7c7uuHLqtdzo4bguTJsrxeqLumUzlBCTRHN6H6wFaIR57piGJv
 nf7XtSOQVTQetDPhx5TvDT7a49cWVnyjlykor1c2Y0gz3xWHwHKdzKjXF
 37Z6TleFulK7uyFkHuF/InP04iqVIc3R69rrh/SfX/HXbH/v6lKrhYdTZ
 U/3hdY08IWEXpVrqCDoPReE9xAGqW4+0o3v/A4nseperr18oGI2Bio0Y5
 W6j68GBL3IY41dXfUgpZ8Zhob2evwyu+h2S/Lrd8CCukGPtX50J+Tpqll w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25722151"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="25722151"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 07:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11270774"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 07:55:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Use vmalloc for array of bind allocation in bind
 IOCTL
Date: Mon, 26 Feb 2024 07:55:54 -0800
Message-Id: <20240226155554.103384-1-matthew.brost@intel.com>
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

v2: Use __GFP_ACCOUNT for allocations (Thomas)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index db3f049a47dc..4154ef75e369 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2770,8 +2770,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 __user *bind_user =
 			u64_to_user_ptr(args->vector_of_binds);
 
-		*bind_ops = kmalloc(sizeof(struct drm_xe_vm_bind_op) *
-				    args->num_binds, GFP_KERNEL);
+		*bind_ops = kvmalloc_array(args->num_binds,
+					   sizeof(struct drm_xe_vm_bind_op),
+					   GFP_KERNEL | __GFP_ACCOUNT);
 		if (!*bind_ops)
 			return -ENOMEM;
 
@@ -2861,7 +2862,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 free_bind_ops:
 	if (args->num_binds > 1)
-		kfree(*bind_ops);
+		kvfree(*bind_ops);
 	return err;
 }
 
@@ -2949,13 +2950,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (args->num_binds) {
-		bos = kcalloc(args->num_binds, sizeof(*bos), GFP_KERNEL);
+		bos = kvcalloc(args->num_binds, sizeof(*bos),
+			       GFP_KERNEL | __GFP_ACCOUNT);
 		if (!bos) {
 			err = -ENOMEM;
 			goto release_vm_lock;
 		}
 
-		ops = kcalloc(args->num_binds, sizeof(*ops), GFP_KERNEL);
+		ops = kvcalloc(args->num_binds, sizeof(*ops),
+			       GFP_KERNEL | __GFP_ACCOUNT);
 		if (!ops) {
 			err = -ENOMEM;
 			goto release_vm_lock;
@@ -3096,10 +3099,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
 
@@ -3123,10 +3126,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

