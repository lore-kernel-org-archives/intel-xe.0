Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65876C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B09E10E97A;
	Fri, 14 Mar 2025 07:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auJuGycE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD72210E979
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937909; x=1773473909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5O2IAmgwO4AmJb6tO2wVUHvwhCz4oEj9kYt1vJoYqc=;
 b=auJuGycEITCppBJcooilPgWYlXYm3li7zPJC8xvAZNswE5hdSK3z/Zh2
 L6cl0qeqqMmrQT9OsdOrunb23HjNB2FlLuWkgdP4Lsl/wGXD56FGdjxfa
 sWopRdhrwP6effPGpdG4VvY9Blec0nzGqCwD7PNQNqLiLF5phafkYL8R3
 OKCiCmRPVQ5zEP8353hYWkkABUraKwK0m2NDwFSe1I2R2wJx4xvSksg9G
 84m6eUhdVuH3zJkDMetXFkoREYQhgmYH5T4AilMvGIYU6qk6dK1HNRplC
 m0TSffREXMYsx2x+eyFrKlxoNiXm1OyS5BmPkVT3VIU4rxX5YRDJMftsb Q==;
X-CSE-ConnectionGUID: 01wy7V3rQ8evsYK0JQ8soQ==
X-CSE-MsgGUID: EzwS1s+yTHy8b3unLCv7Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446012"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:29 -0700
X-CSE-ConnectionGUID: WPkfcVjDRq643DyGY+xRpg==
X-CSE-MsgGUID: uI4J5L7/TyqM5pa/vT8OmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043744"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:26 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 09/29] drm/xe/svm: Allow unaligned addresses and ranges for
 prefetch
Date: Fri, 14 Mar 2025 13:32:06 +0530
Message-Id: <20250314080226.2059819-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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
index 07cad2804b14..c6343a629c02 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3086,6 +3086,16 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
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
@@ -3194,8 +3204,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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

