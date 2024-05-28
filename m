Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576ECC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE7E10E36C;
	Tue, 28 May 2024 12:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJWeKSJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43E410E36C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716898136; x=1748434136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gwYxL3uvvYdBwkXPRmdVz9qNSANfU7P8PVi2i9PnDRE=;
 b=UJWeKSJWYZWQusnqnw1bLtcmAo83Q3rXG21N2IucA4bWOyCh7XrShB6R
 3NDj2xQjy1qQP8pAdv//AH43wWD06yAx0aUXJzHgZnLn0uqgXdxXVTwfW
 qHnneafvl0oc8VcRklpvjozIoKP3dW2s4WOHATZxzwkYp6zsfagRsoQv/
 MVtYCm7k+qFFvgcAd0IH1iSz34x3Kq8jXlXqiTqv2iEuWZCkTgjuNB54I
 Ai+mionbxms1z3pwNDw5Bwqi+YmAGebGjjNyIeLfX6eg+IPCCM0oRuE+B
 pXgEE+nNTUlysiHDSlfnyjiyv9lJ2gw5NVra3Q6fvdTYVN5w4SUlplVS3 g==;
X-CSE-ConnectionGUID: CXEGfdCKTACcjqEqAgCamg==
X-CSE-MsgGUID: JkWwv09KQ8GvGygkuxd8fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13062040"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13062040"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:08:56 -0700
X-CSE-ConnectionGUID: 9OUBibOkR9Cc6L8uTw+BYA==
X-CSE-MsgGUID: f63qAt3DRv+0AQW6/oyQDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35042100"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:08:55 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe: Check empty pinned BO list with lock held.
Date: Tue, 28 May 2024 13:54:08 +0200
Message-ID: <20240528115408.22094-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Use lock that is meant to use for accessing the BO pin list.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 03f7fe7acf8c..2bae01ce4e5b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1758,11 +1758,10 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_pinned(bo));
 	xe_assert(xe, xe_bo_is_user(bo));
 
-	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link)) {
-		spin_lock(&xe->pinned.lock);
+	spin_lock(&xe->pinned.lock);
+	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link))
 		list_del_init(&bo->pinned_link);
-		spin_unlock(&xe->pinned.lock);
-	}
+	spin_unlock(&xe->pinned.lock);
 
 	ttm_bo_unpin(&bo->ttm);
 
@@ -1785,9 +1784,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 		struct ttm_place *place = &(bo->placements[0]);
 
 		if (mem_type_is_vram(place->mem_type)) {
-			xe_assert(xe, !list_empty(&bo->pinned_link));
-
 			spin_lock(&xe->pinned.lock);
+			xe_assert(xe, !list_empty(&bo->pinned_link));
 			list_del_init(&bo->pinned_link);
 			spin_unlock(&xe->pinned.lock);
 		}
-- 
2.42.0

