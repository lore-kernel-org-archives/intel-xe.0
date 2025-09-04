Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF86CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 16:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F94A10E071;
	Thu,  4 Sep 2025 16:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXYafQov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2710510E071
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757002548; x=1788538548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iUWfxkMoOVIEeQUA7U3gB0pbxdhaio6as90NbPVO1dg=;
 b=XXYafQovorFj+J/D+lEEynaFlZSb5x03AxZ8gGrPp0YqIgq3CDMMMwBj
 BNyyElJ9m0dTQfpfsj+EZKQdLxhEYvFRNPKgS6oIPeTKih7dBKKjMVFB+
 qZ6ibrQctYil3KE5XkhZqYoTBfhTwrj27QCgaWL214Cso8xvzlT9miY3h
 w1yVMxUqMf1j+N6VW2223ZKiXWfrBfUxkNkzWRzi7gEgiUNk14+GG2oee
 bZrZHyvX1VBcCwsvc9ZeuBWhwq5xVPMGJQ8OumIthr0wlU/M8Jsf3cuW2
 CJQESqU3H+zes42MZsFl6lFNTCt7CjNAxF9R2diYy4Qpc+TQWx3P12F9g g==;
X-CSE-ConnectionGUID: AzzJQUrJSKGy6m3cbiVnmg==
X-CSE-MsgGUID: wZw+pT5zSCCWwPzZR5wciw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59298786"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59298786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:15:48 -0700
X-CSE-ConnectionGUID: FV49RiCiTbinUA+5wzPOHw==
X-CSE-MsgGUID: qx700kDETtWV26XlBLke9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171483405"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:15:46 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v2] drm/xe/migrate: Remove unneeded emit_pte() when copying
 CCS only
Date: Thu,  4 Sep 2025 21:44:23 +0530
Message-ID: <20250904161423.2448727-1-sanjay.kumar.yadav@intel.com>
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

In xe_migrate_copy(), when copy_only_ccs is true, we only need two
emit_pte() calls one for the BO and one for the raw CCS storage.
However, the current implementation issues three emit_pte() calls,
resulting in an unnecessary PTE programming job.

This fix removes the redundant emit_pte() call to avoid programming
the same PTEs twice and reducing overhead during CCS-only migration.

v2: Preserve correct behavior on DG2, which requires both CCS and
page copies.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9643442ef101..a4b0187f856d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -842,11 +842,15 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
-
-		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
-		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
-					      &dst_L0_ofs, &dst_L0_pt, 0,
-					      avail_pts, avail_pts);
+		if (copy_only_ccs) {
+			dst_L0_ofs = src_L0_ofs;
+		} else {
+			pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+			batch_size += pte_update_size(m, pte_flags, dst,
+							&dst_it, &src_L0,
+							&dst_L0_ofs, &dst_L0_pt,
+							0, avail_pts, avail_pts);
+		}
 
 		if (copy_system_ccs) {
 			xe_assert(xe, type_device);
@@ -876,7 +880,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
 			xe_res_next(&dst_it, src_L0);
-		else
+		else if (!copy_only_ccs)
 			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
 				 &dst_it, src_L0, dst);
 
-- 
2.43.0

