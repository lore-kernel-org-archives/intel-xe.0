Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B3EC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 21:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A485410E1F4;
	Wed, 19 Apr 2023 21:37:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A5110E1F4
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681940234; x=1713476234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kkT+h7tYtbZKozOLELtzD68KEzrraKjOdL9sVe+NO5g=;
 b=E2zo1u4gSLEkPWypM+QoTXIFqfrGtGVDWWEyM0MpDk7mA5XQ+xZMSpaZ
 lKdODDafBfYKyT6P6IqyfHq+aCIb+X/UHCnPmmVi7bCAD55EHRFLI0MfN
 1hbcCb9km2KSgJS+rlLM03jSlvbtrKsMmC02VMKyPHEpyyNMu8pvrS0TC
 TkIflbU6B9sju0poMyXa2JtNIYwGTAOVPzgxPj9IzF0D+3h92mBQ6hZEY
 NFAA9df5oZJiDf0w4+oZZdGgu6J+e3Ppspnw2IPf0k8T/ejWiYaeLDXC6
 QYgYNU2Xu+XWNcW/yE+z+jUtGciZArmi8sTsVE3gEZZYNnv3ytBNhTc/g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334383405"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="334383405"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="756241796"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="756241796"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:37:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 14:37:02 -0700
Message-Id: <20230419213703.3993439-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/adlp: Add revid => step mapping
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Setup the mapping from PCI revid to IP stepping for ADL-P (and its RPL-P
subplatform) in case this information becomes important for implementing
workarounds.

Bspec: 55376
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index ee927dfd3eb3..bcdb4601c2f6 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -60,6 +60,17 @@ static const struct xe_step_info adls_revids[] = {
 	[0xC] = { COMMON_GT_MEDIA_STEP(D0), .display = STEP_C0 },
 };
 
+static const struct xe_step_info adlp_revids[] = {
+	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_A0 },
+	[0x4] = { COMMON_GT_MEDIA_STEP(B0), .display = STEP_B0 },
+	[0x8] = { COMMON_GT_MEDIA_STEP(C0), .display = STEP_C0 },
+	[0xC] = { COMMON_GT_MEDIA_STEP(C0), .display = STEP_D0 },
+};
+
+static const struct xe_step_info adlp_rpl_revids[] = {
+	[0x4] = { COMMON_GT_MEDIA_STEP(C0), .display = STEP_E0 },
+};
+
 static const struct xe_step_info dg2_g10_revid_step_tbl[] = {
 	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_A0 },
 	[0x1] = { COMMON_GT_MEDIA_STEP(A1), .display = STEP_A0 },
@@ -118,6 +129,12 @@ struct xe_step_info xe_step_get(struct xe_device *xe)
 	} else if (xe->info.subplatform == XE_SUBPLATFORM_DG2_G12) {
 		revids = dg2_g12_revid_step_tbl;
 		size = ARRAY_SIZE(dg2_g12_revid_step_tbl);
+	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
+		revids = adlp_rpl_revids;
+		size = ARRAY_SIZE(adlp_rpl_revids);
+	} else if (xe->info.platform == XE_ALDERLAKE_P) {
+		revids = adlp_revids;
+		size = ARRAY_SIZE(adlp_revids);
 	} else if (xe->info.platform == XE_ALDERLAKE_S) {
 		revids = adls_revids;
 		size = ARRAY_SIZE(adls_revids);
-- 
2.40.0

