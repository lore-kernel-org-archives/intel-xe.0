Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311B2C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 16:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67DE10ED25;
	Tue,  8 Sep 2026 16:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CnYh3uzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A1410ED0E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788886273; x=1820422273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dLnRShD0558W3BVNEJZOyxXiroDKtr7Ejg7+9Hd8l8U=;
 b=CnYh3uzDH6DK8z3ZFiko+Zim76Bn3TrLA3mIhw/LuuVsnkTyaAf9KDeV
 /3M1ks+W3vnJ0FDspyE9Yup6trG+xaCZmKcmEVjQoVpqp8RpEInreae/d
 HggLoky98Wj0FxuD5omjoaADsFkpJVK/5x2SmZI214Xlizz4aVHx2RKrm
 LWALIHBMIT9PwRJBU1LobrKVichUyEmvSUaqrFzLaDfZyuAKq0vkJbEIA
 z1wt/D6nZuGhtF23Za6fvnCa/R5tv76gJ0kB07uIAjLyLI6HDEIFRjHtw
 Xh3E6C+RrPlt1907C6a++GB32a47EjIMJYh84Bg3GwruqI5g8QeAy8TFC w==;
X-CSE-ConnectionGUID: C0C+460zQBGXywvBmQ+J5g==
X-CSE-MsgGUID: mwxwO515QyiW5E+1hcnReg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99888272"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="99888272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:13 -0700
X-CSE-ConnectionGUID: I50GoQ2QTO6KcvEF/pvyfA==
X-CSE-MsgGUID: WZPaR+15TamoilyY5IadAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="272995681"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH v5 3/8] drm/xe/mmio_gem: simplify fault handler loop
Date: Tue,  8 Sep 2026 17:50:50 +0100
Message-ID: <20260908165046.1393557-13-matthew.auld@intel.com>
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

