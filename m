Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D7C3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D288410E3E4;
	Mon,  7 Apr 2025 09:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaSfo8NL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A73A10E3E4
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019579; x=1775555579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ZyoiXiQGaSOZrt6D2Ph02hO3Bk4zyHSWB1IBBFatDA=;
 b=SaSfo8NL6MOH3kC7h613Xp3fdS3VbLZqReOMSpdw6DmHMRgC1aCED52d
 PAsl+i8Jo56ll+v7bVv48yLnGkw0HRIo/KG6Y8kN9MboghAqCAO6CNxv6
 FWYDjHGA6KWGdAX9j/TyEQKMpSqoCFL64uzWt0AeQfNzkby67jIwyQpHW
 E5xnZS7IiN63Nkya4zG7px5Eh51RlZeIbdG7n4Fo6A2Y2gaCy4XPJ2GeQ
 99syLUMQzfr9ITYZsncCzOiRIur0H7u8xk2xzkhanVlE6K6S4BY5qmjIS
 365KDWZyGGVkW2tv40Aofr5RM38bAiN0k8s8BvHUrz1ygQ5G/2K++7xfk g==;
X-CSE-ConnectionGUID: KEAwf9L7QNCHN6YFW1W7PQ==
X-CSE-MsgGUID: kA62jMhhQaC0pdYdmYDr1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029393"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029393"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:52:59 -0700
X-CSE-ConnectionGUID: Y2zymEQfQn2OYtURAPhpRQ==
X-CSE-MsgGUID: ObeExkCTRM2Xa1dVQUBOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778663"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:52:58 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 09/32] drm/xe/svm: Allow unaligned addresses and ranges for
 prefetch
Date: Mon,  7 Apr 2025 15:46:56 +0530
Message-Id: <20250407101719.3350996-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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
index ac308cfdaf28..57af2c37f927 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3111,6 +3111,16 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
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
@@ -3219,8 +3229,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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

