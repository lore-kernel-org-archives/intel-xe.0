Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E901067045
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 15:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081EB10EA49;
	Thu, 12 Mar 2026 15:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igGbWnhP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E6D10EA49
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329383; x=1804865383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Esr2S0UHVfTc9gQFDuRLnWwwjThqSY0Aw1nze/sLkWM=;
 b=igGbWnhPV2+TphYmb4iIPVTlqrSv1V7+01dZXEIk3D+NBBiv/bJOWBsT
 0dZ/pRKwp3g27KE/NBsb/YxHrbFwgV0lrDcaCESNd9dUGmIKLxSz63zQ6
 6MZ/AnGesId05UIYulPh5Fp3f7Hl9mcPFcuid0rir8h3Q0SrsVIahnpni
 Yxkb/45YhZF/DF8xf/PaHub/CbAHQSBRVCqNRi6tdndHuBU5nE3RUJZVU
 BIteWZt8SzF84IblVhci2lmzzCYn+4k2M/pb4mkQnzso4act+9PLT1x/F
 zg27EhXSguNxJCE/ob+nywpgusghoRR2sTtTHl/C7k5lo1+fkv0lGBi4k Q==;
X-CSE-ConnectionGUID: ryiucG/0RnOcBxkQ+hchaA==
X-CSE-MsgGUID: y/ROvvkgQsWQAlxgCrGucQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85127117"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85127117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:29:43 -0700
X-CSE-ConnectionGUID: Ho0zmABuSWyOfPH8E2vW1A==
X-CSE-MsgGUID: +kUBr8F9R+6JPRdqzeZB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="223297259"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 08:29:42 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, Nitin Gote <nitin.r.gote@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe/uapi: Fix kernel-doc for DRM_XE_VM_BIND_FLAG_DECOMPRESS
Date: Thu, 12 Mar 2026 21:32:45 +0530
Message-ID: <20260312160244.809849-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

There is kernel-doc warning for DRM_XE_VM_BIND_FLAG_DECOMPRESS:

  ./include/uapi/drm/xe_drm.h:1060: WARNING: Block quote ends without
  a blank line; unexpected unindent.

Fix the warning by adding the missing '%' prefix to
DRM_XE_VM_BIND_FLAG_DECOMPRESS in the kernel-doc list entry for
struct drm_xe_vm_bind_op.

Fixes: 2270bd7124f4 ("drm/xe: add VM_BIND DECOMPRESS uapi flag")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603121515.gEMrFlTL-lkp@intel.com/
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0497b85fa12a..f8b2afb20540 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1057,7 +1057,7 @@ struct drm_xe_vm_destroy {
  *    not invoke autoreset. Neither will stack variables going out of scope.
  *    Therefore it's recommended to always explicitly reset the madvises when
  *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
- *  - DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
+ *  - %DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
  *    When set on a MAP bind operation, request the driver schedule an on-device
  *    in-place decompression (via the migrate/resolve path) for the GPU mapping
  *    created by this bind. Only valid for DRM_XE_VM_BIND_OP_MAP; usage on
-- 
2.50.1

