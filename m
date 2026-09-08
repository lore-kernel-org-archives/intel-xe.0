Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB91FC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 16:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B53C10ED02;
	Tue,  8 Sep 2026 16:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6mmFlU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F23F10ED15
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788886272; x=1820422272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OqJ7sSLaT5DeKfiit4fJrENKZ6eJjft8cp8YERPLx7o=;
 b=n6mmFlU4W6jN537R/ddazioqrxlme3zMCRuyxq0BXW70ZvTuzkTfqxmN
 kjxRYl0tk72Fwk03nGzMNGQeJisPZ6bRODQT2DU2Zww/BCcEmCPRdblCI
 Tm1bckjlVQfry5s6yxzX8LWFNai01BZ92/3zwuTBR2eWlqMS0B9sQQR4B
 OFlgMriR5uBtDZReTvmeVLGSJVnUbRlfledyDJOz2PcHkFGhTtJxcuYBN
 gjaX3b02Z5p/Q60rknsspd4kAH41pRf6Xx7z4DSgEn+SfPfN5EAIvC3+N
 6yvC/PMzaBEsAiGwW5MGq2VQ5WtKmLGwNzKxq+CbBLYC5kYJ1e29DEiYR Q==;
X-CSE-ConnectionGUID: FYvsdMRLSK2TiOxMkcYbYw==
X-CSE-MsgGUID: iK0splGMSOOqpdZOPrKQpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99888269"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="99888269"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:12 -0700
X-CSE-ConnectionGUID: 4Ri0npkTQeu2zPlChZ1/Jw==
X-CSE-MsgGUID: frNPnrd7TFadRr2GmCJvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="272995671"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ilia Levi <ilia.levi@intel.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 2/8] drm/xe/mmio_gem: use write-back mapping for dummy page
Date: Tue,  8 Sep 2026 17:50:49 +0100
Message-ID: <20260908165046.1393557-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908165046.1393557-10-matthew.auld@intel.com>
References: <20260908165046.1393557-10-matthew.auld@intel.com>
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

Currently vmf_insert_pfn() maps the dummy page as UC, inheriting the
VMA's page protection which was set for the real MMIO region. This
conflicts with the direct map's WB mapping of the same page, creating a
cache type alias which is architecturally undefined on some platforms.

Use vmf_insert_pfn_prot() with a WB pgprot instead. Also simplify to
fault in the requested page instead of the whole VMA.

Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260525125801.975038-6-ilia.levi%40intel.com
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index d54477b93b6e..96f3bf46fd75 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -172,14 +172,13 @@ static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
 	__free_page((struct page *)res);
 }
 
-static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
+static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_fault *vmf)
 {
+	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *base = vma->vm_private_data;
 	struct drm_device *dev = base->dev;
-	vm_fault_t ret = VM_FAULT_NOPAGE;
 	struct page *page;
 	unsigned long pfn;
-	unsigned long i;
 
 	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 	if (!page)
@@ -190,16 +189,8 @@ static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
 
 	pfn = page_to_pfn(page);
 
-	/* Map the entire VMA to the same dummy page */
-	for (i = 0; i < base->size; i += PAGE_SIZE) {
-		unsigned long addr = vma->vm_start + i;
-
-		ret = vmf_insert_pfn(vma, addr, pfn);
-		if (ret & VM_FAULT_ERROR)
-			break;
-	}
-
-	return ret;
+	return vmf_insert_pfn_prot(vma, vmf->address, pfn,
+				   vm_get_page_prot(vma->vm_flags));
 }
 
 static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
@@ -219,7 +210,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 		 * It is assumed the userspace will receive the notification via some
 		 * other channel (e.g. drm uevent).
 		 */
-		return xe_mmio_gem_vm_fault_dummy_page(vma);
+		return xe_mmio_gem_vm_fault_dummy_page(vmf);
 	}
 
 	for (i = 0; i < base->size; i += PAGE_SIZE) {
-- 
2.55.0

