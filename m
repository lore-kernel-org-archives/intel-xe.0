Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBFDCD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C8410EB98;
	Fri,  7 Nov 2025 18:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVdc+Fdf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC73C10EB84
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539212; x=1794075212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YNzuWfzvpe4wnfvDfD46wF3cy/wm0D4rg89c7eyJXlw=;
 b=iVdc+FdfCYdRO8EBpxOkpHEKW/xfJxKSm8A6LvJR3gIwWFcdznTsY7fT
 emRnLtNYtvNL41OWWlUCXu4TImIdjn5S6NZaaasxnlxj4jCw6Tvj2mgT7
 sl/qseb8tw9J3u5EidRPPxVoUfB2kKwYuYTX/54D5RlxP0fATrk7t974+
 zLG+h7kkTGTYE4/Ffhr4lXg9Q9l6bw0CHihG1qmiQUn4SQbDbOqunHMme
 D7tMrxXfdYOJQwADaunsdbMJP8a4pOLEwEdEP5Z0ud1nZQG1gl6WHwFr5
 TnIu2qsL4UW6HiahniEQjJPULBLIP2dh5DMKABGcErIie+ivKq/GwtIGD A==;
X-CSE-ConnectionGUID: ZP4QuMaXTWy9znEa1LgHhg==
X-CSE-MsgGUID: eTdBx6nRRoOm8xywwKCMFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733165"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733165"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
X-CSE-ConnectionGUID: EtE0aC/eRUGz00g1n8ePow==
X-CSE-MsgGUID: JCe7abtmQXqwd1i8TGHZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271244"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 30/33] drm/xe/sriov: Use scope-based runtime PM
Date: Fri,  7 Nov 2025 10:13:46 -0800
Message-ID: <20251107181315.631642-65-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Use scope-based runtime power management in the SRIOV code for
consistency with other parts of the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c             | 3 +--
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 6 ++----
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        | 6 ++----
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c          | 5 +----
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 3 +--
 5 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index d0fcde66a774..4b16748fe2ed 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -212,12 +212,11 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 	if (num_vfs && pci_num_vf(pdev))
 		return -EBUSY;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	if (num_vfs > 0)
 		ret = pf_enable_vfs(xe, num_vfs);
 	else
 		ret = pf_disable_vfs(xe);
-	xe_pm_runtime_put(xe);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a81aa05c5532..21eafe333cb5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -69,9 +69,8 @@ static ssize_t from_file_write_to_xe_call(struct file *file, const char __user *
 	if (ret < 0)
 		return ret;
 	if (yes) {
-		xe_pm_runtime_get(xe);
+		guard(xe_pm_runtime)(xe);
 		ret = call(xe);
-		xe_pm_runtime_put(xe);
 	}
 	if (ret < 0)
 		return ret;
@@ -157,9 +156,8 @@ static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *
 	if (ret < 0)
 		return ret;
 	if (yes) {
-		xe_pm_runtime_get(xe);
+		guard(xe_pm_runtime)(xe);
 		ret = call(xe, vfid);
-		xe_pm_runtime_put(xe);
 	}
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index c0b767ac735c..f0777976335c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -394,9 +394,8 @@ static ssize_t xe_sriov_dev_attr_store(struct kobject *kobj, struct attribute *a
 	if (!vattr->store)
 		return -EPERM;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	ret = xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, buf, count);
-	xe_pm_runtime_put(xe);
 
 	return ret;
 }
@@ -430,9 +429,8 @@ static ssize_t xe_sriov_vf_attr_store(struct kobject *kobj, struct attribute *at
 	if (!vattr->store)
 		return -EPERM;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	ret = xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, vfid, buf, count);
-	xe_pm_runtime_get(xe);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 797a4b866226..e1cdc46ad710 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -463,8 +463,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
 	if (!IS_VF_CCS_READY(xe))
 		return;
 
-	xe_pm_runtime_get(xe);
-
+	guard(xe_pm_runtime)(xe);
 	for_each_ccs_rw_ctx(ctx_id) {
 		bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
 		if (!bb_pool)
@@ -475,6 +474,4 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
 		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
 		drm_puts(p, "\n");
 	}
-
-	xe_pm_runtime_put(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
index f3f478f14ff5..7f97db2f89bb 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
@@ -141,12 +141,11 @@ static int NAME##_set(void *data, u64 val)					\
 	if (val > (TYPE)~0ull)							\
 		return -EOVERFLOW;						\
 										\
-	xe_pm_runtime_get(xe);							\
+	guard(xe_pm_runtime)(xe);						\
 	err = xe_sriov_pf_wait_ready(xe) ?:					\
 	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
 	if (!err)								\
 		xe_sriov_pf_provision_set_custom_mode(xe);			\
-	xe_pm_runtime_put(xe);							\
 										\
 	return err;								\
 }										\
-- 
2.51.1

