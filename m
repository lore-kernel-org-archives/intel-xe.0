Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7F2C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 02:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112BE10EBBF;
	Tue, 14 Jul 2026 02:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMxockK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0585C10EBBF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 02:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783997868; x=1815533868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=svroKjqAiO0KyBOpyZkY8q1bnAkbajZP0zUy4sIvu0U=;
 b=FMxockK4hQWKYOHnCoqmY00rwVEtXF/ByTJiGxg8f583YPzbEvvbXCvO
 UjtCP3fjQtQXcNoqGpHT3/HJ0RbBRhTtiAr4sZx2dyN12rIUyAPTFojLt
 joR7JJzspG2vl+W9tZWyqxIiBPJZWO1hB0OytYn96IohIioga1B4gDDQ+
 KRs3TjQlR7RDip/M6hvsu9Syf5W0XHI5jyKwNg4tnHdfAvSYWRWZQE5Hu
 TRXNuVLD6CLkw7bKTp9HFLX3NIbEB6tJIrvF2KWQtZ03rbk9OmGmTnybr
 7GNT1KpHcr4JcQv+ek7ClUUa467fiQLi2W3st1afgY9/G6C69nvJTFCGI g==;
X-CSE-ConnectionGUID: 2/di1gK7TQuxLVML5YiE/w==
X-CSE-MsgGUID: K+sFb71uTqu9CepCADzujQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84661072"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84661072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 19:57:48 -0700
X-CSE-ConnectionGUID: r9Zgr3QkQyeuqg2EU5LzXg==
X-CSE-MsgGUID: XcxRrYrFT4O5QFGBV09CAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255777077"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 13 Jul 2026 19:57:47 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH V6 4/7] drm/xe: apply debug page-size allocation policy to
 user BOs
Date: Tue, 14 Jul 2026 08:27:54 +0530
Message-ID: <20260714025757.3369931-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714025757.3369931-1-naresh.kumar.g@intel.com>
References: <20260714025757.3369931-1-naresh.kumar.g@intel.com>
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

Apply the debug page-size allocation policy during user BO creation.

When page-size allocation control is enabled, override the user BO
page-size selection flags based on the selected debug mode and round the
requested size up to the corresponding granularity:
  - 2M mode selects 2M handling
  - 1G mode selects 1G handling
  - mixed mode selects the page size from the current mixed-mode index

This is intended for internal debug and validation flows. When the
control mode is left at the default setting, the normal user BO creation
path is unchanged.

v2
- ensure debug page-size allocation does not
  affect the default path (sashiko)
- rework synchronization for concurrent access (sashiko)
- refactor commit message for readability

v3
- update user BO size alignment based on debug policy mode
- reword commit message
- ensure normal user flow is unchanged when debug policy is disabled

v4(sashiko)
- limit debug page-size policy application to VRAM BOs
- do not override preexisting page-size requirement flags
- advance mixed-mode index only after successful
  BO create ioctl completion
- add overflow checks before ALIGN() in debug page-size handling
- ensure CONFIG_DRM_XE_DEBUG_PAGE_SIZE enabled and it is dgfx

