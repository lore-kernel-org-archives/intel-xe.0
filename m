Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39161CED276
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 07:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531510E484;
	Tue,  8 Oct 2024 07:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAdferXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D0D10E484
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 07:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728373005; x=1759909005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOexN0AlLmKSx/1cy8pY/9UIBpSP5AlMe5/bg1Pc+mM=;
 b=cAdferXN4mEBeYGxI34fa6nKllYMtRANNnVIO1WUOIuQX9QP9Gh6mWJH
 Rhmmz1q5JCwXMHGlmST1UfKy8BF3mJRbjPyMCfkGZctX+mPVtJ9FQboOS
 yyxYSLMAIKcFGZdimxtLVa/+QCDXKSAMf9MdP1XkY+S6ZMgO/NCYTqIg4
 TiO0BSvqpo0BiHcj+If873v7+fqvhwh7b+Z0wWaZa2jfS3p7sNBzpeZv0
 ZsqBn0Ve1knRf73RzRX6sQko4UT2tR8UhuSKoIOXOoyGhqKhKWgi7qnDr
 KHaGjleu6FPrdzpE42M/oLlX0OY/1xF1cLlpMPZy+aFqdSrgAhgXSOLEp Q==;
X-CSE-ConnectionGUID: HO2lUagdQ0CwOegP3PHfYw==
X-CSE-MsgGUID: 2+Z0XpqHScCvnbXz7vaGFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38938145"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="38938145"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:36:45 -0700
X-CSE-ConnectionGUID: +Do9ZKFkSGqofo6zJa563Q==
X-CSE-MsgGUID: gOkCGgYUTpSgewIoCod3Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="75601241"
Received: from unknown (HELO bvivekan-DESK.iind.intel.com) ([10.190.238.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:36:43 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode change
Date: Tue,  8 Oct 2024 13:06:28 +0530
Message-Id: <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
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

Drop the exclusive client count tracking and use the filelist from the
drm to track the active clients. This also ensures the clients created
internally by the driver won't block changing the ccs mode.

Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 10 ----------
 drivers/gpu/drm/xe/xe_device_types.h |  9 ---------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  |  9 +++++----
 3 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a33d0c772616..c6bd6888cb7b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -91,10 +91,6 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	mutex_init(&xef->exec_queue.lock);
 	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
 
-	spin_lock(&xe->clients.lock);
-	xe->clients.count++;
-	spin_unlock(&xe->clients.lock);
-
 	file->driver_priv = xef;
 	kref_init(&xef->refcount);
 
@@ -111,17 +107,12 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 static void xe_file_destroy(struct kref *ref)
 {
 	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
-	struct xe_device *xe = xef->xe;
 
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
-	spin_lock(&xe->clients.lock);
-	xe->clients.count--;
-	spin_unlock(&xe->clients.lock);
-
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
 	kfree(xef);
@@ -352,7 +343,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.force_execlist = xe_modparam.force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
-	spin_lock_init(&xe->clients.lock);
 
 	init_waitqueue_head(&xe->ufence_wq);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b97cd9828883..d4d53bb24740 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -425,15 +425,6 @@ struct xe_device {
 		struct workqueue_struct *wq;
 	} sriov;
 
-	/** @clients: drm clients info */
-	struct {
-		/** @clients.lock: Protects drm clients info */
-		spinlock_t lock;
-
-		/** @clients.count: number of drm clients */
-		u64 count;
-	} clients;
-
 	/** @usm: unified memory state */
 	struct {
 		/** @usm.asid: convert a ASID to VM */
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 246190b3e2bb..b6adfb9f2030 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -139,9 +139,10 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	}
 
 	/* CCS mode can only be updated when there are no drm clients */
-	spin_lock(&xe->clients.lock);
-	if (xe->clients.count) {
-		spin_unlock(&xe->clients.lock);
+	mutex_lock(&xe->drm.filelist_mutex);
+	if (!list_empty(&xe->drm.filelist)) {
+		mutex_unlock(&xe->drm.filelist_mutex);
+		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
 		return -EBUSY;
 	}
 
@@ -152,7 +153,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		xe_gt_reset_async(gt);
 	}
 
-	spin_unlock(&xe->clients.lock);
+	mutex_unlock(&xe->drm.filelist_mutex);
 
 	return count;
 }
-- 
2.34.1

