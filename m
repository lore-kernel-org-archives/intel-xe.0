Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D71CE7B02
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 12:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3EC10EA29;
	Fri,  6 Sep 2024 12:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1kexpcM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB89C10EA29
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725624381; x=1757160381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hw4qeLQVltmyNO0npDqTiB0DPY2/Phmef6w4n4OiB4k=;
 b=H1kexpcM58DMTDtnnUYNg7QbUP5qCNKosyynh8cXwJKWzudXaq7oH0XU
 NXWRg7ZbW/RdtFySfuaZdKtbRNiYArOa6Hzz63SMXS4CvHEfatZUkADoL
 1j9/cFVu51UNvG90JnhRYpf+DCsOVsplNblozxTBqpWd6A90fi2zzZRhh
 IG1vDcaldNhjpZ3uTqr3VBRPxZkYuJLUOXK1msGP0XEF/PQsG49IdKAu2
 H+0mh7rKOCgiBmzO4CHhubeZ5yYHFcA5frqXGGEwaOuT0+4mhd2Dvy64o
 LmGKxRBLP1cFlUL8PFdFPWqZ69lCy0ww/wwabV4YaZJGeycUTn9uD02kp w==;
X-CSE-ConnectionGUID: ncNtBso1Sc2exh9seJTzrg==
X-CSE-MsgGUID: ePRpIT3PRMC3BD0MFDP3NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35527199"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="35527199"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:06:20 -0700
X-CSE-ConnectionGUID: JG5SOLhPTvK63MBKUT6O3g==
X-CSE-MsgGUID: i0ZA3PjSTTeYjc0Pijgppw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65982248"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:06:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 1/3] [topic/xe-for-CI] Revert "drm/xe: Add PVC's PCI device
 IDs"
Date: Fri,  6 Sep 2024 15:06:02 +0300
Message-Id: <651475e5d6464fa4fbb17bc4fc4ac2ff4ec4e64c.1725624296.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725624296.git.jani.nikula@intel.com>
References: <cover.1725624296.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This reverts commit 3fa91a6b5e41017e82b07ae5522baa9792e808ab.

It only existis in topic/xe-for-CI. Remove it from there.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c   |  3 +--
 include/drm/intel/xe_pciids.h | 16 ----------------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c05ca61787be..2c9f9dc783d9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -323,7 +323,7 @@ static const struct xe_device_desc dg2_desc = {
 	.has_display = true,
 };
 
-static const struct xe_device_desc pvc_desc = {
+static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(PVC),
@@ -392,7 +392,6 @@ static const struct pci_device_id pciidlist[] = {
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
-	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
 	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 73d972a8aca1..644872a35c35 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -187,22 +187,6 @@
 	MACRO__(0x7DD1, ## __VA_ARGS__),        \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
-/* PVC */
-#define XE_PVC_IDS(MACRO__, ...)		\
-	MACRO__(0x0B69, ## __VA_ARGS__),	\
-	MACRO__(0x0B6E, ## __VA_ARGS__),	\
-	MACRO__(0x0BD4, ## __VA_ARGS__),	\
-	MACRO__(0x0BD5, ## __VA_ARGS__),	\
-	MACRO__(0x0BD6, ## __VA_ARGS__),	\
-	MACRO__(0x0BD7, ## __VA_ARGS__),	\
-	MACRO__(0x0BD8, ## __VA_ARGS__),	\
-	MACRO__(0x0BD9, ## __VA_ARGS__),	\
-	MACRO__(0x0BDA, ## __VA_ARGS__),	\
-	MACRO__(0x0BDB, ## __VA_ARGS__),	\
-	MACRO__(0x0BE0, ## __VA_ARGS__),	\
-	MACRO__(0x0BE1, ## __VA_ARGS__),	\
-	MACRO__(0x0BE5, ## __VA_ARGS__)
-
 #define XE_LNL_IDS(MACRO__, ...) \
 	MACRO__(0x6420, ## __VA_ARGS__), \
 	MACRO__(0x64A0, ## __VA_ARGS__), \
-- 
2.39.2

