Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43598CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 12:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4210E4D4;
	Tue, 26 May 2026 12:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDWFggjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4999B10E49D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779799911; x=1811335911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4brUu5V68WIzWdeeYUaG1dmaJZYXkYxM6aL77q1n+mw=;
 b=PDWFggjrhDMtJ1WHLtwTXVA0TIRbBjqLMWdfE1M9yQQE5jYuxtntj/k+
 jvMcO1jr75SThTULC6Q3dlpVEQT9JPuy8MooE9reCnSKO3E60Tfdhx28Z
 sY2Z4FKltMwMVup3PEaFNAku1OOr3Z6HMEpPYvS3b54QcN4L1npQS5iro
 IvlKri2gZfisRj8HDGX+auJRGfQvfDB9/ivzu2qcGqSCaAem4mrbg1d3/
 UzwrdbIultKRe59KpsGVCkoSWD+5tpu/TawLDOHglvXR0zqKLL1vtJFAz
 TlNveBXdOHnhf+u7q2jAxOkAAPRRzRX9M2b7EfSsww9LMX0ZKS9ZGn6vc A==;
X-CSE-ConnectionGUID: ez+bOj4KRPKaHjaQpWFL+g==
X-CSE-MsgGUID: y47cqfkuTmO23/Urm1upaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92082759"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="92082759"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:28 -0700
X-CSE-ConnectionGUID: kLJMCvQwTA2kGrkpMuT4fA==
X-CSE-MsgGUID: 6NoRus1VSvCoQZyyAuoXnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="235554551"
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:22 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/5] drm/xe/mmio_gem: use write-back mapping for dummy page
Date: Tue, 26 May 2026 15:51:08 +0300
Message-ID: <20260526125106.2806522-8-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526125106.2806522-7-ilia.levi@intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
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
index 8c803ef233cc..c22a38e5616b 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -162,14 +162,13 @@ static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
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
@@ -180,16 +179,8 @@ static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
 
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
@@ -209,7 +200,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
 		 * It is assumed the userspace will receive the notification via some
 		 * other channel (e.g. drm uevent).
 		 */
-		return xe_mmio_gem_vm_fault_dummy_page(vma);
+		return xe_mmio_gem_vm_fault_dummy_page(vmf);
 	}
 
 	for (i = 0; i < base->size; i += PAGE_SIZE) {
-- 
2.43.0

