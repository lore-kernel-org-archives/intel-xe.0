Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB30E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F06610EB02;
	Fri,  6 Sep 2024 21:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKd5HzIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AA810EB02
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659529; x=1757195529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X04vywirKbDkHIiIVPduDdxU/3amWSaum6jpppYwxhk=;
 b=bKd5HzIg4gcHCe/2RNNqxA7MfxOOpcpZ4IQy2MtdAgrCezHFyGEFzTXD
 IMYEvhP3tRI2Z97cJp4gVmFvXDeeyzTKA9K7PRsQ71E1BcNYTnEXeWOSf
 H18fBiV3uM/zTkThnuwpc9Bd9qiNGwovQK4BBtMosAl1CZllsP35rAmpV
 PGvn+Pj+y7Mb6o31+Mhh0yZ1DV0kOC8VQx8ezsNo9ERFgMHdzsUI7qMxt
 QJFmFvzNQyyquFTsAlIhmeE0ttgQdOvLWOl3L0J/TWdMY36PFayTYyFhH
 ImR4vO+vRGZGKmQB9FCh0fS2DjS5WqKHrtkLE+Vh7R2us0RCVsId8hcHH Q==;
X-CSE-ConnectionGUID: ezmlbvh/Rdude8l6iS+cqA==
X-CSE-MsgGUID: Ku22RYxwRk6ptSjxfcv1EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580598"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580598"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:08 -0700
X-CSE-ConnectionGUID: uaVPC9eFT8qsg+HmQfKSEg==
X-CSE-MsgGUID: rFkb31B+TiiDmODNoACx0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656350"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:07 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 9/9] drm/xe/ptl: Add PTL platform definition
Date: Fri,  6 Sep 2024 14:51:53 -0700
Message-ID: <20240906215153.31210-10-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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
 drivers/gpu/drm/xe/xe_pci.c            |  7 +++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 include/drm/intel/xe_pciids.h          | 11 +++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b30d09508a38..e471832a7a7f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -370,6 +370,12 @@ static const struct xe_device_desc bmg_desc = {
 	.has_heci_cscfi = 1,
 };
 
+static const struct xe_device_desc ptl_desc = {
+	PLATFORM(PANTHERLAKE),
+	.has_display = true,
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -418,6 +424,7 @@ static const struct pci_device_id pciidlist[] = {
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
index 73d972a8aca1..0e0256072acd 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -215,4 +215,15 @@
 	MACRO__(0xE20D, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__)
 
+#define XE_PTL_P_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__)
+
+#define XE_PTL_U_IDS(MACRO__, ...) \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__)
+
+#define XE_PTL_IDS(MACRO__, ...) \
+	XE_PTL_P_IDS(MACRO__, ## __VA_ARGS__), \
+	XE_PTL_U_IDS(MACRO__, ## __VA_ARGS__)
+
 #endif
-- 
2.44.0

