Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FCED7832F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 15:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A391710E7AD;
	Mon,  2 Dec 2024 15:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8Cx6rMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41B10E7AD
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733154107; x=1764690107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o9EDTZ0h2Rseox/2y6LB2rzR/Xg2KH3KXrQqiniX87c=;
 b=B8Cx6rMFhHnIuXgqBBFg+fdVfHYmkGNyYUPNGG0nW3BqMAbw2om8vLDi
 0T2Mc1YJk85Qe57rV/Fdkd2DG2NsRuYFZ+bfkMrmYmIS9nUFc9bNlfzjh
 XpG4gqVNDoi/Y6m1FPDgLtLIy1EthKzpQ98le4T7YWFVIm3SI5eiY3hWh
 OHDe4I6TxHyHGbEVPvA12bUr400h0psBLbv88t1W9uGyLOZ9sUaygSZ8w
 qUZLgAoo1l6u5Ve3VhKsrhx46SIirRlBVXY4ljwP5tyEeYJ75AsEH4o2k
 TOBpTNTACSRlHO6iDaLa+QsfipF8jBxGnHyq+BvT162P2VmFAqa2G+5Rf Q==;
X-CSE-ConnectionGUID: YiFZv9AjSKSL/LrDok/3UA==
X-CSE-MsgGUID: 9bbcL4s5SLe4CExUSopFLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43996376"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="43996376"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 07:41:47 -0800
X-CSE-ConnectionGUID: GiGZgiSMQTCIN5mQWWLcag==
X-CSE-MsgGUID: OiHod5LsTjaVfwF0/Z5OMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98177719"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.79])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 07:41:45 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/xe/display: fix ttm_bo_access() usage
Date: Mon,  2 Dec 2024 15:41:24 +0000
Message-ID: <20241202154123.76887-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

ttm_bo_access() returns the size on success. Account for that otherwise
the caller incorrectly thinks this is an error in
intel_atomic_prepare_plane_clear_colors().

Fixes: b6308aaa24a7 ("drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3661
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/intel_bo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 43141964f6f2..b2a8d06cc78a 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -40,8 +40,13 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, int size)
 {
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	int ret;
 
-	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
+	ret = ttm_bo_access(&bo->ttm, offset, dst, size, 0);
+	if (ret == size)
+		ret = 0;
+
+	return ret;
 }
 
 struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)
-- 
2.47.0

