Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBF4C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D280A10E41E;
	Mon, 10 Mar 2025 12:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADNjzpiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C90210E41E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609191; x=1773145191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sq/7yNjEmBeqBxZTwAF9DtHOTjNiikstFqUHTGcdaaU=;
 b=ADNjzpiFjlPeCDTQLhXj7JtfR9sqamL25YKX10CIkZWMOmy+I9mjrQro
 1mEIgBjYjxYGa+PoTsQUtG/OHyZsHjZr31J5oB0KbNe04pjF5mB7p73Gz
 2rt7vd0ci5aEWjaw34lVE0wnf4t976Fg6IVK8a0APZPAhpbjyJXl9GyER
 p+NdvjKCEp+6qGw9ljkcVqroEb1B8XbVEumYScuoXxssCd71tE/1Bfkt+
 Z9jRQUzUwHaqd3uG8AtdBWHRbB7h8ITU3/3ugZ4qLB+idvvS65XyNnR4w
 xdthC9O2iUbq0fUVpUmKgMH07c2Y49Qsa4L+2sKsL2xzoRx+ptROuNB7Z Q==;
X-CSE-ConnectionGUID: 0QkS9yf7Rsiurx5pNWagOA==
X-CSE-MsgGUID: LA6o660eTOOF5fLIv62rvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65056443"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65056443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:19:51 -0700
X-CSE-ConnectionGUID: v6Z+BD7oS6GOSADl/AJ6Jw==
X-CSE-MsgGUID: fpT/JgvXSZeuUIUS+ZFZ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="143179114"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2025 05:19:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 09/12] drm/xe/svm: Allow unaligned addresses and ranges for
 prefetch
Date: Mon, 10 Mar 2025 18:13:38 +0530
Message-Id: <20250310124341.1819568-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

The SVM prefetch operation can handle unaligned addresses and range sizes.
This commit updates the ioctl parameter checks to accommodate unaligned
addresses and range sizes for SVM prefetch operations.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a54e78621074..8d2db9d47561 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3089,6 +3089,16 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
+static bool addr_not_in_cpu_addr_vma(struct xe_vm *vm, u64 addr)
+{
+	struct xe_vma *vma;
+
+	down_write(&vm->lock);
+	vma = xe_vm_find_vma_by_addr(vm, addr);
+	up_write(&vm->lock);
+	return !xe_vma_is_cpu_addr_mirror(vma);
+}
+
 static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops)
@@ -3197,8 +3207,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		}
 
 		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
+		    XE_IOCTL_DBG(xe, (addr & ~PAGE_MASK) &&
+				 (addr_not_in_cpu_addr_vma(vm, addr) ||
+				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
+		    XE_IOCTL_DBG(xe, (range & ~PAGE_MASK) &&
+				 (addr_not_in_cpu_addr_vma(vm, addr) ||
+				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
 		    XE_IOCTL_DBG(xe, !range &&
 				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
-- 
2.34.1

