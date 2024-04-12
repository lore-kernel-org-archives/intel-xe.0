Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20FDC00A94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB8610F546;
	Fri, 12 Apr 2024 09:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZ6Rsihr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5AD10F551
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914643; x=1744450643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wRLojUZVqy69jtRCZOwOjMx4Eq4A6jRa6Zht2saBKU=;
 b=FZ6Rsihri1rcMZ1hnq419RE7pS7x2yCt2me05AT0R9cVobyvJ1ezFyr4
 GENdUmqe6TYmA+YxF23kl16261SfmqE/esnEY3mseaF4oSTnKEZFuvc6V
 OrHD+eOls3ZlGKdkcyqVznIpWkbsewPA0sWw+wCtGiqLq7LCyuVb212vx
 gpit2fiqO3PlQhAQ4R7cKvf0COhLuzQYSrvtfCdingYjIzJbZ9axrdHP1
 j73V01XrXcFOfPWPkx+wVFnZHZdrh6NPx8DjikG/5idYYnLdfTW3w3bZm
 hpvr5frE1wKkgDqk4xW0R0ERXXaYwgewkMmHa5+FaVN9bhvP3OMnHVbf4 A==;
X-CSE-ConnectionGUID: fmWzpLiJSNekCTyK+Xlcpg==
X-CSE-MsgGUID: VQK4i8wRQVW7eHjTfhaN6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19075962"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19075962"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:05 -0700
X-CSE-ConnectionGUID: JGXDLCaiSNGlb3oFQ/x06A==
X-CSE-MsgGUID: DJ8KitTaSKGX9YSA0np7ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52342183"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:04 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 7/7] drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem
Date: Fri, 12 Apr 2024 11:22:49 +0200
Message-ID: <20240412092249.3636-8-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412092249.3636-1-nirmoy.das@intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add a query flag for xe->info.has_device_atomics_on_smem
as this is platform dependent. This flag can be use to inform
whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
applied for a given platform.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 4 +++-
 include/uapi/drm/xe_drm.h     | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index df407d73e5f5..b8a606698e38 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -312,7 +312,7 @@ static int query_mem_regions(struct xe_device *xe,
 
 static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 {
-	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
+	const u32 num_params = DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM + 1;
 	size_t size =
 		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
 	struct drm_xe_query_config __user *query_ptr =
@@ -341,6 +341,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
+	config->info[DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM] =
+		xe->info.has_device_atomics_on_smem;
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index a44c057d4471..4804b8a5d028 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -394,6 +394,8 @@ struct drm_xe_query_mem_regions {
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
  *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
  *    available exec queue priority
+ *  - %DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM - Flag is set if the device
+ *    supports device atomics on system memory
  */
 struct drm_xe_query_config {
 	/** @num_params: number of parameters returned in info */
@@ -408,6 +410,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
+#define DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM	5
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.42.0

