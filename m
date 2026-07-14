Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BC9C44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B2110E07D;
	Tue, 14 Jul 2026 10:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHUWYEkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621EA10E20F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 10:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026475; x=1815562475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jdq/s7x0s1O98cKh6sH19+0deykG8bUWmxmXn2H++gc=;
 b=CHUWYEkNc0HyYAO+B8QxY63/BqhTI6BAJ4vaOhamDqVi3VvIIH/Y7kVC
 NcRW/STs3MLU7VQ76qq4xZM2ESp6RhBnjIYrD2XADktEYSEheVdbWZDx/
 MtY658swDQt+CaynUkCRMZVBPnsIKtycKlcahVJBctSfzyea8BVk5dAFn
 hcTuBBIUDndtIaCf1iGdrlfp2HNzB5oClflpa8ueqT4tiLicokjMCA3cI
 tg4V2EokDdsLc8PpDOk60r0JnQgAABnfT0Rj8rv42A3a9bP+hLNEiX5I1
 L2MdrKX0sHraTJmjJdu4eDwZgVFIwGfBI5zlelaTp4W1DI4stHRRLjf26 g==;
X-CSE-ConnectionGUID: Afe22ScdTzujq1ZDkTP83g==
X-CSE-MsgGUID: NbZT/xUuRvaTyHd0WR5/vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84839580"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="84839580"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:54:35 -0700
X-CSE-ConnectionGUID: mH6Z/uc1Tx2SIV4s0HS+Pw==
X-CSE-MsgGUID: X0Y8IAKiRvG4XewT+4q0NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="255876703"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 14 Jul 2026 03:54:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 1/7] drm/xe: add page size allocation control state to
 xe_device
Date: Tue, 14 Jul 2026 16:25:40 +0530
Message-ID: <20260714105538.170849-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
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

From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

Introduce xe_page_size_alloc_ctrl_mode and add page_size_alloc_ctrl
state to struct xe_device along with mutex lock.

The new control supports forcing user BO allocations to 2M pages,
forcing them to 1G pages, or using a mixed round-robin mode across
4K, 64K, 2M, and 1G page sizes. Track the current mixed-mode index
in xe_device so allocation policy can be applied consistently.

v2
- make cur_index to atomic as update need in later patch to
  avoid race/concurency (sashiko)
v3
- reworded comments
- protect mode/index updates with a mutex for proper concurrency handling

v4(sashiko)
- move xe_debug_page_size_alloc_ctrl_init() before drm_dev_register(),
  so mutex and control states are initialized
  before any userspace visibility

v5(Himal)
- Guard all the debug page size policy code under CONFIG
- Squash Kconfig patch to have Kconfig entry for DEBUG_PAGE_SIZE
- Add inline to check debug page size support and exact mode
  configured if it is supported.

v6 (fix CI build)

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug     | 16 ++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 13 +++++++++++-
 drivers/gpu/drm/xe/xe_device.h       | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 31 ++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01227c77f6d7..79118d9efd93 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -86,6 +86,22 @@ config DRM_XE_KUNIT_TEST
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_PAGE_SIZE
+	bool "Enable debug control for user BO page-size allocation"
+	depends on DRM_XE_DEBUG && DEBUG_FS
+	help
+	  Expose a debugfs knob to override user BO page-size allocation
+	  handling for validation and debug. Supported modes include forced
+	  2M, forced 1G, and a mixed mode that exercises 4K, 64K, 2M, and
+	  1G page-size paths on platforms that support them.
+
+	  This is an unstable debugfs interface intended for development and
+	  validation only. Its layout, contents, and existence may change or
+	  be removed at any time with no regression warranty.
+
+	  Recommended for driver developers only.
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_GUC
         bool "Enable extra GuC related debug options"
         depends on DRM_XE_DEBUG
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c9fa4bfed2b9..78dab9ae4f1b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -923,6 +923,15 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static void xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
+{
+	mutex_init(&xe->page_size_alloc_ctrl.lock);
+	xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE;
+	xe->page_size_alloc_ctrl.cur_index = 0;
+}
+#endif
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1074,7 +1083,9 @@ int xe_device_probe(struct xe_device *xe)
 	err = xe_psmi_init(xe);
 	if (err)
 		return err;
-
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+	xe_debug_page_size_alloc_ctrl_init(xe);
+#endif
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index a03760d0ce38..df574738e3f5 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -212,6 +212,36 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged.flag);
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static inline bool xe_debug_page_size_supported(struct xe_device *xe)
+{
+	return IS_DGFX(xe);
+}
+
+static inline bool xe_debug_exact_page_size_mode(struct xe_device *xe)
+{
+	enum xe_page_size_alloc_ctrl_mode mode;
+
+	if (!xe_debug_page_size_supported(xe))
+		return false;
+
+	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+
+	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M ||
+	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G;
+}
+#else
+static inline bool xe_debug_page_size_supported(struct xe_device *xe)
+{
+	return false;
+}
+
+static inline bool xe_debug_exact_page_size_mode(struct xe_device *xe)
+{
+	return false;
+}
+#endif
+
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 022e08205897..16f0cfe43ab0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -61,6 +61,23 @@ enum xe_wedged_mode {
 	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
 };
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+/**
+ * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE: Use the normal allocation policy
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M: Force user BO allocations to 2M pages
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G: Force user BO allocations to 1G pages
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED: Select page sizes in round-robin order
+ *     (4K, 64K, 2M, 1G)
+ */
+enum xe_page_size_alloc_ctrl_mode {
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE = 0,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED
+};
+#endif
+
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
 #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
@@ -474,6 +491,20 @@ struct xe_device {
 	/** @late_bind: xe mei late bind interface */
 	struct xe_late_bind late_bind;
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+	/**
+	 * @page_size_alloc_ctrl: User BO page-size allocation
+	 * debug control state
+	 */
+	struct {
+		/** @page_size_alloc_ctrl.mode: xe page size allocation control mode */
+		enum xe_page_size_alloc_ctrl_mode mode;
+		/** @page_size_alloc_ctrl.cur_index: Round-robin index used by mixed mode */
+		u32 cur_index;
+		/** @page_size_alloc_ctrl.lock: Protects @mode and @cur_index */
+		struct mutex lock;
+	} page_size_alloc_ctrl;
+#endif
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
-- 
2.43.0

