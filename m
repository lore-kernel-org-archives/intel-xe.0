Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42231606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcKr80NE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA09112058;
	Fri, 20 Nov 2026 05:47:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DEB10FF2B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153642; x=1826689642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YldK3zlRig8PF7+W9DR3kHFvbMM9eSs5U45CR42h830=;
 b=fcKr80NEbpi5uuYj6qgjWp5q8L63CD4o4GUW34/aUmRLcTdyt4gV69zJ
 BngK3wM5L2rDAl0G7AOVpo5NJJREopUMuLnLl1KKuHl/ebxWFdIlvLm14
 ItuSmchP6j2J+eipiVC7QP3xLrdl83mUtx4i2M7Z2WiTSPlTbHeI9F40+
 Tjgp+NzkVu1tBZNgYYnN/j6W9HSfSnWBHsc6lPWTUTJt3ZukWDyunxrxd
 FeIXZ2FsGhFjayScxcqktuIu21VIPAcX4qD4wM6xbnlEv99QEqAj9TPU3
 /mU1USntILxzmybmW1SrRZQ2+83pfNhReKpJ4Vl9ySvWE/q+VqNb4kvIE A==;
X-CSE-ConnectionGUID: /s5ZcEb3Qx6eHoFBe9ccAQ==
X-CSE-MsgGUID: l2OGvcyhR1yFrVNp3yCICQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4018525"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4018525"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:16 -0800
X-CSE-ConnectionGUID: CQBlvCSWQ2SCVSVeyzbNiA==
X-CSE-MsgGUID: fMqiIKuQR8mlHGJiZ8drjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10617126"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:16 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 04/16] drm/xe: Add enable_media module parameter
Date: Fri, 20 Nov 2026 05:47:15 +0000
Message-ID: <20261120054712.377573-22-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120054712.377573-18-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The gt_types_allowed configfs attribute is intended for debug only,
so provide a supported way to disable the media GT in production.
The modparam takes precedence over configfs so a single knob is enough
to guarantee the media GT is left alone.

The parameter is tri-state so that -1 can leave the decision to the
driver, which currently enables media wherever it is present.

Both inputs are writable while the driver runs, so latch the result into
xe->info.media_allowed during early probe and read it back through
xe_device_media_allowed(). That keeps the decision fixed for the
lifetime of the device and makes it available outside xe_pci.c.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c     |  3 +++
 drivers/gpu/drm/xe/xe_defaults.h     |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_module.c       |  7 +++++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 21 ++++++++++++++++++---
 8 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 2ddd707a6dbd..43950f499a89 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -96,6 +96,9 @@
  * will always return one GT type per line. "primary" and "media" are the
  * GT type names supported by this interface.
  *
+ * Note that the ``enable_media=0`` module parameter takes precedence over
+ * this attribute: it disables the media GT even if "media" is listed here.
+ *
  * This attribute can only be set before binding to the device.
  *
  * Examples:
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 0884224ef7c7..8d69df72fe4e 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -13,6 +13,7 @@
 #define XE_DEFAULT_GUC_LOG_LEVEL		1
 #endif
 
+#define XE_DEFAULT_ENABLE_MEDIA			-1
 #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b053a788d59c..e179d298cbba 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -377,6 +377,20 @@ bool xe_device_is_admin_only(const struct xe_device *xe)
 }
 #endif
 
+/**
+ * xe_device_media_allowed() - Check whether the media IP may be used.
+ * @xe: the &xe_device to check
+ *
+ * Returns the decision latched during early probe, see
+ * @xe_device.info.media_allowed.
+ *
+ * Return: true if media may be used, false otherwise.
+ */
+bool xe_device_media_allowed(struct xe_device *xe)
+{
+	return xe->info.media_allowed;
+}
+
 /* Number of allocated struct xe_device */
 static atomic_t xe_device_count;
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 7a7632e2d56b..b8b24216ee6a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -279,6 +279,7 @@ static inline bool xe_device_is_admin_only(const struct xe_device *xe)
 }
 #endif
 
+bool xe_device_media_allowed(struct xe_device *xe);
 void xe_device_exit(void);
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a31949073..cfb2639b014e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -226,6 +226,8 @@ struct xe_device {
 		u8 has_pt_mirror:1;
 		/** @info.is_dgfx: is discrete device */
 		u8 is_dgfx:1;
+		/** @info.media_allowed: Media IP may be used */
+		u8 media_allowed:1;
 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
 		u8 needs_scratch:1;
 		/**
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 897724cb5cfb..d6f3dd54613e 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -22,6 +22,7 @@
 #include "xe_sched_job.h"
 
 struct xe_modparam xe_modparam = {
+	.enable_media =		XE_DEFAULT_ENABLE_MEDIA,
 	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
 	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		XE_DEFAULT_FORCE_PROBE,
@@ -38,6 +39,12 @@ module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600)
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
 		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
 
+module_param_named(enable_media, xe_modparam.enable_media, int, 0444);
+MODULE_PARM_DESC(enable_media, "Enable the media GT, when present (-1=auto, 0=disable, 1=enable). "
+		 "Disabling overrides any media GT selected via the gt_types_allowed "
+		 "configfs attribute "
+		 "[default=" __stringify(XE_DEFAULT_ENABLE_MEDIA) "])");
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 6272d9e41207..ffa5ca462207 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@ struct work_struct;
 
 /* Module modprobe variables */
 struct xe_modparam {
+	int enable_media;
 	bool probe_display;
 	int force_vram_bar_size;
 	int guc_log_level;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fb2a5f3311c8..7a5c4939a0ac 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -641,7 +641,7 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
 		int err;
 
 		/* Don't try to read media ver if media GT is not allowed */
-		if (type == GMDID_MEDIA && !xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
+		if (type == GMDID_MEDIA && !xe_device_media_allowed(xe)) {
 			*ver = *revid = 0;
 			return 0;
 		}
@@ -778,6 +778,18 @@ static int xe_probe_info_early(struct xe_device *xe,
 	return 0;
 }
 
+/*
+ * Whether the user wants media at all.  The default (-1) leaves the decision
+ * to the driver.
+ */
+static bool media_wanted(struct xe_device *xe)
+{
+	if (xe_modparam.enable_media < 0)
+		return true;
+
+	return xe_modparam.enable_media;
+}
+
 /*
  * Initialize device info content that only depends on static driver_data
  * passed to the driver at probe time from PCI ID table.
@@ -809,6 +821,9 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe_wa_process_device_oob(xe);
 
+	xe->info.media_allowed = media_wanted(xe) &&
+		xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev));
+
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
@@ -952,8 +967,8 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
 
-	if (!xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
-		xe_tile_info(tile, "Media GT disabled via configfs\n");
+	if (!xe_device_media_allowed(xe)) {
+		xe_tile_info(tile, "Media GT disabled\n");
 		return NULL;
 	}
 
-- 
2.43.0

