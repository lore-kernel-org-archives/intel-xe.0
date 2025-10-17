Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3F9CCD183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1221D10EAE9;
	Fri, 17 Oct 2025 02:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmtMr26F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5D610EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668039; x=1792204039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RYPKKzpcj8RiR7lBzA4i4GbZhnHZqjwWBynPxb6G96o=;
 b=EmtMr26FxtbUCeOTPOXGRHB3L09DlKUrnSFtU3unU9A7K/7Ydzq5KWDD
 HmwwZym5q09dZ8pYOfApvwLwZ0avvDqDATiCpzDoeHcOIywJYlr11iiM5
 uwNvs0ibpu/wmJO20XR9BAg2fn4LkkXUNBt9uAXEbs9TrLuj0jv/syXgx
 lUCG+3R0uUyLwkY4uIoq2+vcuQv3mmvWKvIzvt4PFGqts5PLlziz9oIUX
 NrN5gAKU/GlFLgAOu/Uag+Q/n10rcnsopXvt1tWtHmbSHXkqsgV68zMqE
 zd2da2LiyiWnwAXSeJV2wJyJvvhISS7K56jDq4+XnVaQD28qYs0N+95YE w==;
X-CSE-ConnectionGUID: cNUs/1spTpOhFzXAE9noFQ==
X-CSE-MsgGUID: I/+M8s4KRpmjGjjON0WttQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739219"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
X-CSE-ConnectionGUID: 8G8s/ioPTb+3lbqMapZtPQ==
X-CSE-MsgGUID: KEYet6eZS1OeJrcPBJHTag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089205"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 16/24] drm/xe/xe3p_xpc: Add MCR steering
Date: Thu, 16 Oct 2025 19:26:35 -0700
Message-ID: <20251016-xe3p-v3-16-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
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

There are some ranges in Bspec missing the termination. Add a TODO
comment so they can eventually be updated.

Bspec: 74418
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Move TODO to a comment in the code so it can be revisited later,
    before force_probe removal (Gustavo)
---
 drivers/gpu/drm/xe/xe_gt_mcr.c   | 62 ++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_types.h | 15 ++++++++++
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index e1a2b38fc2a86..81ecd93826350 100644
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
@@ -467,7 +514,18 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 			gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
 		}
 	} else {
-		if (GRAPHICS_VER(xe) >= 20) {
+		if (GRAPHICS_VERx100(xe) == 3511) {
+			/*
+			 * TODO: there are some ranges in bspec with missing
+			 * termination: [0x00B000, 0x00B0FF] and
+			 * [0x00D880, 0x00D8FF] (NODE); [0x00B100, 0x00B3FF]
+			 * (L3BANK). Update them here once bspec is updated.
+			 */
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

