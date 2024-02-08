Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF16C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 05:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5BD10E0A5;
	Thu,  8 Feb 2024 05:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/6o0QG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1624410E087
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 05:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707370532; x=1738906532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JkveNcfGmo5xqS7MEZBM3Xh72WZ4Z0V6NqbMp1rnRSM=;
 b=P/6o0QG5SabXFvdpJ+3aAI+2rXLAsgGPsGZVB9GpxMiQQY40gXkr9ARy
 cPq++cPsKD0k+/5YIdYjlNWfI83Ox+ySoLYbJxMxuGeBiiWzDKQG7uTKX
 VkgFpdy5MqClijyM4cPJGh9b65EcklP8VCrShVq1tUeBNYoBDSuXKUUKz
 V2gP/YfIYo0rnoniTSDMbyJyPzWleFGS8QUtyij79VkqUvQR12iD4Gw9D
 CM0XXiB6riIyvYY9OL0+748QlgGgb7rYTSS4OxpyzGynqJ+I4AF9/TWQ8
 /ZipsTh/0cyH7L3uVqgu33hFcOy1bet8sh8X5LfIiPh6rdQ0JgzTpNjii g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12511547"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; d="scan'208";a="12511547"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 21:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1556338"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 21:35:27 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/1] drm/xe/oa: Combined diff of changes between v8 and v9
Date: Wed,  7 Feb 2024 21:35:18 -0800
Message-ID: <20240208053518.3783805-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240208053518.3783805-1-ashutosh.dixit@intel.com>
References: <20240208053518.3783805-1-ashutosh.dixit@intel.com>
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

Changes between v8 and v9 include:

* Disable overrun mode only when time based sampling is enabled
* Use graphics versions rather than absolute platform names
* Skip reporting reserved engines attached to OA units
* Remove gt_id, open_stream and oa_buf_size from 'struct drm_xe_oa_unit'
  used in drm_xe_query_oa_units
