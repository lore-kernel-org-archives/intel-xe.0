Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF45EA3F27
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 15:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B9C10E616;
	Wed, 11 Feb 2026 15:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOMZhq1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC16710E624
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770823638; x=1802359638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MPRbLEkVl+VSJJpr1Rf5Fqru5kYLs1Pdc5gIDk2nUw=;
 b=XOMZhq1VBp3zztm4Qng51WEP6rh4u1gQ7hoMqgE6qZutEVffOe+qujFA
 vMUNwjgyHcrqraHgJ69bnehKbmZeUsAIAAJxqkwK9SUEea5SM/fM6qRFc
 JhVH2ZSQYghJ126EfP8HE0H6cn4JKkbxISK94LXxljBXHZVKB/a4r/zrT
 cNGyG0MIhzQ5/F5RNANPxr0abagutpTzqakPECgn4BtYzDoCO48QFOi2o
 Zu81jyXSLqPOC0FeEDTcoLoixkjHZThnsverbHnBNXXvhd4aR+5ixowzb
 I1q1qE/sDd9QpwWl8qoMaNF82zrvuhurzcuNa5FGSvehemA6xqyzvd3G1 Q==;
X-CSE-ConnectionGUID: ipW46lp3RDa+5bxWKrD0gQ==
X-CSE-MsgGUID: akP829B1ScOjHW8hPLDEog==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89564303"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89564303"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:17 -0800
X-CSE-ConnectionGUID: UZUd9v3YSvKlbEdcKT7Log==
X-CSE-MsgGUID: RMQeRcpKRVarbWA+fmTPmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211388230"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:16 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v5 9/9] drm/xe/madvise: Enable purgeable buffer object IOCTL
 support
Date: Wed, 11 Feb 2026 20:56:38 +0530
Message-ID: <20260211152644.1661165-10-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211152644.1661165-1-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
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
 - Shrinker integration for memory reclamation (patch 8)

This final patch enables userspace to use the DRM_XE_VMA_ATTR_PURGEABLE_STATE
madvise type to mark buffers as WILLNEED/DONTNEED and receive the retained
status indicating whether buffers were purged.

The feature was kept disabled in earlier patches to maintain bisectability
and ensure all components are in place before exposing to userspace.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 235fff2b654e..20b1ac7e61d6 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -313,18 +313,11 @@ void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
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
 
@@ -382,12 +375,7 @@ static const madvise_func madvise_funcs[] = {
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

