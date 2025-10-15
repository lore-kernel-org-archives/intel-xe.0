Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFA5CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F0E10E812;
	Wed, 15 Oct 2025 14:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUKZu9cN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E876910E811
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760538813; x=1792074813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RhkDLc0FEamInDhF1f20GiPl90H7IJSzKNg/K8mYUuc=;
 b=UUKZu9cNTvOovcJBvZmpaHaYPwavK8kSL9OdRlOStkkS1rMb0srmgn8t
 n6eOrFadegClIoUmWpvuxhNuQdyUHEYuStlIBz0HSk3UI/il4rAKO9iHE
 w6UXF3XTfzdW5QlD20W2RAxr11gXjuCVrOdWmU9a1EI/dZRhb6Gfl4Tik
 H/CGA9qTzUyxI34wKYo/LRe0/XXS44t1TI/f696Ff8RXORgA8NpJtfa8I
 ZrcWcSpg4NB5itGhzsq0ujPHdqDCXjfMXzbzAXpNCjbPpsGpGVhvWJ4/A
 h6+T620GB+wz7GRex0niuwEbxTWm9djMLsMRYBEgnsb83XF80hnXRhzV8 Q==;
X-CSE-ConnectionGUID: N91+q+k0QXqbl4qVl3wvVQ==
X-CSE-MsgGUID: 0C8nsXIxRKWGW66ajJVd6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80349908"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="80349908"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:33:33 -0700
X-CSE-ConnectionGUID: vamIWci9QSGqqX2n7HGLVg==
X-CSE-MsgGUID: JvITvcPwTgmziQkiRitU3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="181318730"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by orviesa006.jf.intel.com with ESMTP; 15 Oct 2025 07:33:30 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com,
	Michal.Wajdeczko@intel.com
Subject: [PATCH V5] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Date: Wed, 15 Oct 2025 19:58:20 +0530
Message-ID: <20251015142820.2519054-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
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

Due to SLA agreement between PF and VFs, multi CCS mode can't
be enabled when VFs are already enabled.
Similarly, enabling VFs must be blocked when multi CCS mode enabled.

v2:
- function xe_device_is_vf_enabled has been refactored to
  xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
- The code now distinctly checks for SR-IOV VF mode and
  SR-IOV PF with VFs enabled.
- Log messages have been updated to explicitly state the current mode.
- The function xe_multi_ccs_mode_enabled is moved to xe_device.h

v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled

v4:
- sysfs interface for CCS mode is not initialized
  when operating in SRIOV VF Mode.
- xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
  enablement.
- remove unnecessary comments as flow is self explanatory.

v5:(review comments from Michal)
- Add xe device level CCS mode block with mutex lock and CCS mode state
- necessesary functions to manage ccs mode state to provide strict mutual
  exclusive support b/w CCS mode & SRIOV VF enabling

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 20 ++++++++
 drivers/gpu/drm/xe/xe_device.h       | 68 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 24 ++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 31 +++++++++----
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 31 ++++++++++++-
 drivers/gpu/drm/xe/xe_pci_sriov.c    |  9 ++++
 6 files changed, 174 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 386940323630..c01eda9baac9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -799,6 +799,24 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 	return 0;
 }
 
