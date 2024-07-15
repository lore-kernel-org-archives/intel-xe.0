Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C26AC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 18:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC3610E48A;
	Mon, 15 Jul 2024 18:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1RObgXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CEE10E48A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721066761; x=1752602761;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6e1idfTrSQ9zFKWGqRaW1kesXTYg2l4vejlWtS9qLS0=;
 b=a1RObgXJOlTVLBdPmZrhgRnD3klqyYDVHMVts09qRUHTJeWxytJetW7q
 8zsufNNt6Kcp090ZHkjKgz4maiEs9yVFXNiIeH0XjQUkYMV5KldRKtEsm
 dstDRPO7Bb24EKcX8sI30UhkkvPQ+cOe3M80yGjYlbYHfAV6uIA+/rgQ0
 4q5IAK3r1cuABQLzVkscBSUUhk9EVQ5VB6ngnSWn0M6KojKQYvR0VgOox
 +t7wo3Cmp+IyYbUdxwdcfZlge/sGg47QMpQ2+cVSSzOc0vdWhA6kf4PwW
 OJB97K38HSMKyPlC0vbApKnYThhIqvS26L0wUr1+fxL8LycWRESvuF0oE g==;
X-CSE-ConnectionGUID: JmlEK9D2QNOG0nwGOS3m0g==
X-CSE-MsgGUID: PiqonyAFTfmOcsYzLopJmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18579913"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18579913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 11:05:54 -0700
X-CSE-ConnectionGUID: zl/ZwHSHSc2RxK1HNdWYPw==
X-CSE-MsgGUID: 8du4XSSdTbuDJ15DHuDc5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49556562"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.120])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 11:05:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Add NEEDS_2M BO flag
Date: Mon, 15 Jul 2024 20:05:38 +0200
Message-Id: <20240715180538.1418-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240715180538.1418-1-michal.wajdeczko@intel.com>
References: <20240715180538.1418-1-michal.wajdeczko@intel.com>
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

In addition of NEEDS_64K BO flag, add similar one to force 2 MiB
alignment of the buffer objects. Explicitly use this flag during
VF LMEM provisioning as LMTT uses 2 MiB pages and one day we may
drop requirement of allocating pinned objects as contiguous.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 | 11 ++++++-----
 drivers/gpu/drm/xe/xe_bo.h                 |  3 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index da35b4a21739..3295bc92d7aa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1264,13 +1264,14 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
-	     (flags & XE_BO_FLAG_NEEDS_64K))) {
-		aligned_size = ALIGN(size, SZ_64K);
+	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
+		size_t align = flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
+
+		aligned_size = ALIGN(size, align);
 		if (type != ttm_bo_type_device)
-			size = ALIGN(size, SZ_64K);
+			size = ALIGN(size, align);
 		flags |= XE_BO_FLAG_INTERNAL_64K;
-		alignment = SZ_64K >> PAGE_SHIFT;
-
+		alignment = align >> PAGE_SHIFT;
 	} else {
 		aligned_size = ALIGN(size, SZ_4K);
 		flags &= ~XE_BO_FLAG_INTERNAL_64K;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 2afc50132c2b..1c9dc8adaaa3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -37,7 +37,8 @@
 #define XE_BO_FLAG_NEEDS_CPU_ACCESS	BIT(13)
 #define XE_BO_FLAG_NEEDS_UC		BIT(14)
 #define XE_BO_FLAG_NEEDS_64K		BIT(15)
-#define XE_BO_FLAG_GGTT_INVALIDATE	BIT(16)
+#define XE_BO_FLAG_NEEDS_2M		BIT(16)
+#define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 4699b7836001..52c7277d243d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1401,6 +1401,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 				  ALIGN(size, PAGE_SIZE),
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				  XE_BO_FLAG_NEEDS_2M |
 				  XE_BO_FLAG_PINNED);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
-- 
2.43.0

