Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0CCEE34D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 20:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACCD882B5;
	Tue, 18 Nov 2025 20:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxFcAKXF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A51882B5
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 20:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763496888; x=1795032888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SG+y7GsHX7YkA/gopa6CWN30m27UUQ1mtvES7R2sUFI=;
 b=SxFcAKXFHDwkOvVi0dKN1jYhXZApSMnKPbFcztugbuA6C2n1d2GfR76T
 e3tiARZ/ewQbQxTqos6PotiFmeTO5iDXi3OdUKaTpEWi1ETRejNcNH7PD
 ASs7Os1AiAWjcZgrUO1Qc1EdLA7dudkFXs7v0li6X5WSfJ4ASE122laQO
 WCsLee76rGme/NWeh52PPyNgLMX2vx0RxDxbG1+0PTHpPNrXBE2XL+Ic6
 MEugK1mMDHmU2vnFYSx81jXWGZmJfSI4pXPwrEOANSG9EI2cCvmJ3SgZU
 2n/pvmQblTm2CGbVrTZO5M7pK+i3egVzBg2+ZUBOXXQpEOmRdfotvFHgK A==;
X-CSE-ConnectionGUID: FoDmeYh5T5qC2Fc4z5GafA==
X-CSE-MsgGUID: U2TPJC/BSim8ozfrZBRe3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65692103"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65692103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 12:14:47 -0800
X-CSE-ConnectionGUID: 7oUYt0SERmmeBAwfPNn5qA==
X-CSE-MsgGUID: fFzS/LEVRBCgdBqhTNq5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195165087"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 12:14:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/vm: Use for_each_tlb_inval() to calculate invalidation
 fences
Date: Tue, 18 Nov 2025 12:14:40 -0800
Message-ID: <20251118201439.3688178-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
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

ops_execute() calculates the size of a fence array based on
XE_MAX_GT_PER_TILE, while the code that actually fills in the fence
array uses a for_each_tlb_inval() iterator.  This works out okay today
since both approaches come up with the same number of invalidation
fences (2: primary GT invalidation + media GT invalidation), but could
be problematic in the future if there isn't a 1:1 relationship between
TLBs needing invalidation and potential GTs on the tile.

Adjust the allocation code to use the same for_each_tlb_inval()
counting logic as the code that fills the array to future-proof the
code.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7cac646bdf1c..6794f38b9340 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3111,12 +3111,12 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	if (number_tiles == 0)
 		return ERR_PTR(-ENODATA);
 
-	if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT) {
-		for_each_tile(tile, vm->xe, id)
-			++n_fence;
-	} else {
-		for_each_tile(tile, vm->xe, id)
-			n_fence += (1 + XE_MAX_GT_PER_TILE);
+	for_each_tile(tile, vm->xe, id) {
+		++n_fence;
+
+		if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT))
+			for_each_tlb_inval(i)
+				++n_fence;
 	}
 
 	fences = kmalloc_array(n_fence, sizeof(*fences), GFP_KERNEL);
-- 
2.51.1

