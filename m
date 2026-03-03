Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508DFEDA687
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 15:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1509A10E83B;
	Tue,  3 Mar 2026 15:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSuzNECA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAF110E837
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551261; x=1804087261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A5v3soCmjvXQl9YyZts88dZaTLB6Xr6ygBnMkDGfVJo=;
 b=mSuzNECAdueSAr17sk5pasihSRMldotNZ0keNyuVZ8dE8zArTjZwIHB8
 S54SS5fu+/M3k44OTboGLynnfXB4zzgSUFvaxaQwfDPayr4j22qn97Y38
 xcGlN5dUT8CXflqs85LUTi3drrT2zBaVGiffdzxOPoBwHy1dBajdNoH16
 HNcTjLnmAnE4TmVdYwWBJ0B9jBm4Ukwk29VrYm8u5gf2SUL7PMsofIC5+
 svQrjIA1cdCQTGalnkyRzPqaDtIqC+iF7h6ujDMY4sjMnxZhOZALaGmBj
 LHdPLj1PtCUYzNgE24dxLoZs6a5VbZBW5/9god26YUihuaOOFyx/E2t0E A==;
X-CSE-ConnectionGUID: dK6p2ZO/R2eCNENfUPE+tw==
X-CSE-MsgGUID: Wr51UfIMSOOMDXZM8h6Fjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73655998"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73655998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:21:01 -0800
X-CSE-ConnectionGUID: O7Frj3jbTk6PBh891+EVqA==
X-CSE-MsgGUID: aM0Ym00aTke6uzc79AE7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222506985"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:21:00 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v6 11/12] drm/xe/madvise: Enable purgeable buffer object IOCTL
 support
Date: Tue,  3 Mar 2026 20:50:07 +0530
Message-ID: <20260303152015.3499248-12-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303152015.3499248-1-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
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
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c      |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 22 +++++-----------------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 34db266b723f..e535c77405b9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
+	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index ab83e94980e4..746e9b7b47bb 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -337,18 +337,11 @@ void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
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
 
@@ -412,12 +405,7 @@ static const madvise_func madvise_funcs[] = {
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

