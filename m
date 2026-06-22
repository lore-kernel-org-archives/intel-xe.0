Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD277CDB475
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FFF10E4D1;
	Mon, 22 Jun 2026 06:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9RGIt+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA1E10E285
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111582; x=1813647582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ro/UwPWXCQEowMnNDzu6UPnOUhsYMK6Zf2PnTYG1gto=;
 b=H9RGIt+oBLfM1U79YsQ3JEfFUml9Oe8pMnYwnXwRsPXIOSHkwWsDeA2v
 dUrfN+FZh3j8ravrc5V+nVfMrJUuoEMunlpKYUxrTaJ8mYW/OI8nUb7Oj
 v/tObUEjc+VYxtdCXSBOmaZSV6N2dE0J1C8R7cnX6lNEd9yLc8s4KINt9
 t4CkzaWrHsByAb3iVt++ItUi5oBo8j4ClfP0XcbSWwsSKTlX8UMSMxBmS
 PHk1x4fWn2wDVMFd3LwP4TJQlt4YxA82ABmc8qG1SsPpfktEPgDdOXPuy
 PN4W+Zd4SiFKQKX6geeYg7hvl+VXtwC8mg9iC/YBq+7rJQXm0P871Icvf w==;
X-CSE-ConnectionGUID: oMj3emXwSra4mgq3HmZwDQ==
X-CSE-MsgGUID: y37QIKRURjilGNoBRF0QmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928747"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:41 -0700
X-CSE-ConnectionGUID: MksLHxg9Q7CIN2WgHIkmFQ==
X-CSE-MsgGUID: i9n9b5qpTlSAw6YQTpqIFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068113"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:39 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 5/9] drm/xe: apply debug page-size policy to user BO creation
Date: Mon, 22 Jun 2026 12:30:27 +0530
Message-ID: <20260622070031.2445502-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

Hook user BO creation into the debug page-size allocation policy.

When a debug page-size mode is active, set the corresponding BO page-size
flags during xe_bo_create_user() and pass a non-zero min_align override
marker into the BO creation path so page-size-specific alignment handling
can be applied by the lower-level allocation flow. Mixed mode rotates
across default(4K), 64K, 2M, and 1G selections on successive BOs.

This is intended for debug and validation of user BO allocation behavior
under different page-size policies.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 48 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 45ff01df68e1..31c0e50f85be 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2512,7 +2512,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 	if (IS_ERR(bo))
 		return bo;
 
-	bo->min_align = alignment;
+	bo->min_align = 0;
 
 	/*
 	 * Note that instead of taking a reference no the drm_gpuvm_resv_bo(),
@@ -2612,6 +2612,50 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
 	return ret ? ERR_PTR(ret) : bo;
 }
 
+static u32 get_flag_from_cur_index_in_mixed_mode(struct xe_device *xe)
+{
+	static const u32 map[4] = {
+		0, //default mode 4K
+		XE_BO_FLAG_NEEDS_64K,
+		XE_BO_FLAG_NEEDS_2M,
+		XE_BO_FLAG_NEEDS_1G,
+	};
+	u32 idx;
+
+	idx  = READ_ONCE(xe->page_size_alloc_ctrl.cur_index) % 4;
+
+	/* Update next index for next iteration */
+	WRITE_ONCE(xe->page_size_alloc_ctrl.cur_index,
+		   xe->page_size_alloc_ctrl.cur_index + 1);
+
+	return map[idx];
+}
+
+static void xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
+					       u32 *bo_flags)
+{
+	int mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+	u32 want = 0;
+
+	if (!xe_device_supports_multi_pagesize(xe))
+		return;
+
+	/* No action if default mode */
+	if (!mode)
+		return;
+
+	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M)
+		want = XE_BO_FLAG_NEEDS_2M;
+	else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G)
+		want = XE_BO_FLAG_NEEDS_1G;
+	else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		want = get_flag_from_cur_index_in_mixed_mode(xe);
+	else
+		return;
+
+	*bo_flags |= want;
+}
+
 /**
  * xe_bo_create_user() - Create a user BO
  * @xe: The xe device.
@@ -2635,6 +2679,8 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 
 	flags |= XE_BO_FLAG_USER;
 
+	xe_bo_apply_debug_page_size_policy(xe, &flags);
+
 	if (vm || exec) {
 		xe_assert(xe, exec);
 		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
-- 
2.43.0

