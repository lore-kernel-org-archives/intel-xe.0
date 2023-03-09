Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B449CC6FD1C
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 21:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E2610E2C4;
	Thu,  9 Mar 2023 21:12:27 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C9D10E2C2
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678396346; x=1709932346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=36cCymp3slD0tjh0XE2NEITTpj2z9n3OYc+h9Tualko=;
 b=NmSrXK1cAV31G7nnQmAXh6bqInjLIiEE1kcOrCLJZ9IHTTjz6BQI9rmA
 yYt5W60M6dorakcNQKI3DKd43WMBtSVH+4yY7VUAH4IHPjexjDu44OdvM
 3XmfF3SD79wirXWRPriNtF629YYc8v+AHNHLI0MtGvNgt5wZveY0rhxOf
 JwUsiNiEqTQZSCXtDjFbLBTv1Twx7UNuzMjQf8EKxTLL8e7x+p/Xv5OMp
 +03klucKUaboK46G0dMq/CJ4m1yR9mIhnYLbvgTvLUc/nTrpdsTN8Kfcm
 xb7Xxu6efVsExseDRDGTRm2hlufqrtpfk0g/+4WXaj79bR8mvpGj7dGRB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316966346"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="316966346"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 13:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="766577118"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="766577118"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 13:12:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Mar 2023 13:12:09 -0800
Message-Id: <20230309211210.1713613-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe/mcr: Add L3BANK steering for DG2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some register ranges with replication type L3BANK were missing from the
driver table. The following warning was triggering when adding a
workaround touching the register 0xb188:

	xe 0000:03:00.0: Did not find MCR register 0xb188 in any MCR steering table

Add the L3BANK ranges according to the spec.

v2:
  - Fix typo in one of the ranges: s/0x008CFF/0x00BCFF/ (Matt Roper)
  - Add termination rule in the init function for L3BANK (Matt Roper)

Bspec: 66534
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 10eff02cc7db..ab8fc649ba52 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -47,6 +47,12 @@ static const struct xe_mmio_range xelp_l3bank_steering_table[] = {
 	{},
 };
 
+static const struct xe_mmio_range xehp_l3bank_steering_table[] = {
+	{ 0x008C80, 0x008CFF },
+	{ 0x00B100, 0x00B3FF },
+	{},
+};
+
 /*
  * Although the bspec lists more "MSLICE" ranges than shown here, some of those
  * are of a "GAM" subclass that has special rules and doesn't need to be
@@ -180,6 +186,18 @@ static void init_steering_l3bank(struct xe_gt *gt)
 		gt->steering[L3BANK].group_target = __ffs(mslice_mask);
 		gt->steering[L3BANK].instance_target =
 			bank_mask & BIT(0) ? 0 : 2;
+	} else if (gt_to_xe(gt)->info.platform == XE_DG2) {
+		u32 mslice_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK,
+						xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
+		u32 bank = __ffs(mslice_mask) * 8;
+
+		/*
+		 * Like mslice registers, look for a valid mslice and steer to
+		 * the first L3BANK of that quad. Access to the Nth L3 bank is
+		 * split between the first bits of group and instance
+		 */
+		gt->steering[L3BANK].group_target = (bank >> 2) & 0x7;
+		gt->steering[L3BANK].instance_target = bank & 0x3;
 	} else {
 		u32 fuse = REG_FIELD_GET(GEN10_L3BANK_MASK,
 					 ~xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
@@ -277,6 +295,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 		gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
 		gt->steering[DSS].ranges = xehpc_dss_steering_table;
 	} else if (xe->info.platform == XE_DG2) {
+		gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
 		gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
 		gt->steering[LNCF].ranges = xehp_lncf_steering_table;
 		gt->steering[DSS].ranges = xehp_dss_steering_table;
-- 
2.39.0