+static int xe_ccs_mode_init(struct xe_device *xe)
+{
+	/*
+	 * Initialize CCS mode state to Not available.
+	 * It will be update by GT level CCS mode
+	 * if applicable.
+	 */
+	xe->ccs_mode.state = XE_CCSMODE_NOT_AVAILABLE;
+
+	/*
+	 * CCS mode mutex lock initalization
+	 * The lock ensures mutual exclusion when updating
+	 * CCS mode support either during VF provisioning or
+	 * GT level CCS mode configuration.
+	 */
+	return drmm_mutex_init(&xe->drm, &xe->ccs_mode.lock);
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -888,6 +906,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_ccs_mode_init(xe);
+
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init(gt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f6..5e6efdf6074c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -172,6 +172,74 @@ static inline bool xe_device_has_lmtt(struct xe_device *xe)
 	return IS_DGFX(xe);
 }
 
+static inline bool xe_ccs_mode_enabled(struct xe_device *xe)
+{
+	if (xe->ccs_mode.state == XE_CCSMODE_ENABLE_INPROGRESS ||
+	    xe->ccs_mode.state == XE_CCSMODE_ENABLED) {
+		return true;
+	}
+
+	return false;
+}
+
+static inline bool xe_ccs_mode_is_unsupported(struct xe_device *xe)
+{
+	return xe->ccs_mode.state == XE_CCSMODE_ENABLE_UNSUPPORTED;
+}
+
+/**
+ *  __xe_ccs_mode_toggle_support - toggles CCS mode support flag based on VF provision
+ *  @xe: ptr to struct xe_device
+ *  @enable: gets boolean value true/false
+ *
+ *  CCS mode state support toggles to unsupported if VF provisioned
+ *  otherwise toggles to supported
+ */
+static inline int
+__xe_ccs_mode_toggle_support(struct xe_device *xe, bool enable)
+{
+	mutex_lock(&xe->ccs_mode.lock);
+
+	if (!enable && xe_ccs_mode_enabled(xe))
+		goto err;
+
+	xe->ccs_mode.state = enable ?
+		XE_CCSMODE_ENABLE_SUPPORTED : XE_CCSMODE_ENABLE_UNSUPPORTED;
+
+	mutex_unlock(&xe->ccs_mode.lock);
+
+	return 0;
+
+err:
+	mutex_unlock(&xe->ccs_mode.lock);
+	return -ECANCELED;
+}
+
+static inline int xe_ccs_mode_support_disable(struct xe_device *xe)
+{
+	return __xe_ccs_mode_toggle_support(xe, false);
+}
+
+static inline int xe_ccs_mode_support_enable(struct xe_device *xe)
+{
+	return __xe_ccs_mode_toggle_support(xe, true);
+}
+
+static inline int xe_ccs_mode_allowed_to_update(struct xe_device *xe)
+{
+	mutex_lock(&xe->ccs_mode.lock);
+
+	if (xe_ccs_mode_is_unsupported(xe)) {
+		mutex_unlock(&xe->ccs_mode.lock);
+		return -ECANCELED;
+	}
+
+	xe->ccs_mode.state = XE_CCSMODE_ENABLE_INPROGRESS;
+	mutex_unlock(&xe->ccs_mode.lock);
+
+	return 0;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 989244418950..fa7fdcc19284 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -73,6 +73,22 @@ struct xe_vram_region;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
+/**
+ * enum xe_ccsmode_state - ccsmode capability state
+ *
+ * @XE_CCSMODE_NOT_AVAILABLE: CCSmode not available in HW
+ * @XE_CCSMODE_ENABLE_UNSUPPORTED: CCS mode enable not supported
+ * @XE_CCSMODE_ENABLE_SUPPORTED: CCS mode enable supported
+ * @XE_CCSMODE_ENABLED: CCS mode enabled
+ */
+enum xe_ccsmode_state {
+	XE_CCSMODE_NOT_AVAILABLE = 1,
+	XE_CCSMODE_ENABLE_UNSUPPORTED,
+	XE_CCSMODE_ENABLE_SUPPORTED,
+	XE_CCSMODE_ENABLE_INPROGRESS,
+	XE_CCSMODE_ENABLED
+};
+
 /**
  * struct xe_mmio - register mmio structure
  *
@@ -616,6 +632,14 @@ struct xe_device {
 	atomic_t g2g_test_count;
 #endif
 
+	/** @ccs_mode: CCS mode lock **/
+	struct {
+		/** @state: CCSmode functionality state */
+		enum xe_ccsmode_state state;
+		/** @lock: protects CCS mode state changes */
+		struct mutex lock;
+	} ccs_mode;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..dbf254a793c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -117,15 +117,15 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	u32 num_engines, num_slices;
 	int ret;
 
-	if (IS_SRIOV(xe)) {
-		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
-			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-		return -EOPNOTSUPP;
+	ret = xe_ccs_mode_allowed_to_update(xe);
+	if (ret < 0) {
+		xe_gt_dbg(gt, "Can't change CCS mode as VF being enabled\n");
+		return ret;
 	}
 
 	ret = kstrtou32(buff, 0, &num_engines);
 	if (ret)
-		return ret;
+		goto failed;
 
 	/*
 	 * Ensure number of engines specified is valid and there is an
@@ -135,7 +135,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
 		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
 			  num_engines, num_slices);
-		return -EINVAL;
+		ret =  -EINVAL;
+		goto failed;
 	}
 
 	/* CCS mode can only be updated when there are no drm clients */
@@ -143,7 +144,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	if (!list_empty(&xe->drm.filelist)) {
 		mutex_unlock(&xe->drm.filelist_mutex);
 		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
-		return -EBUSY;
+		ret = -EBUSY;
+		goto failed;
 	}
 
 	if (gt->ccs_mode != num_engines) {
@@ -155,7 +157,14 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 
 	mutex_unlock(&xe->drm.filelist_mutex);
 
+	xe_gt_ccs_mode_update(gt);
+
 	return count;
+
+failed:
+	xe_gt_ccs_mode_update(gt);
+
+	return ret;
 }
 
 static DEVICE_ATTR_RW(ccs_mode);
@@ -184,6 +193,8 @@ static void xe_gt_ccs_mode_sysfs_fini(void *arg)
  * The number of available compute slices is exposed to user through a per-gt
  * 'num_cslices' sysfs interface.
  *
+ * The sysfs interface for CCS mode is not set up in SRIOV VF Mode.
+ *
  * Returns: Returns error value for failure and 0 for success.
  */
 int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
@@ -191,12 +202,16 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	if (!xe_gt_ccs_mode_enabled(gt))
+	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
 		return 0;
 
 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
 	if (err)
 		return err;
 
+	/* update xe level CCS mode to supported if any gt supports */
+	if (xe->ccs_mode.state == XE_CCSMODE_NOT_AVAILABLE)
+		xe->ccs_mode.state = XE_CCSMODE_ENABLE_SUPPORTED;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_gt_ccs_mode_sysfs_fini, gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f8779852cf0d..0b88fe7d2ba4 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -20,5 +20,34 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 	return hweight32(CCS_MASK(gt)) > 1;
 }
 
-#endif
+static inline bool xe_gt_ccs_mode_is_enabled(struct xe_gt *gt)
+{
+	/* Check if CCS mode enabled with more than one compute engine*/
+	return gt->ccs_mode > 1;
+}
+
+static inline int xe_gt_ccs_mode_update(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	mutex_lock(&xe->ccs_mode.lock);
 
+	/* Change CCS mode state to enabled if CCS mode configured */
+	if (xe_gt_ccs_mode_is_enabled(gt)) {
+		xe->ccs_mode.state = XE_CCSMODE_ENABLED;
+		goto out;
+	}
+	/*
+	 * Change CCS mode state to disabled,
+	 * if none of the gt configured CCS mode with multi engines
+	 */
+	if (xe->ccs_mode.state != XE_CCSMODE_ENABLED)
+		xe->ccs_mode.state = XE_CCSMODE_ENABLE_SUPPORTED;
+
+out:
+	mutex_unlock(&xe->ccs_mode.lock);
+
+	return 0;
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 9c1c9e669b04..8681a4a12fdb 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -153,6 +153,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	xe_assert(xe, num_vfs <= total_vfs);
 	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
 
+	err = xe_ccs_mode_support_disable(xe);
+	if (err < 0)
+		goto failed_ccsmode;
+
 	err = xe_sriov_pf_wait_ready(xe);
 	if (err)
 		goto out;
@@ -195,8 +199,11 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 out:
+	xe_ccs_mode_support_enable(xe);
+failed_ccsmode:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
 			num_vfs, str_plural(num_vfs), ERR_PTR(err));
+
 	return err;
 }
 
@@ -223,6 +230,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 	/* not needed anymore - see pf_enable_vfs() */
 	xe_pm_runtime_put(xe);
 
+	xe_ccs_mode_support_enable(xe);
+
 	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
 	return 0;
 }
-- 
2.43.0

