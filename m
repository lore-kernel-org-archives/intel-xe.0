Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133C0C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D9910E8DA;
	Thu,  9 Nov 2023 15:45:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E1710E8DB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544712; x=1731080712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wod1fEr+onh9Vtq8vxPQIGeiNTYjCjR9YLx5TREbycc=;
 b=f2GgWE/pI9FmemGwRvwM3esCpABDv7ev/tthmdyJfyGCEfJLfdd8scPC
 ipAT8VSvq93TxXnjDcamxRCg7lditFMWRqWawXwoqh2ky/yBpFjPCjKtG
 d1WcU+auKIVbWgOo3V8tYueKnymUv39l+F/bZ0Iq4L2i+CAKGVY924YOx
 L/15yJbFt2KNdkRDENyMuY+Kkgq1W5VF8AQk++oj9sg5F70BsipRWJEeY
 mY22AYB4f1B6eYFE2KIwkWuHwPONn2kT6oNCVavbI3pvMLWSwjZiIgZ5j
 ROdQcGZ0+c3YnQqlKrgLEeqc9MrI2JRLVjpCq3c9qi9qmV1uMjlpOncmN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556599"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556599"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936885963"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936885963"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:10 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:15 +0000
Message-Id: <20231109154457.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 01/43] drm/xe/uapi: Add documentation for query
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
index 9bd7092a7ea4..0b1482d5f709 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -321,14 +321,43 @@ struct drm_xe_query_config {
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
@@ -440,9 +469,15 @@ struct drm_xe_query_topology_mask {
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

