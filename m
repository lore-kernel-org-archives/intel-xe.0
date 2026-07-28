Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B70CC54F51
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 06:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50F510E536;
	Tue, 28 Jul 2026 06:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgyIRuUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2390710E52A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 06:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218501; x=1816754501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AWUmzn7HZ8aXcMkcPSz8bk6Mg8WiqkaLGqPjBpmnqs8=;
 b=jgyIRuUvcLm5GGy7qSS55W6zq8SO8xDEGAsoxiLs+u3+6q8xb6s6C/U3
 Se4d+wRpt6S8ggvRD4C/gYSMbm3KybepHNycooujpYUHh8WeInKiR57wA
 izTBYxbR0Zqy06MiHzs7lB2k4LEC+Vo22mo94d/5ZzvzHf7r81CioZW9H
 0ADP7I2YVAlzK6oJrXGcaatK6yLqiltUay0Xm/kf5Bye2DCk0KYPu/A5M
 XEVuDVb3r09yQaGNgmZ2D63Uo4LZ8giO/mjtTe1+d4WT9a6Xx4IsZGZpN
 NTlk7ZSUSnoK0poJBHuEW80ptCVFxmQvYbhlN83znhwmpgwCQPiiCLYH1 A==;
X-CSE-ConnectionGUID: vJ4gJxEhQ8GCz3AfOeSlkQ==
X-CSE-MsgGUID: YDdVJIUbTDKahdxBo1/U4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96150859"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="96150859"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:01:40 -0700
X-CSE-ConnectionGUID: Y5nk9U/CQ+6Lg1lICgCrvA==
X-CSE-MsgGUID: AGtt9YwmS2+ynyWcAnnKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="284152397"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 23:01:30 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v9 1/6] drm/xe: add page size allocation control state to
 xe_device
Date: Tue, 28 Jul 2026 11:31:27 +0530
Message-ID: <20260728060132.4067990-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060132.4067990-1-naresh.kumar.g@intel.com>
References: <20260728060132.4067990-1-naresh.kumar.g@intel.com>
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

v8 (Himal)
- use drmm_mutex_init to avoid leak with mutex_init
- call xe_debug_page_size_alloc_ctrl_init unconditionally
- Add missed mixed mode check on xe_debug_page_size_mode_not_none check
- Add xe_debug_page_size_mode_is_mixed() function

v9
- make xe_debug_page_size_alloc_ctrl_init() return int
- fail probe if drmm_mutex_init() for page_size_alloc_ctrl.lock fails

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug     | 16 ++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 25 +++++++++++++++
 drivers/gpu/drm/xe/xe_device.h       | 48 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 31 ++++++++++++++++++
 4 files changed, 120 insertions(+)

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
index 4eed9a251e65..7007b6113760 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -921,6 +921,27 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
+{
+	int err;
+
+	err = drmm_mutex_init(&xe->drm, &xe->page_size_alloc_ctrl.lock);
+	if (err)
+		return err;
+
+	xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE;
+	xe->page_size_alloc_ctrl.cur_index = 0;
+
+	return 0;
+}
+#else
+static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
+{
+	return 0;
+}
+#endif
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1073,6 +1094,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_debug_page_size_alloc_ctrl_init(xe);
+	if (err)
+		return err;
+
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index a03760d0ce38..6c4cfaebc44a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -212,6 +212,54 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged.flag);
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static inline bool xe_debug_page_size_supported(struct xe_device *xe)
+{
+	return IS_DGFX(xe);
+}
+
+static inline bool xe_debug_page_size_mode_not_none(struct xe_device *xe)
+{
+	enum xe_page_size_alloc_ctrl_mode mode;
+
+	if (!xe_debug_page_size_supported(xe))
+		return false;
+
+	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+
+	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M ||
+	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G ||
+	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
+}
+
+static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
+{
+	enum xe_page_size_alloc_ctrl_mode mode;
+
+	if (!xe_debug_page_size_supported(xe))
+		return false;
+
+	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+
+	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
+}
+#else
+static inline bool xe_debug_page_size_supported(struct xe_device *xe)
+{
+	return false;
+}
+
+static inline bool xe_debug_page_size_mode_not_none(struct xe_device *xe)
+{
+	return false;
+}
+
+static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
+{
+	return false;
+}
+#endif
+
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 860ad322237f..03a7bb08adf7 100644
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
@@ -478,6 +495,20 @@ struct xe_device {
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

