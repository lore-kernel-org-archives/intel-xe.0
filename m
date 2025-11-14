Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41653CEACDA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45EF10EB31;
	Fri, 14 Nov 2025 21:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keg6qTmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B453710EB36
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AbwqgoLhHLMj3PJSDXD10ApSyaDIgVF6cIc4Jzi2s1Y=;
 b=keg6qTmy6kNZ2z4HPUUEvGjrZUEbfIgdD/Sqln0aazMnn5PGlkpjRsaX
 BA+Xy1o6Uleu7CJi2hxvmAOoJk1F+KLZhW9nI5Oig36Joj2CfHIL/geu5
 M6vI2lZv9iIg5Zvy/fYuktKRvZoK4RRyVmoBRIqRP+chFrqjyrHIQzt0Z
 s4r+AX1wMDTIVw5MropohCy7/42fCLSzxujuvoEswtNsiHW6bOOHkISqE
 Ef8hAWqhUDi1d2Ib+j0FS0wbQBydtAlDG+/D1Y5KCfoSVz8l8Mme/Ys+m
 8xr7SDZ3azNtLoxUs3EGghmz/qBnqed7EVg9KnyLBU2S2ZDcIVpKifwQW Q==;
X-CSE-ConnectionGUID: CDRqLG3qQ1yjxsopG6tiNA==
X-CSE-MsgGUID: kErY1C/tQr220SeB6BCdrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648328"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648328"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:50 -0800
X-CSE-ConnectionGUID: JznLVODhQqil48lgeMx4QA==
X-CSE-MsgGUID: NtzTPH/NRbySIAcJvjD+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308344"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 24/27] drm/xe/sriov: Use scope-based runtime PM
Date: Fri, 14 Nov 2025 13:44:00 -0800
Message-ID: <20251114214335.2388972-53-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

v2:
 - Drop unnecessary 'ret' variables.  (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c             | 10 +++-------
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  6 ++----
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        | 16 ++++------------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c          |  5 +----
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |  3 +--
 5 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 9ff69c4843b0..3fd22034f03e 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -219,7 +219,6 @@ static int pf_disable_vfs(struct xe_device *xe)
 int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	int ret;
 
 	if (!IS_SRIOV_PF(xe))
 		return -ENODEV;
@@ -233,14 +232,11 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 	if (num_vfs && pci_num_vf(pdev))
 		return -EBUSY;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	if (num_vfs > 0)
-		ret = pf_enable_vfs(xe, num_vfs);
+		return pf_enable_vfs(xe, num_vfs);
 	else
-		ret = pf_disable_vfs(xe);
-	xe_pm_runtime_put(xe);
-
-	return ret;
+		return pf_disable_vfs(xe);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index bad751217e1e..e84bdde9bc80 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -70,9 +70,8 @@ static ssize_t from_file_write_to_xe_call(struct file *file, const char __user *
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
@@ -209,9 +208,8 @@ static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *
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
index c0b767ac735c..3d140506ba36 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -389,16 +389,12 @@ static ssize_t xe_sriov_dev_attr_store(struct kobject *kobj, struct attribute *a
 	struct xe_sriov_dev_attr *vattr = to_xe_sriov_dev_attr(attr);
 	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
 	struct xe_device *xe = vkobj->xe;
-	ssize_t ret;
 
 	if (!vattr->store)
 		return -EPERM;
 
-	xe_pm_runtime_get(xe);
-	ret = xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, buf, count);
-	xe_pm_runtime_put(xe);
-
-	return ret;
+	guard(xe_pm_runtime)(xe);
+	return xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, buf, count);
 }
 
 static ssize_t xe_sriov_vf_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
@@ -423,18 +419,14 @@ static ssize_t xe_sriov_vf_attr_store(struct kobject *kobj, struct attribute *at
 	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
 	struct xe_device *xe = vkobj->xe;
 	unsigned int vfid = vkobj->vfid;
-	ssize_t ret;
 
 	xe_sriov_pf_assert_vfid(xe, vfid);
 
 	if (!vattr->store)
 		return -EPERM;
 
-	xe_pm_runtime_get(xe);
-	ret = xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, vfid, buf, count);
-	xe_pm_runtime_get(xe);
-
-	return ret;
+	guard(xe_pm_runtime)(xe);
+	return xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, vfid, buf, count);
 }
 
 static const struct sysfs_ops xe_sriov_dev_sysfs_ops = {
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

