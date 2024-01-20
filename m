Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE74C48260
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DAA10EAE6;
	Sat, 20 Jan 2024 02:00:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D33A10EAD2
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716032; x=1737252032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=484jkBPTzraxPgVMuPpYzUi8VDAijK9vWsTTiQNtE0w=;
 b=Avc/0cXr2UbUoHv6URsCY/2L9zWMIeLtbz1jasYbwRDusS+HnvGpE0JZ
 FhKgUbB6QjQBsrm1pni9M9z9QDTS+lnXGyOLiFOaJVtphIE0sYcPr1+Iv
 lEKJ9J5T5mPDdFTkOEOghzZVVw+tf+vrAZomldgz/WHYBlcBXi2SWxluV
 nBEBqz7mH4oN7OMVfMHXf4LdBRrBf5KhUJOhfLiMuIz0/ZhxwVdqQxPQR
 xuGesOdIZgDkc67v9alzBOfQdQaAsP+Q4LhUHuCu9kuQxjep6VSWaps4A
 EfgHOQq5UQcZHmhM74yCfJpaVv3KKVMXyQFg2svRqaH1/a+OKSuH2yBTO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472948"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472948"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125727"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125727"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/16] drm/xe/oa/uapi: Query OA unit properties
Date: Fri, 19 Jan 2024 18:00:23 -0800
Message-ID: <20240120020026.1261201-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 81 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 55 ++++++++++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9b35673b286c8..eac266a3d66d5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -520,6 +520,86 @@ static int query_gt_topology(struct xe_device *xe,
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
@@ -529,6 +609,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_hwconfig,
 	query_gt_topology,
 	query_engine_cycles,
+	query_oa_units,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 42474629244d4..2c0949b248d9a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -646,6 +646,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_OA_UNITS		7
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1405,6 +1406,60 @@ enum drm_xe_oa_unit_type {
 	DRM_XE_OA_UNIT_TYPE_OAM,
 };
 
+/**
+ * struct drm_xe_oa_unit - describe OA unit
+ */
+struct drm_xe_oa_unit {
+	/** @oa_unit_id: OA unit ID */
+	__u16 oa_unit_id;
+
+	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
+	__u16 oa_unit_type;
+
+	/** @gt_id: GT ID for this OA unit */
+	__u16 gt_id;
+
+	/** @open_stream: True if a stream is open on the OA unit */
+	__u16 open_stream;
+
+	/** @capabilities: OA capabilities bit-mask */
+	__u64 capabilities;
+
+	/** @oa_timestamp_freq: OA timestamp freq */
+	__u64 oa_timestamp_freq;
+
+	/** @oa_buf_size: OA buffer size */
+	__u64 oa_buf_size;
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
+ * When there is an @open_stream, the query returns properties specific to
+ * that @open_stream. Else default properties are returned.
+ */
+struct drm_xe_query_oa_units {
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
-- 
2.41.0

