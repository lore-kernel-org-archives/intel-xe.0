Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE58C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58F410F166;
	Thu, 23 Jul 2026 16:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6Q7a+O3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC6010F168
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823549; x=1816359549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BJwJ2N4qW6gTYSJZUOmvZRRGyuvERybCKwWlekQwMe4=;
 b=k6Q7a+O3Ih/lNh3q8XK5ZPsttx3ht1/KREyh2nRYfOYVUrA3BJOJP48O
 WdX+b3KrbqlTvNcTZmnMqop2mwG5+sCCplk5D82nNfheOnp3VdrADa+lS
 9Dv3w/gHgLlXXVzcBoG9eftkSkxH57T8oFGpIjG+Ld8KOfQ1p2/0AepVa
 AESwtqN98oToTHEijEGm4MS0itEF93bX8VWiwETYU5jNh24sYABsLXAAZ
 ih3f8WZr009Gf53sZsv1PqkpMW9v1TooUGZACplLCo6rQdYN5xITI4Msv
 RC+Ci7jwt64Fz3VvTSl2H62nRiLhYQmIjly/G+o3AG8AnKjwIZ1mPm2L4 w==;
X-CSE-ConnectionGUID: QKF6SF04Qoq8SyDymX0zxg==
X-CSE-MsgGUID: eQVr/Uz0RNy/0tQn70f4Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88022913"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="88022913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:04 -0700
X-CSE-ConnectionGUID: f2k8r1KvTnCz7Iya1KmUHw==
X-CSE-MsgGUID: 8rOnadg/RdiI1irBmTRafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255086059"
Received: from lharel-mobl.ger.corp.intel.com (HELO
 soc-PF64PT41.clients.intel.com) ([10.245.129.67])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:01 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, meny.yossefi@intel.com,
 shuicheng.lin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 3/7] drm/xe/mmio_gem: simplify fault handler loop
Date: Thu, 23 Jul 2026 19:18:28 +0300
Message-ID: <20260723161832.137153-4-ilia.levi@intel.com>
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

Make the iteration over the addresses in the VMA more explicit.
No functional change, as the VMA matches the GEM object exactly.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 418a24bdfa4e..dd41a62cb63c 100644
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
2.49.1

