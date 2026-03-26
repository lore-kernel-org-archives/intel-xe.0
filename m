Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D72109E559
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 05:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1D010E957;
	Thu, 26 Mar 2026 05:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfYcEIKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EF810E956
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 05:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774504306; x=1806040306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4QA2KDXic+Whp85yUPZ16pfqldvkWhPRamKer7mnPA=;
 b=EfYcEIKQTfgApAd0r4q8GUUIe5t4S1NnLhI+rhPpuUKD6Zopa02LhKAj
 /hDyUYlXUyiykAvi92vuVbs6w6j6Hp8rgwoin/9eDPt8P+fTvTJaLausl
 uud1COY/x76F/PmFfZKVaBGcS+YK76NoZPx4KgJuE7FVsfd+jIxISqg9h
 k9aeF+SyGUYtEqxH+zSB4hs59iqvSqk2KBtv/MKogmaMh66WwifognYUs
 pVVeoYj7haPZLJDuBcHfhTxxnszyq37l2OgbNQkq6dVfbsT3UDKAy+831
 9qFYPTuM00qFj98WHZc46rQAWFhQfiyuO1CAdfpE35AutLZ82+IOqf2tg Q==;
X-CSE-ConnectionGUID: fTpVXeWlRwyyf5QBmO4feA==
X-CSE-MsgGUID: yeGAGd9OQDC9LmjDeJNkXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="87031300"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="87031300"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:51:46 -0700
X-CSE-ConnectionGUID: pDl7GsRfQhCMdZj30YIUsg==
X-CSE-MsgGUID: JRnnQE/ORGqtZ4Eg2Ol++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="221586030"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:51:44 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v8 11/12] drm/xe/madvise: Enable purgeable buffer object IOCTL
 support
Date: Thu, 26 Mar 2026 11:21:10 +0530
Message-ID: <20260326055115.3422240-12-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326055115.3422240-1-arvind.yadav@intel.com>
References: <20260326055115.3422240-1-arvind.yadav@intel.com>
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

Hook the madvise_purgeable() handler into the madvise IOCTL now that all
supporting infrastructure is complete:

 - Core purge implementation (patch 3)
 - BO state tracking and helpers (patches 1-2)
 - Per-VMA purgeable state tracking (patch 6)
 - Shrinker integration for memory reclamation (patch 10)

This final patch enables userspace to use the DRM_XE_VMA_ATTR_PURGEABLE_STATE
madvise type to mark buffers as WILLNEED/DONTNEED and receive the retained
status indicating whether buffers were purged.

The feature was kept disabled in earlier patches to maintain bisectability
and ensure all components are in place before exposing to userspace.

Userspace can detect kernel support for purgeable BOs by checking the
DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT flag in the query_config
response.

v6:
  - Add DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for userspace
    feature detection. (Jose)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c      |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 22 +++++-----------------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4852fdcb4b95..d84d6a422c45 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -342,6 +342,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 		DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX;
+	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 340e83764a76..4a19da5e86d4 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -338,18 +338,11 @@ void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
  *
  * Handles DONTNEED/WILLNEED/PURGED states. Tracks if any BO was purged
  * in details->has_purged_bo for later copy to userspace.
- *
- * Note: Marked __maybe_unused until hooked into madvise_funcs[] in the
- * final patch to maintain bisectability. The NULL placeholder in the
- * array ensures proper -EINVAL return for userspace until all supporting
- * infrastructure (shrinker, per-VMA tracking) is complete.
  */
-static void __maybe_unused madvise_purgeable(struct xe_device *xe,
-					     struct xe_vm *vm,
-					     struct xe_vma **vmas,
-					     int num_vmas,
-					     struct drm_xe_madvise *op,
-					     struct xe_madvise_details *details)
+static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
+			      struct xe_vma **vmas, int num_vmas,
+			      struct drm_xe_madvise *op,
+			      struct xe_madvise_details *details)
 {
 	int i;
 
@@ -418,12 +411,7 @@ static const madvise_func madvise_funcs[] = {
 	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
 	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
 	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
-	/*
-	 * Purgeable support implemented but not enabled yet to maintain
-	 * bisectability. Will be set to madvise_purgeable() in final patch
-	 * when all infrastructure (shrinker, VMA tracking) is complete.
-	 */
-	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = NULL,
+	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable,
 };
 
 static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
-- 
2.43.0

