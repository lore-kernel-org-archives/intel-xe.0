Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B90BC07CA9
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106AD10E769;
	Thu, 30 Nov 2023 18:40:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C4A10E764
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369628; x=1732905628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jXMhVzZsD/x5XQGoJhndQlAjMaXZA3Z1UWJcES9bmq8=;
 b=WzwkHJ0YzUEST+LuJS8f2MKPIwBVmbwsdHFZI+d5/S34hjOQq7YCMwA+
 5NenLlDyIXPFhLTvTrUilIlvVabZSMQKfsjwY8MsL+366HzLIqUQzLQFk
 NQEWbdxlDZ6bMO/Wk9IQXCG2AfidOmcC65BdukbZJCY6OHlj9mwkT9SDU
 ai21yzIk2Sh/9bbXTNc2opXxGCGKWFaCXy83e1qar4qYseVBz0Mzm8oA+
 t7OSc3OONfDWRULwI1avG0a3px+09RS/SW7iihgyuT9y+4Qi7HPwjhbA5
 gYGsMuN4oBDoYfxQ3JsDE/lrJS7TuHINIIlsWB3stuemUEjDGYWs6VqTq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111746"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294962"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294962"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:26 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:51 +0000
Message-Id: <20231130183955.7-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 12/16] drm/xe/uapi: Fix various struct padding
 for 64b alignment
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Let's respect Documentation/process/botching-up-ioctls.rst
and add the proper padding for a 64b alignment with all as
well as all the required checks and settings for the pads
and the reserved entries.

v2: Fix remaining holes and double check with pahole (Jose)
    Ensure with pahole that both 32b and 64b have exact same
    layout (Thomas)
    Do not set query's pad and reserved bits to zero since it
    is redundant and already done by kzalloc (Matt)

v3: Fix alignment after rebase (José Roberto de Souza)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  1 +
 drivers/gpu/drm/xe/xe_vm.c    |  8 ++++++++
 include/uapi/drm/xe_drm.h     | 21 ++++++++++++---------
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4461dd1c9e40..56d61bf596b2 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -372,6 +372,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		return -ENOMEM;
 
 	gt_list->num_gt = xe->info.gt_count;
+
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1d537f129aa3..2c4cf1309753 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2825,6 +2825,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int err;
 	int i;
 
+	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, !args->num_binds) ||
 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
@@ -2963,6 +2967,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		return err;
 
+	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	if (args->exec_queue_id) {
 		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
 		if (XE_IOCTL_DBG(xe, !q)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d6b0f3f41bb4..deeef06a44f9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -211,8 +211,6 @@ struct drm_xe_mem_region {
 	 * a unique pair.
 	 */
 	__u16 instance;
-	/** @pad: MBZ */
-	__u32 pad;
 	/**
 	 * @min_page_size: Min page-size in bytes for this region.
 	 *
@@ -381,6 +379,8 @@ struct drm_xe_gt {
 	__u16 tile_id;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
+	/** @pad: MBZ */
+	__u16 pad[3];
 	/** @reference_clock: A clock frequency for timestamp */
 	__u32 reference_clock;
 	/**
@@ -600,7 +600,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CPU_CACHING_WC                      2
 	__u16 cpu_caching;
 	/** @pad: MBZ */
-	__u16 pad;
+	__u16 pad[3];
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -775,6 +775,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 prefetch_mem_region_instance;
 
+	/** @pad: MBZ */
+	__u32 pad2;
+
 	/** @reserved: Reserved */
 	__u64 reserved[3];
 };
@@ -793,12 +796,12 @@ struct drm_xe_vm_bind {
 	 */
 	__u32 exec_queue_id;
 
-	/** @num_binds: number of binds in this IOCTL */
-	__u32 num_binds;
-
 	/** @pad: MBZ */
 	__u32 pad;
 
+	/** @num_binds: number of binds in this IOCTL */
+	__u32 num_binds;
+
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
@@ -810,12 +813,12 @@ struct drm_xe_vm_bind {
 		__u64 vector_of_binds;
 	};
 
+	/** @pad: MBZ */
+	__u32 pad2;
+
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
-	/** @pad2: MBZ */
-	__u32 pad2;
-
 	/** @syncs: pointer to struct drm_xe_sync array */
 	__u64 syncs;
 
-- 
2.34.1

