Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A38CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6740210E353;
	Mon,  6 Oct 2025 11:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwZX+bhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DE110E070
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759751712; x=1791287712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mqdgBMb9eHwmnbAQfHltqgldICHgu827c5w+1jneMis=;
 b=cwZX+bhM90d+JX0Yo6f4flO/F/svgGbRsvMLD5YHB6/8Wa9XkW4EQ2z3
 2zQHNYOr47WjF6ujFefenYhp2oR0XxEUdAm8nV+pJVVbmAGaPi9JPCu6s
 eXxPTO+qxxYlLIIZS/8esEHt6aw7o9KsY/T383Rjy0ZxpDT663jETqZsE
 VJ8tFZkJybHNRmjnOQEpCNkr4NvzbBUW4sdJGmOxKVbqdLW4ZSHNkm+HW
 xYIszCgxEnzAiuunvujEhchlvCzxe+vy9WgN/nhJRc2L/mhW0wxZjCVir
 2IJoYDVKCSQbE1jWc7vFY1i6zyHHqLjkqXoJCI2NuTs9vQbe4V6vUNrIC w==;
X-CSE-ConnectionGUID: +9kbfQi7RISVuXkDRuw2YA==
X-CSE-MsgGUID: OFSIQKiERjyklu8Tf6IZxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="79573570"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="79573570"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:55:12 -0700
X-CSE-ConnectionGUID: +9N3pEVqStq9eTPS8Z/rtQ==
X-CSE-MsgGUID: jbNmKiTJSFGKCX/vLaid0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179138376"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by orviesa010.jf.intel.com with ESMTP; 06 Oct 2025 04:55:11 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com, Michal.Wajdeczko@intel.com,
 stuart.summers@intel.com
Subject: [PATCH V4] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Date: Mon,  6 Oct 2025 17:20:14 +0530
Message-ID: <20251006115013.1305805-2-naresh.kumar.g@intel.com>
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
Similarly, enabling VFs is disabled when multi CCS mode enabled.

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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h           |  8 ++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c      | 10 ++++++----
 drivers/gpu/drm/xe/xe_pci_sriov.c        |  5 +++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 13 +++++++++++++
 4 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f6..986f9cabb897 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -172,6 +172,14 @@ static inline bool xe_device_has_lmtt(struct xe_device *xe)
 	return IS_DGFX(xe);
 }
 
+static inline bool xe_multi_ccs_mode_enabled(struct xe_device *xe)
+{
+	/* Multi CCS mode supported exclusively on GT0 */
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+
+	return gt->ccs_mode > 1;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..91908faf3768 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -117,9 +118,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	u32 num_engines, num_slices;
 	int ret;
 
-	if (IS_SRIOV(xe)) {
-		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
-			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+	if (xe_sriov_pf_has_vfs_enabled(xe)) {
+		xe_gt_dbg(gt, "Can't change CCS mode in SR-IOV PF Mode with VFs Enabled\n");
 		return -EOPNOTSUPP;
 	}
 
@@ -184,6 +184,8 @@ static void xe_gt_ccs_mode_sysfs_fini(void *arg)
  * The number of available compute slices is exposed to user through a per-gt
  * 'num_cslices' sysfs interface.
  *
+ * The sysfs interface for CCS mode is not set up in SRIOV VF Mode.
+ *
  * Returns: Returns error value for failure and 0 for success.
  */
 int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
@@ -191,7 +193,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	if (!xe_gt_ccs_mode_enabled(gt))
+	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
 		return 0;
 
 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 9c1c9e669b04..0715f87a5ecc 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -153,6 +153,11 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	xe_assert(xe, num_vfs <= total_vfs);
 	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
 
+	if (xe_multi_ccs_mode_enabled(xe)) {
+		xe_sriov_info(xe, "Disable multi-CCS mode before enabling VF's\n");
+		return -ECANCELED;
+	}
+
 	err = xe_sriov_pf_wait_ready(xe);
 	if (err)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index dd1df950b021..e26837091375 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -43,4 +43,17 @@ static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
 	return &xe->sriov.pf.master_lock;
 }
 
+/**
+ * xe_sriov_pf_has_vfs_enabled() - Determines if the PF has any VFs enabled
+ * @xe: ptr to xe_device
+ *
+ * Return: true if one or more VFs are enabled on the PF, false otherwise.
+ */
+static inline bool xe_sriov_pf_has_vfs_enabled(const struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	return pci_num_vf(pdev) > 0;
+}
+
 #endif
-- 
2.43.0

