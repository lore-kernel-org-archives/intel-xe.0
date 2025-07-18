Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB768C83F34
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 23:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB7C10EA52;
	Fri, 18 Jul 2025 23:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/dZtAiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1868010E19F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 23:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752880346; x=1784416346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvDVYICiA4rOj90bYudN7Yg8D2nC/s9yvVmPHtQjNcU=;
 b=U/dZtAiXIrNcwgFLLx4gXqLq1phdp98muVxNcK+bvJnIUELRytlflF5J
 vjqGAZAkVXHRm5PS/VjMjKuBYNbxjVhdMOsQR2rlZWQZqc5GiycApHQZH
 NG24RCsi925kGkKhVV7o2RNrxgCNAkoBVNFmDdmHFvabKbSJFuTE4Dfhd
 ghxvvG1ln/pFmUR+ER/+ybc+XD8BVb3ohuLpUkdE7Bn1oINhFXh2ShvV4
 YXaJS0RvRJijqZGf2tRbJKh9dFzvGCVW6q8rY3BVnWEE3LDveTuM3hCjx
 4bgQlgL88sufT08HhLZsVdWJCEm+xnOfxf9SthPKaLAjYVFYrzG6+htYa A==;
X-CSE-ConnectionGUID: FBYN0Q83QLCCoQGoK/rmRw==
X-CSE-MsgGUID: kgHjj2eSTUGcScRmn0WUNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58995570"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="58995570"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 16:12:25 -0700
X-CSE-ConnectionGUID: n6+XVz9DR3mPi4DP/+7R1Q==
X-CSE-MsgGUID: fZChNgBXRC2b3TXhsN2S1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="163949103"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 18 Jul 2025 16:12:24 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 4/6] drm/xe/guc: Add GuC log init config in LFD format
Date: Fri, 18 Jul 2025 19:12:21 -0400
Message-Id: <20250718231223.670188-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718231223.670188-1-zhanjun.dong@intel.com>
References: <20250718231223.670188-1-zhanjun.dong@intel.com>
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

Add support to output GuC log init config (LIC) in LFD format.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 204 ++++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index d2256773aaf3..2258d73d9c24 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -7,6 +7,7 @@
 
 #include <linux/fault-inject.h>
 
+#include <linux/utsname.h>
 #include <drm/drm_managed.h>
 
 #include "abi/guc_lfd_abi.h"
@@ -20,12 +21,67 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
+/* LFD supported LIC type range */
+#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LIC_TYPE_GUC_SW_VERSION)
+#define GUC_LOG_LIC_TYPE_LAST	(GUC_LIC_TYPE_BUILD_PLATFORM_ID)
+
+#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
+
+#define GUC_LFD_BUFFER_SIZE	SZ_1K
+
+struct guc_log_buffer_entry_list {
+	u32 offset;
+	u32 rd_ptr;
+	u32 wr_ptr;
+	u32 buf_size;
+};
+
+struct guc_log_init_config_save {
+	u32 version;
+	/*
+	 * Array of init config KLVs.
+	 * Range from GUC_LOG_LIC_TYPE_FIRST to GUC_LOG_LIC_TYPE_LAST
+	 */
+	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST + 1];
+	struct guc_log_buffer_entry_list entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
+};
+
+static const struct guc_lfd_data default_guc_lfd_data = {
+	.dw0 = FIELD_PREP_CONST(GUC_LFD_DATA_MAGIC, GUC_LFD_DATA_HEADER_MAGIC)
+};
+
 static const struct guc_lfd_file_header default_guc_lfd_file_header = {
 	.magic = GUC_LFD_DRIVER_KEY_STREAMING,
 	.version.dw0 = FIELD_PREP_CONST(GUC_LFD_VERSION_MINOR, GUC_LFD_FORMAT_VERSION_MINOR) |
 		       FIELD_PREP_CONST(GUC_LFD_VERSION_MAJOR, GUC_LFD_FORMAT_VERSION_MAJOR)
 };
 
