Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F91DC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 13:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A48110E5B5;
	Thu,  8 Jun 2023 13:20:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D59510E588
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686230418; x=1717766418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J7/tJAc7A32J8ZoNZU2TD3t0VLLbky7r47n0UzrH3h8=;
 b=BV1/PPuKxmB1zQ6g8t0IREH0SyXXC6/3UdOhQSPyvFye7uEy2SMaSIFH
 s2QchEsWeYVGlwAJe4LEqz3v9kR03REAFTa1feozn+eyJrU5lvnMc2oLf
 F8RYP2zqSIwRvGt4YUmZUVchXSbgsxdxfzXLCTG9FGMVpi7M54YcxwZ1K
 OTxYoD/fJ6mxNXi2tJ5R6L0UGV16iMLOyAtv36n4TRCLQl5QtWOuIFeWE
 flfVA6/sOAu01wCb4Q1cCAH0dZ2Ab0bPWuNne0qF0L8Y90QfBLAiqWArS
 gn4x3kTVrEGGRpBg93E2p4GkAk6ON1T7imK3ba1PDLUBkTVzNuEQGIWJr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336935398"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="336935398"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 06:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687379314"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="687379314"
Received: from lardelea-mobl1.ger.corp.intel.com (HELO 8b3e15e1f306.intel.com)
 ([10.251.211.180])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 06:16:49 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  8 Jun 2023 13:16:33 +0000
Message-Id: <20230608131634.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608131634.7-1-francois.dugast@intel.com>
References: <20230608131634.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/2] drm/xe: Document structures for device
 query
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This adds documentation to the various structures used to query
memory, GTs, topology, engines, and so on. It includes a functional
code snippet to query engines.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7f9a5849e88b..3f4c1f1a4ba2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -119,8 +119,18 @@ struct xe_user_extension {
 #define XE_MEM_REGION_CLASS_SYSMEM	0
 #define XE_MEM_REGION_CLASS_VRAM	1
 
+/**
+ * struct drm_xe_query_mem_usage - describe memory regions and usage
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_MEM_USAGE, then the reply uses
+ * struct drm_xe_query_mem_usage in .data.
+ */
 struct drm_xe_query_mem_usage {
+	/** @num_params: number of memory regions returned in regions */
 	__u32 num_regions;
+
+	/** @pad: MBZ */
 	__u32 pad;
 
 	struct drm_xe_query_mem_region {
@@ -135,9 +145,20 @@ struct drm_xe_query_mem_usage {
 	} regions[];
 };
 
+/**
+ * struct drm_xe_query_config - describe the device configuration
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
+ * struct drm_xe_query_config in .data.
+ */
 struct drm_xe_query_config {
+	/** @num_params: number of parameters returned in info */
 	__u32 num_params;
+
+	/** @pad: MBZ */
 	__u32 pad;
+
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
@@ -148,11 +169,22 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
 #define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
 
+/**
+ * struct drm_xe_query_gts - describe GTs
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
+ * drm_xe_query_gts in .data.
+ */
 struct drm_xe_query_gts {
+	/** @num_gt: number of GTs returned in gts */
 	__u32 num_gt;
+
+	/** @pad: MBZ */
 	__u32 pad;
 
 	/*
@@ -175,6 +207,13 @@ struct drm_xe_query_gts {
 	} gts[];
 };
 
+/**
+ * struct drm_xe_query_topology_mask - describe the topology mask of a GT
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
+ * struct drm_xe_query_topology_mask in .data.
+ */
 struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
 	__u16 gt_id;
@@ -192,6 +231,41 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_device_query - main structure to query device information
+ *
+ * If size is set to 0, the driver fills it with the required size for the
+ * requested type of data to query. If size is equal to the required size,
+ * the queried information is copied into data.
+ *
+ * For example the following code snippet allows retrieving and printing
+ * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_xe_engine_class_instance *hw_engines;
+ *	struct drm_xe_device_query query = {
+ *		.extensions = 0,
+ *		.query = DRM_XE_DEVICE_QUERY_ENGINES,
+ *		.size = 0,
+ *		.data = 0,
+ *	};
+ *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *	hw_engines = malloc(query.size);
+ *	query.data = (uintptr_t)hw_engines;
+ *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *	int num_engines = query.size / sizeof(*hw_engines);
+ *	for (int i = 0; i < num_engines; i++) {
+ *		printf("Engine %d: %s\n", i,
+ *			hw_engines[i].engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
+ *			hw_engines[i].engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
+ *			hw_engines[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
+ *			hw_engines[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
+ *			hw_engines[i].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
+ *			"UNKNOWN");
+ *	}
+ *	free(hw_engines);
+ */
 struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -518,6 +592,7 @@ struct drm_xe_engine_set_property {
 	__u64 reserved[2];
 };
 
+/** struct drm_xe_engine_class_instance - instance of an engine class */
 struct drm_xe_engine_class_instance {
 	__u16 engine_class;
 
-- 
2.34.1

