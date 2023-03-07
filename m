Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BEDC678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8F10E3CC;
	Tue,  7 Mar 2023 09:25:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8733810E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181129; x=1709717129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7UyfgjARcw2CzAcVRtwBmqtkr3vfn4F9DXJ2SGaAGRk=;
 b=oK6/xEUv9xJVKEbc9nwhEFDq1WZU1Dqu9BSCOXkTSJdFfZqdgaLRlQOy
 HnKkn8F93e/Y+EgS+jkKEpxmZutKAggdj1pWQm7TpGdTs7jGG2C22Lj/0
 wQC8Kwj7b82mA7rUn17YlySAQSppO9VnB4rPbHOcOZek/76tuql11z8q3
 XXCwpCJM1lF9mGnPQI1X02L3m1Alru2ZaP7UlnAY+m9ohS4b16yRJ/RI2
 YoW0yABjXGeo8Ln/Ugs8m/MsXEKE2MVW3PMlWJ+gRoPfXaRJgFeE9nu6j
 OQI9eLmkPJbfpQJ36NuEC8r1V550dFBDOxwv3dYkrNIqS+Py4D4F0lc7P g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079112"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079112"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798792"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798792"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:28 -0800
Message-Id: <20230307092446.1263266-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/19] drm/xe/mcr: Add L3BANK steering for DG2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some register ranges with replication type L3BANK were missing from the
driver table. The following warning was triggering when adding a
workaround touching the register 0xb188:

	xe 0000:03:00.0: Did not find MCR register 0xb188 in any MCR steering table

Add the L3BANK ranges according to the spec.

Bspec: 66534

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 10eff02cc7db..a42061c4b9d2 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -47,6 +47,12 @@ static const struct xe_mmio_range xelp_l3bank_steering_table[] = {
 	{},
 };
 
+static const struct xe_mmio_range xehp_l3bank_steering_table[] = {
+	{ 0x008C80, 0x00BCFF },
+	{ 0x00B100, 0x00B3FF },
+	{},
+};
+
 /*
  * Although the bspec lists more "MSLICE" ranges than shown here, some of those
  * are of a "GAM" subclass that has special rules and doesn't need to be
@@ -277,6 +283,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 		gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
 		gt->steering[DSS].ranges = xehpc_dss_steering_table;
 	} else if (xe->info.platform == XE_DG2) {
+		gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
 		gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
 		gt->steering[LNCF].ranges = xehp_lncf_steering_table;
 		gt->steering[DSS].ranges = xehp_dss_steering_table;
-- 
2.39.0

