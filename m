Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C347C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A0110E449;
	Tue, 14 Nov 2023 13:34:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE26F10E449
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699968895; x=1731504895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p7VaIS6g5CPrwru/nA0QXqUIaHjw4Q6gNvocm/JAIBA=;
 b=DIAO9Y6iJFhpgI5PK9CzvXW+tK0VOdvr/IUEPsaRx4iIFRpW+1d5SLlS
 U1S6RWSBpiuchaN0+icpHTOuRyh1zB+/BrUgQpIsrDguzQ0F347ZyW7nW
 I1XzsPQzpz7+GXDccIQA4FrnJCka3TlLCytxfUoXMISVCdiJqRocRvDCH
 omf9QpeIFPkxi6bgSr6umGzjaMBxdxnHy6mTzedTs4jIAqaHrPYW/enVs
 S8UdYUhfYQ34Y19GPGYR+yIihY8pgzfH0VmMRVtlg85jSqkSUWRU5hCVS
 BDGb6K9RIzK9qyZ80kXdxTnu8hZyDWt397nDLKsFybF2wMiE8oWgxptNs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="9293974"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9293974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="764661298"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="764661298"
Received: from kdijkstr-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.218.123])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:34:52 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:34:32 +0000
Message-Id: <20231114133434.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114133434.7-1-francois.dugast@intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 6/8] drm/xe/uapi: Standardize the FLAG naming
 and assignment
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Only cosmetic things. No functional change on this patch.
Define every flag with (1 << n) and use singular FLAG name.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 include/uapi/drm/xe_drm.h     | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index d495716b2c96..61a7d92b7e88 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -331,7 +331,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
-			DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c627e35bddb8..b3df99dd1023 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -323,7 +323,7 @@ struct drm_xe_query_config {
 
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -587,10 +587,10 @@ struct drm_xe_vm_create {
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
 
@@ -654,13 +654,13 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
-#define DRM_XE_VM_BIND_FLAG_ASYNC	(0x1 << 1)
+#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -668,7 +668,7 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define DRM_XE_VM_BIND_FLAG_NULL	(0x1 << 3)
+#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.34.1

