Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE67C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 06:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C58210E75F;
	Tue, 13 Feb 2024 06:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gcfktim/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9DD10E75F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806115; x=1739342115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z5J2lgUQUkxepBLtd3yEWpqmvCP6gQEQ6UnmXD0qWiU=;
 b=Gcfktim/HgDoQE2Dp7h0n9Mo09uSxPlkO6EMBqcxwX8/3xneVbqEnPJa
 D15pt82p3vNzaGgo6ATV0Xc7TnccPdCe6ncD8HjxylBZLzgA7PaxYCZr9
 zS3pl6nYZjF+UrSp4PX7yjJDxbKzyD6P4I/DcCywg7QSq9N1faRhjgAnG
 AvtiGdhxxo0PNQZ/LN3qCLvHjIheCLr3tp01S+8vPzW4tfFkm/v9HOMkB
 EG9WbZwaqAUOn4gNTNm7gW861fPjw8iDWCrwZbqQ0DO71rZ1m1EAQ4A8n
 rgaLmiteqxwWC8YYHri3lFGIE0qRmn/qJL2+Lpbydie8XzWDd+8tPZm2Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1671681"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1671681"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="40247072"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:35:15 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/1] drm/xe/oa: Combined diff of changes between v9 and v10
Date: Mon, 12 Feb 2024 22:35:10 -0800
Message-ID: <20240213063510.131098-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213063510.131098-1-ashutosh.dixit@intel.com>
References: <20240213063510.131098-1-ashutosh.dixit@intel.com>
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, provide a combined diff of all changes in a single patch
to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

This patch will not compile, it's purpose is to just provide the diff.

