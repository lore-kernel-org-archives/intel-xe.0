Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22911CA1013
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 21:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D563210E294;
	Fri,  5 Sep 2025 21:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ns/IrYTN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A27710E294
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 21:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757109384; x=1788645384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ppo6Bjsn+drBh/GV8f3bto79MDILGEz1lLlsOKZKnaY=;
 b=Ns/IrYTNHm1p7MbBCBJ6Hi1eE/ayTT4JnbL42cU3G0bEhi6Hgi58d8GD
 JVVHu2hz17UX9oLXs2QPZkf4Dy0cP7jREqgyMrpuECk4He7U+Pg5GRRPt
 qx1+Ci3VJL07/MBQSIecchtRVUte1ydiEGaqQYaQgxRyT0XqwmBEnOU9e
 hDtL9Nwy3fC5NPBZlwOnX11Mi5w2ZnU5W4F9J5/1SWgj7xzvRLN54ibrw
 SUmhlM0NeqKSK/6r7wKdcjtrrbq/yUoRyxWGtPaBGTS8Zr3KK4ezJoPKU
 NW8lqtSYnMsy8apM6vrcBj/B5hlleKlWqynf294dLKHsLgy2FYmgMiaQO w==;
X-CSE-ConnectionGUID: U2gl0mCmRMitsnh+AsT2HA==
X-CSE-MsgGUID: J4JtygRFQ9+b9Cux1sHTkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="76919859"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="76919859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:56:24 -0700
X-CSE-ConnectionGUID: 4/MzUcmUS6KOh8md6kfcYw==
X-CSE-MsgGUID: lm+B1TGFTIubqoBreAg0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172175908"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:56:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Francois Dugast <francois.dugast@intel.com>,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH 2/2] drm/xe/xe3: Correct L3 bank mask readout
Date: Fri,  5 Sep 2025 14:56:16 -0700
Message-ID: <20250905215614.796247-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905215614.796247-3-matthew.d.roper@intel.com>
References: <20250905215614.796247-3-matthew.d.roper@intel.com>
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

Our readout of L3 bank mask on Xe3 had two subtle bugs:

 - When the bank mask moved from 0x9118[7:4] to 0x9130[31:0], the
   semantics changed from being a per-node mask to being a system-wide
   mask.  I.e., the value reported by the MIRROR_L3BANK_ENABLE already
   represents the banks across to all L3 nodes, so there's no longer any
   need to replicate the mask multiple times, and no need to even read
   the node mask on these platforms.

 - Each bit in MIRROR_L3BANK_ENABLE represents a _pair_ of banks on Xe3
   rather than a single bank.  This means that we need to duplicate each
   bit of the mask we read from the register when determining the real
   bank mask.

For userspace that only counts the number of L3 banks in the mask and
doesn't care about the specific bit positions, these two bugs would
often cancel each other out in many cases (since a platform with two L3
nodes would have the hweight of the bank mask incorrectly doubled by the
first bug, but incorrectly halved by the second bug).

Fixes: 11a64adcdbcc ("drm/xe/xe3: Generate and store the L3 bank mask")
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 4e61c5e39bcb..53bc2bc8cbac 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -149,14 +149,13 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 		return;
 
 	if (GRAPHICS_VER(xe) >= 30) {
-		xe_l3_bank_mask_t per_node = {};
-		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
+		xe_l3_bank_mask_t per_mask_bit = {};
 		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
-		u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);
 
-		bitmap_from_arr32(per_node, &bank_val, 32);
-		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
-					 meml3_en);
+		/* Each bit in the mask register represents a pair of banks */
+		bitmap_set_value8(per_mask_bit, 0x3, 0);
+		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_mask_bit, 2,
+					 mirror_l3bank_enable);
 	} else if (GRAPHICS_VER(xe) >= 20) {
 		xe_l3_bank_mask_t per_node = {};
 		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
-- 
2.51.0

