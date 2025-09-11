Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45864CAC58F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 21:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCAF10EB86;
	Thu, 11 Sep 2025 21:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmB+q0oy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1D710EB8D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 21:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757624719; x=1789160719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iUNNGgkxoq9hV4lb2JB7SY8vvcm/iqwM/63wRZjpRHs=;
 b=EmB+q0oycGX8L++EG+sRCs2CVoB3JKacm2P4xgyJpSf5GENVfMFeCXXz
 0li9DUrJGcoU9xWm3RydyeqnDCHziV22pGC0cnoT4Sbjf6942012yuRMi
 cUMDvCT0YDktgpr92ZB0kDiqq38Ab/gSyiI8P/kKIEeE1b7ASD3MWd6C6
 rNLWkpHUBiXfn+TUgu7MiV57lzZS927YHbzbjDBqwRD4Jt5cJDXsQLmTS
 J1Lxelci7X5OtHQRUwrOizxpIAlslPnbsBwRxdRbos5VRpOBpSXiIMJ/b
 pY7zpsCk412ONmOWEjpiE3hOgFbndXiPmcU5FGFtNQS4LfOKFanrxP9sg w==;
X-CSE-ConnectionGUID: hri/IuMWTpKkGRPIugm4Vw==
X-CSE-MsgGUID: yumjGQ1OTWyRZuVGea2cqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71070350"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="71070350"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:05:19 -0700
X-CSE-ConnectionGUID: IwY8PYwkQ8uKpGLZXK3NbQ==
X-CSE-MsgGUID: ges4vOOGRT2fupgo5UPHJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="173361322"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2025 14:05:18 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 1/3] drm/pcids: Split PTL pciids group to make wcl subplatform
Date: Fri, 12 Sep 2025 02:35:12 +0530
Message-ID: <20250911210514.389014-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
References: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
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

To form the WCL platform as a subplatform of PTL in definition,
WCL pci ids are splited into saparate group from PTL.
So update the pciidlist struct to cover all the pci ids.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 include/drm/intel/pciids.h  | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 701ba9baa9d7..fc2ea9132804 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -375,6 +375,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
 	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
 	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
+	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index da6301a6fcea..9d378c65be4b 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -877,7 +877,9 @@
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0B0, ## __VA_ARGS__), \
+	MACRO__(0xB0B0, ## __VA_ARGS__)
+
+#define INTEL_WCL_IDS(MACRO__, ...) \
 	MACRO__(0xFD80, ## __VA_ARGS__), \
 	MACRO__(0xFD81, ## __VA_ARGS__)
 
-- 
2.51.0

