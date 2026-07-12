Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C435C44506
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E7610E437;
	Sun, 12 Jul 2026 11:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpeNO8gW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EE810E431
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783854896; x=1815390896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GRP7z+jOZhmDfi3fgUxH8opYxXn8ucFY997ePTWrax4=;
 b=YpeNO8gWrPyIJC2IFCcmGGqFH8jhS9FiIcjG3axfx8iaDmXnlMxdFaf3
 h/M9WvqmzfORBId3uGIoNB6it6RYfg0UFSEFk8tNa58aZas9R4NSZrF95
 9tQ/ccw8wkR4HL95gbgB9lRYgI3ul+OEWbdjzEKbtI5Sft6oIMx8RCRdK
 4nndsx4ndvhpppQvDyz5ZJwSdXFiqxYbriSqVuvj3JkWvAU7Qtb564Xkx
 PoG0mQawvSb406mwyd5nOqkCADdg/FYv1CJmZRQnaqalHQBe4mH6VkmEG
 EO8iq7NZnjUUoBCX6SIag+0weJKw47fGY44YXqlprM9q4RADfyNc4lcL9 g==;
X-CSE-ConnectionGUID: BkombtZgSBC5RudZR3C58A==
X-CSE-MsgGUID: K29FFzQRTtqLm+iZDFEJlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84457635"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84457635"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 04:14:56 -0700
X-CSE-ConnectionGUID: A6zKVvEWTWejJ+HO3JZd/A==
X-CSE-MsgGUID: 191E3rkuQvapCO1yHjIUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255367724"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 04:14:56 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v3 5/8] drm/xe: apply debug page-size allocation policy to
 user BOs
Date: Sun, 12 Jul 2026 16:45:14 +0530
Message-ID: <20260712111517.1956177-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 79 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9dbf59fad421..75de27aa1770 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2612,6 +2612,83 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
 	return ret ? ERR_PTR(ret) : bo;
 }
 
+static u32 get_flag_from_cur_index_in_mixed_mode(struct xe_device *xe, size_t *align_size)
+{
+	static const u32 map[4] = {
+		0, //default mode 4K
+		XE_BO_FLAG_NEEDS_64K,
+		XE_BO_FLAG_NEEDS_2M,
+		XE_BO_FLAG_NEEDS_1G,
+	};
+	u32 idx;
+
+	idx = xe->page_size_alloc_ctrl.cur_index++ % ARRAY_SIZE(map);
+
+	if (!map[idx])
+		return 0;
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_64K) {
+		*align_size = ALIGN(*align_size, SZ_64K);
+		return map[idx];
+	}
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_2M) {
+		*align_size = ALIGN(*align_size, SZ_2M);
+		return map[idx];
+	}
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_1G) {
+		*align_size = ALIGN(*align_size, SZ_1G);
+		return map[idx];
+	}
+
+	return 0;
+}
+
+static void xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
+					       u32 *bo_flags,
+					       size_t *size)
+{
+	enum xe_page_size_alloc_ctrl_mode mode;
+	u32 want = 0;
+	size_t align_size = *size;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+
+	mode = xe->page_size_alloc_ctrl.mode;
+
+	/* No action if default mode */
+	if (!mode) {
+		mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+		return;
+	}
+
+	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M) {
+		want = XE_BO_FLAG_NEEDS_2M;
+		align_size = ALIGN(align_size, SZ_2M);
+	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G) {
+		want = XE_BO_FLAG_NEEDS_1G;
+		align_size = ALIGN(align_size, SZ_1G);
+	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED) {
+		want = get_flag_from_cur_index_in_mixed_mode(xe, &align_size);
+	} else {
+		mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+		return;
+	}
+
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+
+	*bo_flags &= ~(XE_BO_FLAG_NEEDS_64K |
+		       XE_BO_FLAG_NEEDS_2M |
+		       XE_BO_FLAG_NEEDS_1G);
+	*bo_flags |= want;
+	/*
+	 * Apply the debug page-size policy by rounding the user BO size up to
+	 * the selected granularity.
+	 */
+	*size = align_size;
+}
+
 /**
  * xe_bo_create_user() - Create a user BO
  * @xe: The xe device.
@@ -2635,6 +2712,8 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 
 	flags |= XE_BO_FLAG_USER;
 
+	xe_bo_apply_debug_page_size_policy(xe, &flags, &size);
+
 	if (vm || exec) {
 		xe_assert(xe, exec);
 		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
-- 
2.43.0

