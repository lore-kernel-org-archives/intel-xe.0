Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC165CCD1BC
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47AA10E666;
	Tue, 21 Oct 2025 22:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQvuBcB2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767CB10E665
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 22:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086766; x=1792622766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ywZ7p3gEf75nefTxxjDIyY9XE3BR3out5ND8y3oICS4=;
 b=WQvuBcB2GhbGIgqXHURlKpJObaZvDe6lH40C8yYZ8eOFXIJaLG8+wRO4
 iGfImIRUWXJKE9nsrnAxbu6zZ2OXQuskx9jWBdWoO8/ppCYL2G09BeQPC
 bjr8T5hkJ9uZgBP6+ZGaAmvcdU9/jBg+AzWqxRHPViqnDk8dqbasTNpvU
 HlY5KbzjDEug7crYUooxleUgkV6Pc1I5/gIuss8SqBukTbFQ4OfQiRAUq
 lH7TXF/x3WWi9iGFnZqhpZ4bsk575Tes/LUQb7k6aohhl6GMWIsI6P9FX
 Bb+jwjmMFcA8rQwkasOmGRZJPFcVSeW1nucbQMuZy/AHnlnzOkHlwwELk w==;
X-CSE-ConnectionGUID: TrNrDhv8SkilwIiuItiawg==
X-CSE-MsgGUID: ZUOPVxEVTYKX0FGW18jx4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63128906"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63128906"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:06 -0700
X-CSE-ConnectionGUID: WKXhtCFFS4mpTJy4f9xfHw==
X-CSE-MsgGUID: CjoE3gVpQGaiDa/FUcib8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="187982618"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 1/2] drm/xe/xe3p_xpc: Treat all PSMI MCR ranges as "INSTANCE0"
Date: Tue, 21 Oct 2025 15:45:55 -0700
Message-ID: <20251021224556.437970-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021224556.437970-1-matthew.d.roper@intel.com>
References: <20251021224556.437970-1-matthew.d.roper@intel.com>
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

Early versions of the B-spec originally indicated that Xe3p_XPC had two
ranges of PSMI registers requiring MCR steering (one starting at 0xB500,
one starting at 0xB600), and that reads of registers in these ranges
required different grpid values to ensure that a non-terminated value is
obtained.  A late-breaking spec update has simplified this; both ranges
can be safely steered to grpid=0 for reads.

Drop the "PSMI19" replication type and related code, and consolidate
both register ranges into a single entry in the "INSTANCE0" steering
table.

Bspec: 74418
Fixes: be614ea19dad ("drm/xe/xe3p_xpc: Add MCR steering")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c   | 15 +--------------
 drivers/gpu/drm/xe/xe_gt_types.h |  8 --------
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 81ecd9382635..0b4b617d413b 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -268,13 +268,8 @@ static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] = {
 	{},
 };
 
-static const struct xe_mmio_range xe3p_xpc_psmi_grp19_steering_table[] = {
-	{ 0x00B500, 0x00B5FF },
-	{},
-};
-
 static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] = {
-	{ 0x00B600, 0x00B6FF },		/* PSMI0 */
+	{ 0x00B500, 0x00B6FF },		/* PSMI */
 	{ 0x00C800, 0x00CFFF },		/* GAMCTRL */
 	{ 0x00F000, 0x00F0FF },		/* GAMCTRL */
 	{},
@@ -452,12 +447,6 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
 	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
 }
 
-static void init_steering_psmi(struct xe_gt *gt)
-{
-	gt->steering[PSMI19].group_target = 19;
-	gt->steering[PSMI19].instance_target = 0;
-}
-
 static void init_steering_gam1(struct xe_gt *gt)
 {
 	gt->steering[GAM1].group_target = 1;
@@ -474,7 +463,6 @@ static const struct {
 	[DSS] =		{ "DSS / XeCore", init_steering_dss },
 	[OADDRM] =	{ "OADDRM / GPMXMT", init_steering_oaddrm },
 	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
-	[PSMI19] =	{ "PSMI[19]",	init_steering_psmi },
 	[GAM1] =	{ "GAMWKRS / STLB / GAMREQSTRM", init_steering_gam1 },
 	[INSTANCE0] =	{ "INSTANCE 0",	NULL },
 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
@@ -524,7 +512,6 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 			gt->steering[DSS].ranges = xe3p_xpc_xecore_steering_table;
 			gt->steering[GAM1].ranges = xe3p_xpc_gam_grp1_steering_table;
 			gt->steering[INSTANCE0].ranges = xe3p_xpc_instance0_steering_table;
-			gt->steering[PSMI19].ranges = xe3p_xpc_psmi_grp19_steering_table;
 		} else if (GRAPHICS_VER(xe) >= 20) {
 			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
 			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d93faa1eedef..6e9c84b33b60 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -72,14 +72,6 @@ enum xe_steering_type {
 	OADDRM,
 	SQIDI_PSMI,
 
-	/*
-	 * The bspec lists multiple ranges as "PSMI," but the different
-	 * ranges with that label have different grpid steering values so we
-	 * treat them independently in code.  Note that the ranges with grpid=0
-	 * are included in the INSTANCE0 group above.
-	 */
-	PSMI19,
-
 	/*
 	 * Although most GAM ranges must be steered to (0,0) and thus use the
 	 * INSTANCE0 type farther down, some platforms have special rules
-- 
2.51.0

