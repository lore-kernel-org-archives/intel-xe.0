Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4758DCD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 19:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80F410E0BB;
	Mon, 25 May 2026 19:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTxgVxHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4402410E0BB
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 19:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779738085; x=1811274085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+SmCO1K59wuWaz4Znf4Ak8XmuWq5hyDW0vzgKb808i0=;
 b=XTxgVxHQuSaUIS2lQhgM/lvwXWJ43PkEs7dxNEZVhqw4nVPmQTJzCjkX
 E1+wJDr1ZZAdHiGVWEeEP/HSiSangKnexicgAJkGXUC4ZZzKIdv10u9e+
 B6yUAvkdiCKAmI6mK9FqfGDz7jJJ4UtBeXttitYp1mjSbuPZbMXIt99Zw
 ORgBHO11IegLbW7iLo9rMOIjJPtE8uaIIwNZlynVRoD9O1r2p8sOYUQhh
 tGIQI6aQ/813T3RH8cTtDbUdMdTAnvup7oNAvJk2m/OPMR4BnLIdXSJ49
 DcObqA9XkATIW7ph9xr52HEn5NB2VPYHvzq6WmHp9OcKT9cLtjY8qM1uu A==;
X-CSE-ConnectionGUID: TbefcSXOTvmbtym1KvB80g==
X-CSE-MsgGUID: FVy32rL3SZita/gcVAYmTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84179820"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="84179820"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:41:25 -0700
X-CSE-ConnectionGUID: pCvBaWe8TL+rEqKTTYshAA==
X-CSE-MsgGUID: yHzo60ywTha9OeYauVqZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="246650107"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:41:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 3/6] drm/xe: Move xe->info.devid|revid initialization
Date: Mon, 25 May 2026 21:41:09 +0200
Message-ID: <20260525194109.16076-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525160529.15890-4-michal.wajdeczko@intel.com>
References: <20260525160529.15890-4-michal.wajdeczko@intel.com>
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

The xe_info_init_early() is a place where we initialize those of
the xe->info fields that do not require any additional hardware
probes. Move the initialization of the devid/revid also there, but
to avoid breaking the kunit helper, which also calls this function,
keep their initialization separate in sub-function so we can easily
stub it when running the kunit test.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
v2: don't add devid/revid to xe_pci_fake_data (Gustavo)
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++++++
 drivers/gpu/drm/xe/xe_device.c    |  2 --
 drivers/gpu/drm/xe/xe_pci.c       | 12 ++++++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 860409c579f8..9240aff779da 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -311,6 +311,11 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
 
+static void fake_init_devid(struct xe_device *xe)
+{
+	/* Nothing to do, just keep zero. */
+}
+
 static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 			   u32 *ver, u32 *revid)
 {
@@ -369,6 +374,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	xe->sriov.__mode = data && data->sriov_mode ?
 			   data->sriov_mode : XE_SRIOV_MODE_NONE;
 
+	kunit_activate_static_stub(test, init_devid, fake_init_devid);
 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
 	kunit_activate_static_stub(test, xe_info_probe_tile_count,
 				   fake_xe_info_probe_tile_count);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cdc7e0935c13..b498147dcf61 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -521,8 +521,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 	if (err)
 		return ERR_PTR(err);
 
-	xe->info.devid = pdev->device;
-	xe->info.revid = pdev->revision;
 	xe->atomic_svm_timeslice_ms = 5;
 	xe->min_run_period_lr_ms = 5;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b1f5f0098f26..6b1a4cb7ccb0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -727,6 +727,16 @@ static int handle_gmdid(struct xe_device *xe,
 	return 0;
 }
 
+static void init_devid(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	KUNIT_STATIC_STUB_REDIRECT(init_devid, xe);
+
+	xe->info.devid = pdev->device;
+	xe->info.revid = pdev->revision;
+}
+
 /*
  * Initialize device info content that only depends on static driver_data
  * passed to the driver at probe time from PCI ID table.
@@ -742,6 +752,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
+	init_devid(xe);
+
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
-- 
2.47.1

