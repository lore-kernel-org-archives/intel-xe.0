Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7959CD5BD5
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543FE10E3C8;
	Mon, 25 May 2026 16:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdzyWR84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64E510E3B4
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779725141; x=1811261141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hH/D3vz53R+L2vqLofCOW7gjnAWDmP8pB/UtqhAm2ow=;
 b=AdzyWR84XYj3v0Clm8QfEhG+nuvQ5YrEO06RDj6vlXZGo20q4MGl9m9P
 9PbWTyyy7+b/G7rXM5wzUtILT6ITKtosGoNArQv/rI9L9sjImeZjYK889
 sZ6UuC+Qm8GQOjjZQJtvvIzv2SIoBFHplf7Wj4xm3+7cM5qv67mcjSX1j
 7NedpDVm8Pxvn0lrPcqmmrfyNNQAi9cMBVMWLEhMRNd7y+AHa2kr3HhUb
 ZpjWNMHmZeXiI5naBAWWSTwuXxZoyHR8Kp9H80Sy/8dWjbz1PAayoEiAt
 0QM6HIiYrNfb8OYpQ+UzdqusuO/ZbmReAtWHtgMJFxDEVKzGfsZykOBNi w==;
X-CSE-ConnectionGUID: tK9s7lSeS76Lt6aZy7fj/w==
X-CSE-MsgGUID: 4DIatehySEupK1SM2YB/Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80275437"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80275437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:41 -0700
X-CSE-ConnectionGUID: OR8csomqQk6c85MIOMJeKw==
X-CSE-MsgGUID: tsh4q+vrQXGq914PtIthqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="235275247"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/6] drm/xe: Move xe->info.devid|revid initialization
Date: Mon, 25 May 2026 18:05:26 +0200
Message-ID: <20260525160529.15890-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525160529.15890-1-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  2 ++
 drivers/gpu/drm/xe/xe_device.c         |  2 --
 drivers/gpu/drm/xe/xe_pci.c            | 12 ++++++++++++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 860409c579f8..7c3428ab4c89 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -311,6 +311,17 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
 
+static void fake_init_devid(struct xe_device *xe)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_pci_fake_data *data = test->priv;
+
+	if (data) {
+		xe->info.devid = data->devid;
+		xe->info.revid = data->revid;
+	}
+}
+
 static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 			   u32 *ver, u32 *revid)
 {
@@ -369,6 +380,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	xe->sriov.__mode = data && data->sriov_mode ?
 			   data->sriov_mode : XE_SRIOV_MODE_NONE;
 
+	kunit_activate_static_stub(test, init_devid, fake_init_devid);
 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
 	kunit_activate_static_stub(test, xe_info_probe_tile_count,
 				   fake_xe_info_probe_tile_count);
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 30505d1cbefc..46f961f75ecd 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -22,6 +22,8 @@ struct xe_pci_fake_data {
 	struct xe_step_info step;
 	u32 graphics_verx100;
 	u32 media_verx100;
+	u16 devid;
+	u8 revid;
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
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

