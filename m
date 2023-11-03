Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0900EC05022
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1B310E9F4;
	Fri,  3 Nov 2023 14:36:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F4B10EA04
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022158; x=1730558158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GajA3A9vYOaAuQaGFH5SzrWUrIk8sorkpidk9W6STKA=;
 b=fdu+6QcDTAIgl0MxGpp9PMTwB3Pd6k/QHHf4FBpT9220jfFslNC3oaJ8
 TArCGKJcSHNd6S+0niub7eoGq3zrIXRgzdZQcxsv4o/dOPJ78dqEsWnP/
 HVBAQ7xblSFQv/1QVUoab/M8I5dS+JS/Jv6QiBD3UodNMJDxUz+IwsVyF
 Rhft+zkOtHnV1w4jPr97ztvDWZ0VaUqte4lkk6YQxDnzz9KXERCuwfeSQ
 T3yya7gaivIixOPfEjD/y55XSM/0bhWyLttkxAfHZK8+CYN8nnYLftkeW
 esZ88Q7Hrj/FaTFAgC5r1mgL1NfxF6hIaygasOpzk8IZZUpCU+cQuUcYg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843466"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843466"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832509"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832509"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:45 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:36 +0000
Message-Id: <20231103143456.7-31-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 30/50] drm/xe/uapi: Standardize the FLAG
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
index ad587bc0a0d4..aa5743e2e4d0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -332,7 +332,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
-			DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4c7ee3828428..7d854c368336 100644
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
@@ -368,7 +368,7 @@ struct drm_xe_query_config {
 
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID		0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
 	/*
 	 * DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - This returns the
 	 * maximum value of the &min_page_size across all memory regions
@@ -752,10 +752,10 @@ struct drm_xe_vm_create {
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
 
@@ -849,10 +849,10 @@ struct drm_xe_vm_bind_op {
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

