Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CAC001DE
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3706110E6BA;
	Fri, 11 Aug 2023 16:08:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A6410E6AD
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770126; x=1723306126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUT5dp46NbQ3Zh++SPowlKTHFkfEJ2Kc83irmYx2J4Y=;
 b=LE/D9oqc0kYpRY3iRV5fDkjmfOC8SJ5nupweuRV4QqAzC3Ho7HEN1RHF
 hoQrvOM91Gx23pRf4QRs9+gvxY/Ak839iV5/HJWPAWQrg+AwPb+q8Jb2G
 59689tD3yn1zDzIZpy6tS4RqOzD4X819Ul17Y+Ranh4bQbUaIJtINvu76
 fJU29tukovCptFAUvEC61lUIVVZJkxw/5Mf3LLtnNol4NwNsdTPEg2t0Q
 bUcPy95olpwCOgpsgDlLJm6RXqDkB9BTCmf2tXgESHpMK8RplsJdGZ8Ib
 eIvB6mKUnxmQc+Obj7qsDfnziSrbzO6W+vNLEGyrWG2v8eWc18IAnt8nB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044323"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044323"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300451"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300451"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:07 -0700
Message-Id: <20230811160618.477297-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/15] drm/xe/xe2: Add MCR register steering for
 media GT
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

Xe2 media has a few types of MCR registers, but all except for "GPMXMT"
can safely steer to instance 0,0.  GPMXMT follows the same rules that
MTL's OADDRM ranges did, so it can re-use the same enum value.

Bspec: 71186
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index ef9f4044ca1fd..c01799b4efcb5 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -214,6 +214,23 @@ static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
 	{},
 };
 
+static const struct xe_mmio_range xe2lpm_gpmxmt_steering_table[] = {
+	{ 0x388160, 0x38817F },
+	{ 0x389480, 0x3894CF },
+	{},
+};
+
+static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
+	{ 0x384000, 0x3847DF },         /* GAM, rsvd */
+	{ 0x384900, 0x384AFF },         /* GAM */
+	{ 0x389560, 0x3895FF },         /* MEDIAINF */
+	{ 0x38B600, 0x38B8FF },         /* L3BANK */
+	{ 0x38C800, 0x38D07F },         /* GAM, MEDIAINF */
+	{ 0x38F000, 0x38F0FF },         /* GAM */
+	{ 0x393C00, 0x393C7F },         /* MEDIAINF */
+	{},
+};
+
 static void init_steering_l3bank(struct xe_gt *gt)
 {
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
@@ -322,7 +339,7 @@ static const struct {
 	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
 	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
 	[DSS] =		{ "DSS",	init_steering_dss },
-	[OADDRM] =	{ "OADDRM",	init_steering_oaddrm },
+	[OADDRM] =	{ "OADDRM / GPMXMT", init_steering_oaddrm },
 	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
 	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
@@ -340,7 +357,12 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
-		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
+		if (MEDIA_VER(xe) >= 20) {
+			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
+			gt->steering[INSTANCE0].ranges = xe2lpm_instance0_steering_table;
+		} else {
+			gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
+		}
 	} else {
 		if (GRAPHICS_VER(xe) >= 20) {
 			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
-- 
2.40.1