* Expose oa_buf_size via DRM_XE_PERF_IOCTL_INFO perf fd ioctl
* Introduce 'struct drm_xe_oa_stream_status' for returning OA stream
  status (rather than returning just via DRM_XE_PERF_IOCTL_STATUS return
  code
* Clarify some uapi comments

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c    | 87 +++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_query.c |  8 ++--
 include/uapi/drm/xe_drm.h     | 73 ++++++++++++++++++++++-------
 3 files changed, 106 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 560b6a3189e42..c26bbed1940ec 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -381,7 +381,7 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 	 * mode to avoid this issue.
 	 */
 	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
-	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
 		oa_buf |= OAG_OABUFFER_DISABLE_OVERRUN_MODE;
 	/*
 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
@@ -1029,12 +1029,29 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream,
 	return ret;
 }
 
-static long xe_oa_status_locked(struct xe_oa_stream *stream)
+static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
 {
-	u32 ret = xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_status);
+	struct drm_xe_oa_stream_status status = {};
+	void __user *uaddr = (void __user *)arg;
+
+	status.oa_status = xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_status);
+
+	if (copy_to_user(uaddr, &status, sizeof(status)))
+		return -EFAULT;
 
 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
-	return ret;
+	return 0;
+}
+
+static long xe_oa_info_locked(struct xe_oa_stream *stream, unsigned long arg)
+{
+	struct drm_xe_oa_stream_info info = { .oa_buf_size = XE_OA_BUFFER_SIZE, };
+	void __user *uaddr = (void __user *)arg;
+
+	if (copy_to_user(uaddr, &info, sizeof(info)))
+		return -EFAULT;
+
+	return 0;
 }
 
 static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
@@ -1051,7 +1068,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 	case DRM_XE_PERF_IOCTL_CONFIG:
 		return xe_oa_config_locked(stream, arg);
 	case DRM_XE_PERF_IOCTL_STATUS:
-		return xe_oa_status_locked(stream);
+		return xe_oa_status_locked(stream, arg);
+	case DRM_XE_PERF_IOCTL_INFO:
+		return xe_oa_info_locked(stream, arg);
 	}
 
 	return -EINVAL;
@@ -2206,37 +2225,8 @@ static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
 
 static void xe_oa_init_supported_formats(struct xe_oa *oa)
 {
-	switch (oa->xe->info.platform) {
-	case XE_TIGERLAKE:
-	case XE_ROCKETLAKE:
-	case XE_ALDERLAKE_S:
-	case XE_ALDERLAKE_P:
-	case XE_ALDERLAKE_N:
-	case XE_DG1:
-		oa_format_add(oa, XE_OA_FORMAT_A12);
-		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
-		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
-		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
-		break;
-
-	case XE_DG2:
-	case XE_PVC:
-		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
-		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
-		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
-		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
-		break;
-
-	case XE_METEORLAKE:
-		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
-		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
-		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
-		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
-		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
-		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
-		break;
-
-	case XE_LUNARLAKE:
+	if (GRAPHICS_VER(oa->xe) >= 20) {
+		/* Xe2+ */
 		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
 		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
 		oa_format_add(oa, XE_OA_FORMAT_PEC64u64);
@@ -2248,10 +2238,27 @@ static void xe_oa_init_supported_formats(struct xe_oa *oa)
 		oa_format_add(oa, XE_OA_FORMAT_PEC32u32_G2);
 		oa_format_add(oa, XE_OA_FORMAT_PEC36u64_G1_32_G2_4);
 		oa_format_add(oa, XE_OA_FORMAT_PEC36u64_G1_4_G2_32);
-		break;
-
-	default:
-		drm_err(&oa->xe->drm, "Unknown platform\n");
+	} else if (GRAPHICS_VERx100(oa->xe) >= 1270) {
+		/* XE_METEORLAKE */
+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
+	} else if (GRAPHICS_VERx100(oa->xe) >= 1255) {
+		/* XE_DG2, XE_PVC */
+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
+	} else {
+		/* Gen12+ */
+		xe_assert(oa->xe, GRAPHICS_VER(oa->xe) >= 12);
+		oa_format_add(oa, XE_OA_FORMAT_A12);
+		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 6f8fc9d2127ed..828be65a076d6 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -566,18 +566,15 @@ static int query_oa_units(struct xe_device *xe,
 
 			du->oa_unit_id = u->oa_unit_id;
 			du->oa_unit_type = u->type;
-			du->gt_id = gt->info.id;
-			du->open_stream = !!u->exclusive_stream;
 			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
-			du->oa_buf_size = XE_OA_BUFFER_SIZE;
-			du->num_engines = u->num_engines;
 
 			for (j = 1; j < DRM_XE_OA_PROPERTY_MAX; j++)
 				du->capabilities |= BIT(j);
 
 			j = 0;
 			for_each_hw_engine(hwe, gt, hwe_id) {
-				if (xe_oa_unit_id(hwe) == u->oa_unit_id) {
+				if (!xe_hw_engine_is_reserved(hwe) &&
+				    xe_oa_unit_id(hwe) == u->oa_unit_id) {
 					du->eci[j].engine_class =
 						xe_to_user_engine_class[hwe->class];
 					du->eci[j].engine_instance = hwe->logical_instance;
@@ -585,6 +582,7 @@ static int query_oa_units(struct xe_device *xe,
 					j++;
 				}
 			}
+			du->num_engines = j;
 			pdu += sizeof(*du) + j * sizeof(du->eci[0]);
 			qoa->num_oa_units++;
 		}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2c0949b248d9a..bd535343a406c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1385,6 +1385,9 @@ struct drm_xe_perf_param {
 
 /**
  * enum drm_xe_perf_ioctls - Perf fd ioctl's
+ *
+ * Information exchanged between userspace and kernel for perf fd ioctl's
+ * is stream type specific
  */
 enum drm_xe_perf_ioctls {
 	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
@@ -1396,8 +1399,11 @@ enum drm_xe_perf_ioctls {
 	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
 	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
 
-	/** @DRM_XE_PERF_IOCTL_STATUS: Stream status */
+	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
 	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
+
+	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
+	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
 };
 
 /** enum drm_xe_oa_unit_type - OA unit types */
@@ -1411,26 +1417,20 @@ enum drm_xe_oa_unit_type {
  */
 struct drm_xe_oa_unit {
 	/** @oa_unit_id: OA unit ID */
-	__u16 oa_unit_id;
+	__u32 oa_unit_id;
 
 	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
-	__u16 oa_unit_type;
-
-	/** @gt_id: GT ID for this OA unit */
-	__u16 gt_id;
+	__u32 oa_unit_type;
 
-	/** @open_stream: True if a stream is open on the OA unit */
-	__u16 open_stream;
-
-	/** @capabilities: OA capabilities bit-mask */
+	/**
+	 * @capabilities: OA capabilities bit-mask: this is a bit-mask of
+	 * property id's in enum @drm_xe_oa_property_id
+	 */
 	__u64 capabilities;
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
 
-	/** @oa_buf_size: OA buffer size */
-	__u64 oa_buf_size;
-
 	/** @reserved: MBZ */
 	__u64 reserved[4];
 
@@ -1448,8 +1448,22 @@ struct drm_xe_oa_unit {
  * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
  * drm_xe_query_oa_units in .data.
  *
- * When there is an @open_stream, the query returns properties specific to
- * that @open_stream. Else default properties are returned.
+ * OA unit properties for all OA units can be accessed using a code block
+ * such as the one below:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_xe_query_oa_units *qoa;
+ *	struct drm_xe_oa_unit *oau;
+ *	u8 *poau;
+ *
+ *	// malloc qoa and issue DRM_XE_DEVICE_QUERY_OA_UNITS. Then:
+ *	poau = (u8 *)&qoa->oa_units[0];
+ *	for (int i = 0; i < qoa->num_oa_units; i++) {
+ *		oau = (struct drm_xe_oa_unit *)poau;
+ *		// Access 'struct drm_xe_oa_unit' fields here
+ *		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
+ *	}
  */
 struct drm_xe_query_oa_units {
 	/** @num_oa_units: number of OA units returned in oau[] */
@@ -1489,8 +1503,9 @@ enum drm_xe_oa_property_id {
 	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
 
 	/**
-	 * @DRM_XE_OA_PROPERTY_SAMPLE_OA: A value of 1 requests the inclusion of
-	 * raw OA unit reports as part of stream samples.
+	 * @DRM_XE_OA_PROPERTY_SAMPLE_OA: A value of 1 requests inclusion of raw
+	 * OA unit reports or stream samples in a global buffer attached to an
+	 * OA unit.
 	 */
 	DRM_XE_OA_PROPERTY_SAMPLE_OA,
 
@@ -1563,6 +1578,30 @@ struct drm_xe_oa_config {
 	__u64 regs_ptr;
 };
 
+/**
+ * struct drm_xe_oa_stream_status - OA stream status returned from
+ * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
+ */
+struct drm_xe_oa_stream_status {
+	/** @oa_status: OA status register as specified in Bspec */
+	__u64 oa_status;
+
+	/** @reserved */
+	__u64 reserved[3];
+};
+
+/**
+ * struct drm_xe_oa_stream_info - OA stream info returned from
+ * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
+ */
+struct drm_xe_oa_stream_info {
+	/** @oa_buf_size: OA buffer size */
+	__u64 oa_buf_size;
+
+	/** @reserved */
+	__u64 reserved[3];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

