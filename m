Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7863B108B8E6
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 09:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3862010EAD1;
	Fri, 20 Mar 2026 09:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmNLaecj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280CD10EAC8
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774000448; x=1805536448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QNNWQ+DhNE4fZm+kr9mLIQfe+yxn0joGhrYTlJyUp2Q=;
 b=lmNLaecj8NifcLnA6jXrRCyrQ+lrc+vFU8Lir0XG1yz4f9FdIHSlo1z0
 lWyrN4GKfZGCb2Dgvd3uUEgLzUTnDaT6JhLBEeCgrpeZh8joT4kuFKFfq
 CU6IPN4DsIoBvIOHCJ9acruUkoDhLhvQdFFHKPY6sCUS0ApzyCYE5UBcg
 ZM0yyI3WVWxxqA72rNhrrlQRo21Mk2HA3ShX2EOTqYg39seJhGvPY0EaG
 /5UWNLKxPVJu9EY7teOBr6t2IED1n3GzhcIKKt/fuJw8ujfq/h9Y0d2C3
 ortSlt2FNVfFSwFtMoEWfwDCGRP1606uF+AhJxy03DYQoiwaubNu5irJK Q==;
X-CSE-ConnectionGUID: lrKmiVsUSaqd4yXkzKCv/A==
X-CSE-MsgGUID: xn5DUftgR5iKsmqzFMWofg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92469223"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92469223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:54:08 -0700
X-CSE-ConnectionGUID: QxVM9d6WSKaNRkH18mryng==
X-CSE-MsgGUID: Cg94ZuP3QriP8ilhx+A3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227968145"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:54:05 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH 2/5] drm/xe/uapi: Add additional error components to XE DRM RAS
Date: Fri, 20 Mar 2026 15:55:57 +0530
Message-ID: <20260320102607.1017511-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260320102607.1017511-1-riana.tauro@intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
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
---
 include/uapi/drm/xe_drm.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f8b2afb20540..a1b1e15209cf 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2432,6 +2432,12 @@ enum drm_xe_ras_error_component {
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
@@ -2449,7 +2455,10 @@ enum drm_xe_ras_error_component {
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

