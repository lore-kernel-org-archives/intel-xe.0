Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EE7C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC81310E1EC;
	Fri, 26 May 2023 19:08:52 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0AA10E1EC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685128129; x=1716664129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qTCd9WMq2tvxSBoUaBmMatRQrdER8mGIMDiWYEpI4fg=;
 b=j24e1Q6+vEkpA678CcX7TFQqHPd4v35bOtcXpJy0f8J/4xAV93ntbaf4
 gPFuJeFfPwHXRFhf6hA5jZCw2Kgb2ICFABdoKVAMkG6NKQomlkCeLEoGZ
 Atcvh56iIS8FshGxnRMztIlerbP72bZbCuipd3rjr7rg5aLoQPLYDkplk
 wzV0vH/NYIcw8d1z0zSZJJAPU3VlGJkc0FS7u4hDVzmYfBEzwn1u+zHYH
 YZw/9NU/UDyA0SOYeMGT32ehZPDLvhts4B1J3hQ4/BDDm1DkNPz38eF39
 PrkwI2sEehGFQGeqwKPjVwapBWd1NJPZ4GH7C0mGgm/2gWuTqRHLabuE3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440637413"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440637413"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682817918"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682817918"
Received: from omurra1x-mobl.ger.corp.intel.com (HELO 2082b82b753b.intel.com)
 ([10.252.55.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 19:08:24 +0000
Message-Id: <20230526190824.7-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526190824.7-1-francois.dugast@intel.com>
References: <20230526190824.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Fix some formatting issues in uAPI
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

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2cee86e8427a..1b5d4e126dff 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -105,16 +105,16 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
 #define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
 #define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
-#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
-#define DRM_IOCTL_XE_VM_BIND			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_VM_DESTROY			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
+#define DRM_IOCTL_XE_VM_BIND			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
 #define DRM_IOCTL_XE_ENGINE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_CREATE, struct drm_xe_engine_create)
 #define DRM_IOCTL_XE_ENGINE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_GET_PROPERTY, struct drm_xe_engine_get_property)
-#define DRM_IOCTL_XE_ENGINE_DESTROY		DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
-#define DRM_IOCTL_XE_EXEC			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
+#define DRM_IOCTL_XE_ENGINE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
+#define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
-#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
+#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
-#define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
 struct drm_xe_query_mem_usage {
 	/** @num_params: number of memory regions returned in regions */
@@ -156,7 +156,7 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
 };
 
 struct drm_xe_query_gts {
@@ -415,8 +415,8 @@ struct drm_xe_vm_bind_op {
 	 * If this flag is clear and the IOCTL doesn't return an error, in
 	 * practice the bind op is good and will complete.
 	 *
-	 * If this flag is set and doesn't return return an error, the bind op
-	 * can still fail and recovery is needed. If configured, the bind op that
+	 * If this flag is set and doesn't return an error, the bind op can
+	 * still fail and recovery is needed. If configured, the bind op that
 	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
 	 * Once the user sees the error (via a ufence +
 	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
@@ -653,9 +653,9 @@ struct drm_xe_exec {
 	__u64 syncs;
 
 	/**
-	  * @address: address of batch buffer if num_batch_buffer == 1 or an
-	  * array of batch buffer addresses
-	  */
+	 * @address: address of batch buffer if num_batch_buffer == 1 or an
+	 * array of batch buffer addresses
+	 */
 	__u64 address;
 
 	/**
-- 
2.34.1

