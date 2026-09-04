Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C941C79F88
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C31010FAA6;
	Fri,  4 Sep 2026 17:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTM7cpkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACE710FA91
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788541550; x=1820077550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o9Md9Qr29AmNbs7XUeB1MsC3ke8IKSxb4EU+KAEK4HM=;
 b=FTM7cpkgz24WX4Tsv9OjAWp1PBDQ8GHZkB+GxyhoCtkxxxG8htcFdxnl
 mKRpjg9AOyzYXmquOI6vYEIWUP27mCpZCDdhSvQFXxc1pUCfAFQaRQEus
 8LvY3rJ9O4NDZFcZ9Qqt2wJCdFpAseF2L0a9mp6KyNvaZwWQnTelJAiI8
 ZlGevr2Og4J9GgS9oyKEMi8nILNM66B8Eo5jodmZBYpz1DuCzKR7jhbbE
 h2pVYKksfEbzxoJnF/DnVm42XBdNcU7smhdSzOvkM9vWbucWscKsy+2CE
 mCDBE4+lIjL4/9aoWJA+vyL/CaPjldrgg1wrE32DeGonF3lSsS5ZRo4nN A==;
X-CSE-ConnectionGUID: 7D/KNOFnQ7qtf3thZ9h1kg==
X-CSE-MsgGUID: u2TOQrkKTVG2WSjbg7dQrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89082222"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89082222"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:50 -0700
X-CSE-ConnectionGUID: iteFrRUhQSufN6rASBvvbQ==
X-CSE-MsgGUID: GazvVz8fTcCkBO1kDG8qKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273882697"
Received: from johndonn-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 5/6] drm/xe: Drop redundant parameter from xe_probe_info and
 friends
Date: Fri,  4 Sep 2026 19:05:29 +0200
Message-ID: <20260904170531.516-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904170531.516-1-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
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

We can now obtain the const pointer to struct xe_device_desc directly
from the xe, no need to pass it as explicit parameter.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  5 +++--
 drivers/gpu/drm/xe/xe_pci.c       | 13 ++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index c817692c0ce3..7712282308c4 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -311,10 +311,11 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
 
 static int fake_probe_info(struct xe_device *xe,
-			   const struct xe_device_desc *desc,
 			   struct xe_pci_fake_data *data,
 			   struct xe_probed_info *probed_info)
 {
+	const struct xe_device_desc *desc = xe->desc;
+
 	probed_info->tile_count = 1 + desc->max_remote_tiles;
 
 	if (!data || desc->pre_gmdid_graphics_ip) {
@@ -379,7 +380,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	xe->sriov.__mode = data && data->sriov_mode ?
 			   data->sriov_mode : XE_SRIOV_MODE_NONE;
 
-	err = fake_probe_info(xe, desc, data, &probed_info);
+	err = fake_probe_info(xe, data, &probed_info);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6ca1ec311a4b..c401c8803796 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -836,14 +836,13 @@ static int xe_info_init_early(struct xe_device *xe,
 }
 
 static void xe_probe_tile_count(struct xe_device *xe,
-				const struct xe_device_desc *desc,
 				struct xe_probed_info *probed_info)
 {
 	struct xe_mmio *mmio;
 	u8 tile_count;
 	u32 mtcfg;
 
-	probed_info->tile_count = 1 + desc->max_remote_tiles;
+	probed_info->tile_count = 1 + xe->desc->max_remote_tiles;
 
 	/*
 	 * Probe for tile count only for platforms that support multiple
@@ -946,9 +945,10 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 }
 
 static int xe_probe_ips(struct xe_device *xe,
-			const struct xe_device_desc *desc,
 			struct xe_probed_info *probed_info)
 {
+	const struct xe_device_desc *desc = xe->desc;
+
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers.
@@ -989,14 +989,13 @@ static int xe_probe_ips(struct xe_device *xe,
  * Probe from the hardware the info required by xe_info_init().
  */
 static int xe_probe_info(struct xe_device *xe,
-			 const struct xe_device_desc *desc,
 			 struct xe_probed_info *probed_info)
 {
 	int err;
 
-	xe_probe_tile_count(xe, desc, probed_info);
+	xe_probe_tile_count(xe, probed_info);
 
-	err = xe_probe_ips(xe, desc, probed_info);
+	err = xe_probe_ips(xe, probed_info);
 	if (err)
 		return err;
 
@@ -1240,7 +1239,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 	if (err)
 		return err;
 
-	err = xe_probe_info(xe, desc, &probed_info);
+	err = xe_probe_info(xe, &probed_info);
 	if (err)
 		return err;
 
-- 
2.47.1

