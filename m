Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A570C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 17:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BEE10E08E;
	Mon, 14 Jul 2025 17:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRiMCKa9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CED10E221
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752514320; x=1784050320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGkAvSPZDXFv12Ap4JwFohMe95cOv24w0tu8sq7lSag=;
 b=LRiMCKa9wDxnOcNmXZAV1boJ4LfM/O8/f5iqnsCYOSnmQ2kvoxieqW1R
 DFGNjxkkJd5764xQGQ7cGYCGAKR4RZPZoJ/zHkhYGXc79qmdQhFhGWwfq
 GzKKq4ZCEtDt1WPzCaR/RZOasPPaAwDIUA46YYKuWJiMC6Nm5CVXzeUJu
 YmGlSsX9t7zFG/luRsYDAWvjH+yPGggnMjP6sPgRL3LRBK0KjLGQxzfuL
 os/3mmU7PgeZ+le0nitte+P8R2gQB6Nus5RtbebwSpPLFZjq5+4VCWbzm
 1eR2ipkhdm7aqxj0LyjvPf6nh2WWmcUaErro6zDc/4fdlS3JUpT+div0z g==;
X-CSE-ConnectionGUID: HYHRcjnzRSSUmiTlCi86FA==
X-CSE-MsgGUID: WgkTrG31TAeVhDvRsWRBnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72167069"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="72167069"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:31:59 -0700
X-CSE-ConnectionGUID: IM0g36efQLao8VsMw6gb6g==
X-CSE-MsgGUID: 3TwlUnkCRKOxG50moWLDxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="180689769"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:31:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com
Subject: [PATCH 1/3] drm/xe: Disable compression on SVM
Date: Mon, 14 Jul 2025 10:33:40 -0700
Message-Id: <20250714173342.2997396-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714173342.2997396-1-matthew.brost@intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
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

This is not yet supported, forcefully disable by setting pat_index to
zero for CPU address mirror VMAs.

Cc: stable@vger.kernel.org
Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2035604121e6..73cb981c0956 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2362,7 +2362,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.is_cpu_addr_mirror = flags &
 				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
-			op->map.pat_index = pat_index;
+			if (op->map.is_cpu_addr_mirror)
+				op->map.pat_index = 0;
+			else
+				op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
-- 
2.34.1

