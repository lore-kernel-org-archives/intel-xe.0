Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662EDCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 17:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACD910E313;
	Thu, 16 Oct 2025 17:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nimkR4N6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E9310E311
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760637028; x=1792173028;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=fbuLQIn9yAPaj+mu6sOUctmhtrzCGHtq7e0XQT7sORw=;
 b=nimkR4N68t/BRsqTRcO6QoOm6KGxRdLfjxlFrQLpguwzYXj4GCy866SK
 yihOno4VmrVhs2KEe/9wfINkYqaacMMx9RpOPl8uGPriMT3VFC43KRgka
 EO0kpCu+u1zkOP1nkV4KoEUJKzDUBAk2Wu9hfKEXRJUIH6KKs11lZeJUW
 bljgPKTGFaxUBSeZ3quWTE1WW6JIo3BEH9SzJM8tUNnislrxzepkQ3dfp
 mQ0CBu19CDidWytH2p37+bF1EFx9kgdILlyaiwE4YONYZ95+OrKs0GOVL
 jlu6IzNAJ8K6oPUk9ueNRjETx6+yJ0aI7Lad1OzQjONhOyrrmEt8UaGqn A==;
X-CSE-ConnectionGUID: xSu5JnzeR1KKFtAb8dEDbQ==
X-CSE-MsgGUID: BHEe/44JTKWkW2abW8VUhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73512598"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73512598"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 10:50:28 -0700
X-CSE-ConnectionGUID: ngACb1vhRyCjySc6Dvgtsw==
X-CSE-MsgGUID: eEJE2ynlRTmuk9NLGaEpNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182997802"
Received: from ldmartin-desk2.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.131])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 10:50:26 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 16 Oct 2025 14:49:57 -0300
Subject: [PATCH 2/2] drm/xe/tests/pci: Check dma_mask_size, va_bits and
 vm_max_level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-2-d0886d97121d@intel.com>
References: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
In-Reply-To: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
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

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---

Michal, I added a "Suggested-by" on your name because of [1].  Please
let me know if you are okay with that.

[1] https://lore.kernel.org/all/43c824c1-dbfc-48b1-9c90-389e3bf24c9a@intel.com/
---
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index f09efb523b7e..a4dbc8ddee43 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -50,8 +50,13 @@ static void check_platform_desc(struct kunit *test)
 	const struct xe_device_desc *desc =
 		(const struct xe_device_desc *)pci->driver_data;
 
+	KUNIT_ASSERT_GT(test, desc->dma_mask_size, 0);
+
 	KUNIT_ASSERT_GT(test, (int)desc->max_gt_per_tile, 0);
 	KUNIT_ASSERT_LE(test, (int)desc->max_gt_per_tile, XE_MAX_GT_PER_TILE);
+
+	KUNIT_ASSERT_GT(test, desc->va_bits, 0);
+	KUNIT_ASSERT_GT(test, desc->vm_max_level, 0);
 }
 
 static struct kunit_case xe_pci_tests[] = {

-- 
2.51.0

