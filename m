Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E82CA0FFD
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 18:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A566510EC22;
	Fri, 29 Aug 2025 18:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqbiKng3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DD010EC21
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756490423; x=1788026423;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=S/XtUemfKnKWxYh+NRy1smW2U1Y6BNO1zItR4XXZlik=;
 b=FqbiKng3Ciq/KmnYXIVfuqHIFMFC+USbOq4nVSLsNWzm3P9APvGcGJOt
 8jul/IGufRCIrKJmQdpkDnjMv5SM8E9Ev+9Euzwnt3ILkCKAXbSrU+kvO
 p+38XcdbmtLTHiIWzx8KWeMslYR89PQVOw1GULbQqVSE00MMcGnjzuPGS
 9Qwk+Oje9gwEheOLARrFrdnmndC+Gs0O/TB7wxM4kug7+31dP7svDf+A2
 uequ7sN7O0Byva5cMdzQGEcHFSyi17DTH32cFh95WkokUCHDuDiHyQPF0
 qbtsykTbIRruLerswOBfSVk4do48zYwkbco6CUf/0g7yB5yO3uJT6JOE8 g==;
X-CSE-ConnectionGUID: 3n1Rt8ulSLmhp13wNPVang==
X-CSE-MsgGUID: RNYbp78PRxCugNTDyzF9Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58853095"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58853095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 11:00:23 -0700
X-CSE-ConnectionGUID: k+iy10zyR1S1vquiYcGjLg==
X-CSE-MsgGUID: JZT+mHnLRz2Ui9X4uGtz4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175718609"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 11:00:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/xe: Add support larger CPU pages to
 build_pt_update_batch_sram
Date: Fri, 29 Aug 2025 11:00:17 -0700
Message-Id: <20250829180018.1333174-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829180018.1333174-1-matthew.brost@intel.com>
References: <20250829180018.1333174-1-matthew.brost@intel.com>
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

If the GPU page size is smaller than the CPU page size,
build_pt_update_batch_sram breaks. Fix by supporting writes of multiple
GPU pages per CPU page.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 57e6d5a8ac39..72f53e304873 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1751,6 +1751,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
+		chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
+
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = pt_offset;
 		bb->cs[bb->len++] = 0;
@@ -1764,12 +1766,21 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 			xe_tile_assert(m->tile, sram_addr[i].proto ==
 				       DRM_INTERCONNECT_SYSTEM);
 			xe_tile_assert(m->tile, addr);
+
+again:
 			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
 								 addr, pat_index,
 								 0, false, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
+			if (XE_PAGE_SIZE < PAGE_SIZE) {
+				addr += XE_PAGE_SIZE;
+				if (sram_addr[i].addr + PAGE_SIZE != addr) {
+					chunk--;
+					goto again;
+				}
+			}
 			i++;
 		}
 	}
-- 
2.34.1

