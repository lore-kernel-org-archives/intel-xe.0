Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11181CA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 13:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE09D10E44B;
	Mon, 18 Aug 2025 13:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLfotIRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B20A10E44B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755525108; x=1787061108;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=z7m9F0/5GzYOULL7LAWjI0leIcjlzIZylvOQkpkwhj8=;
 b=KLfotIRB4EWzENQly2YZbttknDkhpmfzOQHsw2OvFva/iPvyzn50ZHvf
 3dHwiWZrAXGmvg6SdV9N4Cx7cDKWYOkIKJHKVx1Vi93PmKy9LsIjjdedL
 +RZf04NY5ToECzPCqlL1YUMgMULaMkvIRKBR19AQR+UNRy8XFlO7GZDob
 /0ZPQvEQOgNDGyIgyf0OrkaLsXj0NELAmJX5H0qtiLAINS5sTKstyd/SE
 ZP6epc9hAqPcMethj5dyeSJRJlQ/RCrSDWOy/Lh+672y80APGlq9Rp9el
 HZuLw2QuGZ3pDioMax9i3dsEhjDI3FOlC/qvo5N2A7WizFUaRJ+UHJtVU w==;
X-CSE-ConnectionGUID: 0ZF0UhbiRaCOxr/+BkqOKQ==
X-CSE-MsgGUID: HhQUptQORWCpmYumkCQFfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61373718"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61373718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 06:51:48 -0700
X-CSE-ConnectionGUID: 9cP2JNYTSDit1ReAzJybBQ==
X-CSE-MsgGUID: ZoNk7oB9Tyu95JppD0DmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172785492"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.108.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 06:51:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 18 Aug 2025 10:51:03 -0300
Subject: [PATCH v3 2/2] drm/xe: Use for_each_gt to define gt_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-gt_count-improvements-v3-2-32f6901e42e6@intel.com>
References: <20250818-gt_count-improvements-v3-0-32f6901e42e6@intel.com>
In-Reply-To: <20250818-gt_count-improvements-v3-0-32f6901e42e6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
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

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0d7073a04bb2..12de65756599 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -734,7 +734,6 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.id = tile->id * xe->info.max_gt_per_tile;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
-		xe->info.gt_count++;
 
 		err = xe_tile_alloc_vram(tile);
 		if (err)
@@ -759,9 +758,15 @@ static int xe_info_init(struct xe_device *xe,
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

