Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FD5C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 13:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB98410EC09;
	Tue,  8 Sep 2026 13:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwclhZHT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D952F10EBFF
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788875451; x=1820411451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OqJ7sSLaT5DeKfiit4fJrENKZ6eJjft8cp8YERPLx7o=;
 b=TwclhZHTHvIRMDkSKkDPptQIBO0DgKvZZLx3iQLLYFbYwLCa/69PmaaC
 +eKxLgmLBi8OKDS4h7iUxN1PJnVp0mqS1TuAHDISguqWOO8HxobU05v+U
 wvPgtecaQxwKWyvgBMjt0Pzmo7aBHRVyFtG31twrGs6OU1g/V4SA5h4qa
 61MIBHA5OYaKhUQgC1tz6A5UBZg4i7vkfOfrep6U14AIwkQhcS8PaY7NB
 9ouS+oaybb5RtTmi4TFRrZOC+qcP/cz1JrPl1VNb/XzdRQ3nhpFGP87sD
 JzL6HJ4J1phQ5AkPpuE3ijH+vyYK1Btxec7FYIvX/MJuJ8LyCpmPjVbUK Q==;
X-CSE-ConnectionGUID: QKJewbh0RK+oxqpYEN9f8Q==
X-CSE-MsgGUID: YmLB6DHBQYmcZnV6InkLdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106793376"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106793376"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:51 -0700
X-CSE-ConnectionGUID: +mkJ1/NzR1isDDZAp2cDNA==
X-CSE-MsgGUID: qEzwNdX3SpWn5GrYpSURtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270519677"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ilia Levi <ilia.levi@intel.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 2/8] drm/xe/mmio_gem: use write-back mapping for dummy page
Date: Tue,  8 Sep 2026 14:49:58 +0100
Message-ID: <20260908134955.1344429-12-matthew.auld@intel.com>
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

