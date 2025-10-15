Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911AFCCD1A3
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5264310E907;
	Wed, 15 Oct 2025 22:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4PipEjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8E010E902
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566032; x=1792102032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Wh/XT1Dg2xPPJpdoq1vT54TS22d0amwR6vxBwOIK3E=;
 b=J4PipEjdT/LbJ0+Whu4jl+hPfk+UqCCPIpXSeNGJSj0S9gxHQqsndxia
 ovBUC4I75HSlAMpYaS/FKybsDI/ay8kzLYXvcHrZt4v1UccB66E/D7o6t
 vnzLkTsLNDvmhTnI0Qcc+lg4xUbtKj3bASd4JufEkQjsyb6FTQg4SJBPz
 nBtBw6KLlOB/8YzE+smkysJ1a+uiG6faT5OgqtdQMalHtRn5nhtIDhFlo
 OU3tO4S6WGNWBHitG6aWEKSlTZsm9bTKiRPK9iTdbvpiyibWoYudyhfS0
 vMZT2xwKKFBLhpB9QtOjj+ymI9yzhUAljtDY7FMbkbwdCyUD9fg81tDKf g==;
X-CSE-ConnectionGUID: LCQqU+8tTfS2lF2ne124Cg==
X-CSE-MsgGUID: tl4M3/7RQfGa7mb2bpQ8GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794061"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: 0XVGK2VyRi+XdnzVR6NXcA==
X-CSE-MsgGUID: 5ER3WYMhSlqbPfciak0aAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298310"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 16/22] drm/xe/xe3p_xpc: Add MCR steering
Date: Wed, 15 Oct 2025 15:06:31 -0700
Message-ID: <20251015-xe3p-v2-16-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe3p_XPC's steering has a few changes from Xe3.  Aside from
minor changes to the XeCore (the new name for what used to be "DSS") and
INSTANCE0 tables, different rules apply to different subranges of type
"GAM."  Certain GAM subranges require steering to grp/instance (0,0)
(and thus use the INSTANCE0 table), while others require special
steering to (1,0) instead.  Similarly, there are multiple classes of
"PSMI" steering, with some requiring steering to (0,0) while others
require (19,0).

FIXME: There's an "L3BANK" range listed in the bspec that needs
clarification.

Bspec: 74418
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c   | 56 ++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_types.h | 15 +++++++++++
 2 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index e1a2b38fc2a86..e5506ec28e147 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -169,6 +169,15 @@ static const struct xe_mmio_range xelpg_dss_steering_table[] = {
 	{},
 };
 
+static const struct xe_mmio_range xe3p_xpc_xecore_steering_table[] = {
+	{ 0x008140, 0x00817F },         /* SLICE, XeCore, SLICE */
+	{ 0x009480, 0x00955F },         /* SLICE, XeCore */
+	{ 0x00D800, 0x00D87F },		/* SLICE */
+	{ 0x00DC00, 0x00E9FF },         /* SLICE, rsvd, XeCore, rsvd, XeCore, rsvd, XeCore */
+	{ 0x013000, 0x0135FF },         /* XeCore, SLICE */
+	{},
+};
+
 static const struct xe_mmio_range xelpmp_oaddrm_steering_table[] = {
 	{ 0x393200, 0x39323F },
 	{ 0x393400, 0x3934FF },
@@ -247,6 +256,30 @@ static const struct xe_mmio_range xe3lpm_instance0_steering_table[] = {
 	{},
 };
 
+/*
+ * Different "GAM" ranges have different rules; GAMWKRS, STLB, and GAMREQSTRM
+ * range subtypes need to be steered to (1,0), while all other GAM subtypes
+ * are steered to (0,0) and are included in the "INSTANCE0" table farther
+ * down.
+ */
+static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] = {
+	{ 0x004000, 0x004AFF },		/* GAMREQSTRM, rsvd, STLB, GAMWKRS, GAMREQSTRM */
+	{ 0x00F100, 0x00FFFF },		/* GAMWKRS */
+	{},
+};
+
+static const struct xe_mmio_range xe3p_xpc_psmi_grp19_steering_table[] = {
+	{ 0x00B500, 0x00B5FF },
+	{},
+};
+
+static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] = {
+	{ 0x00B600, 0x00B6FF },		/* PSMI0 */
+	{ 0x00C800, 0x00CFFF },		/* GAMCTRL */
+	{ 0x00F000, 0x00F0FF },		/* GAMCTRL */
+	{},
+};
+
 static void init_steering_l3bank(struct xe_gt *gt)
 {
 	struct xe_mmio *mmio = &gt->mmio;
@@ -419,6 +452,18 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
 	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
 }
 
+static void init_steering_psmi(struct xe_gt *gt)
+{
+	gt->steering[PSMI19].group_target = 19;
+	gt->steering[PSMI19].instance_target = 0;
+}
+
+static void init_steering_gam1(struct xe_gt *gt)
+{
+	gt->steering[GAM1].group_target = 1;
+	gt->steering[GAM1].instance_target = 0;
+}
+
 static const struct {
 	const char *name;
 	void (*init)(struct xe_gt *gt);
@@ -426,9 +471,11 @@ static const struct {
 	[L3BANK] =	{ "L3BANK",	init_steering_l3bank },
 	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
 	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
-	[DSS] =		{ "DSS",	init_steering_dss },
+	[DSS] =		{ "DSS / XeCore", init_steering_dss },
 	[OADDRM] =	{ "OADDRM / GPMXMT", init_steering_oaddrm },
 	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
+	[PSMI19] =	{ "PSMI[19]",	init_steering_psmi },
+	[GAM1] =	{ "GAMWKRS / STLB / GAMREQSTRM", init_steering_gam1 },
 	[INSTANCE0] =	{ "INSTANCE 0",	NULL },
 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
 };
@@ -467,7 +514,12 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 			gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
 		}
 	} else {
-		if (GRAPHICS_VER(xe) >= 20) {
+		if (GRAPHICS_VERx100(xe) == 3511) {
+			gt->steering[DSS].ranges = xe3p_xpc_xecore_steering_table;
+			gt->steering[GAM1].ranges = xe3p_xpc_gam_grp1_steering_table;
+			gt->steering[INSTANCE0].ranges = xe3p_xpc_instance0_steering_table;
+			gt->steering[PSMI19].ranges = xe3p_xpc_psmi_grp19_steering_table;
+		} else if (GRAPHICS_VER(xe) >= 20) {
 			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
 			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
 			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8b5f604d7883a..d93faa1eedef8 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -72,6 +72,21 @@ enum xe_steering_type {
 	OADDRM,
 	SQIDI_PSMI,
 
+	/*
+	 * The bspec lists multiple ranges as "PSMI," but the different
+	 * ranges with that label have different grpid steering values so we
+	 * treat them independently in code.  Note that the ranges with grpid=0
+	 * are included in the INSTANCE0 group above.
+	 */
+	PSMI19,
+
+	/*
+	 * Although most GAM ranges must be steered to (0,0) and thus use the
+	 * INSTANCE0 type farther down, some platforms have special rules
+	 * for specific subtypes that require steering to (1,0) instead.
+	 */
+	GAM1,
+
 	/*
 	 * On some platforms there are multiple types of MCR registers that
 	 * will always return a non-terminated value at instance (0, 0).  We'll

-- 
2.51.0