v5(Himal)
v5:
- Guard debug page-size policy paths with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
- Leave the normal BO creation path unchanged
  when no debug mode is selected

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 154 +++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9dbf59fad421..bccc3611dca3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2612,6 +2612,148 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
 	return ret ? ERR_PTR(ret) : bo;
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe)
+{
+	if (!IS_DGFX(xe) ||
+	    READ_ONCE(xe->page_size_alloc_ctrl.mode) !=
+	    XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		return;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+	if (xe->page_size_alloc_ctrl.mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		xe->page_size_alloc_ctrl.cur_index++;
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+}
+
+static bool xe_size_align_overflows(size_t size, size_t align)
+{
+	return size > SIZE_MAX - (align - 1);
+}
+
+static u32 get_flag_from_cur_index_in_mixed_mode(struct xe_device *xe, size_t *align_size,
+						 int *err)
+{
+	static const u32 map[4] = {
+		0, /* default mode 4K */
+		XE_BO_FLAG_NEEDS_64K,
+		XE_BO_FLAG_NEEDS_2M,
+		XE_BO_FLAG_NEEDS_1G,
+	};
+	u32 idx;
+
+	lockdep_assert_held(&xe->page_size_alloc_ctrl.lock);
+
+	*err = 0;
+	idx = xe->page_size_alloc_ctrl.cur_index % ARRAY_SIZE(map);
+
+	if (!map[idx])
+		return 0;
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_64K) {
+		if (xe_size_align_overflows(*align_size, SZ_64K)) {
+			*err = -EINVAL;
+			return 0;
+		}
+		*align_size = ALIGN(*align_size, SZ_64K);
+		return map[idx];
+	}
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_2M) {
+		if (xe_size_align_overflows(*align_size, SZ_2M)) {
+			*err = -EINVAL;
+			return 0;
+		}
+		*align_size = ALIGN(*align_size, SZ_2M);
+		return map[idx];
+	}
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_1G) {
+		if (xe_size_align_overflows(*align_size, SZ_1G)) {
+			*err = -EINVAL;
+			return 0;
+		}
+		*align_size = ALIGN(*align_size, SZ_1G);
+		return map[idx];
+	}
+
+	return 0;
+}
+
+static int xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
+					      u32 *bo_flags,
+					      size_t *size)
+{
+	enum xe_page_size_alloc_ctrl_mode mode;
+	u32 want = 0;
+	size_t align_size = *size;
+	int err = 0;
+
+	if (!IS_DGFX(xe))
+		return 0;
+	/*
+	 * The debug page-size policy is only meaningful for BOs placed in
+	 * VRAM, where the downstream BO init path can
+	 * actually honor the corresponding minimum page-size requirement.
+	 */
+	if (!(*bo_flags & XE_BO_FLAG_VRAM_MASK))
+		return 0;
+
+	/*
+	 * Do not override existing page-size requirement flags, since they
+	 * may reflect functional requirements for specific BO types.
+	 */
+	if (*bo_flags & (XE_BO_FLAG_NEEDS_64K |
+			 XE_BO_FLAG_NEEDS_2M |
+			 XE_BO_FLAG_NEEDS_1G))
+		return 0;
+
+	if (!READ_ONCE(xe->page_size_alloc_ctrl.mode))
+		return 0;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+
+	mode = xe->page_size_alloc_ctrl.mode;
+	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE) {
+		goto out_unlock;
+	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M) {
+		if (xe_size_align_overflows(align_size, SZ_2M)) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+		want = XE_BO_FLAG_NEEDS_2M;
+		align_size = ALIGN(align_size, SZ_2M);
+	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G) {
+		if (xe_size_align_overflows(align_size, SZ_1G)) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+		want = XE_BO_FLAG_NEEDS_1G;
+		align_size = ALIGN(align_size, SZ_1G);
+	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED) {
+		want = get_flag_from_cur_index_in_mixed_mode(xe, &align_size, &err);
+		if (err)
+			goto out_unlock;
+	} else {
+		goto out_unlock;
+	}
+
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+
+	*bo_flags |= want;
+	/*
+	 * Apply the debug page-size policy by rounding the user BO size up to
+	 * the selected granularity.
+	 */
+	*size = align_size;
+	return err;
+
+out_unlock:
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+	return err;
+}
+#endif
+
 /**
  * xe_bo_create_user() - Create a user BO
  * @xe: The xe device.
@@ -2632,9 +2774,18 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 				u32 flags, struct drm_exec *exec)
 {
 	struct xe_bo *bo;
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+	int err;
+#endif
 
 	flags |= XE_BO_FLAG_USER;
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+
+	err = xe_bo_apply_debug_page_size_policy(xe, &flags, &size);
+	if (err)
+		return ERR_PTR(err);
+#endif
 	if (vm || exec) {
 		xe_assert(xe, exec);
 		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
@@ -3449,6 +3600,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto out_bulk;
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+	xe_bo_debug_mixed_mode_cur_index_advance(xe);
+#endif
 	args->handle = handle;
 	goto out_put;
 
-- 
2.43.0

