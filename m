Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE06C04E85
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B5910E8DE;
	Thu,  9 Nov 2023 15:46:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5530810E8EA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544769; x=1731080769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nlKdSvWuGw0+IifeHUgBbFUMsyaU1FHlbLRz6OJ4Amg=;
 b=XJFcuALsR0a1UQQefxTtVO+celU3t2vLvsDlZHztFDyDonrz/iqnABfF
 w50OLvM0ilJXMwWLr1xqiVTCKf9fvLFq0URZX0lH2v2bs/o8RTVEOY7To
 pYjKjDNc9ec9gp6HSE2U45Eenq4+TVlGq3liQKyvtGvDuOP+gwPdCyG9l
 7OEPnHo79pvcEHnR/AqIWYIIAopmRU9tdkcEgpRglqv2hx2vtERrkoTnn
 kHruc+pcDmWahEwghFQA0T0XMTX+b4huODEx1vZZuIlYPg8b99kTFpdwB
 GrF0a6C2mR5hpJ6rxqZob9RRbZHJ3DYuMejLjV1uCYkH5H2UPR90tQlyu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556782"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556782"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886051"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886051"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:47 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:41 +0000
Message-Id: <20231109154457.7-28-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 27/43] drm/xe/uapi: Standardize the FLAG
 naming and assignment
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Only cosmetic things. No functional change on this patch.
Define every flag with (1 << n) and use singular FLAG name.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 include/uapi/drm/xe_drm.h     | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index bc2b4609a38d..71a4943cab20 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -333,7 +333,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
-			DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0c004b24f820..5217558a32d0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -354,7 +354,7 @@ struct drm_xe_query_mem_regions {
  *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
  *    configuration, see list below
  *
- *    - %DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM - Flag is set if the device
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
@@ -371,7 +371,7 @@ struct drm_xe_query_config {
 
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID		0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
 	/*
 	 * DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - This returns the
 	 * maximum value of the &min_page_size across all memory regions
@@ -755,10 +755,10 @@ struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(0x1 << 0)
-#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(0x1 << 1)
-#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(0x1 << 2)
-#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(0x1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
+#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(1 << 1)
+#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -852,10 +852,10 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
-#define DRM_XE_VM_BIND_FLAG_ASYNC	(0x1 << 1)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
-#define DRM_XE_VM_BIND_FLAG_NULL	(0x1 << 3)
+#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.34.1

