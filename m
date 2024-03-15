Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E303C54E69
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C56810FF4B;
	Fri, 15 Mar 2024 01:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHiywrtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE0510FF3D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710466527; x=1742002527;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zQAyEQx76PoEORhjb82XLOzXEih/ScOl5waf42oa6s0=;
 b=kHiywrtpZj50EffRm3ch3xUmE/f88J+42X5WvspEaCqh/rU9d5yfrbuj
 1Jx52uAmpbib6G2WYXfy0Vny7ad01ZIv11Rvxc1zN+H6aAtDgLgAYpaJ7
 eFPic/e8/8EbS60xs6QZnjZkEZhYswxo1kFZTRj+shxB6T7EulT37E5pz
 qTVMf8Nst09yMScenj/YVrvO78EPa2tlmQUb2/0vgeJ3lDuCh2lVSXYQa
 g8NNDZPnF+CbWPEb6kcOihPYpWqjmiWiMVjg6YXsbhEXQ/r3xVb/9cAmT
 k/BrdXNbC28wCkeeAnY7neNzF89HCc6UtfRrIc7qPydiO5EraIQtOXNie A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15963134"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="15963134"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="43397269"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:35:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/17] drm/xe/oa/uapi: Query OA unit properties
Date: Thu, 14 Mar 2024 18:35:13 -0700
Message-ID: <20240315013518.2848986-13-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
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

Implement query for properties of OA units present on a device.

v2: Clean up reserved/pad fields (Umesh)
    Follow the same scheme as other query structs
v3: Skip reporting reserved engines attached to OA units
v4: Expose oa_buf_size via DRM_XE_PERF_IOCTL_INFO (Umesh)
v5: Don't expose capabilities as OR of properties (Umesh)
v6: Add extensions to query output structs: drm_xe_oa_unit,
    drm_xe_query_oa_units and drm_xe_oa_stream_info

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c    | 13 ++++++
 drivers/gpu/drm/xe/xe_query.c | 77 +++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 81 +++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a696cc54886d..b8d880797c16 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1010,6 +1010,17 @@ static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
 	return 0;
 }
 
