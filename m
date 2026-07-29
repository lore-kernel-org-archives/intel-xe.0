Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9803CC54F5C
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 08:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E7110EB17;
	Wed, 29 Jul 2026 08:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FrJLcOtO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE4310EB13
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785314455; x=1816850455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YoHqXDEtSEojucs82cU8t0/bk+a8HV5LxhneJ/eyGMs=;
 b=FrJLcOtOKXIAGQxauo2xBUx2fwanySHeLw2Z+W6E/GzRaT1LAwAiURtA
 rinFzxvuBbTyCcp+3HhUv4gmRyxd3IRdfzUY4j8/YPI+CAql+McL+Lhvm
 9sjCVqmjhEWSNe+/tCm2gh+C8ZIVwpPbrpExarIjMB/KrtkP9z2oZ53Qk
 WfX5581lQfCW7qbCXLg084ygpUKNCs9U4rrqE5DZVXoodmbdF97pGFzgu
 eh1TseIy7hmR1w+poO+PqjuXwfPHHf8gCaYPQ9OD4MKJq4F9iiq8yDdCy
 QZUmcEiF2FMNJMaStkcEKtyxQP9M/9q+iaNv8/5HLC4nxsblPosAOmA/u A==;
X-CSE-ConnectionGUID: 0IvbUIPfQL6dM6S6v3gcHA==
X-CSE-MsgGUID: +TR6L8jQTT64cOuxJ5pm+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89589363"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89589363"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 01:40:55 -0700
X-CSE-ConnectionGUID: f1FbKg0bTbGBw3cVOrlXew==
X-CSE-MsgGUID: K03e/DRbSHu7PN7Kgt3hLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="260568430"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2026 01:40:53 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v10 4/6] drm/xe: apply debug page-size allocation policy to
 user BOs
Date: Wed, 29 Jul 2026 14:10:44 +0530
Message-ID: <20260729084046.1050783-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729084046.1050783-1-naresh.kumar.g@intel.com>
References: <20260729084046.1050783-1-naresh.kumar.g@intel.com>
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

v8(Himal)
- Avoid current index increment for system BO's
- Simplify mixed mode align logic by changing array to struct array
- Have a inline check if it is on debug mode or not
- Avoid condition compiled debug in function code blocks

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 148 +++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cf0b7b35c331..929669f18788 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2640,6 +2640,145 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
 	return ret ? ERR_PTR(ret) : bo;
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe, struct xe_bo *bo)
+{
+	if (!xe_debug_page_size_mode_is_mixed(xe))
+		return;
+
+	if (!(bo->flags & XE_BO_FLAG_VRAM_MASK) ||
+	    !(bo->flags & XE_BO_FLAG_USER))
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
+	static const struct {
+		u32    flag;
+		size_t align;
+	} map[] = {
+		{ 0,                     SZ_4K  }, /* default: 4K, no flag */
+		{ XE_BO_FLAG_NEEDS_64K,  SZ_64K },
+		{ XE_BO_FLAG_NEEDS_2M,   SZ_2M  },
+		{ XE_BO_FLAG_NEEDS_1G,   SZ_1G  },
+	};
+	u32 idx;
+	const typeof(*map) *entry;
+
+	lockdep_assert_held(&xe->page_size_alloc_ctrl.lock);
+
+	*err = 0;
+	idx = xe->page_size_alloc_ctrl.cur_index % ARRAY_SIZE(map);
+
+	entry = &map[idx];
+
+	if (!entry->flag)
+		return 0;
+
+	if (xe_size_align_overflows(*align_size, entry->align)) {
+		*err = -EINVAL;
+		return 0;
+	}
+	*align_size = ALIGN(*align_size, entry->align);
+
+	return entry->flag;
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
+#else
+static int xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
+					      u32 *bo_flags,
+					      size_t *size)
+{
+	return 0;
+}
+
+static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe,
+						     struct xe_bo *bo)
+{
+}
+#endif
+
 /**
  * xe_bo_create_user() - Create a user BO
  * @xe: The xe device.
@@ -2660,9 +2799,16 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 				u32 flags, struct drm_exec *exec)
 {
 	struct xe_bo *bo;
+	int err = 0;
 
 	flags |= XE_BO_FLAG_USER;
 
+	if (xe_debug_page_size_mode_not_none(xe)) {
+		err = xe_bo_apply_debug_page_size_policy(xe, &flags, &size);
+		if (err)
+			return ERR_PTR(err);
+	}
+
 	if (vm || exec) {
 		xe_assert(xe, exec);
 		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
@@ -3477,6 +3623,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto out_bulk;
 
+	xe_bo_debug_mixed_mode_cur_index_advance(xe, bo);
+
 	args->handle = handle;
 	goto out_put;
 
-- 
2.43.0

