Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1681FCD484F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B428F10E663;
	Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnXBTNDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE10110E63B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oUxw5U7qKooVYR8txCSqxPwklVqbKlV3RNVtBu5f9gA=;
 b=ZnXBTNDmPAHKdPVJJQLds4TbmAnWnf3qz7TeAStWb9PkLAY2DwVVmn6B
 5VoMyXvJF2M2pkfigyhKq6d/uJDcjp5LKaSIuMXqWFN4U0L+v2dYjsK32
 wHFiaUPFmmBileAY5crtS6mfKpg5arx1XTa2b6L15nm3bbqe94CUwlY83
 XE8fAD9BHIrryHGmhZQ46ddtl+xE99Liivk5+AVRx0GL9ikHd1ME87BNF
 VbLM0w49cSH57rvW4XEfKQyBx9cA/f43qBtdNPGxN7QI4kISkJW67bitO
 ukONFdnKcH1pRmxoZ3umUcMqvZOtAgoZhhve3GqWCtl6RD03tANzVGpba w==;
X-CSE-ConnectionGUID: n2fmS9UsQDW+ehKezDPe8A==
X-CSE-MsgGUID: sZsuhxZiSh68wMs2peu09Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904832"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904832"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
X-CSE-ConnectionGUID: p/EQDu/yTbWoGc33ODBxYw==
X-CSE-MsgGUID: MknFl6TySZOg8AGVdHrg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944344"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 41/43] drm/xe/ggtt: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:42 -0700
Message-ID: <20240904002100.2023834-86-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f3fca5565d32..0f4e778a7663 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -107,8 +107,10 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 
 static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 {
-	struct xe_gt *gt = XE_WA(ggtt->tile->primary_gt, 22019338487) ? ggtt->tile->primary_gt :
-			   ggtt->tile->media_gt;
+	struct xe_tile *tile = ggtt->tile;
+	struct xe_gt *affected_gt = XE_WA(tile->primary_gt, 22019338487) ?
+		tile->primary_gt : tile->media_gt;
+	struct xe_mmio *mmio = &affected_gt->mmio;
 	u32 max_gtt_writes = XE_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
 	/*
 	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
@@ -118,7 +120,7 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 	lockdep_assert_held(&ggtt->lock);
 
 	if ((++ggtt->access_count % max_gtt_writes) == 0) {
-		xe_mmio_write32(gt, GMD_ID, 0x0);
+		xe_mmio_write32(mmio, GMD_ID, 0x0);
 		ggtt->access_count = 0;
 	}
 }
-- 
2.45.2

