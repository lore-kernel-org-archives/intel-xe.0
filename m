Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DD9EB64DB
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B95C10E1F8;
	Mon, 19 Jun 2023 11:00:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B54910E1EF
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687172447; x=1718708447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b/Ey/2+iC2TIzGnpIvurvDQ/M5QFZscSWVRVCS3XZ4s=;
 b=mPbtDzliIOJiudiOPaWiioP6nSXfByu9enYKabpjczJQ2vMld+FeWWed
 SZjlKrV2YrF1MW/vn61o4AKUt2DCeTAC2l3Lrs+0IvkgPsdpIi7lF/d4Z
 mIuMw8LtIdmzhJz7bM2SPpl0+Tm7i3F4h7MVO3xrzixSgVISX4BmtIPTQ
 wft/iQZDD5fbFVemuUTvk1kF5mmoI9s9nFXw3ukdEYZuFeaom41kHJFyv
 ucn8s5uoqs/qAp89Oklxhdas+zNPD5mrCy6TiIARuR7b3pqq7n7UmTLiJ
 aMfF2xNtuG58ItCWvnnDvIez5ntvObkJQiYEAXKDKJl5ag8AosUY+nXj1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339941728"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="339941728"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803579313"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="803579313"
Received: from lsuareza-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 12:00:22 +0100
Message-ID: <20230619110018.53538-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619110018.53538-8-matthew.auld@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 3/6] drm/xe/uapi: add some kernel-doc for
 region query
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Effie Yu <effie.yu@intel.com>,
 Carl Zhang <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Since we need to extend this, we should also take the time to add some
basic kernel-doc here for the existing bits. Note that this is all still
subject to change when upstreaming.

Also convert XE_MEM_REGION_CLASS_* into an enum, so we can more easily
create links to it from other parts of the uapi.

Suggested-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/uapi/drm/xe_drm.h | 74 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9bdea8b81435..239cedaac0ca 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -116,21 +116,84 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
-#define XE_MEM_REGION_CLASS_SYSMEM	0
-#define XE_MEM_REGION_CLASS_VRAM	1
 
+/**
+ * enum drm_xe_memory_class - Supported memory classes.
+ */
+enum drm_xe_memory_class {
+	/** @XE_MEM_REGION_CLASS_SYSMEM: Represents system memory. */
+	XE_MEM_REGION_CLASS_SYSMEM = 0,
+	/**
+	 * @XE_MEM_REGION_CLASS_VRAM: On discrete platforms, this
+	 * represents the memory that is local to the device, which we
+	 * call VRAM. Not valid on integrated platforms.
+	 */
+	XE_MEM_REGION_CLASS_VRAM
+};
+
+/**
+ * struct drm_xe_query_mem_usage - The region info query enumerates all regions
+ * known to the driver by filling in an array of struct drm_xe_query_mem_region
+ * structures.
+ */
 struct drm_xe_query_mem_usage {
+	/**
+	 * @num_regions: Number of supported memory regions for this device.
+	 *
+	 * The @regions will contain @num_regions entries.
+	 */
 	__u32 num_regions;
+	/** @pad: MBZ */
 	__u32 pad;
-
+	/**
+	 * struct drm_xe_query_mem_region - Describes some region as known to
+	 * the driver.
+	 */
 	struct drm_xe_query_mem_region {
+		/**
+		 * @mem_class: The memory class describing this region.
+		 *
+		 * See enum drm_xe_memory_class for supported values.
+		 */
 		__u16 mem_class;
-		__u16 instance;	/* unique ID even among different classes */
+		/**
+		 * @instance: The instance for this region.
+		 *
+		 * The @mem_class and @instance taken together will always give
+		 * a unique pair.
+		 */
+		__u16 instance;
+		/** @pad: MBZ */
 		__u32 pad;
+		/**
+		 * @min_page_size: Min page-size in bytes for this region.
+		 *
+		 * When the kernel allocates memory for this region, the
+		 * underlying pages will be at least @min_page_size in size.
+		 *
+		 * Important note: When userspace allocates a GTT address which
+		 * can point to memory allocated from this region, it must also
+		 * respect this minimum alignment. This is enforced by the
+		 * kernel.
+		 */
 		__u32 min_page_size;
+		/**
+		 * @max_page_size: Max page-size in bytes for this region.
+		 */
 		__u32 max_page_size;
+		/**
+		 * @total_size: The usable size in bytes for this region.
+		 */
 		__u64 total_size;
+		/**
+		 * @used: Estimate of the memory used in bytes for this region.
+		 *
+		 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
+		 * accounting.  Without this the value here will always equal
+		 * zero.
+		 */
 		__u64 used;
+		/** @reserved: MBZ */
 		__u64 reserved[8];
 	} regions[];
 };
@@ -777,6 +840,9 @@ struct drm_xe_vm_madvise {
 	 * Setting the preferred location will trigger a migrate of the VMA
 	 * backing store to new location if the backing store is already
 	 * allocated.
+	 *
+	 * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
+	 * drm_xe_memory_class.
 	 */
 #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS	0
 #define DRM_XE_VM_MADVISE_PREFERRED_GT		1
-- 
2.41.0

