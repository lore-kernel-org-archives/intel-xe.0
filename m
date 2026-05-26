Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8BDCD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 13:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7F010E1AA;
	Tue, 26 May 2026 13:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fslliZNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83AA10E1AA
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779803700; x=1811339700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QbUwT9bgENt0lLA20M40WbsZlZ4JtmIPE9PIjKX7zSI=;
 b=fslliZNE/zLdqCMtZAzgfGOc1kKMHZlt8hVXuiID30wYhj7pZJHRLHV+
 ncAW1gswJ1hOlXglkyVnU2+9AHI0od5MgPePwnI3spfb7saExMtGlDQ/y
 GsAbtQJVBHOtFHKwbgQRav7zn71qkU2O3POkXcap9WaHOxNTe6EwxgGP6
 5SemNfvR8ve4VK93m3eeXa2xO5hrt3lUE4dHGSh8sekbUrUq3q+1yAvkC
 W7Hsvztp6QHCDj2urLGlWONCRGlcMEy7LP9heJJ9nNaIqGqez5wOQrLUI
 aIpDWq1QDApYmIMr10SVUbjzC+3C+/thhiNATAvRIWoQxocfCARDZ4k3E A==;
X-CSE-ConnectionGUID: +3Ea+FzjRbmiP5N8vnDbcA==
X-CSE-MsgGUID: l7c6PBD+Sf2vOyNxq/otPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79762221"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="79762221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 06:55:00 -0700
X-CSE-ConnectionGUID: 0pNvFK4YTb+3xdywgZU/Cg==
X-CSE-MsgGUID: 276FY4ItTC6aIlp9tZTDLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="239328276"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 06:54:58 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v2] drm/xe/madvise: Skip invalidation for purgeable state
 updates
Date: Tue, 26 May 2026 19:24:47 +0530
Message-ID: <20260526135447.2973029-1-arvind.yadav@intel.com>
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

v2:
  - Replace inline 'args->type != DRM_XE_VMA_ATTR_PURGEABLE_STATE'
    check with a small helper madvise_range_needs_invalidation().
    (Himal)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index c4fb29004195..9e343f9aa44d 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -332,6 +332,20 @@ static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 	return err;
 }
 
+/**
+ * madvise_range_needs_invalidation() - Check whether madvise needs invalidation
+ * @args: madvise ioctl arguments
+ *
+ * Purgeable state updates only touch VMA/BO metadata. PTEs stay valid and are
+ * zapped only if the BO is later purged.
+ *
+ * Return: true when the update needs PTE invalidation.
+ */
+static bool madvise_range_needs_invalidation(const struct drm_xe_madvise *args)
+{
+	return args->type != DRM_XE_VMA_ATTR_PURGEABLE_STATE;
+}
+
 static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
 {
 	if (XE_IOCTL_DBG(xe, !args))
@@ -708,8 +722,9 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
 				 &details);
 
-	err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
-					     madvise_range.addr + args->range);
+	if (madvise_range_needs_invalidation(args))
+		err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
+						     madvise_range.addr + args->range);
 
 	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
-- 
2.43.0

