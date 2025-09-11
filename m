Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D88CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 17:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F154D10EB72;
	Thu, 11 Sep 2025 17:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DN10Cbx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1C410EB72
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757612048; x=1789148048;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZKgdXfOiKLExZyEWVj2Viwl2owqMBlLntY5bo9r2F+U=;
 b=DN10Cbx2cU3oCbhgKlTN2nBxnUFjnJqjHddZ2PRnZ2/IHqw6tif4xZEU
 ckNf+QH8BJDxMhnn+e6xb/TqGuyYh67aFURgjuMYF6phOkbPcWJfdAuiE
 g0wu2d69nJNdhZQoXtssiYkMK805l+TXQT1T/nk0p14ki5WJ8dYnoIkFE
 HLukVFQIsjkf1JLDYZkwlmVwYbHJXZO+CAdCj2gw70maw8V8uvEoxa+E9
 o7+/iku1pKNuDw5K7tyXjRxSX3J3MUuI6gq8egQQ/FAYtdTPGkTlmxChz
 QoG1uVRGiMv9SaYbvia83/Zj1L+f+Uf2k5EFtabineT5Po6kY6CHilmM2 w==;
X-CSE-ConnectionGUID: UfcfcMCrSqO/GXadlpjEIw==
X-CSE-MsgGUID: PmYFUmlST0OhnN7BymJ1bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71056185"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="71056185"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:34:08 -0700
X-CSE-ConnectionGUID: pJ3EdYLTQmqwUL9v45gtLQ==
X-CSE-MsgGUID: w44VEtrNQeuUaNZcJI98cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173298699"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 11 Sep 2025 10:34:06 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe/madvise: Fix ioctl argument check
Date: Thu, 11 Sep 2025 17:31:40 +0000
Message-ID: <20250911173139.1405878-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

It is "preferred_mem_loc" instead of "atomic" for the ATTR_PREFERRED_LOC path.

Also include 2 minor changes with no functional impact.
1. Remove the redundant "attr.atomic_access" assignment.
2. Replace down_read_interruptible() with xe_svm_notifier_lock_interruptible()
   to pair with xe_svm_notifier_unlock().

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 153700743545..cad3cf627c3f 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -124,8 +124,6 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			vmas[i]->attr.atomic_access = op->atomic.val;
 		}
 
-		vmas[i]->attr.atomic_access = op->atomic.val;
-
 		bo = xe_vma_bo(vmas[i]);
 		if (!bo || bo->attr.atomic_access == op->atomic.val)
 			continue;
@@ -253,7 +251,7 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
 			return false;
 
-		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
+		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.reserved))
 			return false;
 		break;
 	}
@@ -407,7 +405,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	}
 
 	if (madvise_range.has_svm_userptr_vmas) {
-		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
+		err = xe_svm_notifier_lock_interruptible(vm);
 		if (err)
 			goto err_fini;
 	}
-- 
2.49.0

