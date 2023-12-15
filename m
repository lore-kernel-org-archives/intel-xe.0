Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9ABC46CC6
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0933710EA62;
	Fri, 15 Dec 2023 15:46:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A6210EA40
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655193; x=1734191193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jzkalR1UIt90Iu7rsUqeGMF2vCJu/5kowhP1veE0GNU=;
 b=dGwvusMk89Sl38a53/SFN6D43SVd9AbGBe0klVtrcI0NsdVPKG1uZur1
 g7Y0BsY5yy/y4pObT2YjTptJOwy84S78bcz1r9TS01WYtITm65PJ2pgSX
 1s4wXlTqhDwpzPVW5CrCzO563oVVzwi0WzIVj+xm77YgUgp+ow9mg3vuN
 fqaLTKQuVegBUnuuMsY/Ntgmk73lbXXFsWgr6hQEkwPYTUCQUzVtkOD1u
 uD47TBlRJKazQWe5Dv6TbORxlXBW/YMCFpMGq8hg52sUc0Sv+KcrlDzFJ
 6gmb89PMn/PhnV0HjECHW+9Lr9nQBGXQ154rdQDNBBErcfzdPktaWyPfG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141879"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324580"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:32 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 20/21] drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where
 they are used
Date: Fri, 15 Dec 2023 15:45:52 +0000
Message-Id: <20231215154553.7-21-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Bring those defines close to the context where they can be used. Also
apply indentation as it is done for other subsets of defines.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8a69abea0725..919aa72c4481 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1020,20 +1020,6 @@ struct drm_xe_vm_bind {
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
@@ -1066,6 +1052,14 @@ struct drm_xe_exec_queue_create {
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

