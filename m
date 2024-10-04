Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5E3CF8861
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDEB10E198;
	Fri,  4 Oct 2024 22:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfT0ttSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A797610E0CB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728079564; x=1759615564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pp+GyqyEXSNeHf2n8dUIK6Rxm6rr2LlKWyLYPjzi2Vc=;
 b=cfT0ttSQXljzHRyAbgMGn9Q9+p2jiN0genc3YLlaUqeuH6x10hANNDT5
 Kv9UZ2X4uS/lB/kFgiDHX3J9YAciWlHfAcLEPnTI3IRVhLSuxcRR0KDgF
 axABGFHGvA3FbO9xYARFgweABBK8omxdtL1tbovIoh0fw3TF7nNwfYKfp
 T7u5sQiPAUp7LwUDhCqFOJBQDqCsNbac2g4Qspwdss7btnxrE3R7tf/9X
 ZoqWvrg7XXRAJfgZCJp5GBzH3GFtNMxy2EKmEbQ6KAvGxGCFOty5sAGce
 9mmmOMO094zZU4baCMadHA3d023JOuQ+x07iRaZiTAcCxOTEvJvdbvjQY Q==;
X-CSE-ConnectionGUID: 3edfPZ4gSE6macNaTnY2EQ==
X-CSE-MsgGUID: IWrTl3SXQ8KjSEq21gs+kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30199420"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="30199420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:04 -0700
X-CSE-ConnectionGUID: Ocswl6BrS/6Pm0vH5RrArA==
X-CSE-MsgGUID: 0G+WXWznRbef8+KcivFYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74836992"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:02 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 5/6] drm/xe/ptl: Add PTL platform definition
Date: Fri,  4 Oct 2024 15:05:49 -0700
Message-ID: <20241004220550.94308-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241004220550.94308-1-matthew.s.atwood@intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
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

From: Haridhar Kalvala <haridhar.kalvala@intel.com>

PTL is an integrated GPU based on the Xe3 architecture.

Bspec: 72574

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            |  6 ++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 include/drm/intel/xe_pciids.h          | 11 +++++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6b2dfe4b305f..c7711f6aa095 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -355,6 +355,11 @@ static const struct xe_device_desc bmg_desc = {
 	.has_heci_cscfi = 1,
 };
 
+static const struct xe_device_desc ptl_desc = {
+	PLATFORM(PANTHERLAKE),
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -405,6 +410,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
 	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
+	XE_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 79b7042c4534..d08574c4cdb8 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -23,6 +23,7 @@ enum xe_platform {
 	XE_METEORLAKE,
 	XE_LUNARLAKE,
 	XE_BATTLEMAGE,
+	XE_PANTHERLAKE,
 };
 
 enum xe_subplatform {
diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 65520a90c17c..6d8d013f74e0 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -220,4 +220,15 @@
 	MACRO__(0xE20D, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__)
 
+#define XE_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)
+
 #endif
-- 
2.45.0

