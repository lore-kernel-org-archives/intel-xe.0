Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1CCE7E631
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE35C10E3D9;
	Tue, 26 Sep 2023 13:04:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D7A10E3D9
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733438; x=1727269438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WUA7VTo1GLwU6KDL+fipjj8SJS3/SZf6pGm2+py4Q10=;
 b=g5tL8RxEG0VpnWK5mvKGqvkGIZU7UwZRfmLdP6BCcBlMt0bof+7uCUx/
 UKL8sRi8pkxHleLzgpI1p11hZ6g5yP6uPZZZB78Z7MP/+OgyWLHCc1YtA
 iCjAzq5xNqyTRCc2RpZjLhaX6Ikj1zOx32m1onV6TVc5/d5luquqkaQTf
 q7h5n+Lw2zbkKLo/QIZzb4/aFguxgarQh80cLaFrXlZwL2gKfcv8KtF3M
 O8u0NLPJXiRsZBkS5EzDXkP6MOEMRWxuY5mV1TAUUl6QMaclBmKdzSqAP
 d6HjcD34HT8PGMMYXk9IFv9vVy0zhO//P/eOmo7GKnC3Ln7xl8fwyqOPQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617264"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617264"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139667"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:25 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:31 +0000
Message-Id: <20230926125540.7-22-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 21/30] drm/xe/uapi: Add documentation for query
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Provide a description of the keys used the struct
drm_xe_query_config info array. Document the behavior
of the driver for IOCTL DRM_IOCTL_XE_DEVICE_QUERY
depending on the size value provided in struct
drm_xe_device_query.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/637
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 41 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e9969c27c3c4..f306cae6d467 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -324,14 +324,43 @@ struct drm_xe_query_config {
 	/** @pad: MBZ */
 	__u32 pad;
 
+	/*
+	 * Device ID (lower 16 bits) and the device revision (next
+	 * 8 bits)
+	 */
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
+	/*
+	 * Flags describing the device configuration, see list below
+	 */
 #define XE_QUERY_CONFIG_FLAGS			1
+	/*
+	 * Flag is set if the device has usable VRAM
+	 */
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+	/*
+	 * Minimal memory alignment required by this device,
+	 * typically SZ_4K or SZ_64K
+	 */
 #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
+	/*
+	 * Maximum bits of a virtual address
+	 */
 #define XE_QUERY_CONFIG_VA_BITS			3
+	/*
+	 * Total number of GTs for the entire device
+	 */
 #define XE_QUERY_CONFIG_GT_COUNT		4
+	/*
+	 * Total number of accessible memory regions
+	 */
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
+	/*
+	 * Value of the highest available exec queue priority
+	 */
 #define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+	/*
+	 * Number of elements in the info array
+	 */
 #define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
@@ -443,9 +472,15 @@ struct drm_xe_query_topology_mask {
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
- * If size is set to 0, the driver fills it with the required size for the
- * requested type of data to query. If size is equal to the required size,
- * the queried information is copied into data.
+ * The user selects the type of data to query among DRM_XE_DEVICE_QUERY_*
+ * and sets the value in the query member. This determines the type of
+ * the structure provided by the driver in data, among struct drm_xe_query_*.
+ *
+ * If size is set to 0, the driver fills it with the required size for
+ * the requested type of data to query. If size is equal to the required
+ * size, the queried information is copied into data. If size is set to
+ * a value different from 0 and different from the required size, the
+ * IOCTL call returns -EINVAL.
  *
  * For example the following code snippet allows retrieving and printing
  * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
-- 
2.34.1

