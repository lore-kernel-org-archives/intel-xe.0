Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E6FCD6E4C
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00252112FC3;
	Mon,  1 Jun 2026 08:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuwKxOqi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2974D112FC3
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780303334; x=1811839334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DUYXZw2CQLFBvKNETblf9n7xPUyufBR8ZkZNCm6A62g=;
 b=QuwKxOqiqVI3ly9B/b2LvuUyiiRgwZKZjt6T47BzrEKmcr24tBUYNMAM
 gSBTU7OEHKiCUd0wD4WggGQhF57VGKqG0vnQRpe4KtLhdPNh2a/2mnuZn
 M/5NiGDNbd3hCYNEs7IJkA4uBauaZ/+62Qp3rH+zZ9LWpENwr/yTQShPs
 YixasnfTGc+Dl1o7tRuwTOcW0Mujg3tsR1/de97mES0jBx7VnnYowSDxV
 5OJS1no8w6N1MkuDP5rZdypetKoKOX6WBveUXL/RQ4/SUqh9OLKqW2wLO
 N+QHa4YQSyFUvMplmlJJdKQVmlwHW73f0lgU3f8ZG/DUq+mxyREz2ra9e Q==;
X-CSE-ConnectionGUID: 3jHT3wPkSpOixWGBBK6WvQ==
X-CSE-MsgGUID: nQxWOmZfQjWI+NV1GgBvLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91629500"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="91629500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:42:14 -0700
X-CSE-ConnectionGUID: 1MIS5/NhQ1aDOuCDxSsumQ==
X-CSE-MsgGUID: 7XCNSbvwQP+RdyO207THlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="240525258"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:42:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v8 1/6] drm/xe/uapi: Add additional error components to xe
 drm_ras
Date: Mon,  1 Jun 2026 14:11:48 +0530
Message-ID: <20260601084146.3808639-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260601084146.3808639-8-riana.tauro@intel.com>
References: <20260601084146.3808639-8-riana.tauro@intel.com>
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

Add additional Error components supported by XE drm_ras (Reliability,
Availability and Serviceability).

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

