Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244EAC2BB3F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 03:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDC610E246;
	Thu, 16 Nov 2023 03:34:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ED910E121
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700105684; x=1731641684;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RcZ1Inp6op5gBiMMz8hBFyKEVqzo8Isi2qaT5+iw+/k=;
 b=VrNX03lBBNiyQp965y31fNf9h3M5KgttfquCDlOjNSazkj1SrF3pyZOH
 ZFU0gXvWQexaqeBX2/nuYd8oEF3H5Kd16+wIhqo8NGFfxMZrvWNgOAvlU
 RR5KJgUYA0qSVmccS6dt2dBtGX0GMVPm7LMLC4CjuVPYxrlVgBFRBVBQN
 /hPNP97ecr2CN/SikwoEHGmWcDYDiyDxITGDtYuNU6Ad9QifmP4T7yjXL
 RRCupIDdU5goCwO8LWdS0+5DkW3c3Fzph2cq0TX8MI8z5wgXGcnrNrweJ
 wKMWV9cbT24AiU3TFAKTk3HoqjKNRqM2CskmKhu0sgnXZDx06j9DRnvLG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9648710"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="9648710"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="831129662"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="831129662"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:34:41 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 19:34:36 -0800
Message-Id: <20231116033436.1713-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231116033436.1713-1-niranjana.vishwanathapura@intel.com>
References: <20231116033436.1713-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe/pvc: Avoid any races around ccs_mode
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
 drivers/gpu/drm/xe/xe_device.c       |  9 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_gt_sysfs.c     | 10 ++++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1202f8007f79..792465f178fe 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -73,6 +73,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	mutex_init(&xef->exec_queue.lock);
 	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
 
+	spin_lock(&xe->clients.lock);
+	xe->clients.count++;
+	spin_unlock(&xe->clients.lock);
+
 	file->driver_priv = xef;
 	return 0;
 }
@@ -105,6 +109,10 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
+	spin_lock(&xe->clients.lock);
+	xe->clients.count--;
+	spin_unlock(&xe->clients.lock);
+
 	xe_drm_client_put(xef->client);
 	kfree(xef);
 }
@@ -228,6 +236,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.force_execlist = force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
+	spin_lock_init(&xe->clients.lock);
 
 	init_waitqueue_head(&xe->ufence_wq);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index be11cadccbd4..3d92cd5d1237 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -297,6 +297,15 @@ struct xe_device {
 		struct ttm_resource_manager sys_mgr;
 	} mem;
 
+	/** @clients: drm clients info */
+	struct {
+		/** @lock: Protects drm clients info */
+		spinlock_t lock;
+
+		/** @count: number of drm clients */
+		u64 count;
+	} clients;
+
 	/** @usm: unified memory state */
 	struct {
 		/** @asid: convert a ASID to VM */
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 36f7bd34bc78..6fca6bdeb902 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -48,6 +48,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	       const char *buff, size_t count)
 {
 	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 num_engines, num_slices;
 	int ret;
 
@@ -66,12 +67,21 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
+	/* CCS mode can only be updated when there are no drm clients */
+	spin_lock(&xe->clients.lock);
+	if (xe->clients.count) {
+		spin_unlock(&xe->clients.lock);
+		return -EBUSY;
+	}
+
 	if (gt->ccs_mode.num_engines != num_engines) {
 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 		gt->ccs_mode.num_engines = num_engines;
 		xe_gt_reset_async(gt);
 	}
 
+	spin_unlock(&xe->clients.lock);
+
 	return count;
 }
 
-- 
2.21.0.rc0.32.g243a4c7e27

