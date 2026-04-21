Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0136FF8FA80
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 14:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB7110E89B;
	Tue, 21 Apr 2026 14:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbnJml2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A656E10E8CB
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776781089; x=1808317089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HlTg8tKtMdNVKqDqDWrzZiqQ+5/2krmi4cNXpf2PopY=;
 b=KbnJml2DPXgP64JRtP66xjMX/gosvJaLjsWo3YMYCaKgaGMtInZxvvvD
 TYnXiW1xpNHNghv0+Cc3w4acIYuU6GIuDvxdv7d6txdgvOB1r6DEMmY28
 zfwzWu6hDoVibZ+3kt8WgG0HjvqrapsfEFUvHiDGWcEMDGrsOx1gscsp5
 oNflqrUBVTQV/KLpbhEyWlMn8aCE+2zU++nKbaIL5lfBDiLH6vrA3A6x8
 2sAN7sjcfaL8kaX+gMI+IL4bJMq8XkKkC3smNAzaN6KPBOFwADLFGR9XZ
 ir5GpPe1p1OyGOPTFV4cA0tPVwNLGBdMDcEs2t1Snr7wzLXZUH32jUkk6 g==;
X-CSE-ConnectionGUID: Ed63yFjURaidyHQMaSjfvQ==
X-CSE-MsgGUID: EU5bAVXHTPmkD3ECUdCL3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95272269"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="95272269"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:18:09 -0700
X-CSE-ConnectionGUID: 3P29GHwyQ46bc9RVgdmd2A==
X-CSE-MsgGUID: i9C7kRgUTj66yFZvOFCyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="233829045"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:18:07 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 1/5] drm/xe/uapi: Add additional error components to XE
 drm_ras
Date: Tue, 21 Apr 2026 20:20:57 +0530
Message-ID: <20260421145056.253300-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260421145056.253300-7-riana.tauro@intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
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

Add additional Error components supported by XE RAS (Reliability,
Availability and Serviceability).

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 48e9f1fdb78d..50c80af4ad4e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2589,6 +2589,12 @@ enum drm_xe_ras_error_component {
 	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
 	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
 	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
+	/** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
+	DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
+	/** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
+	DRM_XE_RAS_ERR_COMP_PCIE,
+	/** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
+	DRM_XE_RAS_ERR_COMP_FABRIC,
 	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
 	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
 };
@@ -2606,7 +2612,10 @@ enum drm_xe_ras_error_component {
  */
 #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
 	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
-	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
+	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal",		\
+	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",		\
+	[DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",				\
+	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
 }
 
 #if defined(__cplusplus)
-- 
2.47.1

