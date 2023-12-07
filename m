Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D13C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B88E10E8B4;
	Thu,  7 Dec 2023 13:50:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB2710E8AD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957040; x=1733493040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LzgaLaFly3aAHGIb91B/5Yrq3igrpVTBwU2v/a/0qbM=;
 b=ZQKO7YLRS1x113i7oRR8P6xBKmwLfWRxEs2yZFS3+d0VsbGjo0M1XGFj
 hLXChvzesz5Vz3zD1eeQCFpGn2u/1gmuRgZJR4QC91Q2fN5MBZGlY9/eh
 xWWSFX00DsNaftZlHJ9C2eSb9+aQ5Ef3CuQe8ryPnvRkhR9cdFLTupjZl
 Jj8UF4d+2M9/9Jz8qVjP3wy4gicykw2NfsyXVsHHMtRcRT/cUM9Kiux6h
 OCviSrL7YzZUp60D7dHnn8/VQfk9pfFfEnKe7xK10TodK3im+nrrqTmkP
 7IKLHHSqo9kAG8U5DwBHAbUkxEKIompPbPqDhcmFVXsG415xjuIsxDqfE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722273"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722273"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115598"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115598"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:38 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 14/14] drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where
 they are used
Date: Thu,  7 Dec 2023 13:50:09 +0000
Message-Id: <20231207135009.7-15-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Bring those defines close to the context where they can be used. Also
apply indentation as it is done for other subsets of defines.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7733c5a3659b..0e22b0ceac4d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1031,20 +1031,6 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
-/* For use with DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY */
-
-/* Monitor 128KB contiguous region with 4K sub-granularity */
-#define DRM_XE_ACC_GRANULARITY_128K 0
-
-/* Monitor 2MB contiguous region with 64KB sub-granularity */
-#define DRM_XE_ACC_GRANULARITY_2M 1
-
-/* Monitor 16MB contiguous region with 512KB sub-granularity */
-#define DRM_XE_ACC_GRANULARITY_16M 2
-
-/* Monitor 64MB contiguous region with 2M sub-granularity */
-#define DRM_XE_ACC_GRANULARITY_64M 3
-
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
@@ -1077,6 +1063,14 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+/* Monitor 128KB contiguous region with 4K sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_128K				0
+/* Monitor 2MB contiguous region with 64KB sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_2M				1
+/* Monitor 16MB contiguous region with 512KB sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_16M				2
+/* Monitor 64MB contiguous region with 2M sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_64M				3
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.34.1

