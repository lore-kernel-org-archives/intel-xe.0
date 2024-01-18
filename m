Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356A3C47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 22:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB93F10E1BF;
	Thu, 18 Jan 2024 22:18:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F2A10E1BF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 22:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705616312; x=1737152312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8Wy6wSTMwowTGHp53dLAx58L9UwU5zhFiSNAu2BCno=;
 b=N1zMtDomfHLHRwva2MtbtIsucXvDfh7agIqEb0EOcP/Romio3utJY4Rt
 g6MT1qF208srYc7tiwo/64HGpDXuYtL04va02PgXKTr1NAeff6zOCyJkK
 +ISoTlez29WQ9fYGoWOAq9h05Q6V4jmzXo2yccgLaIaotZjNHkMt4WXuq
 R4x3g1klC3Ef7lHrghSkOKCSlw0d7/6nKVwpye0/zrvZSIJ8T70FdoMLK
 MTI/7NzC2WmekD0OM/WEDpPOHM383/qjR+7hVIQTrDBwoJOps6XdHH7pk
 LqEi0+5iJ+Ry7tcVi8TP5Rv2U0uOKW8mcKEqmcRi1mr/AAw+mv3+brOgu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7685323"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7685323"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 14:18:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928244353"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="928244353"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 14:18:20 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 1/1] drm/xe: correct the calculation of remaining size
Date: Thu, 18 Jan 2024 14:20:51 -0800
Message-Id: <20240118222051.790432-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118222051.790432-1-fei.yang@intel.com>
References: <20240118222051.790432-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

In function write_pgtable, the calculation of chunk in the do-while
loop is wrong, we should always compare against remaining size instead
of the total size update->qwords.
Also correct the assert. While one MI_STORE_DATA_IMM can take no more
than 0x1fe qwords, the size of the pgtable can be 512 entries.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 44725f978f3e..04e9f723d316 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1107,7 +1107,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	 * This shouldn't be possible in practice.. might change when 16K
 	 * pages are used. Hence the assert.
 	 */
-	xe_tile_assert(tile, update->qwords <= MAX_PTE_PER_SDI);
+	xe_tile_assert(tile, update->qwords <= 0x1ff);
 	if (!ppgtt_ofs)
 		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
 						xe_bo_addr(update->pt_bo, 0,
@@ -1116,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
 
-		chunk = min(update->qwords, MAX_PTE_PER_SDI);
+		chunk = min(size, MAX_PTE_PER_SDI);
 
 		/* Ensure populatefn can do memset64 by aligning bb->cs */
 		if (!(bb->len & 1))
-- 
2.25.1

