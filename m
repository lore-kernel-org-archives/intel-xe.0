Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF68CED24E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 01:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3D210E44B;
	Tue,  8 Oct 2024 01:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlR0Ax3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009D010E44A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 01:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728351319; x=1759887319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=foi+X5bkE6K+wW3FJ/wMDUL3VjvvM2Piytq0vleQIG4=;
 b=LlR0Ax3/zTQ5GdSbhDbso5uYDRENqLE6kMHoln8+CqD6BLwZ2A4iwTWV
 +o1wJ8BjVlyrDdqv/oTA1lftOvH/ZNkjvGm3cHjqfdD4xXcUUdUSs9Igw
 r9Dh5vdOW7tPdbN4aeSmh6s/5lVBiQ5ZoJAtkOerpubHMXB9aIYhC3lQ3
 3Ojzg+8zt2SD9qPWBang9A16XcLoSCq05UuKHCgSQx8B4syrAzBn6jflt
 QersHkhF/ZYtmSiiASBX6RWlo8CyhULjzrHqqI3ZTqPvGPihoMYwRQAoN
 v8wT0kv1amZmbQFtDhpaH0AcdGw/MnhlgA8mCs2MmnRq/LSGusS043VeO A==;
X-CSE-ConnectionGUID: SdC3jTpORkiy7eBwj5Nf5Q==
X-CSE-MsgGUID: 2tN9Q5c6S+235mpTpG0BsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38652977"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38652977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:19 -0700
X-CSE-ConnectionGUID: mBatkIlbSxK6nlG8V8krXg==
X-CSE-MsgGUID: 1pXCnrTTQ7CAIHYSAX6wAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80454320"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:18 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 5/6] drm/xe/ptl: Add PTL platform definition
Date: Mon,  7 Oct 2024 18:35:08 -0700
Message-ID: <20241008013509.61233-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241008013509.61233-1-matthew.s.atwood@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
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

v2: explicitly turn off display until display patches land.

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
index 2139edba9062..4085bb3b6550 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -350,6 +350,12 @@ static const struct xe_device_desc bmg_desc = {
 	.has_heci_cscfi = 1,
 };
 
+static const struct xe_device_desc ptl_desc = {
+	PLATFORM(PANTHERLAKE),
+	.has_display = false,
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -400,6 +406,7 @@ static const struct pci_device_id pciidlist[] = {
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

