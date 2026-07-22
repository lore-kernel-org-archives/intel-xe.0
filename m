Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBD0C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 14:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA49310EE15;
	Wed, 22 Jul 2026 14:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g10Hjyjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0546410EE15
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784731072; x=1816267072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L/EgxmxK7S4lYHTENaiSCilUSKn0zrEd8OAmGcIszyA=;
 b=g10HjyjzI3NlNuLQHnsBFIfSJ29nGEBAaX5fwjJDiIb4XDwFbJy0ZaUr
 T45atLUF+3Ze2BiFDcKhevglKA8eTgjaa/tztS6+t6lhujvWjiLZwXJ8n
 Ak2o6JTm67MBY4murg9ZFrD55QDQqRNZ+ekJg+ocOemTjFqhAaX+eGPag
 bo9ZtmRiyhGsLppbEhCGscDAlTto4lRAc7XuTKcYGvNGmd1DdwhhgqjsQ
 q84FhIE/tO/uClTjFx/70rMoi3RRUW6vvF9BwCCBsGxo8AuJOzNSCZb57
 w8tB0KOdWCpKdEmBHIIafKJElQUg2jUl0O21ZCwbD1sMEPqlghjskZVWV g==;
X-CSE-ConnectionGUID: kvQgOhMrTvSV+vm9VOi9KQ==
X-CSE-MsgGUID: Ft19s/h+SAuuqye6Zl9+Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102777837"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="102777837"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:37:52 -0700
X-CSE-ConnectionGUID: digrn5H6QjykYinPwe0oQA==
X-CSE-MsgGUID: 6MjnCTW5QX+PS2xRDy9YyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="261653198"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 07:37:51 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v8 1/6] drm/xe: add page size allocation control state to
 xe_device
Date: Wed, 22 Jul 2026 20:07:54 +0530
Message-ID: <20260722143759.1718600-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug     | 16 ++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 19 +++++++++++
 drivers/gpu/drm/xe/xe_device.h       | 48 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 31 ++++++++++++++++++
 4 files changed, 114 insertions(+)

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
index 4eed9a251e65..c715bb1cafcf 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -921,6 +921,23 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static void xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
+{
+	int err;
+
+	err = drmm_mutex_init(&xe->drm, &xe->page_size_alloc_ctrl.lock);
+	if (err)
+		return;
+	xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE;
+	xe->page_size_alloc_ctrl.cur_index = 0;
+}
+#else
+static void xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
+{
+}
+#endif
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1073,6 +1090,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_debug_page_size_alloc_ctrl_init(xe);
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

