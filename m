Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ECBFF510C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 15:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB98F10E47F;
	Tue,  7 Apr 2026 15:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U88O1bD1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6828110E480;
 Tue,  7 Apr 2026 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775577093; x=1807113093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=frEvjBBZAHPSnrSXKeFbDeYbNCnm+340DRmPkouemao=;
 b=U88O1bD1Usc/tE414BuBV3z+bYLG1KZyOjTbW/NajZaYkXolBgICsahy
 Dg6FobzzVpdhX2vq+qin2lUxgSe9GkPTlYgCYsMqtHc/A331DKdkuqGi7
 20RmN8ZvYS6of9re40sC+7ABMy3OP+0QVwtE1/SIV4gELbRNR5sbsfJjw
 sIFrAsJqStJTGSEP9c5EHjeAwLQeDqCm70w8OlKxm2NaUP0NENoCD6A+C
 RuPyWYhD+rvlGsWzz/h5ifcUaig+jA+l4Q8hXrQU8klx+PbkLxT4lfYg7
 mLpmVCQRUscZdVOyYR7LJxQQDtYKpXsonCJi49iDDEo4Hk6IzrOQaYibk A==;
X-CSE-ConnectionGUID: qMsIT9QxS4iiTvitTkvM+g==
X-CSE-MsgGUID: qTMXvbUkS02IMIE1bgEynQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76614823"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76614823"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:33 -0700
X-CSE-ConnectionGUID: faw+V2cXTi2l+nQ2Orz30A==
X-CSE-MsgGUID: V9v6G2qOS9O1JJr0mYfkgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="229876010"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:32 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/12] drm/i915/selftests: Eliminate duplicate vma size check
Date: Tue,  7 Apr 2026 18:50:51 +0300
Message-ID: <20260407155053.32156-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Both remapped and rotated views need the exact same size check.
Currently that is being done separately for each type. Share
the code by just checking for !NORMAL view. This test doesn't
use I915_GTT_VIEW_PARTIAL so the inverse check is fine here.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 7c4111e60f2e..258557388a2d 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -634,7 +634,7 @@ static int igt_vma_rotate_remap(void *arg)
 
 					expected_pages = remapped_size(view.type, &plane_info[0], &plane_info[1]);
 
-					if (view.type == I915_GTT_VIEW_ROTATED &&
+					if (view.type != I915_GTT_VIEW_NORMAL &&
 					    vma->size != expected_pages * PAGE_SIZE) {
 						pr_err("VMA is wrong size, expected %lu, found %llu\n",
 						       PAGE_SIZE * expected_pages, vma->size);
@@ -642,14 +642,6 @@ static int igt_vma_rotate_remap(void *arg)
 						goto out_object;
 					}
 
-					if (view.type == I915_GTT_VIEW_REMAPPED &&
-					    vma->size > expected_pages * PAGE_SIZE) {
-						pr_err("VMA is wrong size, expected %lu, found %llu\n",
-						       PAGE_SIZE * expected_pages, vma->size);
-						err = -EINVAL;
-						goto out_object;
-					}
-
 					if (vma->pages->nents > expected_pages) {
 						pr_err("sg table is wrong sizeo, expected %u, found %u nents\n",
 						       expected_pages, vma->pages->nents);
-- 
2.52.0

