Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791F5C47DDF
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 06:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD75E10F80E;
	Thu, 25 Jan 2024 06:50:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BAF10F80E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 06:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706165419; x=1737701419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RH6zrht2f5UMjZEeyOYld5C86W86TuJCDGT5djLlP/c=;
 b=UEMh5bHZm2nehLnfftQNBzDRiF8BtANOYVHlgsAbwCDto1TcTKAnYZNT
 2qJP3t2RkEqDJamw0mjWQ3ThGEg2F4kLyP4kmaEPGsCdtEqbIF21ZR6pu
 zvqurvGQmOX1/O8KV00gX5j6zZfEcilMFADSqo4Vk8JW1a1kI7yCeS7vw
 3x/KSaQaLPxDx+GSYzwrQjabifsQKyXWAb6x3IWeRLFZKi+aqd8nkz3Jx
 tbsGvtd14a9MsMtIFnbJVH59moXN3mwcbIAT+NEloVonWHaOPDiWOBK6I
 gppEnE24aT/Wysww+v8VzieJWhlV7ibGUeyoEneitx1405QRS/CM4ar3m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15428176"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15428176"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28387858"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:50:19 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe: correct the assertion for number of PTEs
Date: Wed, 24 Jan 2024 22:52:45 -0800
Message-Id: <20240125065245.1204731-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125065245.1204731-1-fei.yang@intel.com>
References: <20240125065245.1204731-1-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

While one MI_STORE_DATA_IMM can take no more than 0x1fe qwords,
the size of the pgtable can be 512 entries.

Fixes: 43d48379c939 ("drm/xe: correct the calculation of remaining size")
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7abf15546ced..9ab004871f9a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -71,6 +71,7 @@ struct xe_migrate {
 #define NUM_KERNEL_PDE 17
 #define NUM_PT_SLOTS 32
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
+#define MAX_NUM_PTE 512
 
 /*
  * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
@@ -1107,7 +1108,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	 * This shouldn't be possible in practice.. might change when 16K
 	 * pages are used. Hence the assert.
 	 */
-	xe_tile_assert(tile, update->qwords <= MAX_PTE_PER_SDI);
+	xe_tile_assert(tile, update->qwords < MAX_NUM_PTE);
 	if (!ppgtt_ofs)
 		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
 						xe_bo_addr(update->pt_bo, 0,
-- 
2.25.1

