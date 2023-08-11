Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7412C41513
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF4010E6BB;
	Fri, 11 Aug 2023 16:08:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE7C10E6AE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770126; x=1723306126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0D1sqwUqng6vkrjP7vVsqRYQelSJsibYJ+ft6lwb+Vw=;
 b=f2EQ8ACsLOqJ2Ghu3DpQ03v2Ay95TOnCps+ZcL7V+lS1KDBU3e7ObNE+
 Vu0LmMeVndLCXy+lkoc2abYcRJNyZ5lgV6sNGv9ORMXdjhzCroMLTKcCb
 TcPdQrO+rnAzErOeT4fAwyxgBV+PTXJaj8q1V1rzNYT27WhrpsEOLFgld
 AbAMENfRwUvd3nQCsgBjqzoYIKsVuuvNPDZQYR2+AgqKjGJyzmn4U2J5s
 FBJe4MPHZ9uyNVKqcgvfIuUjdiIfdl29+qodU+17vovLZy5JYqPUup+vq
 oQtbJdnOWSpZISnoAkyWmemMON6c2DJBdAiGwF6gUaqSZKcKxj8WVIDkT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044322"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044322"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300448"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300448"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:06 -0700
Message-Id: <20230811160618.477297-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/15] drm/xe/xe2: Add MCR register steering for
 primary GT
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe2 uses the same steering control register and steering semaphore
register as MTL.  As with recent platforms, group/instance 0,0 is
sufficient to target a non-terminated instance for most classes of MCR
registers; the only types of ranges that need to consider platform
fusing to find a non-terminated instance are SLICE/DSS ranges and a new
SQIDI_PSMI type of range.

Note that the range of valid bits in XE2_NODE_ENABLE_MASK may be reduced
for some Xe2 SKUs.  However the lowest bits are always valid and only
the lowest instance is obtained via __ffs(), so there's no need to
complicate the masking with extra platform/subplatform checks.

Also note that Wa_14017387313 suggests skipping MCR lock acquisition
around GAM and GAMWKR registers to prevent MCR register accesses in an
interrupt handler from deadlocking when the steering semaphore is
already held outside the interrupt context.  At this time Xe never
issues MCR accesses from within an interrupt handler so the workaround
is not currently needed.

Bspec: 71185
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt_mcr.c       | 50 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_types.h     |  1 +
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index ad7ae6a28caca..5bc6c7fa4759f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -145,6 +145,7 @@
 #define   EN_32B_ACCESS				REG_BIT(30)
 
 #define	MIRROR_FUSE3				XE_REG(0x9118)
+#define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
 #define   L3BANK_PAIR_COUNT			4
 #define   L3BANK_MASK				REG_GENMASK(3, 0)
 /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 9eb7a6a1348d6..ef9f4044ca1fd 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -181,6 +181,39 @@ static const struct xe_mmio_range dg2_implicit_steering_table[] = {
 	{},
 };
 
+static const struct xe_mmio_range xe2lpg_dss_steering_table[] = {
+	{ 0x005200, 0x0052FF },         /* SLICE */
+	{ 0x005500, 0x007FFF },         /* SLICE */
+	{ 0x008140, 0x00815F },         /* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
+	{ 0x0094D0, 0x00955F },         /* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
+	{ 0x009680, 0x0096FF },         /* DSS */
+	{ 0x00D800, 0x00D87F },         /* SLICE */
+	{ 0x00DC00, 0x00DCFF },         /* SLICE */
+	{ 0x00DE80, 0x00E8FF },         /* DSS (0xE000-0xE0FF reserved) */
+	{ 0x00E980, 0x00E9FF },         /* SLICE */
+	{ 0x013000, 0x0133FF },         /* DSS (0x13000-0x131FF), SLICE (0x13200-0x133FF) */
+	{},
+};
+
+static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
+	{ 0x000B00, 0x000BFF },
+	{ 0x001000, 0x001FFF },
+	{},
+};
+
+static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
+	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
+	{ 0x008700, 0x0087FF },         /* SQIDI, MEMPIPE */
+	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
+	{ 0x00C800, 0x00CFFF },         /* GAM */
+	{ 0x00D880, 0x00D8FF },         /* NODE */
+	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
+	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
+	{ 0x00EF00, 0x00F4FF },         /* GAM, GAMWKR */
+	{ 0x013400, 0x0135FF },         /* MEMPIPE */
+	{},
+};
+
 static void init_steering_l3bank(struct xe_gt *gt)
 {
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
@@ -265,6 +298,16 @@ static void init_steering_oaddrm(struct xe_gt *gt)
 	gt->steering[DSS].instance_target = 0;		/* unused */
 }
 
+static void init_steering_sqidi_psmi(struct xe_gt *gt)
+{
+	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
+				 xe_mmio_read32(gt, MIRROR_FUSE3));
+	u32 select = __ffs(mask);
+
+	gt->steering[SQIDI_PSMI].group_target = select >> 1;
+	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
+}
+
 static void init_steering_inst0(struct xe_gt *gt)
 {
 	gt->steering[DSS].group_target = 0;		/* unused */
@@ -280,6 +323,7 @@ static const struct {
 	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
 	[DSS] =		{ "DSS",	init_steering_dss },
 	[OADDRM] =	{ "OADDRM",	init_steering_oaddrm },
+	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
 	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
 };
@@ -298,7 +342,11 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 
 		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
 	} else {
-		if (GRAPHICS_VERx100(xe) >= 1270) {
+		if (GRAPHICS_VER(xe) >= 20) {
+			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
+			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
+			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
+		} else if (GRAPHICS_VERx100(xe) >= 1270) {
 			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
 			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
 			gt->steering[DSS].ranges = xelpg_dss_steering_table;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 48fd698ff62aa..d4310be3e1e7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -55,6 +55,7 @@ enum xe_steering_type {
 	LNCF,
 	DSS,
 	OADDRM,
+	SQIDI_PSMI,
 
 	/*
 	 * On some platforms there are multiple types of MCR registers that
-- 
2.40.1

