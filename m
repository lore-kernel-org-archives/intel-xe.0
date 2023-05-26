Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93007C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E73310E1ED;
	Fri, 26 May 2023 19:08:53 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C1F10E1EC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685128127; x=1716664127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6icdmuCubmBvI5Cpg6opVv2V6AsqVbuBRirF+HU65zo=;
 b=V9z57ZEGlwyFGSjF4yVOuyRmTfcctO2Lt9bijnJ9/mkf7QXJG6hPfR3d
 1tMNELaFTO93kT2Z1TH86rFlCh5dgJmPJsrb5bacou8/bIhfziGX3MiZS
 4iY6Zvz+4qWoY+OgghmAgsljbJtY8OD4heS30pvZO42GUfSkRFqjex/2J
 lvfL+mOtaoYuo6wEriB/Mpo7t4bYLUM+BY1MgMnzNWxMG+SMijWIcbUrB
 RCo3iehRS4s8dJVl1CdZJf4TWdQLvAd0J/+RUhLo1TXEvyZhYtFLPikRA
 W+A6THBaZslc5gIeCsRwQY3sSjYsWheVcLrOdIGKpAy2owhp7sgWuaHZh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440637399"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440637399"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682817910"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682817910"
Received: from omurra1x-mobl.ger.corp.intel.com (HELO 2082b82b753b.intel.com)
 ([10.252.55.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:46 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 19:08:23 +0000
Message-Id: <20230526190824.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526190824.7-1-francois.dugast@intel.com>
References: <20230526190824.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe: Document usage of struct
 drm_xe_device_query
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

Explain how to use struct drm_xe_device_query, in particular the behavior
for size.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 160b0aad4a96..2cee86e8427a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -117,7 +117,10 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
 struct drm_xe_query_mem_usage {
+	/** @num_params: number of memory regions returned in regions */
 	__u32 num_regions;
+
+	/** @pad: MBZ */
 	__u32 pad;
 
 	struct drm_xe_query_mem_region {
@@ -136,8 +139,13 @@ struct drm_xe_query_mem_usage {
 #define XE_MEM_REGION_CLASS_VRAM	1
 
 struct drm_xe_query_config {
+	/** @num_params: number of parameters returned in info */
 	__u32 num_params;
+
+	/** @pad: MBZ */
 	__u32 pad;
+
+	/** @info: array containing the config info below  */
 	__u64 info[];
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
@@ -152,7 +160,10 @@ struct drm_xe_query_config {
 };
 
 struct drm_xe_query_gts {
+	/** @num_gt: number of GTs returned in gts */
 	__u32 num_gt;
+
+	/** @pad: MBZ */
 	__u32 pad;
 
 	/*
@@ -192,6 +203,23 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_device_query - main structure to query device information
+ *
+ * If size is set to 0, the driver fills it with the required size for the
+ * requested type of data to query. If size is equal to the required size,
+ * the queried information is copied into data.
+ *
+ * A typical usage from user space is:
+ * - create a struct drm_xe_device_query with size = 0 and query = one of
+ *   the types DRM_XE_DEVICE_QUERY_*, for example DRM_XE_DEVICE_QUERY_ENGINES
+ * - call DRM_IOCTL_XE_DEVICE_QUERY
+ * - create a pointer to a query struct matching the query type selected
+ *   previously, for example struct drm_xe_engine_class_instance *
+ * - allocate memory of the size returned in drm_xe_device_query
+ * - call DRM_IOCTL_XE_DEVICE_QUERY
+ * - read the queried information in data
+ */
 struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.34.1