+static struct guc_log_buffer_entry_markers {
+	u32 key[2];
+} const entry_markers[4] = {
+	{{
+		GUC_LFD_LOG_BUFFER_MARKER_1V2,
+		GUC_LFD_LOG_BUFFER_MARKER_2
+	}},
+	{{
+		GUC_LFD_LOG_BUFFER_MARKER_1V2,
+		GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2
+	}},
+	{{
+		GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
+		GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2
+	}},
+	{{
+		GUC_LIC_MAGIC,
+		((GUC_LIC_FORMAT_VERSION_MAJOR << 16) | GUC_LIC_FORMAT_VERSION_MINOR)
+	}}
+};
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -223,15 +279,163 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static int xe_guc_log_add_lfd_header(void *buf, int buf_size)
+{
+	int len = sizeof(default_guc_lfd_data);
+
+	memcpy(buf, &default_guc_lfd_data, len);
+	return len;
+}
+
+static int xe_guc_log_add_payload(void *buf, int buf_size, u32 data_len, void *data)
+{
+	struct guc_lfd_data *lfd = buf;
+
+	/* make length DW aligned */
+	lfd->dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
+	memcpy(lfd->data, data, data_len);
+	return lfd->dw_size * sizeof(u32);
+}
+
+static int xe_guc_log_add_typed_payload(void *buf, int buf_size, u32 type,
+					u32 data_len, void *data)
+{
+	struct guc_lfd_data *lfd = buf;
+	int index;
+
+	index = xe_guc_log_add_lfd_header(buf, buf_size);
+	lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, type);
+	index += xe_guc_log_add_payload(buf, buf_size, data_len, data);
+
+	return index;
+}
+
+static inline int lic_type_to_KLV_index(u32 lic_type)
+{
+	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type > GUC_LOG_LIC_TYPE_LAST);
+
+	return lic_type - GUC_LOG_LIC_TYPE_FIRST;
+}
+
+static int xe_guc_log_add_klv(void *buf, int size, u32 lic_type,
+			      struct guc_log_init_config_save *config)
+{
+	int klv_index = lic_type_to_KLV_index(lic_type);
+
+	return xe_guc_log_add_typed_payload(buf, size, lic_type, sizeof(u32),
+					    &config->KLV[klv_index]);
+}
+
+static int xe_guc_log_add_os_id(void *buf, int buf_size, u32 id)
+{
+	struct guc_lfd_data *lfd = buf;
+	struct guc_lfd_data_os_info *os_id;
+	char *version;
+	int info_len;
+
+	os_id = (void *)lfd->data;
+	os_id->os_id = id;
+
+	version = init_utsname()->release;
+	info_len = strnlen(version, buf_size) + 1;
+
+	if (buf_size < sizeof(struct guc_lfd_data) + info_len)
+		return -ENOMEM;
+
+	strscpy(os_id->build_version, version, info_len);
+	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
+					    info_len + sizeof(*os_id), os_id);
+}
+
+static void xe_guc_log_loop_log_init(struct guc_log_init_config *init,
+				     struct guc_log_init_config_save *config)
+{
+	struct guc_klv_generic_dw_t *p = (void *)init->data;
+	int i;
+
+	for (i = 0; i < init->dw_size;) {
+		int klv_len = FIELD_GET(GUC_KLV_0_LEN, p->kl) + 1;
+		int key = FIELD_GET(GUC_KLV_0_KEY, p->kl);
+
+		if (key < GUC_LOG_LIC_TYPE_FIRST || key > GUC_LOG_LIC_TYPE_LAST)
+			break;
+		config->KLV[lic_type_to_KLV_index(key)] = p->value;
+		i += klv_len;
+		p = (void *)((u32 *)p + klv_len);
+	}
+}
+
+static void xe_guc_log_load_lic(void *guc_log, struct guc_log_init_config_save *config)
+{
+	u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
+	struct guc_log_buffer_state *p = guc_log;
+	int i = 0;
+
+	config->version = p->version;
+	while (p) {
+		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
+			if (p->marker[0] == entry_markers[i].key[0] &&
+			    p->marker[1] == entry_markers[i].key[1]) {
+				config->entry[i].offset = offset;
+				config->entry[i].rd_ptr = p->read_ptr;
+				config->entry[i].wr_ptr = p->write_ptr;
+				config->entry[i].buf_size = p->size;
+
+				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
+					offset += p->size;
+					p++;
+				} else {
+					/* Load log init config */
+					xe_guc_log_loop_log_init((void *)p, config);
+
+					/* Init config is the last */
+					return;
+				}
+			}
+		}
+		if (i >= GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
+			break;
+	}
+}
+
+static int
+xe_guc_log_output_lfd_init(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+			   struct guc_log_init_config_save *config)
+{
+	int type, len;
+	size_t size = 0;
+	char buf[GUC_LFD_BUFFER_SIZE] = {0};
+
+	/* FW required types */
+	for (type = GUC_LOG_LIC_TYPE_FIRST; type <= GUC_LOG_LIC_TYPE_LAST; type++)
+		size += xe_guc_log_add_klv(&buf[size], GUC_LFD_BUFFER_SIZE - size, type, config);
+
+	/* KMD required type(s) */
+	len = xe_guc_log_add_os_id(&buf[size], GUC_LFD_BUFFER_SIZE - size,
+				   GUC_LFD_OS_TYPE_OSID_LIN);
+	if (len < 0)
+		return len;
+	size += len;
+
+	xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
+	return size;
+}
+
 static void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
 {
+	struct guc_log_init_config_save config;
+
 	if (!snapshot || !snapshot->size)
 		return;
 
 	/* Output LFD file header */
 	xe_print_blob_ascii85(p, "[LOG].data", 0, &default_guc_lfd_file_header, 0,
 			      offsetof(struct guc_lfd_file_header, lfd_stream));
+
+	/* Output LFD stream */
+	xe_guc_log_load_lic(snapshot->copy[0], &config);
+	xe_guc_log_output_lfd_init(p, snapshot, &config);
 }
 
 /**
-- 
2.34.1

