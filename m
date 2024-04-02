Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AC3C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC7010EAA7;
	Tue,  2 Apr 2024 12:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPYZuV9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FC110F2EF
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 12:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712062045; x=1743598045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EZh+NTLSuFNCJURnrSG3RpASJiHQ0VzE3m/2yjEEk1I=;
 b=CPYZuV9fImr2yZ1ZNZwmxEaulwwxGbj2HxmMfzDEReL4tkzRRU5+8fG9
 pn2mgKKGGe704kOHN319nXuJWkyTu5lM9pmhCcC8zYbD63LNgCqqhUSnQ
 wvcdYBqenva+iWvPpLlfbQO5xn7b2HIR/d0u0LjqOVt4GsefnzOYMM6qK
 BSpiDRDuLFXQnTZgho1Ir8UXKgvoQHSYaKlVcWByjfvgnuqdO1E5ub91u
 sBElHYAzaZcgAaSe4XGjvA9VL6Jne0nonDg8aB0RdB1Yr9nzSysMj+Akb
 QT/MBebAGa5gOTdncs3MTaiwAkLEw7abtuPoEYtwp9GX+/rX/2pxxD6sN w==;
X-CSE-ConnectionGUID: AZLKgRidR0eEdAPTdXDmtg==
X-CSE-MsgGUID: QLlD7JN7SHKmM6Yx70juSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7098070"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7098070"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:24 -0700
X-CSE-ConnectionGUID: PUEe78z5Teacz9Dn7RWjeQ==
X-CSE-MsgGUID: ijrdFMYeSaes9TJUsl8b5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18111173"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:23 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 03/11] drm/xe/bmg: Add BMG platform definition
Date: Tue,  2 Apr 2024 18:17:16 +0530
Message-Id: <20240402124724.1238122-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

BMG is a discrete GPU based on the Xe2 architecture.

Bspec: 68090
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 include/drm/xe_pciids.h                | 7 +++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2d3b18d6404e..1e3a81a19e9d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -337,6 +337,12 @@ static const struct xe_device_desc lnl_desc = {
 	.require_force_probe = true,
 };
 
+static const struct xe_device_desc bmg_desc = {
+	DGFX_FEATURES,
+	PLATFORM(XE_BATTLEMAGE),
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -381,6 +387,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
+	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 553f53dbd093..79b7042c4534 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -22,6 +22,7 @@ enum xe_platform {
 	XE_PVC,
 	XE_METEORLAKE,
 	XE_LUNARLAKE,
+	XE_BATTLEMAGE,
 };
 
 enum xe_subplatform {
diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index c7fc288dacee..73d972a8aca1 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -208,4 +208,11 @@
 	MACRO__(0x64A0, ## __VA_ARGS__), \
 	MACRO__(0x64B0, ## __VA_ARGS__)
 
+#define XE_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)
+
 #endif
-- 
2.25.1

