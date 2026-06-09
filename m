Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCA5CD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5B510E640;
	Tue,  9 Jun 2026 20:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4f0zFN5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82B010E629
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036270; x=1812572270;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=dvRnPLsZ7ZryxORULp2r/PbhHhFKzASrv4q8bTi6XBc=;
 b=f4f0zFN5JC2ArQ0wZx+4LFpQW5MLxtFcNzcQrNjzDDyzznwEmxea3wOA
 GRl8aSxkuClvZZ4RK/T2AtovxSX1gfrXae/hafO1E00KqbM2MPUNsVBjm
 vSIlSSElZ0iRGZzRNxIKcoUSP1ZKyZoWKnNPbBu7Vk6VuxmXK8GXpHr6Q
 VOrw1FldN+iVM6/L2BHAu+XvB30H/TAMp4IXSieb0u76W9rilhmTHfjiX
 tI64Gf00G2aMJTJtbwnGPKd3mU5zeqTQemzMZFeeiEUmIlj4MMkhoAWyx
 zrdsuShSO+w19M/bsRFd92JNiJrxamqXs1BrR2UWge5W47e0MzqphTJYr Q==;
X-CSE-ConnectionGUID: JWS3InDERpqhAemTT+Puzw==
X-CSE-MsgGUID: TsYH38AQRFeIDeiKfYkuYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383299"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383299"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:50 -0700
X-CSE-ConnectionGUID: 7RqOjE6BTZmKVdIUvHrdAQ==
X-CSE-MsgGUID: jXnVlP/pTb6GcakT1NEeAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027536"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:51 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:35 -0300
Subject: [PATCH 3/9] drm/xe: Add devid and revid to xe_probed_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-3-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The PCI devid and revid fields are info that we probe from the
hardware (indirectly via the PCI subsystem).  Add them to
xe_probed_info and set them via xe_probe_info_early(), since the
respective fields in xe->info are updated in xe_info_init_early().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  6 ------
 drivers/gpu/drm/xe/xe_pci.c       | 23 ++++++++++-------------
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 51d032a9e01a..1baf3cd0d381 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -311,11 +311,6 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
 
-static void fake_init_devid(struct xe_device *xe)
-{
-	/* Nothing to do, just keep zero. */
-}
-
 static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 			   u32 *ver, u32 *revid)
 {
@@ -382,7 +377,6 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	xe->sriov.__mode = data && data->sriov_mode ?
 			   data->sriov_mode : XE_SRIOV_MODE_NONE;
 
-	kunit_activate_static_stub(test, init_devid, fake_init_devid);
 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
 	kunit_activate_static_stub(test, xe_info_probe_tile_count,
 				   fake_xe_info_probe_tile_count);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 646e04c6254f..382df59260ae 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -727,18 +727,9 @@ static int handle_gmdid(struct xe_device *xe,
 	return 0;
 }
 
-static void init_devid(struct xe_device *xe)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-
-	KUNIT_STATIC_STUB_REDIRECT(init_devid, xe);
-
-	xe->info.devid = pdev->device;
-	xe->info.revid = pdev->revision;
-}
-
 struct xe_probed_info {
-	/* Nothing for now. */
+	u16 devid;
+	u8 revid;
 };
 
 /*
@@ -747,6 +738,11 @@ struct xe_probed_info {
 static int xe_probe_info_early(struct xe_device *xe,
 			       struct xe_probed_info *probed_info)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	probed_info->devid = pdev->device;
+	probed_info->revid = pdev->revision;
+
 	return 0;
 }
 
@@ -761,13 +757,14 @@ static int xe_info_init_early(struct xe_device *xe,
 {
 	int err;
 
+	xe->info.devid = probed_info->devid;
+	xe->info.revid = probed_info->revid;
+
 	xe->info.platform_name = desc->platform_name;
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
-	init_devid(xe);
-
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;

-- 
2.53.0

