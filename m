Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813A5C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 20:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4377E10E1A0;
	Wed, 23 Jul 2025 20:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLrTH+4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C203C10E069
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 20:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753302050; x=1784838050;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CJaveoxL/J03x0ETPtQlnrUGSHhwVsKS3a5D769czEQ=;
 b=ZLrTH+4TCtzA37dkHWYRQNKumDVtAqw+Qan3ODspryzKjsELEKXwsmIe
 bXaFx8Ha2b0ryIKLEFzqP53M1TezgA576DNMrOakb9MRNwqNAUbsRBhLA
 77APLsD4tDyy8XkoUQYEpiNyPCNpy1jkMvAWqW11099552ipNkf1Si34m
 aoWi5CUWRWVFTv1OQ5pMdHxUIUgH86Oe8T0icNIlXW6rmxsU7emx0Z5oN
 9sr66hZC1bJccE9f/JPljeSgwtjmGx6bHCWEnVe1+4bPaKL6RHr60Aotk
 GRKuivwDYGgu2LTh1rr+LbTpyhiGgUbIF4+ZmVIPvP4IBcAgTwNhnGyXh g==;
X-CSE-ConnectionGUID: jSx51LUMQiCHbWbDjrhjSw==
X-CSE-MsgGUID: qKT1xw+wRYW8m+jODO0DAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55558273"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55558273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:20:50 -0700
X-CSE-ConnectionGUID: VOzBQM29RwCU4xpUXJ32+w==
X-CSE-MsgGUID: MpN5WympTUyU4GdMlY4ljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="190651580"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.108.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:20:49 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Jul 2025 17:20:10 -0300
Subject: [PATCH 2/2] drm/xe: Use for_each_gt to define gt_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-gt_count-improvements-v1-2-3016134db9ea@intel.com>
References: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
In-Reply-To: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

We are currently bumping gt_count as we define GTs for each tile. While
that works with our current code, there are reasons to improve that:

* That section of the code is dedicated to define each tile's set of GTs
  and their respective info. The gt_count can be seen as a device level
  property. While it is fair to bump it as we define each GT, we can
  also focus on the GT themselves and count after we are done with the
  definitions.

* More *importantly*, gt_count should reflect the number of GTs that we
  would get when looping over them with for_each_gt(). Bumping gt_count
  the way we are currently doing makes that value not really connected
  to for_each_gt(). This could bite us in the future if in the loop gets
  extra checks that are not accounted for in each existing "gt_count++".

As such, let's use for_each_gt() and extract the calculation of gt_count
into a separate block, just after we define the set of GTs for each
tile.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4f5d4f0a8173..4aa3381f32bc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -731,7 +731,6 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.id = tile->id * xe->info.max_gt_per_tile;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
-		xe->info.gt_count++;
 
 		err = xe_tile_alloc_vram(tile);
 		if (err)
@@ -756,9 +755,15 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
 		gt->info.engine_mask = media_desc->hw_engine_mask;
-		xe->info.gt_count++;
 	}
 
+	/*
+	 * Now that we have tiles and GTs defined, let's loop over valid GTs
+	 * in order to define gt_count.
+	 */
+	for_each_gt(gt, xe, id)
+		xe->info.gt_count++;
+
 	return 0;
 }
 

-- 
2.50.1

