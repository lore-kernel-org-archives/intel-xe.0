Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB4BD2ED0F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 11:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE8A10E5BF;
	Tue, 20 Jan 2026 11:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOx9+0WD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BE410E5BF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768907998; x=1800443998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dFSKk9t7s8XGmg+9tzdCtZBhRN/ScjHE2y+Gwsx2EqA=;
 b=eOx9+0WDiIeoAg2EfT6hRbctPAGPC8tP7EYFV8UDGn4kpLIujTq/vSH7
 QxuhG7tLhmwyep/h0/N0n4uBbpNdAEbxzpgQ2lHqIaVCRS42NNgv8zJbP
 km6BV3v2opPKrvD5ADLq2BSSsK0qpEgne5megFHibMNen26KbJmE4jeCE
 j0J5sByszDwSc/Ot9y+XL8/Syl/q2lMQUIJ9q8UCKEZdHxTUYEcDlHnHo
 OLkVGU0lU1xqpNTCNNDb1JpLDQnoFlzbOJuAXJvJ1cr1OfOpslfF0Mitl
 qGufJ78NXVB7+uxOGnDIe7hUCqlkMST3iJTRtK0zBIFboYyABKZZV8iBy A==;
X-CSE-ConnectionGUID: GY4pk4jsSeS2k48NfW3unw==
X-CSE-MsgGUID: XFVbLlo/Q32CqN6cJS4iUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70165409"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70165409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:19:58 -0800
X-CSE-ConnectionGUID: nk6LzST4T068SDDcCdaQ8Q==
X-CSE-MsgGUID: iEFUcp9lRo20ZRI5cc9+OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210946107"
Received: from ksatya-dev.iind.intel.com (HELO ksatya-dev.intel.com)
 ([10.190.229.161])
 by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2026 03:19:55 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [RFC 1/1] =?UTF-8?q?drm/xe/vf:=20Skip=20creating=20DRM=20device?=
 =?UTF-8?q?=20entries=20in=20PF=20admin=E2=80=91only=20mode?=
Date: Tue, 20 Jan 2026 11:20:10 +0000
Message-ID: <20260120112010.70397-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120112010.70397-1-satyanarayana.k.v.p@intel.com>
References: <20260120112010.70397-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When the PF is configured for admin‑only mode, it is restricted to
management functions and should not expose a device node that would allow
users to run workloads.

In this mode, no DRM device entry is created; however, sysfs and debugfs
interfaces for the PF remain available at:

sysfs: /sys/devices/pci0000:00/<B:D:F>
debugfs: /sys/kernel/debug/dri/<B:D:F>

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c          | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c           | 11 +++++++----
 drivers/gpu/drm/xe/xe_device.h           |  6 ++++++
 drivers/gpu/drm/xe/xe_oa.c               |  2 +-
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |  2 +-
 5 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0907868b32d6..134d2e661c7c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -458,6 +458,20 @@ static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
 	return size;
 }
 
+static void update_minor_dev(struct xe_device *xe, struct drm_minor **minor,
+			     __maybe_unused struct dentry **root)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (!xe_sriov_pf_admin_only(xe))
+		return;
+
+	(*minor)->dev = drm;
+	(*minor)->kdev = drm->dev;
+	(*minor)->debugfs_root = drm->debugfs_root;
+	*root = (*minor)->debugfs_root;
+}
+
 static const struct file_operations disable_late_binding_fops = {
 	.owner = THIS_MODULE,
 	.read = disable_late_binding_show,
@@ -475,6 +489,8 @@ void xe_debugfs_register(struct xe_device *xe)
 	u8 tile_id;
 	u8 id;
 
+	update_minor_dev(xe, &minor, &root);
+
 	drm_debugfs_create_files(debugfs_list,
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 00afc84a8683..fdd8668bd565 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -993,9 +993,11 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = drm_dev_register(&xe->drm, 0);
-	if (err)
-		return err;
+	if (!xe_sriov_pf_admin_only(xe)) {
+		err = drm_dev_register(&xe->drm, 0);
+		if (err)
+			return err;
+	}
 
 	xe_display_register(xe);
 
@@ -1046,7 +1048,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_nvm_fini(xe);
 
-	drm_dev_unplug(&xe->drm);
+	if (!xe_sriov_pf_admin_only(xe))
+		drm_dev_unplug(&xe->drm);
 
 	xe_bo_pci_dev_remove_all(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6604b89330d5..bb1e7bc8bf4f 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -11,6 +11,7 @@
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
@@ -177,6 +178,11 @@ static inline bool xe_device_has_mert(struct xe_device *xe)
 	return xe->info.has_mert;
 }
 
+static inline struct device *xe_to_drm_kdev(struct xe_device *xe)
+{
+	return xe_sriov_pf_admin_only(xe) ? xe->drm.dev : xe->drm.primary->kdev;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index abf87fe0b345..90fa30de85ce 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2512,7 +2512,7 @@ int xe_oa_register(struct xe_device *xe)
 		return 0;
 
 	oa->metrics_kobj = kobject_create_and_add("metrics",
-						  &xe->drm.primary->kdev->kobj);
+						  &(xe_to_drm_kdev(xe)->kobj));
 	if (!oa->metrics_kobj)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index 9054fdc34597..9a99fafbe77d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -56,7 +56,7 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
  */
 static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
 {
-	return !xe->info.probe_display;
+	return !xe->info.probe_display && xe->sriov.pf.driver_max_vfs > 0;
 }
 
 static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
-- 
2.43.0

