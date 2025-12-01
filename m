Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69332D111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 05:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA6D10E2A3;
	Mon,  1 Dec 2025 05:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJqAfmDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F1110E2AA
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764568439; x=1796104439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8UYsixHJCDbFPvZEb0rXTzIvgu77AOyO3EKbuVMn57U=;
 b=UJqAfmDzV+fXNBDmgRqq1EUoOsK49QSsm5tUJ1aR8b+ul+YWIluv2N4d
 1QQibjQLQjuGD+8fcFhUkoGf8AoHEjxF+OaXDZcogrW/0HywrH/e0a/PM
 R1nkQKUtFbYUYkXPvhjlHwrEF66Bplx9f8icsDHO+wENwr4Fb22TG1awD
 Nvofuz5akigpftOkRRasOLJY917qQmQ3dbWUoNXxJlqs7QN240OSoVAXm
 rGTtrwMmIdi+euW7Jyc8QlmIKgKhtzQiOE1Z6Bi9yIUCp66Z1KhjY4NOj
 Q73ek1bRXjqGe9NAJrGg3YcgnWj9bpqNKnmzDVs5Qv7erG8cbRKdicrbJ w==;
X-CSE-ConnectionGUID: HR3a+uVUQBO3/3DmRShiSg==
X-CSE-MsgGUID: 6K/BNBTVTO6BSjAwd9QPAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66457392"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66457392"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:59 -0800
X-CSE-ConnectionGUID: eIzKx8TvSCGr2PnUz16ByQ==
X-CSE-MsgGUID: B79HEVNWTUCY/Us9QGNUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224950839"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:57 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v2 7/9] drm/xe/vm: Prevent binding of purged buffer objects
Date: Mon,  1 Dec 2025 11:20:17 +0530
Message-ID: <20251201055309.854074-8-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201055309.854074-1-arvind.yadav@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
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

Add validation in xe_vm_bind_ioctl_validate_bo() to reject MAP and
PREFETCH operations on purged buffer objects with -EINVAL.

Problem:
When a BO is purged (XE_MADV_PURGEABLE_PURGED state), its backing pages
have been freed by the kernel. Without this check, VM_BIND operations
would proceed:

 1. DRM_XE_VM_BIND_OP_MAP: Attempts to create GPU mappings to freed memory
    - xe_vma_ops_alloc() creates VMA pointing to invalid BO
    - Page tables populated with stale/invalid addresses
    - GPU access leads to undefined behavior or hangs

 2. DRM_XE_VM_BIND_OP_PREFETCH: Attempts to migrate non-existent pages
    - Triggers BO validation in TTM
    - ttm_bo_validate() fails or crashes (no backing store)
    - Wasted work for permanently invalid BO

With this check:
  - MAP/PREFETCH immediately fail with -EINVAL at ioctl boundary
  - Clear error message at syscall (better UX than deferred GPU hang)
  - Prevents creation of invalid GPU page table entries

v2:
  - Clarify that purged BOs are permanently invalid (i915 semantics)
  - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d03e69524369..cc946bff9607 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3482,6 +3482,13 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return -EINVAL;
 	}
 
+	/* Purged BOs are permanently invalid; reject new MAP/PREFETCH. */
+	if (XE_IOCTL_DBG(xe,
+			 xe_bo_is_purged(bo) &&
+			 (op == DRM_XE_VM_BIND_OP_MAP ||
+			  op == DRM_XE_VM_BIND_OP_PREFETCH)))
+		return -EINVAL;
+
 	/*
 	 * Some platforms require 64k VM_BIND alignment,
 	 * specifically those with XE_VRAM_FLAGS_NEED64K.
-- 
2.43.0

