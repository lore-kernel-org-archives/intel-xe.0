Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E6DCCD1A5
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA0B10E544;
	Mon, 20 Oct 2025 23:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmBXE1Px";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224F210E543
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761003983; x=1792539983;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=eqh/16wSuSJtaEJPDLIWIQbo7QPBc40SpR2F8hxZM8k=;
 b=hmBXE1PxF31Fr7XT0gSJCSTFp3cO3+/zuCUJWVQqiOneaQdClfXQ0qrx
 7CFRzyrsLODBYgk9Wrrs1sUa09Aq5u+3pQEny67/Xn/x56qF8JwuA71j4
 70KefLJmb+rmHMnKhZPH7aG0zgheEAuCnVhTHk1KQ3AhA/ffrNs4tiiyV
 VF+SqtBOygnJR3+yS4kD/oKXixvvfhVaW5WUXORsmWdE9LMBtKigezwUg
 qU53SFwDsLdii0ai0td/TPlR8Fd0X0PMetEIBCltFjfDnJNQQj1fDex3n
 NcTSwwuqQz6mHvMFO6EUAOsoDKklOEhlh1ubQim0dhjCegAAJ4A+2ZyXb A==;
X-CSE-ConnectionGUID: KYBxLa5eSq+b8a08as0mWg==
X-CSE-MsgGUID: DlOfCWJ5QR6seXoMEJCk7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73799302"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="73799302"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:46:23 -0700
X-CSE-ConnectionGUID: sEtnIuMZTPeO9918VgzDzg==
X-CSE-MsgGUID: PG5cRi1/Sz29VXk9btQG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="214414295"
Received: from ldmartin-desk2.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:46:22 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 20 Oct 2025 20:45:56 -0300
Subject: [PATCH v2 1/2] drm/xe/tests/pci: Convert GT count check to general
 device check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-1-27b03971bc7e@intel.com>
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

We already have check_graphics_ip() and check_media_ip() as general
functions to check the IP descriptors.  The check in
check_platform_gt_count() is simple enough such that we can convert the
function to a more general device check.  In an upcoming change, we will
also add some checks for other members of struct xe_device_desc. As
such, rename check_platform_gt_count() to check_platform_desc().

While at it, use inline (unsigned int) casting of max_gt_per_tile to
keep checks for each member localized; and use KUNIT_EXPECT_*() variants
of the macros to allow multiple issues to be reported.

v2:
  - Use (int) instead of (unsigned int) casting. (Michal)
  - Use KUNIT_EXPECT_*() instead of UNIT_ASSERT_*() macros. (Michal)

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index 37b344df2dc3..4ba2fb93c9de 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -44,21 +44,20 @@ static void check_media_ip(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, mask, 0);
 }
 
-static void check_platform_gt_count(struct kunit *test)
+static void check_platform_desc(struct kunit *test)
 {
 	const struct pci_device_id *pci = test->param_value;
 	const struct xe_device_desc *desc =
 		(const struct xe_device_desc *)pci->driver_data;
-	int max_gt = desc->max_gt_per_tile;
 
-	KUNIT_ASSERT_GT(test, max_gt, 0);
-	KUNIT_ASSERT_LE(test, max_gt, XE_MAX_GT_PER_TILE);
+	KUNIT_EXPECT_GT(test, (unsigned int)desc->max_gt_per_tile, 0);
+	KUNIT_EXPECT_LE(test, (unsigned int)desc->max_gt_per_tile, XE_MAX_GT_PER_TILE);
 }
 
 static struct kunit_case xe_pci_tests[] = {
 	KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
 	KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
-	KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
+	KUNIT_CASE_PARAM(check_platform_desc, xe_pci_id_gen_param),
 	{}
 };
 

-- 
2.51.0

