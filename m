Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DB6CF9C5C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Sep 2024 01:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB1F10E124;
	Sat, 21 Sep 2024 01:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/KbCvwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6568810E124
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Sep 2024 01:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726881370; x=1758417370;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eD7luO2Mszvl4Vs+7Gr/ISQwcvHNInLxbPPZVmOFOsA=;
 b=Q/KbCvwU6Ww0DxM5Ya37uOUj75d9MGx7BuHuvigs2AXl61prORSS/Pxa
 GrVsaPQDXFysdWxD2TwNrng6cwt0ClQ9nB1WpAC5t82rgSObO56BiOMf9
 axakSDWSHIiwiZpB778sfQjD9A1G9f1+BlomKCAo886ZDIJ/WrBJ8tNOc
 9ypLpQvndj6M7I+X2qb7tnoKVQhuxObjbca1kbKzrTlycSAMt1Jedrw9z
 lRWmjvtszzGBG6bnzprF6YIFEc3yX2sJB7xiBaXsan+bikHYdlyHUWVnA
 vnET3j7xP1qn/HDZanmiVCMSFVpStKUqjkFWOCSm5OAm8MViHdaSZ+OFT g==;
X-CSE-ConnectionGUID: BbKezFAWRWOJmuXCWQBEXQ==
X-CSE-MsgGUID: hyfPYVltRbeuCVX8FZfqNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="43422213"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="43422213"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 18:16:10 -0700
X-CSE-ConnectionGUID: Xv2IqYs2S7q4S/i7s9ROKw==
X-CSE-MsgGUID: nN+I0wLQSI2P4tpy3faLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="101206559"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 18:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Clean up VM / exec queue file lock usage.
Date: Fri, 20 Sep 2024 18:17:12 -0700
Message-Id: <20240921011712.2681510-1-matthew.brost@intel.com>
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

Both the VM / exec queue file lock protect the lookup and reference to
the object, nothing more. These locks are not intended anything else
underneath them. XA have their own locking too, so no need to take the
VM / exec queue file lock aside from when doing a lookup and reference
get.

Add some kernel doc to make this clear and cleanup a few typos too.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 --
 drivers/gpu/drm/xe/xe_device_types.h | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_drm_client.c   |  9 ++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c   |  2 --
 drivers/gpu/drm/xe/xe_vm.c           |  4 ----
 5 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cb5a9fd820cf..53dcece40fc5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -171,10 +171,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
-	mutex_lock(&xef->vm.lock);
 	xa_for_each(&xef->vm.xa, idx, vm)
 		xe_vm_close_and_put(vm);
-	mutex_unlock(&xef->vm.lock);
 
 	xe_file_put(xef);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5ad96d283a71..484fb34dde98 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -593,15 +593,23 @@ struct xe_file {
 	struct {
 		/** @vm.xe: xarray to store VMs */
 		struct xarray xa;
-		/** @vm.lock: protects file VM state */
+		/**
+		 * @vm.lock: Protects VM lookup + reference and removal a from
+		 * file xarray. Not an intended to be an outer lock which does
+		 * thing while being held.
+		 */
 		struct mutex lock;
 	} vm;
 
 	/** @exec_queue: Submission exec queue state for file */
 	struct {
-		/** @exec_queue.xe: xarray to store engines */
+		/** @exec_queue.xa: xarray to store exece queues */
 		struct xarray xa;
-		/** @exec_queue.lock: protects file engine state */
+		/**
+		 * @exec_queue.lock: Protects exec queue lookup + reference and
+		 * removal a frommfile xarray. Not an intended to be an outer
+		 * lock which does thing while being held.
+		 */
 		struct mutex lock;
 	} exec_queue;
 
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index c4add8b38bbd..fb52a23e28f8 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -283,8 +283,15 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
-	xa_for_each(&xef->exec_queue.xa, i, q)
+	xa_for_each(&xef->exec_queue.xa, i, q) {
+		xe_exec_queue_get(q);
+		mutex_unlock(&xef->exec_queue.lock);
+
 		xe_exec_queue_update_run_ticks(q);
+
+		mutex_lock(&xef->exec_queue.lock);
+		xe_exec_queue_put(q);
+	}
 	mutex_unlock(&xef->exec_queue.lock);
 
 	/* Get the total GPU cycles */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7f28b7fc68d5..7743ebdcbf4b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -635,9 +635,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	mutex_lock(&xef->exec_queue.lock);
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
-	mutex_unlock(&xef->exec_queue.lock);
 	if (err)
 		goto kill_exec_queue;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a3d7cb7cfd22..31fe31db3fdc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1765,9 +1765,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	mutex_lock(&xef->vm.lock);
 	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
-	mutex_unlock(&xef->vm.lock);
 	if (err)
 		goto err_close_and_put;
 
@@ -1799,9 +1797,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	return 0;
 
 err_free_id:
-	mutex_lock(&xef->vm.lock);
 	xa_erase(&xef->vm.xa, id);
-	mutex_unlock(&xef->vm.lock);
 err_close_and_put:
 	xe_vm_close_and_put(vm);
 
-- 
2.34.1

