Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A152C761A6
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 12:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4762610E59E;
	Mon, 27 Mar 2023 12:48:53 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFCB10E5A8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679921332; x=1711457332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wn5XVIifJdekyViIZpBNso0Escr5CPsr9T8gG+ahz5o=;
 b=B36bgcZbCVkV+VcRuRaTiW624mLQKywASlZAocBfX1FBkvXSBZZzHAus
 UzGgAE2OoQD6Beq+SbVMzV2zeMeAPzT4gePqyo5qNgSlfTHVYgug7WHq9
 aYopeyE7JeyAlblhKWzdlqjvYTJX3omeyg57rc/gyLyn/mvdXo5veNe8C
 yOtn9n4f5786tI4CffOifHCvo8HzgGUxKSajEPYcOiI82a2Br36unuOMS
 KUYF4BrJvWz8uatqY3vj6qUGE96lMejObrkr8wLaO9TzmSo8CNmYnGxoF
 IbF6hgQSTKUFZwotD15soUI0L/kEwJ4NbDomf9VTH9ZMH4/e8/9JZ5gBI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="342654380"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="342654380"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 05:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660832418"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="660832418"
Received: from ababushk-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.24])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 05:48:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Mar 2023 13:48:04 +0100
Message-Id: <20230327124807.54459-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124807.54459-1-matthew.auld@intel.com>
References: <20230327124807.54459-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/5] drm/xe/uapi: add some kernel-doc for
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
---
 include/uapi/drm/xe_drm.h | 74 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..8cb3324221f2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -154,21 +154,84 @@ struct drm_xe_engine_class_instance {
 	__u16 gt_id;
 };
 
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
+		 * the @total_size.
+		 */
 		__u64 used;
+		/** @reserved: MBZ */
 		__u64 reserved[8];
 	} regions[];
 };
@@ -760,6 +823,9 @@ struct drm_xe_vm_madvise {
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
2.39.2

