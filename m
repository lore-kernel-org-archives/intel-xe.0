Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438FCD767F7
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED7210E90F;
	Thu, 31 Oct 2024 18:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGOst2B2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9F310E903
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398223; x=1761934223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZMJwEdjNoBvlGVgeI7A/wYeq0nHCWPF1Z/N58o2JT8=;
 b=bGOst2B2i5g8zbhV8l67gy1+zqS0e4VNmWC/YQ0OudmB+gNv9VjQSukj
 6/pkkfoNYvuFO46qBPtmPbxVLXlOiNtaIGrMmUgIUk/ygz4XCiXpyhk+x
 0y+RcADDi2nRQTmM6NvdFH+Dz+1Y1yO4GTgBQ9l5gXo8fHIMoUUcBlUl2
 3k370YGZhf8ddJ9PynDIhwKRSKF50B2Jjpchsr4z9pWQSkPhrCiEfv0bF
 27Ycq1M3TREXkjzAxQ1ohukWlPu5QaMZ5jn+YD0L4EqFaJijELfSJntrU
 V4riMCxvY0EgZHJJYrclbNDK2bbXI3CCAb1hcZA1k6U+OZ0iuH0lXrL8m A==;
X-CSE-ConnectionGUID: TdMzM0D9T0qTYUh38VLeLg==
X-CSE-MsgGUID: qBTFlDzhRbW5NT7FYtyMYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255873"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255873"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:23 -0700
X-CSE-ConnectionGUID: jPykgL80SPekrOrYy238zw==
X-CSE-MsgGUID: eF3cRXnNQd67FJsGmd5cpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637583"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 7/8] drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
Date: Thu, 31 Oct 2024 11:10:47 -0700
Message-Id: <20241031181048.2948948-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
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

We only allow continguous BOs to be vmapped, set XE_BO_FLAG_PINNED on
BOs in migrate selftest as this forces continguous BOs and selftest uses
vmaps.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 1a192a2a941b..4cef3b20bd17 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -83,7 +83,8 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 						   bo->size,
 						   ttm_bo_type_kernel,
 						   region |
-						   XE_BO_FLAG_NEEDS_CPU_ACCESS);
+						   XE_BO_FLAG_NEEDS_CPU_ACCESS |
+						   XE_BO_FLAG_PINNED);
 	if (IS_ERR(remote)) {
 		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %pe\n",
 			   str, remote);
@@ -642,7 +643,9 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 
 	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				   DRM_XE_GEM_CPU_CACHING_WC,
-				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+				   XE_BO_FLAG_SYSTEM |
+				   XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				   XE_BO_FLAG_PINNED);
 
 	if (IS_ERR(sys_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -666,7 +669,8 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 
 	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				   DRM_XE_GEM_CPU_CACHING_WC,
-				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				   XE_BO_FLAG_PINNED);
 
 	if (IS_ERR(ccs_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -690,7 +694,8 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 
 	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				    DRM_XE_GEM_CPU_CACHING_WC,
-				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				    XE_BO_FLAG_PINNED);
 	if (IS_ERR(vram_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(vram_bo));
-- 
2.34.1

