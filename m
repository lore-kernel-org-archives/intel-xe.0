Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CFCFB5188
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643EC10E342;
	Tue,  7 Apr 2026 03:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pmu/w4VU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC4510E342
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775531082; x=1807067082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uLt1ncurUxV0O22fT7fAHYHS+0jAsJ+ZAT5JoOXWEI4=;
 b=Pmu/w4VUeN9qIdwhE20aSdO5Q7KET9l3vfGl1Vz/9Hztk6drasgiPnBn
 ISEDJ7p0PdnYzKQslprL5gWraIXJnHyMf4V+I84Qw97hVj47S0YiDypvq
 b1+kLwp1BZvsj64grZ1siBy51i95sPlq6Ud/eArqGOl20CTnp/K64je+c
 +phRV/Y/PC2y03LHyptseyz4xodJLvtmeEM2WuE81vBMwosAhSvbRT6H8
 IwC+CrFSVsSkysX0e9YoPZ+PE1WnwJUBKBNXsirU2Ic1psVS6hbsBeNHz
 sjolx5d9ktvNSH/zoFMBKamxfbcUGIe8XDz4GtKTSdTXzZkaEZh1+CrZN Q==;
X-CSE-ConnectionGUID: Z6f2ji5JT6WvjqaHykmlTQ==
X-CSE-MsgGUID: Q0sH+o9sRKaHAtWg/N73Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76201137"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76201137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:04:42 -0700
X-CSE-ConnectionGUID: g+9S0vl8TsipqoytkTOMrw==
X-CSE-MsgGUID: wOhngBxcQFOtT2uW1j8GtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225295086"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:04:41 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 3/6] drm/xe/uapi: Fix wrong names and references in xe_drm.h
Date: Tue,  7 Apr 2026 03:00:43 +0000
Message-ID: <20260407030046.3394004-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260407030046.3394004-1-shuicheng.lin@intel.com>
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix incorrect field names, struct names, ioctl names, and
descriptions in doc comments:
- probed_size -> @cpu_visible_size (correct field name)
- @flags description was copy of @placement ->
  fix to reference DRM_XE_GEM_CREATE_FLAG_*
- %XE_PXP_HWDRM_DEFAULT_SESSION ->
  %DRM_XE_PXP_HWDRM_DEFAULT_SESSION (missing DRM_ prefix)
- Remove undefined %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
- &DRM_XE_OBSERVATION -> &DRM_IOCTL_XE_OBSERVATION
- id's/struct's -> IDs/structs (fix incorrect possessive forms)
- drm_xe_query_oa_units -> drm_xe_oa_unit
- DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ->
  DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
- DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES ->
  DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
- @sizeof_mem_ranges_attr -> @sizeof_mem_range_attr
- @vector_of_vma_mem_attr -> @vector_of_mem_attr

v3: id -> ID. (Xin)
    split cross-reference fix to seperate patch.

Assisted-by: GitHub Copilot:claude-opus-4.6
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 include/uapi/drm/xe_drm.h | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1d3406416d8c..ad8e3b69a3d7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -349,7 +349,7 @@ struct drm_xe_mem_region {
 	 * is smaller than @total_size then this is referred to as a
 	 * small BAR system.
 	 *
-	 * On systems without small BAR (full BAR), the probed_size will
+	 * On systems without small BAR (full BAR), the @cpu_visible_size will
 	 * always equal the @total_size, since all of it will be CPU
 	 * accessible.
 	 *
@@ -862,8 +862,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
 #define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
 	/**
-	 * @flags: Flags, currently a mask of memory instances of where BO can
-	 * be placed
+	 * @flags: Flags for the GEM object, see DRM_XE_GEM_CREATE_FLAG_*
 	 */
 	__u32 flags;
 
@@ -1366,7 +1365,7 @@ struct drm_xe_vm_get_property {
  *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
  *    there is no need to explicitly set that. When a queue of type
  *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
- *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
+ *    (%DRM_XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
  *    The user is expected to query the PXP status via the query ioctl (see
  *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
  *    attempting to create a queue with this property. When a queue is created
@@ -1651,7 +1650,6 @@ struct drm_xe_exec {
  *
  * and the @flags can be:
  *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
- *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
  *
  * The @mask values can be for example:
  *  - 0xffu for u8
@@ -1741,7 +1739,7 @@ enum drm_xe_observation_op {
 };
 
 /**
- * struct drm_xe_observation_param - Input of &DRM_XE_OBSERVATION
+ * struct drm_xe_observation_param - Input of &DRM_IOCTL_XE_OBSERVATION
  *
  * The observation layer enables multiplexing observation streams of
  * multiple types. The actual params for a particular stream operation are
@@ -1902,10 +1900,10 @@ enum drm_xe_oa_format_type {
 };
 
 /**
- * enum drm_xe_oa_property_id - OA stream property id's
+ * enum drm_xe_oa_property_id - OA stream property IDs
  *
  * Stream params are specified as a chain of @drm_xe_ext_set_property
- * struct's, with @property values from enum @drm_xe_oa_property_id and
+ * structs, with @property values from enum @drm_xe_oa_property_id and
  * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
  * @param field in struct @drm_xe_observation_param points to the first
  * @drm_xe_ext_set_property struct.
@@ -1919,7 +1917,7 @@ enum drm_xe_oa_property_id {
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
 	 * the OA stream, see @oa_unit_id in 'struct
-	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
+	 * drm_xe_oa_unit'. Defaults to 0 if not provided.
 	 */
 	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
 
@@ -2369,10 +2367,10 @@ struct drm_xe_madvise {
 };
 
 /**
- * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
+ * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
  *
  * This structure is provided by userspace and filled by KMD in response to the
- * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
+ * DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS ioctl. It describes memory attributes of
  * memory ranges within a user specified address range in a VM.
  *
  * The structure includes information such as atomic access policy,
@@ -2427,7 +2425,7 @@ struct drm_xe_mem_range_attr {
 };
 
 /**
- * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
+ * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
  *
  * This structure is used to query memory attributes of memory regions
  * within a user specified address range in a VM. It provides detailed
@@ -2435,14 +2433,14 @@ struct drm_xe_mem_range_attr {
  * page attribute table (PAT) index, and preferred memory location.
  *
  * Userspace first calls the ioctl with @num_mem_ranges = 0,
- * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL to retrieve
+ * @sizeof_mem_range_attr = 0 and @vector_of_mem_attr = NULL to retrieve
  * the number of memory regions and size of each memory range attribute.
  * Then, it allocates a buffer of that size and calls the ioctl again to fill
  * the buffer with memory range attributes.
  *
  * If second call fails with -ENOSPC, it means memory ranges changed between
  * first call and now, retry IOCTL again with @num_mem_ranges = 0,
- * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
+ * @sizeof_mem_range_attr = 0 and @vector_of_mem_attr = NULL followed by
  * second ioctl call.
  *
  * Example:
-- 
2.43.0

