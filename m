Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE39C88E7F
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 15:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082FD10E28D;
	Tue, 15 Sep 2026 15:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9NLAf36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9574410E28D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789487888; x=1821023888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RGFVNMsQRxRwl+1gKTL7z47Gfsfbhdiz33xZaFPUXZk=;
 b=Z9NLAf36LQ9z0QI3SiU0QtvBsRxfeXsuSMTAq3qXEH1thJdp69062HJF
 xGlAeYR33uSNDLkoVsH4WlqqHXL1OqlIq9sfl1mYtWSzKCAckX1kID8k+
 cOHl3PWGuPuQcs1N+4F9pxscq2nHoWyHhFNX0ltdxWmjwM+wvYNVY2nD3
 jcOoSBZ9gffV3wxZu5GOwTvfCh96a2ye1ZUMn9AOneZLBIoNdeaIKFA9D
 QKDZRAX93qlKYz7qwAIVzIm8FOk6IXkWCbgLnNlvbe7iA47Bxohs5bn5I
 MYas1XTwXVIMNPzpJc3BfOmQu33URJg2OsNu2tPJ58rpG6go3vU3KZyht A==;
X-CSE-ConnectionGUID: 5rcnNoIrTQ6jydxrLFS2+Q==
X-CSE-MsgGUID: mBCofApSSmGyrBxnNs8YvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100455252"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100455252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 08:58:07 -0700
X-CSE-ConnectionGUID: WBDo7mV3Q8+3U/SxZOY6Wg==
X-CSE-MsgGUID: 0eMXbUDXROGrMwVpLSCUaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272575606"
Received: from adambyrn-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.16.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 08:58:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/kunit: Skip test if can't find (sub)platform
Date: Tue, 15 Sep 2026 17:57:53 +0200
Message-ID: <20260915155753.472-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Some platforms, like PVC, might be added to the driver pciidlist
only on the CI specific branch, causing failures in some kunit
tests, like xe_log, if they would like to create fake PVC device
on the non-CI upstream tree:

 [] # demo_dmesg: ASSERTION FAILED at drivers/gpu/drm/xe/tests/\
    xe_kunit_helpers.c:88
 [] Expected err == 0, but
 []     err == -19 (0xffffffffffffffed)
 [] [FAILED] demo_dmesg

If the requested device descriptor can't be found during the fake
device initialization, skip the test instead of returning -ENODEV
that would otherwise be treated as a real test failure:

 [] [SKIPPED] demo_dmesg (platform 8 not found)

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 5aefc03c00c7..76e0a1532285 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -363,7 +363,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	}
 
 	if (!ent->device)
-		return -ENODEV;
+		kunit_skip(test, "platform %d not found\n", data->platform);
 
 	if (data->subplatform == XE_SUBPLATFORM_NONE) {
 		subplatform_desc = NULL;
@@ -382,7 +382,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 			break;
 
 	if (!subplatform_desc || !subplatform_desc->subplatform)
-		return -ENODEV;
+		kunit_skip(test, "subplatform %d not found on %s\n",
+			   data->subplatform, desc->platform_name);
 
 done:
 	xe->desc = desc;
-- 
2.47.1

