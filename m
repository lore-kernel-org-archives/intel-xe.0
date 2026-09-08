Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFF2C79F9E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 13:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E37C10EC06;
	Tue,  8 Sep 2026 13:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgN/UDiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BF110EC06
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788875452; x=1820411452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dLnRShD0558W3BVNEJZOyxXiroDKtr7Ejg7+9Hd8l8U=;
 b=dgN/UDiV8XcrIaV5SHLNsCQDn+ySvCs5zejCeK5oK6nPqC0QZtNGd7iz
 t18Swk336MdoM/lGkAbNe5bE3GXVUDFWjM4gdYOAHXZJ17mtjdu5E4b2+
 jcL8GygrySqhxztUHhvm2UdMoidrn6sPVu6kv6LnAWgC4PvWx+7LUKpam
 ufck4pSE/6+RE6v3gxHegmTtelrK7jQjUU0BtnazcuK4MPEKUmdrtypap
 AReXs7KjRKc8sE+or+qoldIvIiv4gaDmvA782tFjQ0ciliXYdoewP6Hu3
 MU/IpDD1QdcYXYMWa4+Rs4paIVLCgGbp/077gtw1NMZkzKvaUeBh57z6P A==;
X-CSE-ConnectionGUID: HUC2+8cJSDSrRJ26LaTDAA==
X-CSE-MsgGUID: fcIfZDZnQ+yg558AYgyrGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106793378"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106793378"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:52 -0700
X-CSE-ConnectionGUID: k2Rjw+FzT5yrkKcK+geFNQ==
X-CSE-MsgGUID: 4EWV4ixNRRmyRfZ/z3h1Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270519685"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH v4 3/8] drm/xe/mmio_gem: simplify fault handler loop
Date: Tue,  8 Sep 2026 14:49:59 +0100
Message-ID: <20260908134955.1344429-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908134955.1344429-10-matthew.auld@intel.com>
References: <20260908134955.1344429-10-matthew.auld@intel.com>
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

From: Ilia Levi <ilia.levi@intel.com>

Make the iteration over the addresses in the VMA more explicit.
No functional change, as the VMA matches the GEM object exactly.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 96f3bf46fd75..3b6d04efe81a 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -200,7 +200,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
 	struct drm_device *dev = base->dev;
 	vm_fault_t ret = VM_FAULT_NOPAGE;
-	unsigned long i;
+	unsigned long addr, pfn;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx)) {
@@ -213,13 +213,13 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 		return xe_mmio_gem_vm_fault_dummy_page(vmf);
 	}
 
-	for (i = 0; i < base->size; i += PAGE_SIZE) {
-		unsigned long addr = vma->vm_start + i;
-		unsigned long phys_addr = obj->phys_addr + i;
-
-		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
+	pfn = PHYS_PFN(obj->phys_addr);
+	for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
+		ret = vmf_insert_pfn(vma, addr, pfn);
 		if (ret & VM_FAULT_ERROR)
 			break;
+
+		pfn++;
 	}
 
 	drm_dev_exit(idx);
-- 
2.55.0

