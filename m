Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C3EEE4998
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511C910E584;
	Fri, 18 Aug 2023 22:08:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48D810E57D
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kzfnCWDwsFb33QRsAS8vern7DuMbOmxo4wYAvsRe/4U=;
 b=JCubVkcYxP0oFjPS2G4aXksLPb1Tq+ktYyalu+/cnOTrkz6Wndk3RVQ6
 arHy+xBX4NLSjXREmuRUxA95R/wL3OL/sbnhndcE62eGHpmCrRJ6ZHblZ
 aBJpiizIuxVqyiToDmobCqWeiLTv0e04qbdXR8QfhVGlA9ViMXMShorIQ
 1ZkvrkBgMBa/WDfmPtTngN5JRN5moB7nTZHTOYnwKsjdyXfvnxMFkwREx
 aOSP6DHSImllVXmj60lxdQzoRN1AdBd77Ylt7s7QTTkqQXicgTD5ccUV9
 F1kQCAQxHzGvNLQ5glPIjpIvOB/H1b4m6fcQ9Ch/quve1/1wrl74P1E9s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592995"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592995"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758212"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758212"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:22 -0700
Message-Id: <20230818220824.700519-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 13/15] drm/xe/lnl: Add LNL platform definition
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

LNL is an integrated GPU based on the Xe2 architecture.

Bspec: 70821
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 include/drm/xe_pciids.h                | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 70d5f25c0d20..5e3ffe76cc46 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -342,6 +342,12 @@ static const struct xe_device_desc mtl_desc = {
 	.has_display = true,
 };
 
+static const struct xe_device_desc lnl_desc = {
+	PLATFORM(XE_LUNARLAKE),
+	.has_4tile = true,
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -382,6 +388,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
 	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
+	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index abbb8a1f29a8..e378a64a0f86 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -21,6 +21,7 @@ enum xe_platform {
 	XE_DG2,
 	XE_PVC,
 	XE_METEORLAKE,
+	XE_LUNARLAKE,
 };
 
 enum xe_subplatform {
diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 43afd973e153..29f07a00ac0f 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -207,4 +207,9 @@
 	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
 	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
 
+#define XE_LNL_IDS(MACRO__, ...) \
+	MACRO__(0x6420, ## __VA_ARGS__), \
+	MACRO__(0x64A0, ## __VA_ARGS__), \
+	MACRO__(0x64B0, ## __VA_ARGS__)
+
 #endif
-- 
2.40.1

