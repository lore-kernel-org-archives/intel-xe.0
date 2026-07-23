Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01236C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CA810F15E;
	Thu, 23 Jul 2026 16:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YH6wX4K0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6966810F15B
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823541; x=1816359541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aSDB2s8h8GSEyh5rdtfXqtQL6E4s27xeiuYyvPm8aqU=;
 b=YH6wX4K0nEwY7Q6sGWLfzfclj7Ltuq2ofPuFhichhvLpSvf9YVpbVd/s
 5vY2Wp/ckNGHEqROzB7sBX7clE0L+7x5Qg1m/HXhFiADMaQqGIyLxpdxN
 fctnwyZaL9qOv01AON2kK3SZPvNnthDIgJeBAG1/GOsrvHFyZc9HZ9jl/
 U8RJOf2jlUq1esP0iYRHEj4rqUzSABYl9o+J7RE+jLCc+zEb2WQcDq5DB
 uwlh0765Jsq0ugcM3C8Jg1A3OLh64C3I0c/sTISoKEkdmPPqCIarAPQJS
 S3h4n7H2ivhmvz5BFPUIiUCojJYbei0+99H5F2k74ryVvRz9ufxaEMg1A g==;
X-CSE-ConnectionGUID: jKxwaCUEQ0uxtqPuj+S8dw==
X-CSE-MsgGUID: R/MTyE+zRjyBb3rteSHZ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88022907"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="88022907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:01 -0700
X-CSE-ConnectionGUID: +eT5z13FRx20NMy5RFzhmQ==
X-CSE-MsgGUID: GxV0VzWsT9ipETyjnWLjhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255086053"
Received: from lharel-mobl.ger.corp.intel.com (HELO
 soc-PF64PT41.clients.intel.com) ([10.245.129.67])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:18:58 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, meny.yossefi@intel.com,
 shuicheng.lin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/7] drm/xe/mmio_gem: use write-back mapping for dummy page
Date: Thu, 23 Jul 2026 19:18:27 +0300
Message-ID: <20260723161832.137153-3-ilia.levi@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260723161832.137153-1-ilia.levi@intel.com>
References: <20260723161832.137153-1-ilia.levi@intel.com>
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

Currently vmf_insert_pfn() maps the dummy page as UC, inheriting the
VMA's page protection which was set for the real MMIO region. This
conflicts with the direct map's WB mapping of the same page, creating a
cache type alias which is architecturally undefined on x86.

Use vmf_insert_pfn_prot() with a WB pgprot instead. Also simplify to
fault in the requested page instead of the whole VMA.

Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260525125801.975038-6-ilia.levi%40intel.com
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index f15a6a84af15..418a24bdfa4e 100644
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
2.49.1