Changes between v9 and v10 include:
* Kernel-doc fixes
* Documentation/comment fixes
* Don't expose capabilities as OR of properties (Umesh)
* Define oa_status register bitfields (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c   | 12 ++++------
 drivers/gpu/drm/xe/xe_oa_types.h | 12 ++++------
 drivers/gpu/drm/xe/xe_query.c    |  4 +---
 include/uapi/drm/xe_drm.h        | 40 +++++++++++++++++++-------------
 4 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index c94f15f34c659..4e9ec5ad09ec1 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -842,13 +842,11 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 }
 
 /**
- * xe_guc_pc_override_gucrc_mode() - override GUCRC mode
+ * xe_guc_pc_override_gucrc_mode - override GUCRC mode
  * @pc: Xe_GuC_PC instance
  * @mode: new value of the mode.
  *
- * Override the GUCRC mode.
- *
- * Return: 0 on success, negative error code on error.
+ * Return: 0 on success, negative error code on error
  */
 int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
 {
@@ -862,12 +860,10 @@ int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mod
 }
 
 /**
- * xe_guc_pc_override_gucrc_mode() - override GUCRC mode
+ * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
  * @pc: Xe_GuC_PC instance
  *
- * Unset the GUCRC mode override
- *
- * Return: 0 on success, negative error code on error.
+ * Return: 0 on success, negative error code on error
  */
 int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
 {
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index bee49977ee3d4..ce20c03bbc285 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -56,9 +56,7 @@ enum xe_oa_format_name {
 	XE_OA_FORMAT_MAX,
 };
 
-/**
- * struct xe_oa_format - Format fields for supported OA formats
- */
+/** struct xe_oa_format - Format fields for supported OA formats */
 struct xe_oa_format {
 	u32 counter_select;
 	int size;
@@ -68,9 +66,7 @@ struct xe_oa_format {
 	u16 bc_report;
 };
 
-/**
- * struct xe_oa_regs - Registers for each OA unit
- */
+/** struct xe_oa_regs - Registers for each OA unit */
 struct xe_oa_regs {
 	u32 base;
 	struct xe_reg oa_head_ptr;
@@ -107,7 +103,7 @@ struct xe_oa_unit {
  * struct xe_oa_gt - OA per-gt information
  */
 struct xe_oa_gt {
-	/** @lock: lock protecting create/destroy OA streams */
+	/** @gt_lock: lock protecting create/destroy OA streams */
 	struct mutex gt_lock;
 
 	/** @num_oa_units: number of oa units for each gt */
@@ -182,7 +178,7 @@ struct xe_oa_stream {
 	/** @hwe: hardware engine associated with this oa stream */
 	struct xe_hw_engine *hwe;
 
-	/** @lock: Lock serializing stream operations */
+	/** @stream_lock: Lock serializing stream operations */
 	struct mutex stream_lock;
 
 	/** @sample: true if DRM_XE_OA_PROP_SAMPLE_OA is provided */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 828be65a076d6..5dfc6072a0b5b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -567,9 +567,7 @@ static int query_oa_units(struct xe_device *xe,
 			du->oa_unit_id = u->oa_unit_id;
 			du->oa_unit_type = u->type;
 			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
-
-			for (j = 1; j < DRM_XE_OA_PROPERTY_MAX; j++)
-				du->capabilities |= BIT(j);
+			du->capabilities = DRM_XE_OA_CAPS_BASE;
 
 			j = 0;
 			for_each_hw_engine(hwe, gt, hwe_id) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index bd535343a406c..2c28198190c02 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1343,9 +1343,7 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
-/**
- * enum drm_xe_perf_type - Perf stream types
- */
+/** enum drm_xe_perf_type - Perf stream types */
 enum drm_xe_perf_type {
 	DRM_XE_PERF_TYPE_OA,
 	DRM_XE_PERF_TYPE_MAX,
@@ -1408,7 +1406,13 @@ enum drm_xe_perf_ioctls {
 
 /** enum drm_xe_oa_unit_type - OA unit types */
 enum drm_xe_oa_unit_type {
+	/**
+	 * @DRM_XE_OA_UNIT_TYPE_OAG: OAG OA unit. OAR/OAC are considered
+	 * sub-types of OAG. For OAR/OAC, use OAG.
+	 */
 	DRM_XE_OA_UNIT_TYPE_OAG,
+
+	/** @DRM_XE_OA_UNIT_TYPE_OAM: OAM OA unit */
 	DRM_XE_OA_UNIT_TYPE_OAM,
 };
 
@@ -1422,11 +1426,9 @@ struct drm_xe_oa_unit {
 	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
 	__u32 oa_unit_type;
 
-	/**
-	 * @capabilities: OA capabilities bit-mask: this is a bit-mask of
-	 * property id's in enum @drm_xe_oa_property_id
-	 */
+	/** @capabilities: OA capabilities bit-mask */
 	__u64 capabilities;
+#define DRM_XE_OA_CAPS_BASE		(1 << 0)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
@@ -1517,10 +1519,11 @@ enum drm_xe_oa_property_id {
 
 	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
 	DRM_XE_OA_PROPERTY_OA_FORMAT,
-	/**
-	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
-	 * the following quantities: a. enum @drm_xe_oa_format_type
-	 * b. Counter select c. Counter size and d. BC report
+	/*
+	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
+	 * in terms of the following quantities: a. enum @drm_xe_oa_format_type
+	 * b. Counter select c. Counter size and d. BC report. Also refer to the
+	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
 	 */
 #define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
 #define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
@@ -1551,7 +1554,8 @@ enum drm_xe_oa_property_id {
 	 */
 	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
 
-	DRM_XE_OA_PROPERTY_MAX /* non-ABI */
+	/** @DRM_XE_OA_PROPERTY_MAX: non-ABI */
+	DRM_XE_OA_PROPERTY_MAX
 };
 
 /**
@@ -1565,7 +1569,7 @@ struct drm_xe_oa_config {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** * @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
+	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
 	char uuid[36];
 
 	/** @n_regs: Number of regs in @regs_ptr */
@@ -1583,10 +1587,14 @@ struct drm_xe_oa_config {
  * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
  */
 struct drm_xe_oa_stream_status {
-	/** @oa_status: OA status register as specified in Bspec */
+	/** @oa_status: OA status register as specified in PRM/Bspec 46717/61226 */
 	__u64 oa_status;
+#define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 6)
+#define DRM_XE_OASTATUS_COUNTER_OVERFLOW	(1 << 2)
+#define DRM_XE_OASTATUS_BUFFER_OVERFLOW		(1 << 1)
+#define DRM_XE_OASTATUS_REPORT_LOST		(1 << 0)
 
-	/** @reserved */
+	/** @reserved: reserved for future use */
 	__u64 reserved[3];
 };
 
@@ -1598,7 +1606,7 @@ struct drm_xe_oa_stream_info {
 	/** @oa_buf_size: OA buffer size */
 	__u64 oa_buf_size;
 
-	/** @reserved */
+	/** @reserved: reserved for future use */
 	__u64 reserved[3];
 };
 
-- 
2.41.0

