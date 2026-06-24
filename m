Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CCCCDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 17:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA33510F003;
	Wed, 24 Jun 2026 17:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvtr0iHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA5210EFFD
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 17:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782323345; x=1813859345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xAHuQkHSY2dVep77d3Fk0b24pBQ8i3jBJOfy9zdNcpg=;
 b=cvtr0iHv1Im44RuLsmvg55O2hnrVrRbOUdPmbrEYFu0LFPxqGF1cvtdk
 57Mn5cQ0mLrqPoJHur78gR6T1bCKXy/1ArsbxMWyORFobn7/cAfsnNH8d
 2rEqunXexSmTciwFCKgbpG5LlnpI3DfLjcIcYt6AlfP8aNUtSnT3tMgTM
 msuNacR4cOwJB2Oh+NC4LyVvVEM4pZXXBZOIkvSk1N3QBVWm3tt4DH/Xv
 a0GAxzhu4rQ18vAyP+5waUBiU1Cxg7R05mUfCTVsR9sNPn250C3LTIXwf
 apFU9O4eNRH0qwAM9nL0DrFvzjwc3+Kha8T8yeCds9T4a6Xtl02PZW4fA w==;
X-CSE-ConnectionGUID: NuxFZhrKSqOTsfLyDbonKA==
X-CSE-MsgGUID: SrEVA5S0TweJFAv+nj6BQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94212857"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="94212857"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 10:49:05 -0700
X-CSE-ConnectionGUID: gabE7xqJSASnISBrG7WZ0g==
X-CSE-MsgGUID: auGuc9pMSti0DVU614YnaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="273627588"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 24 Jun 2026 10:49:03 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Martin Hodo <martin.hodo@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC
Date: Wed, 24 Jun 2026 23:19:44 +0530
Message-ID: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
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

v2:
-Fix null dereference

Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..32ded13491ca 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3255,11 +3255,26 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 						    .request_decompress = false,
 						    .check_purged = true,
 					    });
-		if (!err && !xe_vma_has_no_bo(vma))
-			err = xe_bo_migrate(xe_vma_bo(vma),
-					    region_to_mem_type[region],
-					    NULL,
-					    exec);
+		if (!err && !xe_vma_has_no_bo(vma)) {
+			struct xe_bo *bo = xe_vma_bo(vma);
+			u32 mem_type;
+
+			if (region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
+				unsigned int i;
+
+				mem_type = XE_PL_TT;
+				for (i = 0; i < bo->placement.num_placement; i++) {
+					if (mem_type_is_vram(bo->placements[i].mem_type)) {
+						mem_type = bo->placements[i].mem_type;
+						break;
+					}
+				}
+			} else {
+				mem_type = region_to_mem_type[region];
+			}
+
+			err = xe_bo_migrate(bo, mem_type, NULL, exec);
+		}
 		break;
 	}
 	default:
-- 
2.43.0

