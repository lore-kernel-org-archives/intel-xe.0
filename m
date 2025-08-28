Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD08FC8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BEA10E96D;
	Thu, 28 Aug 2025 10:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cd/oKHKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4535B10E95F
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756376530; x=1787912530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MeZCaqAjDsnsJXIX0Kz1sTZs5CySW2wfAol5u7EA17o=;
 b=cd/oKHKYa1gSwUCJYPxzHeoA68HIHF7u97SUQiqyP4ETh5ucCrbPtQKc
 1e4lVwuIZ/J3naHK8NysbcZsyqLB1Nfc6G5x/N4pXaLI864gzJtwEFjf9
 ED2ZZ+8+qHAMZ4Obl7w8hBKsTLL9n+9JleLAdRV5CXwaFcNroTpd9La0U
 /+VB3KWelwDPcKHQJLflcTjZ5WjUPZQWTSXpic+lWudldkKlfq3fJbPWK
 vuTuD0mO7E7XkxjDY7zqVdrFOvDDRX3qeCO/YZcINl6xc2sX//ad2fsys
 03txz53/FaoRietHzGEcoYGWkZqOZYgAldjKk0H5IH5/ZaOH2EHr7ZtbE Q==;
X-CSE-ConnectionGUID: TSDgeStPRL+zsWRvR/VWHQ==
X-CSE-MsgGUID: 624gleHrR4SXZvA+XUXjQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58741878"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58741878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:22:10 -0700
X-CSE-ConnectionGUID: 9tESyOVaRNuQvTTK9h9b0Q==
X-CSE-MsgGUID: bh1JylLxQIqr51q+aXR3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="201040289"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 28 Aug 2025 03:22:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 1/2] drm/xe: Fix indentation in xe_zap_ptes_in_madvise_range
Date: Thu, 28 Aug 2025 16:19:32 +0530
Message-Id: <20250828104933.3839825-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828104933.3839825-1-himal.prasad.ghimiray@intel.com>
References: <20250828104933.3839825-1-himal.prasad.ghimiray@intel.com>
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

Fix misleading indentation around WRITE_ONCE in pte zap loop.
No functional change intended.

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 7813bdedacaa..6f5e027fb58b 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -201,12 +201,12 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				if (xe_pt_zap_ptes(tile, vma)) {
 					tile_mask |= BIT(id);
 
-				/*
-				 * WRITE_ONCE pairs with READ_ONCE
-				 * in xe_vm_has_valid_gpu_mapping()
-				 */
-				WRITE_ONCE(vma->tile_invalidated,
-					   vma->tile_invalidated | BIT(id));
+					/*
+					 * WRITE_ONCE pairs with READ_ONCE
+					 * in xe_vm_has_valid_gpu_mapping()
+					 */
+					WRITE_ONCE(vma->tile_invalidated,
+						   vma->tile_invalidated | BIT(id));
 				}
 			}
 		}
-- 
2.34.1

