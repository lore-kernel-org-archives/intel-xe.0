Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9DACCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 15:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A711C10E493;
	Mon, 13 Oct 2025 15:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Umm/WryQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5647010E493
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 15:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760369458; x=1791905458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zzh8UT0Vj7HgiLWduG3TQxGjrnf11kVJE120LeuKCs8=;
 b=Umm/WryQHPC5WQObtw3Sg0ng3c9b7M5bBimYlPNYNG3h8nseujQTvwdR
 Wf/2y/mgL/gI0Q7CNwgbUwe8W0AOicohCsJhZEg+8fSehOYdA/f+9whQ1
 wgrWUznBma8vbcrQdgZYd084aPryOyxkNDggWx1kRNPaoZkibRlsTmWA7
 w57ONxlOxwsp/gfYpgpib7n6Y1YRabz8vQz5ULsPBIa98tvyhz/yMteCF
 QtyNEoIke4VPR/BdgGGfn7vWWyBHsIpqKdsFUVP9csgSn8vRL92EkfCr5
 53J/v5yiQjuapgIhoUbw+loFF5yL34kBMiyhfR7XAMNfZOXpBapxRp3Y5 A==;
X-CSE-ConnectionGUID: AkaiK1P7RZerr6LZnQvEgQ==
X-CSE-MsgGUID: 7d7TTkjtSh6re4AfyE6+EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73854787"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73854787"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 08:30:58 -0700
X-CSE-ConnectionGUID: cH/Yg2azTpOdsAZ3stAnJA==
X-CSE-MsgGUID: eL8hczKTQiaUV7msEK725Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="181200065"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 08:30:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/kunit: Fix kerneldoc for parameterized tests
Date: Mon, 13 Oct 2025 08:30:15 -0700
Message-ID: <20251013153014.2362879-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
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

Kunit's generate_params() was recently updated to take an additional
test context parameter.  Xe's IP and platform parameter generators were
updated accordingly at the same time, but the new parameter was not
added to the functions' kerneldoc, resulting in the following warnings:

   Warning: drivers/gpu/drm/xe/tests/xe_pci.c:78 function parameter 'test' not described in 'xe_pci_fake_data_gen_params'
   Warning: drivers/gpu/drm/xe/tests/xe_pci.c:254 function parameter 'test' not described in 'xe_pci_graphics_ip_gen_param'
   Warning: drivers/gpu/drm/xe/tests/xe_pci.c:278 function parameter 'test' not described in 'xe_pci_media_ip_gen_param'
   Warning: drivers/gpu/drm/xe/tests/xe_pci.c:302 function parameter 'test' not described in 'xe_pci_id_gen_param'
   Warning: drivers/gpu/drm/xe/tests/xe_pci.c:390 function parameter 'test' not described in 'xe_pci_live_device_gen_param'
   5 warnings as errors

Document the new parameter to eliminate the warnings and make CI happy.

Fixes: b9a214b5f6aa ("kunit: Pass parameterized test context to generate_params()")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 69e2840c7ef0..663a79ec960d 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -66,6 +66,7 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
 
 /**
  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data parameters
+ * @test: test context object
  * @prev: the pointer to the previous parameter to iterate from or NULL
  * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
  *
@@ -242,6 +243,7 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
 
 /**
  * xe_pci_graphics_ip_gen_param - Generate graphics struct xe_ip parameters
+ * @test: test context object
  * @prev: the pointer to the previous parameter to iterate from or NULL
  * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
  *
@@ -266,6 +268,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
 
 /**
  * xe_pci_media_ip_gen_param - Generate media struct xe_ip parameters
+ * @test: test context object
  * @prev: the pointer to the previous parameter to iterate from or NULL
  * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
  *
@@ -290,6 +293,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
 
 /**
  * xe_pci_id_gen_param - Generate struct pci_device_id parameters
+ * @test: test context object
  * @prev: the pointer to the previous parameter to iterate from or NULL
  * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
  *
@@ -376,6 +380,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
 
 /**
  * xe_pci_live_device_gen_param - Helper to iterate Xe devices as KUnit parameters
+ * @test: test context object
  * @prev: the previously returned value, or NULL for the first iteration
  * @desc: the buffer for a parameter name
  *
-- 
2.51.0

