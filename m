Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4444CCDB46B
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 08:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F7A10E532;
	Mon, 22 Jun 2026 08:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqRFKAL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A6510E532
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782116650; x=1813652650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rai2mWn+l/AsRaq7X660sx+O+oywCAhc7aN/It5Eoss=;
 b=eqRFKAL/HKKfoHCZ97UGPP5rcv4hwa21tyhB64Mrp1ktALnvYafSRY/f
 MjkPf9JqQL75NwJI/cgr0BxY53X8WjG3LZBusESgL6iVYg8o/77hMA/n5
 4zvx6XC5Qgb6w+Hj8R4uRyRkGVa1MK5Er104K+OncOPcT54krombQAjwx
 FiaIqwwKj1IPvLeBeNscMQugmPRZw5osDxUWoBYjv7oDbGzOvd0M0sUKx
 2KlPETHqGqOoGaPi+TPY26n9Fi8/IaGi7p389nInpDIpe1RIkQ3tVJG5p
 xSjHBiJ62DKYgP1CDGbsLCmo8hO/1TcdgPMVbYyEjod6KUcaeFpMUbKrH g==;
X-CSE-ConnectionGUID: l/BQfC5hQZ+x2IRpOOW1tQ==
X-CSE-MsgGUID: 58LjwHyGTpW3rD0mL4X82g==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82726802"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82726802"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:24:09 -0700
X-CSE-ConnectionGUID: OyUOEIRiSTKleEindu8DOQ==
X-CSE-MsgGUID: JeyaC+CgRLKwKv7tB/xbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="279356903"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 22 Jun 2026 01:24:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Martin Hodo <martin.hodo@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC
Date: Mon, 22 Jun 2026 13:54:46 +0530
Message-ID: <20260622082445.1720007-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
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

When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for a BO VMA,
the code used it as an index into region_to_mem_type[], causing an
out-of-bounds access since the value is -1.

Resolve the preferred location for BO VMAs directly: local VRAM on dGFX
(using the BO's tile placement) or system memory on iGPU.

Discovered using AI-assisted static analysis confirmed by Intel Product
Security.

Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..5a487eeb0271 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3255,11 +3255,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 						    .request_decompress = false,
 						    .check_purged = true,
 					    });
-		if (!err && !xe_vma_has_no_bo(vma))
+		if (!err && !xe_vma_has_no_bo(vma)) {
+			u32 mem_type;
+
+			/*
+			 * For CONSULT_MEM_ADVISE_PREF_LOC, resolve to the
+			 * BO's default preferred location: local VRAM on dGFX
+			 * or system memory on iGPU (no-op since BO is already
+			 * there).
+			 */
+			if (region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC)
+				mem_type = IS_DGFX(vm->xe) ?
+					xe_vma_bo(vma)->tile->mem.vram->placement :
+					XE_PL_TT;
+			else
+				mem_type = region_to_mem_type[region];
+
 			err = xe_bo_migrate(xe_vma_bo(vma),
-					    region_to_mem_type[region],
-					    NULL,
-					    exec);
+					    mem_type, NULL, exec);
+		}
 		break;
 	}
 	default:
-- 
2.43.0

