Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB8AC3ABA3
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 19:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9F510E0EF;
	Thu,  1 May 2025 19:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFOoUBhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AF010E0EF
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746126904; x=1777662904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=74sVn2in48o0vWLWH+wEXGq6+69ofWQONk3IrCka46Q=;
 b=hFOoUBhfh2tpzEfZdnWDO1Lojd8OzmuSXSyt7NLsoyqyPruZQuFfnrJR
 dDAc4SBwfxPSwAELlh238qtR6gR7thHLrKxH3/xiOyvPZg0MO6Zf0psfl
 B/pUDKM3iUUURwRZzcgqt2enamAMiM9lP5EzTS9hiGL5m9/BXArobJPck
 VN3PqPH0JnN5fLMFbVbibtI0w+gEpu6YLwg7bEtD1wvkVJ+o6jvv0WNAf
 B0KRipkPfLhr6CLfvDWAVVUgfm+6W16ycGES8qEnDfKBJC7BJTQe3Is94
 HQmnztYZYnnZepQU8IoI43BX2/0cai1v8+yyjhgSlKZqBhv38350tehAk Q==;
X-CSE-ConnectionGUID: m70L7fIjTquWhNUhB4ia0A==
X-CSE-MsgGUID: Udu0Ij2ZT82Dsny2aylaMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="46919676"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="46919676"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 12:15:03 -0700
X-CSE-ConnectionGUID: T163EED9Sd6GZVXH+Wz0Rg==
X-CSE-MsgGUID: zHs9IP8hTtG8MYhlsdKLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="134765424"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 12:15:02 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, matthew.brost@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe: Use copy_from_user() instead of __copy_from_user()
Date: Thu,  1 May 2025 12:14:45 -0700
Message-ID: <acabf20aa8621c7bc8de09b1bffb8d14b5376484.1746126614.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

copy_from_user() has more checks and is more safer than
__copy_from_user()

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 4 ++--
 drivers/gpu/drm/xe/xe_eu_stall.c   | 4 ++--
 drivers/gpu/drm/xe/xe_exec.c       | 4 ++--
 drivers/gpu/drm/xe/xe_exec_queue.c | 9 ++++-----
 drivers/gpu/drm/xe/xe_oa.c         | 6 +++---
 drivers/gpu/drm/xe/xe_vm.c         | 6 +++---
 6 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3a84a9d92c48..d99d91fe8aa9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2569,7 +2569,7 @@ static int gem_create_user_ext_set_property(struct xe_device *xe,
 	int err;
 	u32 idx;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
@@ -2606,7 +2606,7 @@ static int gem_create_user_extensions(struct xe_device *xe, struct xe_bo *bo,
 	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
 		return -E2BIG;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index e2bb156c71fb..96732613b4b7 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -283,7 +283,7 @@ static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension
 	int err;
 	u32 idx;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
@@ -313,7 +313,7 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
 	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
 		return -E2BIG;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index b75adfc99fb7..44364c042ad7 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -176,8 +176,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (xe_exec_queue_is_parallel(q)) {
-		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
-				       q->width);
+		err = copy_from_user(addresses, addresses_user, sizeof(u64) *
+				     q->width);
 		if (err) {
 			err = -EFAULT;
 			goto err_syncs;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 606922d9dd73..21d4ced31dd9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -479,7 +479,7 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	int err;
 	u32 idx;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
@@ -518,7 +518,7 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
 		return -E2BIG;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
@@ -618,9 +618,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
 		return -EINVAL;
 
-	err = __copy_from_user(eci, user_eci,
-			       sizeof(struct drm_xe_engine_class_instance) *
-			       len);
+	err = copy_from_user(eci, user_eci,
+			     sizeof(struct drm_xe_engine_class_instance) * len);
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 346f357b3d1f..fb842fa0552e 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1301,7 +1301,7 @@ static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user_extn_fr
 	int err;
 	u32 idx;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return -EFAULT;
 
@@ -1338,7 +1338,7 @@ static int xe_oa_user_extensions(struct xe_oa *oa, enum xe_oa_user_extn_from fro
 	if (XE_IOCTL_DBG(oa->xe, ext_number >= MAX_USER_EXTENSIONS))
 		return -E2BIG;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return -EFAULT;
 
@@ -2281,7 +2281,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 		return -EACCES;
 	}
 
-	err = __copy_from_user(&param, u64_to_user_ptr(data), sizeof(param));
+	err = copy_from_user(&param, u64_to_user_ptr(data), sizeof(param));
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80e56e232685..62fbc746c883 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3101,9 +3101,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		if (!*bind_ops)
 			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
 
-		err = __copy_from_user(*bind_ops, bind_user,
-				       sizeof(struct drm_xe_vm_bind_op) *
-				       args->num_binds);
+		err = copy_from_user(*bind_ops, bind_user,
+				     sizeof(struct drm_xe_vm_bind_op) *
+				     args->num_binds);
 		if (XE_IOCTL_DBG(xe, err)) {
 			err = -EFAULT;
 			goto free_bind_ops;
-- 
2.48.1

