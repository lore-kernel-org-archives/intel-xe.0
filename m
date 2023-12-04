Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9807C10F05
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 05:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D5A10E194;
	Mon,  4 Dec 2023 05:37:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5751F10E2C0
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 05:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701668234; x=1733204234;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8O6NPPYYnQ6FpuKAz7D+GQggCBpjrBDZBykGsribIMw=;
 b=BixrTKP2npi2eIqZdX19PeCb/pgcPcj8De6ty9xqEX3of8+UIIX3Yclu
 a96eGiPt0rCRjJ0O+FEhPCodnvgJCBZvR9Oq2ex9dEQo/ih3NaqZxMs8A
 UWfhi/FNQHWJGKl79Bq5A4MbS0cJZ10sxkrWQnGHqjx0DBAaF8OWcpCHy
 1/g/AJxqknABA2YzyDax7T5V8P9m5RjkYlqzUuTn8jZhWvH8uVl2qgxq7
 dsGFPONzXz1wPUWZw+Q1CtHcPq4e3qrjq6A1KShjg2yVK2rSgezZbUOLj
 53nVmbleQv9G7mHlobNvv1kFee4JbvPkMumDAHWaakSy2vGx9BM7aUX6d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="397574069"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="397574069"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="914308805"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="914308805"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:37:12 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun,  3 Dec 2023 21:37:09 -0800
Message-Id: <20231204053709.30013-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
References: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] drm/xe: Avoid any races around ccs_mode
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

v2: Rebase

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  9 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 10 ++++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 785bf2e610b7..22574908ed4c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -72,6 +72,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	mutex_init(&xef->exec_queue.lock);
 	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
 
+	spin_lock(&xe->clients.lock);
+	xe->clients.count++;
+	spin_unlock(&xe->clients.lock);
+
 	file->driver_priv = xef;
 	return 0;
 }
@@ -104,6 +108,10 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
+	spin_lock(&xe->clients.lock);
+	xe->clients.count--;
+	spin_unlock(&xe->clients.lock);
+
 	xe_drm_client_put(xef->client);
 	kfree(xef);
 }
@@ -226,6 +234,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.force_execlist = xe_modparam.force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
+	spin_lock_init(&xe->clients.lock);
 
 	init_waitqueue_head(&xe->ufence_wq);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9a212dbdb8a4..58442da2f6c5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -310,6 +310,15 @@ struct xe_device {
 		enum xe_sriov_mode __mode;
 	} sriov;
 
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
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 723cf77c830a..529fc286cd06 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -105,6 +105,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	       const char *buff, size_t count)
 {
 	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 num_engines, num_slices;
 	int ret;
 
@@ -123,12 +124,21 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
+	/* CCS mode can only be updated when there are no drm clients */
+	spin_lock(&xe->clients.lock);
+	if (xe->clients.count) {
+		spin_unlock(&xe->clients.lock);
+		return -EBUSY;
+	}
+
 	if (gt->ccs_mode != num_engines) {
 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 		gt->ccs_mode = num_engines;
 		xe_gt_reset_async(gt);
 	}
 
+	spin_unlock(&xe->clients.lock);
+
 	return count;
 }
 
-- 
2.21.0.rc0.32.g243a4c7e27

