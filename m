Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E616EC4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 00:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8169F10E436;
	Tue, 14 Nov 2023 00:46:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5363710E436
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 00:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699922771; x=1731458771;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v1OPRUEADR+55Rw/bCK9Err9A7/FAQhqMltRxVwMNpc=;
 b=lqmJJoSorf4cHWqTf39DpP1bE0RUpVHOtFMldj8D9cKsbo1oFRvib2gX
 4winEjWhTR67KQuUiaB0Ee0YUD4GsatTK+yVyUweaAj8RPbHjcweNhq2B
 awFwgMc/1miDHfK4f8wZiRDC//RyAPwJs4tvANfnbio1gPBmqfyX4uIKc
 cBwq3lCcFPYOKneGyLmDYkoJoaiMUVBrGZfaGt0JVYbWmZN3EAfogkSTy
 23MpJkWXWLt52Jcdbj1teZNZ0HljxEEDTj7mfY7hi7CFX2RqzEGpgG7Gy
 fddK13WjXiqBdBA19XMaXZrdUxhbVfU5jN7i9G+G2MXX8UQZaAOn+Y8N7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3621914"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3621914"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 16:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="740923721"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="740923721"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 16:46:10 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 16:46:04 -0800
Message-Id: <20231114004604.4439-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
References: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v3 2/2] drm/xe: Avoid any races around ccs_mode
 update
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

Ensure that there are no drm clients when changing CCS mode.
Allow exec_queue creation only with enabled CCS engines.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 9 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 9 +++++++++
 drivers/gpu/drm/xe/xe_gt_sysfs.c     | 9 +++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1202f8007f79..27e6f0bf423e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -73,6 +73,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	mutex_init(&xef->exec_queue.lock);
 	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
 
+	spin_lock(&xe->ccs_mode.lock);
+	xe->ccs_mode.num_drm_clients++;
+	spin_unlock(&xe->ccs_mode.lock);
+
 	file->driver_priv = xef;
 	return 0;
 }
@@ -105,6 +109,10 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
+	spin_lock(&xe->ccs_mode.lock);
+	xe->ccs_mode.num_drm_clients--;
+	spin_unlock(&xe->ccs_mode.lock);
+
 	xe_drm_client_put(xef->client);
 	kfree(xef);
 }
@@ -228,6 +236,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.force_execlist = force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
+	spin_lock_init(&xe->ccs_mode.lock);
 
 	init_waitqueue_head(&xe->ufence_wq);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index be11cadccbd4..3382281146aa 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -297,6 +297,15 @@ struct xe_device {
 		struct ttm_resource_manager sys_mgr;
 	} mem;
 
+	/** @ccs_mode: ccs mode */
+	struct {
+		/** @lock: Ensure there are no clients while setting ccs_mode */
+		spinlock_t lock;
+
+		/** @num_drm_clients: number of drm clients */
+		u64 num_drm_clients;
+	} ccs_mode;
+
 	/** @usm: unified memory state */
 	struct {
 		/** @asid: convert a ASID to VM */
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index e53221c2894f..c4779efd65b4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -48,6 +48,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	       const char *buff, size_t count)
 {
 	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 num_engines, num_slices;
 	int ret;
 
@@ -66,12 +67,20 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
+	spin_lock(&xe->ccs_mode.lock);
+	if (xe->ccs_mode.num_drm_clients) {
+		spin_unlock(&xe->ccs_mode.lock);
+		return -EBUSY;
+	}
+
 	if (gt->ccs.num_engines != num_engines) {
 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 		gt->ccs.num_engines = num_engines;
 		xe_gt_reset_async(gt);
 	}
 
+	spin_unlock(&xe->ccs_mode.lock);
+
 	return count;
 }
 
-- 
2.21.0.rc0.32.g243a4c7e27

