Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6BBC7EE2D
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 15:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73D10E4F2;
	Wed, 31 May 2023 15:24:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619C910E4EF
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685546645; x=1717082645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=efOT5ctNSDOnFUR2MwaDSlzruPen2t80HYih7Z3QfVE=;
 b=ehNbBC/Fw+2Rn4RXq9mtfnSa0epV7Ju0cGTjrueaDf0BUYrW9KanK/SM
 EuXJUeYqVqGQMUBlNr6A2i0PFtmgoUC8wX7ZSNjPBMn/Sirr+CBwRm/eX
 5EqoHR6Jlpa+85czQXJo3/4Ga5zFBNi5WWNMQYSICp80wA0+U3rW9C5vl
 uZozDMfBL0J5MGA/E6mdhDk11UccEj6YwbiY3dfa/UVWWZ2zx4qeYOXFr
 T3eL3JS5qAu0qKAvCs3vYOuLqDaLsK9mKnRyCIhR2IMayIDwfZl+tVqSQ
 x2Puy3A/GCXiUDDymMNkAoQILOyKPYES/4VON9MwvQWVpDJbe2W5VBPDn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339865519"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339865519"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796747944"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="796747944"
Received: from amokrov-mobl1.ccr.corp.intel.com (HELO 9d3bf2d3f760.intel.com)
 ([10.251.208.253])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:24:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 15:23:37 +0000
Message-Id: <20230531152338.6-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531152338.6-1-francois.dugast@intel.com>
References: <20230531152338.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/5] drm/xe: Document usage of struct
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
 include/uapi/drm/xe_drm.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2eea80bf0e06..e29399de148c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -120,7 +120,10 @@ struct xe_user_extension {
 #define XE_MEM_REGION_CLASS_VRAM	1
 
 struct drm_xe_query_mem_usage {
+	/** @num_params: number of memory regions returned in regions */
 	__u32 num_regions;
+
+	/** @pad: MBZ */
 	__u32 pad;
 
 	struct drm_xe_query_mem_region {
@@ -136,7 +139,10 @@ struct drm_xe_query_mem_usage {
 };
 
 struct drm_xe_query_config {
+	/** @num_params: number of parameters returned in info */
 	__u32 num_params;
+
+	/** @pad: MBZ */
 	__u32 pad;
 
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
@@ -149,11 +155,15 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
 #define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
+	/** @info: array containing the config info below  */
 	__u64 info[];
 };
 
 struct drm_xe_query_gts {
+	/** @num_gt: number of GTs returned in gts */
 	__u32 num_gt;
+
+	/** @pad: MBZ */
 	__u32 pad;
 
 	/*
@@ -193,6 +203,23 @@ struct drm_xe_query_topology_mask {
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

