Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03649C44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 02:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B3910E530;
	Mon, 13 Jul 2026 02:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbYcQpF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB9110E4B9
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 02:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783909665; x=1815445665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4tVxSVxWKs5vogymYxyw2+unJ7D1Api0E+USMZfDV0I=;
 b=ZbYcQpF9M4C3geUI8vLX3WMnWtPktERcICRb3Ecc6pPesluGgeK0fhnl
 xSjdZX2/6MlPxO8okRnm6mAPYDhGwUQVS8JvggXlnu4Fu3WkOIoAHkzX4
 4qGU9sU0C+MHWCWP7WZrEgGIaQTCRwRNL16It7T1dx4A0NeiBU2m61YV7
 l7FpGEOH7qsO+tpxND5+H8FwDnL6Gr+hvYN9v5eAjk698C0Ds4IjPO/aP
 hCsQuMM9AJiPTZQfCbFDTIe09dyBQtC4mWTMkdfPs5xL7zF5N1YCXOxKr
 CAid1MW5ZaKG67EdkTq0KsZeSsF8N8rNBvjHgGSoskwcZXQMEKQkh9tCW g==;
X-CSE-ConnectionGUID: DJ70PASjTWasE53IeOsupw==
X-CSE-MsgGUID: aqNYTeOMQea1WLsWWivFQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88197454"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88197454"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 19:27:44 -0700
X-CSE-ConnectionGUID: 6Ss/RpZTTKqAEw4n9cOSpw==
X-CSE-MsgGUID: uhqgUSFXQVquG/qWcatq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253680043"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 12 Jul 2026 19:27:43 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v4 5/8] drm/xe: apply debug page-size allocation policy to
 user BOs
Date: Mon, 13 Jul 2026 07:55:38 +0530
Message-ID: <20260713022541.2581814-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
References: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 145 +++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9dbf59fad421..43ae853222ea 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2612,6 +2612,144 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
 	return ret ? ERR_PTR(ret) : bo;
 }
 
+static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe)
+{
+	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG_PAGE_SIZE) || !IS_DGFX(xe))
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
+	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG_PAGE_SIZE) || !IS_DGFX(xe))
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
+
 /**
  * xe_bo_create_user() - Create a user BO
  * @xe: The xe device.
@@ -2632,9 +2770,14 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 				u32 flags, struct drm_exec *exec)
 {
 	struct xe_bo *bo;
+	int err;
 
 	flags |= XE_BO_FLAG_USER;
 
+	err = xe_bo_apply_debug_page_size_policy(xe, &flags, &size);
+	if (err)
+		return ERR_PTR(err);
+
 	if (vm || exec) {
 		xe_assert(xe, exec);
 		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
@@ -3439,6 +3582,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto out_vm;
 
+	xe_bo_debug_mixed_mode_cur_index_advance(xe);
+
 	if (args->extensions) {
 		err = gem_create_user_extensions(xe, bo, args->extensions, 0);
 		if (err)
-- 
2.43.0