+static long xe_oa_info_locked(struct xe_oa_stream *stream, unsigned long arg)
+{
+	struct drm_xe_oa_stream_info info = { .oa_buf_size = XE_OA_BUFFER_SIZE, };
+	void __user *uaddr = (void __user *)arg;
+
+	if (copy_to_user(uaddr, &info, sizeof(info)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
@@ -1025,6 +1036,8 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 		return xe_oa_config_locked(stream, arg);
 	case DRM_XE_PERF_IOCTL_STATUS:
 		return xe_oa_status_locked(stream, arg);
+	case DRM_XE_PERF_IOCTL_INFO:
+		return xe_oa_info_locked(stream, arg);
 	}
 
 	return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e80321b34918..e477c2a71ffe 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -593,6 +593,82 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 	return 0;
 }
 
+static size_t calc_oa_unit_query_size(struct xe_device *xe)
+{
+	size_t size = sizeof(struct drm_xe_query_oa_units);
+	struct xe_gt *gt;
+	int i, id;
+
+	for_each_gt(gt, xe, id) {
+		for (i = 0; i < gt->oa.num_oa_units; i++) {
+			size += sizeof(struct drm_xe_oa_unit);
+			size += gt->oa.oa_unit[i].num_engines *
+				sizeof(struct drm_xe_engine_class_instance);
+		}
+	}
+
+	return size;
+}
+
+static int query_oa_units(struct xe_device *xe,
+			  struct drm_xe_device_query *query)
+{
+	void __user *query_ptr = u64_to_user_ptr(query->data);
+	size_t size = calc_oa_unit_query_size(xe);
+	struct drm_xe_query_oa_units *qoa;
+	enum xe_hw_engine_id hwe_id;
+	struct drm_xe_oa_unit *du;
+	struct xe_hw_engine *hwe;
+	struct xe_oa_unit *u;
+	int gt_id, i, j, ret;
+	struct xe_gt *gt;
+	u8 *pdu;
+
+	if (query->size == 0) {
+		query->size = size;
+		return 0;
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
+		return -EINVAL;
+	}
+
+	qoa = kzalloc(size, GFP_KERNEL);
+	if (!qoa)
+		return -ENOMEM;
+
+	pdu = (u8 *)&qoa->oa_units[0];
+	for_each_gt(gt, xe, gt_id) {
+		for (i = 0; i < gt->oa.num_oa_units; i++) {
+			u = &gt->oa.oa_unit[i];
+			du = (struct drm_xe_oa_unit *)pdu;
+
+			du->oa_unit_id = u->oa_unit_id;
+			du->oa_unit_type = u->type;
+			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
+			du->capabilities = DRM_XE_OA_CAPS_BASE;
+
+			j = 0;
+			for_each_hw_engine(hwe, gt, hwe_id) {
+				if (!xe_hw_engine_is_reserved(hwe) &&
+				    xe_oa_unit_id(hwe) == u->oa_unit_id) {
+					du->eci[j].engine_class =
+						xe_to_user_engine_class[hwe->class];
+					du->eci[j].engine_instance = hwe->logical_instance;
+					du->eci[j].gt_id = gt->info.id;
+					j++;
+				}
+			}
+			du->num_engines = j;
+			pdu += sizeof(*du) + j * sizeof(du->eci[0]);
+			qoa->num_oa_units++;
+		}
+	}
+
+	ret = copy_to_user(query_ptr, qoa, size);
+	kfree(qoa);
+
+	return ret ? -EFAULT : 0;
+}
+
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
@@ -603,6 +679,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_gt_topology,
 	query_engine_cycles,
 	query_uc_fw_version,
+	query_oa_units,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4bfa06ebf6da..54d0912f2ba8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -686,6 +686,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
+#define DRM_XE_DEVICE_QUERY_OA_UNITS		8
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1436,6 +1437,71 @@ enum drm_xe_oa_unit_type {
 	DRM_XE_OA_UNIT_TYPE_OAM,
 };
 
+/**
+ * struct drm_xe_oa_unit - describe OA unit
+ */
+struct drm_xe_oa_unit {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @oa_unit_id: OA unit ID */
+	__u32 oa_unit_id;
+
+	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
+	__u32 oa_unit_type;
+
+	/** @capabilities: OA capabilities bit-mask */
+	__u64 capabilities;
+#define DRM_XE_OA_CAPS_BASE		(1 << 0)
+
+	/** @oa_timestamp_freq: OA timestamp freq */
+	__u64 oa_timestamp_freq;
+
+	/** @reserved: MBZ */
+	__u64 reserved[4];
+
+	/** @num_engines: number of engines in @eci array */
+	__u64 num_engines;
+
+	/** @eci: engines attached to this OA unit */
+	struct drm_xe_engine_class_instance eci[];
+};
+
+/**
+ * struct drm_xe_query_oa_units - describe OA units
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
+ * drm_xe_query_oa_units in .data.
+ *
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
+ */
+struct drm_xe_query_oa_units {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @num_oa_units: number of OA units returned in oau[] */
+	__u32 num_oa_units;
+	/** @pad: MBZ */
+	__u32 pad;
+	/** @oa_units: OA units returned for this device */
+	struct drm_xe_oa_unit oa_units[];
+};
+
 /** enum drm_xe_oa_format_type - OA format types */
 enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_OAG,
@@ -1565,6 +1631,21 @@ struct drm_xe_oa_stream_status {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_oa_stream_info - OA stream info returned from
+ * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
+ */
+struct drm_xe_oa_stream_info {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @oa_buf_size: OA buffer size */
+	__u64 oa_buf_size;
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[3];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

