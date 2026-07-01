Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6E0C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F10410F063;
	Wed,  1 Jul 2026 16:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ilf2LtLv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9630910F063
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782923599; x=1814459599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tADu/lBkaP1L/v1oaVT2h2WLbvJmKuA3v0vyik/w+eM=;
 b=Ilf2LtLvBvyZp9M8yyx+dbyoOCN949eO2Wlp8ue0vLkUdWyp9r7fPnPr
 4R1Jxv8DZTcl9XPv840+OQ2X05LS2PXxGf21QlmNG2GRUxFJLHj7RbRMD
 x8Qh6zRvM4Eq1J07mBbf91vJ29t7ci9nKJhjDfkmUpS8Mt21qTwQ0oHEu
 kKG+0D4ZIdXVlIWHQzeFeTRpdrU5OTyI7CI3WCy0/IPYWufnZHJa7ZKcV
 pWeKg1G/ClAK6Ch/Xzuju2L7GoQRQyyIYM7aVmfHszbZ4/W/a642lMGkk
 j7uxgbyYY/66ZqKQLv6McskqTeGmLWbYIC26lcAOAYeC5TJALRH/c5uqH Q==;
X-CSE-ConnectionGUID: pVqan9DxRbi+QgX4QmmpRA==
X-CSE-MsgGUID: 6mqTdjLkTx+/TPkoMNCz5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82779255"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82779255"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:33:19 -0700
X-CSE-ConnectionGUID: 6nMEa/9yRqSpw+/xoIbBfw==
X-CSE-MsgGUID: A03dAZ2BRCqf0Ut0myMHtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256196444"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 09:33:18 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 5/8] drm/xe: apply debug page-size policy to user BO
 creation
Date: Wed,  1 Jul 2026 22:03:45 +0530
Message-ID: <20260701163348.3432358-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
References: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
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

Apply the debug page-size allocation policy in xe_bo_create_user().

In 2M-only and 1G-only modes, set the matching BO flag when the
requested size is aligned. In mixed mode, rotate across 4K, 64K, 2M,
and 1G, and set the selected flag only when the size is aligned for
it.

Otherwise, leave the flags unchanged and use the default allocation
behavior.

This makes user BO creation follow the same debug page-size policy as
other BO allocation paths.

v2
- make sure debug page-size allocation do not
  break default/usual path(sashiko)
- add atomic accesses to avoid race for concurrent access(sashiko)
- refactored commit messages for readability

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 45ff01df68e1..e1da9701c898 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2612,6 +2612,60 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
 	return ret ? ERR_PTR(ret) : bo;
 }
 
+static u32 get_flag_from_cur_index_in_mixed_mode(struct xe_device *xe, size_t size)
+{
+	static const u32 map[4] = {
+		0, //default mode 4K
+		XE_BO_FLAG_NEEDS_64K,
+		XE_BO_FLAG_NEEDS_2M,
+		XE_BO_FLAG_NEEDS_1G,
+	};
+	u32 idx;
+
+	idx = (atomic_inc_return(&xe->page_size_alloc_ctrl.cur_index) - 1) % 4;
+
+	if (!map[idx] && IS_ALIGNED(size, SZ_4K))
+		return 0;
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_64K && IS_ALIGNED(size, SZ_64K))
+		return map[idx];
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_2M && IS_ALIGNED(size, SZ_2M))
+		return map[idx];
+
+	if (map[idx] == XE_BO_FLAG_NEEDS_1G && IS_ALIGNED(size, SZ_1G))
+		return map[idx];
+
+	return 0;
+}
+
+static void xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
+					       u32 *bo_flags,
+					       size_t size)
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
+	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M && IS_ALIGNED(size, SZ_2M))
+		want = XE_BO_FLAG_NEEDS_2M;
+	else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G &&
+		 IS_ALIGNED(size, SZ_1G))
+		want = XE_BO_FLAG_NEEDS_1G;
+	else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		want = get_flag_from_cur_index_in_mixed_mode(xe, size);
+	else
+		return;
+
+	*bo_flags |= want;
+}
+
 /**
  * xe_bo_create_user() - Create a user BO
  * @xe: The xe device.
@@ -2635,6 +2689,8 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 
 	flags |= XE_BO_FLAG_USER;
 
+	xe_bo_apply_debug_page_size_policy(xe, &flags, size);
+
 	if (vm || exec) {
 		xe_assert(xe, exec);
 		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
-- 
2.43.0

