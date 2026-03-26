Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D019109E54B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 05:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB1610E95A;
	Thu, 26 Mar 2026 05:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmOGBRqD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F2F10E957
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 05:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774504308; x=1806040308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5e0uq6yb6tQwp4mCYpOXlZawTD/2tbaUV3g667KUUbo=;
 b=PmOGBRqDtj0zlu9zIAXcddb88HIIOPu56B2vmpJXUJ2B2fXgtd+33se7
 0u1FKwRUDG8fuxLKRPMmbwivS0M1vCx57UslLOTuiCtu9e26pYTsmWl2R
 uJ0Tb3CK0q5cpOgMFk16hkvlxky43Ajapwz8VILXHRvjJLNGiyGhz8WB2
 FWrpXK4qg/bLdlcV3j8cF7csTIqkJFboR96UpjvEJfBTJBVO/T4ARX1/8
 82QhNdzhIv0GxKL0WdgEdM22HLuSK33cXINxHf+3ZVk/bOSHosHCahYzS
 3NhS1tQgohnoOxFctIFZFcS0TQW9nWLhGeA5UwzAVyanjzirhBaYNbBvq g==;
X-CSE-ConnectionGUID: wIt9y+JwSPuuflst+a3mmQ==
X-CSE-MsgGUID: P0LDXnF3RDShkz703ybq/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="87031301"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="87031301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:51:47 -0700
X-CSE-ConnectionGUID: E6MgToUPRPeOwEtQGKKyYg==
X-CSE-MsgGUID: aKvQhJgISDmBeffUi9I4jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="221586033"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:51:46 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v8 12/12] drm/xe/madvise: Accept canonical GPU addresses in
 xe_vm_madvise_ioctl
Date: Thu, 26 Mar 2026 11:21:11 +0530
Message-ID: <20260326055115.3422240-13-arvind.yadav@intel.com>
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

Userspace passes canonical (sign-extended) GPU addresses where bits 63:48
mirror bit 47. The internal GPUVM uses non-canonical form (upper bits
zeroed), so passing raw canonical addresses into GPUVM lookups causes
mismatches for addresses above 128TiB.

Strip the sign extension with xe_device_uncanonicalize_addr() at the
top of xe_vm_madvise_ioctl(). Non-canonical addresses are unaffected.

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 4a19da5e86d4..2d03676ee595 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -673,8 +673,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_madvise *args = data;
-	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
-							 .range =  args->range, };
+	struct xe_vmas_in_madvise_range madvise_range = {
+		/*
+		 * Userspace may pass canonical (sign-extended) addresses.
+		 * Strip the sign extension to get the internal non-canonical
+		 * form used by the GPUVM, matching xe_vm_bind_ioctl() behavior.
+		 */
+		.addr = xe_device_uncanonicalize_addr(xe, args->start),
+		.range = args->range,
+	};
 	struct xe_madvise_details details;
 	struct xe_vm *vm;
 	struct drm_exec exec;
@@ -724,7 +731,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (err)
 		goto unlock_vm;
 
-	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	err = xe_vm_alloc_madvise_vma(vm, madvise_range.addr, args->range);
 	if (err)
 		goto madv_fini;
 
@@ -774,7 +781,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
 				 &details);
 
-	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
+	err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
+					     madvise_range.addr + args->range);
 
 	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
-- 
2.43.0

