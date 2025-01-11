Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669B1E77188
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jan 2025 02:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180FF10E083;
	Sat, 11 Jan 2025 02:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnihIxZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152BA10E083
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Jan 2025 02:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736561745; x=1768097745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DhtPg8IiiuCstbfe3ZDtJ+853rN1u9E77EB+RrmyE48=;
 b=HnihIxZlat6p8oonCM+/QNKSsQuRWY9di+nTkSSZEojkhIy6pK+7qpdq
 +Fi09cHoAokF7yZFyW8bb5qqCSJJaVI8WrToEIQ10x2l55dKlvbRPltg4
 ko8krRNMC+0NfxJOPE3Y0IVPPyEbNYR1IpSCLn0CEgFwxcGbAsZJD/dRl
 7CK1EODvKu6iQgJ9yvG+1h2fHPRyOPvpT/D7IZc6Io2ikBf/5q4XI5yM2
 Cr+Vl2QU7osnomT16ApK5ahT/zB52RnimuH5Ul1UjZ/n0A4AXUtw02mm2
 bmZsSYMkk/Z0/c/QxHyrl0ybPvmiM2ZuA5RMqDW4F2eoLe3XFiRu+mA2k Q==;
X-CSE-ConnectionGUID: MgmgUMlORb6gVk7AfpxjIw==
X-CSE-MsgGUID: twFctqDhTj6iQMYmCCxKUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36889745"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="36889745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 18:15:44 -0800
X-CSE-ConnectionGUID: 4KF0ynHGTaiu+HSGjQofxQ==
X-CSE-MsgGUID: 9mTBRomvSRyllUSc5xOT5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103772910"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 18:15:44 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Add missing VISACTL mux registers
Date: Fri, 10 Jan 2025 18:15:39 -0800
Message-ID: <20250111021539.2920346-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add missing VISACTL mux registers required for some OA config's.

Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4e00a77289c50..eeb96b5f49e2a 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2163,6 +2163,7 @@ static const struct xe_mmio_range xe2_oa_mux_regs[] = {
 	{ .start = 0x5194, .end = 0x5194 },	/* SYS_MEM_LAT_MEASURE_MERTF_GRP_3D */
 	{ .start = 0x8704, .end = 0x8704 },	/* LMEM_LAT_MEASURE_MCFG_GRP */
 	{ .start = 0xB1BC, .end = 0xB1BC },	/* L3_BANK_LAT_MEASURE_LBCF_GFX */
+	{ .start = 0xD0E0, .end = 0xD0F4 },	/* VISACTL */
 	{ .start = 0xE18C, .end = 0xE18C },	/* SAMPLER_MODE */
 	{ .start = 0xE590, .end = 0xE590 },	/* TDL_LSC_LAT_MEASURE_TDL_GFX */
 	{ .start = 0x13000, .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
-- 
2.47.1

