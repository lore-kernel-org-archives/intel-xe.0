Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9E6C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 22:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4810E10E1C1;
	Thu, 11 Jan 2024 22:02:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D9010E1C1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705010562; x=1736546562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rf0sDXwf+n6rth5Rns2RgX/ojIbvfVbJAQbUtH4ShB0=;
 b=a/S74uxErvEdnYtnwhxGRpHY1GpyZRAkpLQlOjeQF18aqSfehs1GptQj
 1a5zzLYYg+G3v8RskJUUIODlvDPc82dQEYXQoTeoyvT0PiS55y3GGjC0E
 wI03+7Krl8tHCrNUIQV4Jk2ojuHNVd1lvzvvBY5wGQaaWvPt8hjILpOhQ
 aEtGmoA1pf5Y+tsgxQkL1V/8Cx7arGplke/+GlIv7W1/25XKQNJEhfwJf
 T1UhFXrv03Ds9L/cQw8f92Bw+wyZHzXkS8YuImhp327kmBWNOycz3Od/B
 +/Ejy+d1se6udQBQkkl5VrRSt8YLKpMjtjFSgWkXw9irrWRO3inwJwWaD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="389450999"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="389450999"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 14:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="873170950"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="873170950"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 14:02:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510
Date: Thu, 11 Jan 2024 14:02:38 -0800
Message-ID: <20240111220238.1467572-2-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is
considered the largest legal value accepted.  Since that instruction
field is always encoded in (val-2) format, this translates to 0x400
dwords for the true maximum length of the instruction.  Subtracting the
instruction header (1 dword) and address (2 dwords), that leaves 0x3FD
dwords (i.e., 0x1FE qwords) for PTE values.

Bspec: 60246, 45753
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 88a32b272dda..44725f978f3e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -72,6 +72,15 @@ struct xe_migrate {
 #define NUM_PT_SLOTS 32
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
 
+/*
+ * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
+ * legal value accepted.  Since that instruction field is always stored in
+ * (val-2) format, this translates to 0x400 dwords for the true maximum length
+ * of the instruction.  Subtracting the instruction header (1 dword) and
+ * address (2 dwords), that leaves 0x3FD dwords (0x1FE qwords) for PTE values.
+ */
+#define MAX_PTE_PER_SDI 0x1FE
+
 /**
  * xe_tile_migrate_engine() - Get this tile's migrate engine.
  * @tile: The tile.
@@ -444,7 +453,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 		*L0_ofs = xe_migrate_vm_addr(pt_ofs, 0);
 
 		/* MI_STORE_DATA_IMM */
-		cmds += 3 * DIV_ROUND_UP(num_4k_pages, 0x1ff);
+		cmds += 3 * DIV_ROUND_UP(num_4k_pages, MAX_PTE_PER_SDI);
 
 		/* PDE qwords */
 		cmds += num_4k_pages * 2;
@@ -479,7 +488,7 @@ static void emit_pte(struct xe_migrate *m,
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
 	while (ptes) {
-		u32 chunk = min(0x1ffU, ptes);
+		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = ofs;
@@ -1098,7 +1107,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	 * This shouldn't be possible in practice.. might change when 16K
 	 * pages are used. Hence the assert.
 	 */
-	xe_tile_assert(tile, update->qwords <= 0x1ff);
+	xe_tile_assert(tile, update->qwords <= MAX_PTE_PER_SDI);
 	if (!ppgtt_ofs)
 		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
 						xe_bo_addr(update->pt_bo, 0,
@@ -1107,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
 
-		chunk = min(update->qwords, 0x1ffU);
+		chunk = min(update->qwords, MAX_PTE_PER_SDI);
 
 		/* Ensure populatefn can do memset64 by aligning bb->cs */
 		if (!(bb->len & 1))
@@ -1283,7 +1292,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		batch_size = 6 + num_updates * 2;
 
 	for (i = 0; i < num_updates; i++) {
-		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, 0x1ff);
+		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
 
 		/* align noop + MI_STORE_DATA_IMM cmd prefix */
 		batch_size += 4 * num_cmds + updates[i].qwords * 2;
-- 
2.43.0

