Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8467FCD129E
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A9A112F11;
	Tue,  9 Apr 2024 20:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8EryWFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9A0112F2D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693098; x=1744229098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1X3Gr0xbsSA9KELLBjMza5fGOIvz9/06mnw/mL9xy0w=;
 b=f8EryWFrxfJ2g86ap0g1El7ZWksAkmruAZz5b8Ifwovz1bgStTsYz+Dm
 rz6XmuCOFG8PVASM/2N00kQEjWqALaIPqlau0KKa6+CLQbxshPHLhE/qO
 3/+WGngta8d/66+1WN/E68x7TkCPw6G1C6E6QG4yr21H+YHIrr6Kr88V/
 RrEqFMYykcpCD3ezb3le2sBz5TmDcnF/i+PKuyNL7ztILNFrJXhq/RfdI
 kiQsbEMUlXx/aa1qx3fD9xFpWHjQAEiHE483ueXf1nkA5otBULFhhvevW
 FjO/FK1opvFL+cpfBcQVtbzbnr0rNRWIyL1z1Oo59rsl3UPu1sKKdWK1Y A==;
X-CSE-ConnectionGUID: hq3ErqmgRP6u4YKb8ivUVg==
X-CSE-MsgGUID: Rzk3Zks1Tn+ISj8p1r6GTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803772"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803772"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:54 -0700
X-CSE-ConnectionGUID: anvWQlDrRWSyD23AkzuAog==
X-CSE-MsgGUID: sZ32hNPvRSmW7E0gPn6aYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773803"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 30/31] drm/xe/svm: Add a helper to determine a vma is fault
 userptr
Date: Tue,  9 Apr 2024 16:17:41 -0400
Message-Id: <20240409201742.3042626-31-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

xe_vma_is_fault_userptr is added to determine the vma is
a fault userptr.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index d55330988e32..a718f927e362 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -166,6 +166,11 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 		!xe_vma_is_system_allocator(vma);
 }
 
+static inline bool xe_vma_is_fault_userptr(struct xe_vma *vma)
+{
+	return xe_vma_is_userptr(vma) && (vma->gpuva.flags & XE_VMA_FAULT_USERPTR);
+}
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
-- 
2.26.3

