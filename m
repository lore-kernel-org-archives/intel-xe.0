Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B42FCAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 13:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6585710E8C1;
	Thu, 18 Sep 2025 13:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MH+81zqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8289210E8C1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758203796; x=1789739796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5pEoxa4/iwq8lUwIUPULDE6XOjIa8AXaNMFQklT89o=;
 b=MH+81zqV8yKLCtd26IPA6KUmRkCDNLdkkRMYYG9/1tP9QYOMbrAHSLqg
 /JOtdUrYY3MjYmq+ZCHUDWbRVdUbrWPM0ErPREYWNKh4jN0+yLjf/QxXR
 CRHdOpJ0i8KeB2OgberLxlyxtO0EdD8Zpcv+5ThHlD7quceys/8y7PHhN
 KnDSAQHX1+4p6QRZ/wXkjGVGvdZUW8xY/m7VlXI0X6PpAbEgQ+7JhrG6v
 o5FBT2XTOdvzXmnU8WuS7/CApGsGf2tU1/6lhJ7O40MXHdo7TyodeT3zc
 BZYUNaGJc6+s88OeCKaEA3U3O3W2BmhN2L/r3sPmFOiqOuZk85ak+FJoe g==;
X-CSE-ConnectionGUID: IAe5JapxQqqpyuCuM0fNnA==
X-CSE-MsgGUID: OjomTmMyQMybx3Rw3CVr+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64337077"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64337077"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:56:36 -0700
X-CSE-ConnectionGUID: 0FhzzW8IS1qcLz7x4ymwqw==
X-CSE-MsgGUID: rpLkdYtjQWKfn4lzRfvoww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179828027"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 06:56:35 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 1/5] drm/xe: add VM_BIND DECOMPRESS uapi flag
Date: Thu, 18 Sep 2025 19:55:25 +0530
Message-Id: <20250918142529.608432-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918142529.608432-1-nitin.r.gote@intel.com>
References: <20250918142529.608432-1-nitin.r.gote@intel.com>
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

Add DRM_XE_VM_BIND_FLAG_DECOMPRESS to the userspace API so callers
can request GPU-side decompression on VM_BIND.

This flag is used by subsequent driver changes to trigger scheduling of
GPU work that resolves compressed VRAM pages into an uncompressed PAT
VM mapping.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 include/uapi/drm/xe_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 40ff19f52a8d..6b652a6968a0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1119,6 +1119,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 6)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.25.1

