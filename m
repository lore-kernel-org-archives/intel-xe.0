Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A453CD484F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 14:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24FF10E770;
	Wed,  4 Sep 2024 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GymayV/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E601310E770
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725461571; x=1756997571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+CkU2e2nXCOfaNi+gzekcKRIMjbzCmNCHkVYHAcIao4=;
 b=GymayV/pq38N2fmyYWMJWr+XfCeJ+UYmktl6lXUFuRev67R+X4gh+hCT
 n8ae1p6j8tTeiW2B7clO22psjJ6qDmQW+jlE6MnQmXszh76ncpBOewKDy
 aypRwFhWMHdjxQceqpBbGsAVz/z3u8vtWw4s/4mdgRWjjCpqyzkrAn9pj
 AIbnQeX4Pqe9IHRrYV9K+e+cFL+K79N0k7JujpyshJmKdA842kmI5cLbI
 B1H7Q9ofvJTNMVZzC9Muuc1M8xE8sqd9gYvjTowBuUw672pnKz37s1yL8
 pmPNir2iRMyCdfpMHAYmeIumTiIXGGl2Q5JDuNijlbJZmrIaIK8B6F8eg w==;
X-CSE-ConnectionGUID: IZz+5QLDSDWpSRQrU+mJKg==
X-CSE-MsgGUID: kC6NyFq3RraP7CRL576G5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="13370293"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="13370293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 07:52:51 -0700
X-CSE-ConnectionGUID: 3O3sfM2dSqKbePUOYXIXrQ==
X-CSE-MsgGUID: 2RdbAiYJTx+tFwzZmjk5zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="65638044"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 07:52:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe: use IS_ENABLED() instead of defined() on config
 options
Date: Wed,  4 Sep 2024 17:52:31 +0300
Message-Id: <20240904145231.3902289-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Prefer IS_ENABLED() instead of defined() for checking whether a kconfig
option is enabled.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                  | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c | 2 +-
 drivers/gpu/drm/xe/xe_guc.c                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 06911e9a3bf5..53948a965404 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -468,7 +468,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		mem->bus.offset += vram->io_start;
 		mem->bus.is_iomem = true;
 
-#if  !defined(CONFIG_X86)
+#if  !IS_ENABLED(CONFIG_X86)
 		mem->bus.caching = ttm_write_combined;
 #endif
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
index f3ddcbefc6bc..2ed5b6780d30 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
@@ -33,7 +33,7 @@ static const struct drm_info_list vf_info[] = {
 		.show = xe_gt_debugfs_simple_show,
 		.data = xe_gt_sriov_vf_print_version,
 	},
-#if defined(CONFIG_DRM_XE_DEBUG) || defined(CONFIG_DRM_XE_DEBUG_SRIOV)
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) || IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)
 	{
 		"runtime_regs",
 		.show = xe_gt_debugfs_simple_show,
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 52df28032a6f..db667850c8b8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -583,7 +583,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
  * extreme thermal throttling. And a system that is that hot during boot is probably
  * dead anyway!
  */
-#if defined(CONFIG_DRM_XE_DEBUG)
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define GUC_LOAD_RETRY_LIMIT	20
 #else
 #define GUC_LOAD_RETRY_LIMIT	3
-- 
2.39.2

