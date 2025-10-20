Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D71CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA55F10E543;
	Mon, 20 Oct 2025 23:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kboIQl2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02BF10E543
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761003985; x=1792539985;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=IbkDLrOdaawXVgVCLKq8iw9YQ5NivfdV1y9KaPM9UrU=;
 b=kboIQl2dR4pmmAiwAV5OixmHI9eOzT+TIBFsEMucs0GlevYhi6Q3Y98j
 qdVlbIQfAPadmkIZZltnH42gFyodr+IZ9/aDhjxNgStQPJ94H/13OT9Uh
 fESaM3iGYrqKMrCKFmb1zVy+vhv0oSQCPt6KykAjy56n5nr2aC34Uf4g4
 cDkRBkKsUkcZ6MsAsdk7rVbwCgpePnIriAljTTE1JXEo1n6VPeCvr/P+i
 9prP1RWazGU28YzJsoQXJDcXwR0NLLNS1S1IAWDSfEmeHlnQ7risaI5T5
 JhF7eMIL36xGSUKs42FGv/5iqXiLO66S+VLthegcPc1YVGCPJsFgShiqs Q==;
X-CSE-ConnectionGUID: DPZ0xkR2SMyzJ6Tc7pxawg==
X-CSE-MsgGUID: KU3DzMmCT6u26fNP7QeGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73799312"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="73799312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:46:25 -0700
X-CSE-ConnectionGUID: 7HYPyZErSNu/t+4XCi0h4Q==
X-CSE-MsgGUID: OEdH7gVMQymUHp+fqhnPtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="214414309"
Received: from ldmartin-desk2.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:46:23 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 20 Oct 2025 20:45:57 -0300
Subject: [PATCH v2 2/2] drm/xe/tests/pci: Check dma_mask_size, va_bits and
 vm_max_level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-2-27b03971bc7e@intel.com>
References: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
In-Reply-To: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
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

Members dma_mask_size, va_bits and vm_max_level of struct xe_device_desc
are all expected to be non-zero.  Add checks for that in
check_platform_desc().

v2:
  - Also check that va_bits does not exceed 64. (Michal)

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index 4ba2fb93c9de..4d10a7e2b570 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -50,8 +50,15 @@ static void check_platform_desc(struct kunit *test)
 	const struct xe_device_desc *desc =
 		(const struct xe_device_desc *)pci->driver_data;
 
+	KUNIT_EXPECT_GT(test, desc->dma_mask_size, 0);
+
 	KUNIT_EXPECT_GT(test, (unsigned int)desc->max_gt_per_tile, 0);
 	KUNIT_EXPECT_LE(test, (unsigned int)desc->max_gt_per_tile, XE_MAX_GT_PER_TILE);
+
+	KUNIT_EXPECT_GT(test, desc->va_bits, 0);
+	KUNIT_EXPECT_LE(test, desc->va_bits, 64);
+
+	KUNIT_EXPECT_GT(test, desc->vm_max_level, 0);
 }
 
 static struct kunit_case xe_pci_tests[] = {

-- 
2.51.0

