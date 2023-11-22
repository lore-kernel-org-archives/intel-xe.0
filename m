Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760DFC61DF5
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F3110E65E;
	Wed, 22 Nov 2023 14:39:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C55E10E00E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663947; x=1732199947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WsKjeFL80tLG85hnCgK7fD+nVr8lqt96pMxPRIS0vfQ=;
 b=OEEHcF6pXEvlm0xXE+H4eBZcod4tCkcxJlgfnwqYcaJ3rAzLDg2bZsYx
 aVKzXyqmxuHVxjlqPfpfcn5JJnYGlaRqjcCSpQA6H4xFW/DBNA4Ubfdwp
 1/oFJPs3eryPYIYVej875i4yEM86MnygAxVlgM7/1gD/a7ppvj0+Vz5ir
 5gGb9gWRaKlG/C+NDh6SSuqGVEEnbFPZfInTWWMuUEW1183EkS6FuYNOb
 zXIPMt16q7BtkcFR1N6dOTnOfaYIpkpEey++mTHDW5eK3hMXKvB+E6/6e
 bNEeTnOO4ugov12rcClvNiAYm4rzJGlYoH6ql2hv62ZXTPfBIvxSV1AMk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985195"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985195"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:39:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430422"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430422"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:59 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:32 +0000
Message-Id: <20231122143833.7-14-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 13/14] drm/xe/uapi: Fix various struct padding
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

v2: Fix remaining wholes and double check with pahole (Jose)
    Ensure with pahole that both 32b and 64b have exact same
    layout (Thomas)
    Do not set query's pad and reserved bits to zero since it
    is redundant and already done by kzalloc (Matt)

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
 include/uapi/drm/xe_drm.h     | 19 +++++++++++--------
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 095f1b8c2290..d0523dfc488f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -371,6 +371,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		return -ENOMEM;
 
 	gt_list->num_gt = xe->info.gt_count;
+
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ccd2821e61f8..1dbd6e948741 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2817,6 +2817,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int err;
 	int i;
 
+	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, !args->num_binds) ||
 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
@@ -2933,6 +2937,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index b0ef1f62fd99..4c175946547c 100644
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
@@ -715,6 +715,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 prefetch_mem_region_instance;
 
+	/** @pad: MBZ */
+	__u32 pad2;
+
 	/** @reserved: Reserved */
 	__u64 reserved[3];
 };
@@ -733,12 +736,12 @@ struct drm_xe_vm_bind {
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
@@ -750,12 +753,12 @@ struct drm_xe_vm_bind {
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

