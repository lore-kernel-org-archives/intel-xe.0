Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47487CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 05:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD03310E1CA;
	Mon, 11 May 2026 05:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmqoXkRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA37A10E1CA
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 05:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778478861; x=1810014861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R/tGSITO/qNznLp9wu4gi9taFsrMajf7tSmSuAyL5xM=;
 b=QmqoXkRlxpcaxqvjlKHPPHznjQGodB3uz2QzVXFw/qINJbjliD5DBCvv
 +qNt3n6fvvdKNXeDtGgTp8VqVvT0LTzstxpuRHc/W2GOeay4L8HbVuxM1
 7mZByEb8s6rCkERY+0v7GAZ3AkCcUr3ikTreFE/xLrfijvwMtG6RWVGd9
 karTqToNpjj2S4MbvGoYazEOhv/4L9bVlQ9dj4dkEi3GJ6zzqBLUKZR16
 groekbhzdpFOXD4FEwcR1nWoRTwzMdCG6wJ/ZnWdnuQwDb0PFdtpfQv1b
 BKShS64w5vB3LBucKOeCYfKQ8SLo0ncBVnGaDGDOKmFoMLFFcTGVD+yJZ Q==;
X-CSE-ConnectionGUID: 6/AL03eFSbqLuJGlkTJRgw==
X-CSE-MsgGUID: M/cYP9zkRYSkIlry/ZkS3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79459710"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79459710"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:54:20 -0700
X-CSE-ConnectionGUID: YiH+jCwQReusmOfXkE9ONQ==
X-CSE-MsgGUID: l1pY7sbyQiyLB7P2L0wBhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="236499904"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:54:16 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe/madvise: Skip invalidation for purgeable state updates
Date: Mon, 11 May 2026 11:24:05 +0530
Message-ID: <20260511055405.91510-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Purgeable state updates only change VMA/BO metadata. They do not zap
PTEs when switching between DONTNEED and WILLNEED. PTEs are zapped
later if the BO is actually purged.

xe_vm_invalidate_madvise_range() waits on the VM dma-resv before checking
vma->skip_invalidation. Since purgeable madvise marks all affected VMAs to
skip invalidation, this wait is unnecessary and can stall on unrelated
in-flight work.

Skip the invalidate path entirely for purgeable state updates.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index c4fb29004195..7db3cee73430 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -708,8 +708,13 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
 				 &details);
 
-	err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
-					     madvise_range.addr + args->range);
+	/*
+	 * PURGEABLE_STATE updates only change VMA/BO metadata. PTEs remain valid until
+	 * the BO is actually purged, so skip the invalidate path and its dma-resv wait.
+	 */
+	if (args->type != DRM_XE_VMA_ATTR_PURGEABLE_STATE)
+		err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
+						     madvise_range.addr + args->range);
 
 	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
-- 
2.43.0

