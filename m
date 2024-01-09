Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040B8C4706C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB0D10E547;
	Tue,  9 Jan 2024 23:50:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9A410E713
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704844232; x=1736380232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LJAaFfYY1+iKX4xo7EVkRBzUE8nQ7xZUtNkN49HfTFk=;
 b=QDRbkI44RQ+B4IqcMF4irU/1P97gotkPLqIP53Kr+rsho/S7LotdNv94
 aRsQPvOV8D5J9ZRnAlCFFnCVz4S2irC8sSKDNg4uYE4MyQkYwpVS3AWek
 Vkv5ZQz5Dw4zA7/HgVsCW72WXEeLaILy493s02IqYiu3ZnC690gHN8zJp
 vWqduTnnicE6S666GHDVq7+rruE0aWEACkMDtteenIo+LVnxQi/gK6yPE
 RrlF7JtHevSUtqwqjeLy4RE2v9mY9zkkV7cuueIJ/WeUd+1DWtvXvdEgP
 rTwD/vUdqw8q883b3NPkvz6E6+8W5Hytnq2465N0bHjrdR9H3eZ/+xBaE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11845375"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="11845375"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="23742102"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orviesa002.jf.intel.com with ESMTP; 09 Jan 2024 15:50:30 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/xe/uapi: CLOS uapi support
Date: Wed, 10 Jan 2024 05:27:56 +0530
Message-Id: <20240109235758.1432987-2-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109235758.1432987-1-pallavi.mishra@intel.com>
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
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

Introduce Class of Service (CLOS) uapi. This allows
Apps to reserve portions of the GPU Caches for
exclusive use.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 include/uapi/drm/xe_drm.h | 71 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9..7d5656a55ddf 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -100,6 +100,10 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_CLOS_RESERVE		0x0b
+#define DRM_XE_CLOS_FREE		0x0c
+#define DRM_XE_CLOS_SET_WAYS		0x0d
+
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -113,6 +117,9 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_CLOS_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_RESERVE, struct drm_xe_clos_reserve)
+#define DRM_IOCTL_XE_CLOS_FREE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_FREE, struct drm_xe_clos_free)
+#define DRM_IOCTL_XE_CLOS_SET_WAYS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_SET_WAYS, struct drm_xe_clos_set_ways)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1339,6 +1346,70 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_clos_reserve
+ *
+ * Allows clients to request reservation of one free CLOS, to use in subsequent
+ * Cache Reservations.
+ *
+ */
+struct drm_xe_clos_reserve {
+	/** @clos_index: clos index for reservation */
+	__u16 clos_index;
+
+	/** @pad: MBZ */
+	__u16 pad16;
+};
+
+/**
+ * struct drm_xe_clos_free
+ *
+ * Free off a previously reserved CLOS set. Any corresponding Cache Reservations
+ * that are active for the CLOS are automatically dropped and returned to the
+ * Shared set.
+ *
+ * The clos_index indicates the CLOS set which is being released and must
+ * correspond to a CLOS index previously reserved.
+ *
+ */
+struct drm_xe_clos_free {
+	/** clos_index: free clos index */
+	__u16 clos_index;
+
+	/** @pad: MBZ */
+	__u16 pad16;
+};
+
+/**
+ * struct drm_xe_clos_set_ways
+ *
+ * Allows clients to request, or release, reservation of one or more cache ways,
+ * within a previously reserved CLOS set.
+ *
+ * If num_ways = 0, KMD will drop any existing Reservation for the specified
+ * clos_index and cache_level. The requested clos_index and cache_level Waymasks
+ * will then track the Shared set once again.
+ *
+ * Otherwise, the requested number of Ways will be removed from the Shared set
+ * for the requested cache level, and assigned to the Cache and CLOS specified
+ * by cache_level/clos_index.
+ *
+ */
+struct drm_xe_clos_set_ways {
+	/** @clos_index: reserved clos index */
+	__u16 clos_index;
+
+	/** @cache_level: level of cache  */
+	__u16 cache_level; /* e.g. 3 for L3 */
+
+	/** @num_ways: cache ways */
+	__u16 num_ways;
+
+	/** @pad: MBZ */
+	__u16 pad16;
+};
+
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1

