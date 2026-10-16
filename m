Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B26CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F218611261D;
	Fri, 16 Oct 2026 07:19:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A04112624
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135142; x=1823671142;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MR7PzklUFQKqbNANMjnt50S/S+piLkX76zb/gylRs8o=;
 b=Ei+I3eejhnwBr4Pv8+2UZ40SdeGb77G5oulDkFVPio2n+HzXS7p7nk7u
 QGGXpsUK03Xq9VXdPEgoZg3carGCPxUCFaGDlMUvu8hgQNAij1AlJbswZ
 8hHAoljG8yyYJUISQ3A4nVambyWkuoeSSmKDS5uk0tG6IWuSiS33c0PKe
 To+9CHznjh8a1EffFMWakovOxGqd7Z0aDJ2uDi5oZ1BaFaYtmuZSH11hK
 xJuwydNcg4B0xdN3HUgWycYf0XqrZfmL1Sz3/cZnYzOP4HBk5crY1Kh7Z
 bl5h3jSHcSjiA9lOrjBLbeqXe4zNWpUAYSpm12bYwXGYs1MpnXUt3L+3M w==;
X-CSE-ConnectionGUID: 0OkYJlOSSXyWtfM/LzuLTg==
X-CSE-MsgGUID: 5/cYAufJSaGZHJLzNBs2Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813656"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:53 -0700
X-CSE-ConnectionGUID: pCtRsA/yReW1ti5UQLVJiQ==
X-CSE-MsgGUID: Sk2sEuuZSY65VvuHYId5Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787280"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:52 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 12/18] drm/xe: Invalidate existing VRAM mappings on wedge
Date: Fri, 16 Oct 2026 12:48:22 +0530
Message-ID: <20261016071832.222574-13-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

CPU mappings created before a device wedge can keep valid PTEs and
continue accessing VRAM. Mapping new faults to a dummy page does not
replace these existing mappings.

Use the common device I/O SRCU gate to wait for active CPU faults to
finish. Then invalidate all tracked VRAM mappings. Faults starting
after the wedge use the per-BO dummy page.

This ensures userspace is notified only after existing VRAM mappings
have been removed.

v2:
- Drain active faults before invalidating VRAM mappings

v3:
- Use the common DRM device SRCU gate instead of a separate VRAM fault
  SRCU domain.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c     | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h     |  1 +
 drivers/gpu/drm/xe/xe_device.c |  4 ++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 20dcaf4cb9f1..e5f8c8b6db94 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -4235,6 +4235,26 @@ void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
 	list_del_init(&bo->vram_userfault_link);
 }
 
+/**
+ * xe_bo_wedged_invalidate_mmaps - Invalidate CPU mappings backed by VRAM
+ * @xe: xe device instance
+ *
+ * The caller must drain the common device I/O gate before calling this
+ * function. Remove all tracked VRAM mappings so later faults map the
+ * per-BO dummy page.
+ */
+void xe_bo_wedged_invalidate_mmaps(struct xe_device *xe)
+{
+	struct xe_bo *bo, *next;
+
+	mutex_lock(&xe->mem_access.vram_userfault.lock);
+	list_for_each_entry_safe(bo, next,
+				 &xe->mem_access.vram_userfault.list,
+				 vram_userfault_link)
+		xe_bo_runtime_pm_release_mmap_offset(bo);
+	mutex_unlock(&xe->mem_access.vram_userfault.lock);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_bo.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77b3a02e9b8e..3bd19866819c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -453,6 +453,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
 void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
+void xe_bo_wedged_invalidate_mmaps(struct xe_device *xe);
 
 int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_device *dev,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7010d1320f8d..82743ca2d3f8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -936,6 +936,10 @@ static void xe_device_wedged_work(struct work_struct *work)
 	unsigned long method;
 	int err;
 
+	/* Drain active faults before invalidating VRAM mappings. */
+	xe_device_io_drain(xe);
+	xe_bo_wedged_invalidate_mmaps(xe);
+
 	/* Report at most one recovery method per worker invocation. */
 	method = READ_ONCE(xe->wedged.method);
 	if (method != READ_ONCE(xe->wedged.reported_method)) {
-- 
2.43.0

