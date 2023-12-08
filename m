Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B9FC10F14
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4A610E9EA;
	Fri,  8 Dec 2023 06:43:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1D610E9D6
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017817; x=1733553817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oqR9sL4KjyzE9OjeIfGN1w6F9gFSd2TZLa5KoJFuWTU=;
 b=Jg3LdeIa7GKaol8nUhKqcUF+PC9W0skmgLm0p+Feytx769g73FshThzm
 F31dNUbOQQpNAkTodKsnz6K4fA320aXptCgth+UhURc8W2c7FOCjfyncj
 k7S1EkbHs5/m1SK5tfoQn5z2jK9id/VYRBg0b4fhAxSE9q3y+yCncSZp5
 TfxcvGRDZha0BaxIzkkD+3HYlUDhO7/fvkdG3XbWOlbgFpN+ptzMp9zsb
 VM9tCuiu5o8LeNwnH9C+Ldwcya+vcTfPtQZHoQIJcQymfGIMI3TAayVm1
 i8587KgK+Mbpt5MqaQywRlTqGGpbOc0ZI3f1A8VFNuN0aRA6xwRPR4Tfz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866615"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866615"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699263"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699263"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 14/17] drm/xe/oa/uapi: Query OA unit properties
Date: Thu,  7 Dec 2023 22:43:26 -0800
Message-ID: <20231208064329.2387604-15-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.h    |  2 +
 drivers/gpu/drm/xe/xe_query.c | 81 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 64 +++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index a0f9a876ea6b4..b88914693cdb3 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -25,5 +25,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file);
+u32 xe_oa_timestamp_frequency(struct xe_gt *gt);
+u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 56d61bf596b2b..abe2ea088e2ec 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -501,6 +501,86 @@ static int query_gt_topology(struct xe_device *xe,
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
+			du->gt_id = gt->info.id;
+			du->open_stream = !!u->exclusive_stream;
+			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
+			du->oa_buf_size = XE_OA_BUFFER_SIZE;
+			du->num_engines = u->num_engines;
+
+			for (j = 1; j < DRM_XE_OA_PROPERTY_MAX; j++)
+				du->capabilities |= BIT(j);
+
+			j = 0;
+			for_each_hw_engine(hwe, gt, hwe_id) {
+				if (xe_oa_unit_id(hwe) == u->oa_unit_id) {
+					du->eci[j].engine_class =
+						xe_to_user_engine_class[hwe->class];
+					du->eci[j].engine_instance = hwe->logical_instance;
+					du->eci[j].gt_id = gt->info.id;
+					j++;
+				}
+			}
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
@@ -510,6 +590,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_hwconfig,
 	query_gt_topology,
 	query_engine_cycles,
+	query_oa_units,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8156301df7315..5f41c5bfe5e0e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -517,6 +517,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_OA_UNITS		7
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1182,6 +1183,69 @@ enum drm_xe_oa_unit_type {
 	DRM_XE_OA_UNIT_TYPE_OAM,
 };
 
+/**
+ * struct drm_xe_query_oa_units - describe OA units
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
+ * drm_xe_query_oa_units in .data.
+ *
+ * When there is an @open_stream, the query returns properties specific to
+ * that @open_stream. Else default properties are returned.
+ */
+struct drm_xe_query_oa_units {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @num_oa_units: number of OA units returned in oau[] */
+	__u32 num_oa_units;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @reserved: MBZ */
+	__u64 reserved[4];
+
+	/** @oa_units: OA units returned for this device */
+	struct drm_xe_oa_unit {
+		/** @oa_unit_id: OA unit ID */
+		__u16 oa_unit_id;
+
+		/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
+		__u16 oa_unit_type;
+
+		/** @gt_id: GT ID for this OA unit */
+		__u16 gt_id;
+
+		/** @open_stream: True if a stream is open on the OA unit */
+		__u16 open_stream;
+
+		/** @internal_events: True if internal events are available */
+		__u16 internal_events;
+
+		/** @pad: MBZ */
+		__u16 pad;
+
+		/** @capabilities: OA capabilities bit-mask */
+		__u64 capabilities;
+
+		/** @oa_timestamp_freq: OA timestamp freq */
+		__u64 oa_timestamp_freq;
+
+		/** @oa_buf_size: OA buffer size */
+		__u64 oa_buf_size;
+
+		/** @reserved: MBZ */
+		__u64 reserved[4];
+
+		/** @num_engines: number of engines in @eci array */
+		__u64 num_engines;
+
+		/** @eci: engines attached to this OA unit */
+		struct drm_xe_engine_class_instance eci[];
+	} oa_units[];
+};
+
 /** enum drm_xe_oa_format_type - OA format types */
 enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_OAG,
-- 
2.41.0

