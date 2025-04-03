Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70DFC369A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D3C10EA5A;
	Thu,  3 Apr 2025 18:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKDlhRoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD6E10EA4D
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743706581; x=1775242581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JdUkweTom349eh/KGOUptLi9Y6ZcZxwMGVza7V0Dt+Q=;
 b=iKDlhRoAAyLKf6GQjTwITrVseLtLEx9Zf7gFP63yS2gkie091pXGPHgU
 1hftQ778xITtGpRThzLQfVu6ExzvWp6ua7RFXricodNQxLnCEofe1AmXb
 MXBGic8GMj3M85Ljm0qMGSOhVYRb1kaCIZlBQj7c4iwQWU5fbEHSX49o4
 8adGXQtRZt4H5BeV3vbR9fgEYY2ZAlAbI1kf3yV7zK9l8etAUPCZJQQ6w
 2GIuMbpIUBf6a3UHHQmRs+QmApdNZbO/oHTgTt5zg2c5wsZ+2oK1mLZql
 8Z3bbqYZQkWAHfC/QjTfE9g/H+O1ldgj1Z28IEhot+ZC4JnjRhHNn4FPc A==;
X-CSE-ConnectionGUID: irAH4nTGSYGMmCWByqwAGA==
X-CSE-MsgGUID: /hFrPg6ZRv+Dm8Zadh9RGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32737757"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="32737757"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:56:19 -0700
X-CSE-ConnectionGUID: fTND5c9GRXmRCmHiLse31g==
X-CSE-MsgGUID: xCdgN9g8SUmaJHh9RuS4lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="126895840"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2025 11:56:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/8] drm/xe/guc: Enable w/a 16026508708
Date: Thu,  3 Apr 2025 11:56:11 -0700
Message-ID: <20250403185619.1555853-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The workaround is only relevant to SRIOV but does affect all platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index d633f1c739e4..7de8f827281f 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -367,6 +367,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
+	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index bee4e0cfe7b8..9de8c2b81f0d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -376,6 +376,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
 					&offset, &remain);
 
+	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
+		guc_waklv_enable_simple(ads,
+					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9b9e176992a8..9efc5accd43d 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -57,3 +57,5 @@ no_media_l3	MEDIA_VERSION(3000)
 		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
 16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
 		MEDIA_VERSION_RANGE(1301, 3000)
+16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
+		MEDIA_VERSION_RANGE(1300, 3000)
-- 
2.49.0

