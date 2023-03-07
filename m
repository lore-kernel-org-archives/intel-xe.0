Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC00C61DA4
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 01:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE88710E34B;
	Tue,  7 Mar 2023 01:56:52 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AF510E34B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 01:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678154210; x=1709690210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZzVtn7yHqNkMOIf2VAqgXMFhzZqwp67Iq3SDAkLj05c=;
 b=icA2r+TgTB07Jb+TljaNJWQN2YovUjF0mvCY3soxstXo6033n5wd/6vQ
 pLSlgtTBqcHduIeHdeiWu8eyEYUm4Av8uwuFEG8UAltAPJtHHmxe8eW9U
 n+WsuJi8iNrmberdQewLLJhvjJEQ2u1bY6cOoEuyoecRuS2EEr7WuMl+M
 99rxLTwklsyLgNk2S8b9Q7vVkJQIux7lM8CbKnd5BQtsa++C/9fZHAJdV
 V7xkQESUHuD9hj6hlhgsjWk+RwUZwOHNv3J9Mz6YA1CRDS5gb6wKH2P+j
 cdEfF2/Qmahhqs5524uWhbd/CwXF/MlNkpb/teXML3rbWFH829SobWdNX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398316520"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="398316520"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 17:56:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="850517785"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="850517785"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 17:56:49 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 17:56:35 -0800
Message-Id: <20230307015635.986043-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mcr: Add L3BANK steering for DG2
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

Bspec: 66534

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index fdbf9edb14cd..694a79b40ec0 100644
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

