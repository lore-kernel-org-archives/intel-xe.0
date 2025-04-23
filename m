Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DABC369D5
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DEA10E0B9;
	Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXkEBuGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4487310E283
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745445506; x=1776981506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MwRFdeDKAaie7K9s6Ji+WhMc58yJvgE2aRycpdqlEBY=;
 b=AXkEBuGF0dATcAwgRda2uPzaJwXsDMbBpSaMnPv5US9A7dHsHIv5hYas
 FLEjmE1UmTKhRlusWaXMQJoTkMoGLwrGDq5zUnoRv1PurBk3522cwBS4G
 j/UYHVA8yIHWms6vTKcJ1nLYxDnURW/tV/4KzYD1+t3hPEFOGLxRnn83l
 D2Z1CoATeXbi8C5ieANjUeLxnGKv8khnc9JQloaTqT68YNcYkJWfD4h4k
 8G7gg6WghtFJ4t+Icssj3lvsvZF7IufZkrd9gRKmzNCI/7ReYSM4+tp3h
 nbJe/vwuAN2sDIwAVZNmlY5lXjdvbc1fsuq5Og41d+qoFzCYqL65lT82b Q==;
X-CSE-ConnectionGUID: gaKDlto5SSGuY88tg1WUIA==
X-CSE-MsgGUID: GZW3XigDTyeN6QeX/MIfAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47073116"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47073116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:58:23 -0700
X-CSE-ConnectionGUID: IqdMOf2+SZC9NOcYc+jA3Q==
X-CSE-MsgGUID: xwrTOzGqQyejFT+EZw032Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136507654"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 14:58:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 4/6] drm/xe/guc: Add GuC log init config in LFD format
Date: Wed, 23 Apr 2025 14:58:19 -0700
Message-Id: <20250423215821.3078428-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423215821.3078428-1-zhanjun.dong@intel.com>
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_log.c | 201 +++++++++++++++++++++++++++++++-
 1 file changed, 198 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index e362e407f6d5..3fdf3823e2d0 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -7,6 +7,7 @@
 
 #include <linux/fault-inject.h>
 
+#include <linux/utsname.h>
 #include <drm/drm_managed.h>
 
 #include "abi/guc_log_lfd_abi.h"
@@ -20,6 +21,30 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
+/* LFD supported LIC type range */
+#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
+#define GUC_LOG_LIC_TYPE_LAST	(GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID)
+
+struct guc_log_buffer_entry_list {
+	u32 offset;
+	u32 rd_ptr;
+	u32 wr_ptr;
+	u32 buf_size;
+};
+
+struct guc_log_init_config_save {
+	/*
+	 * Array of init config KLVs.
+	 * Range from GUC_LOG_LIC_TYPE_FIRST to GUC_LOG_LIC_TYPE_LAST
+	 */
+	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST + 1];
+	struct guc_log_buffer_entry_list entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
+};
+
+static const struct guc_logfile_lfd_data default_guc_logfile_lfd_data = {
+	.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_LFD_MAGIC, GUC_LOGFILE_LFD_HEADER_MAGIC)
+};
+
 static const struct guc_logfile_header default_guc_logfile_header = {
 	.magic = LFD_DRIVER_KEY_STREAMING,
 	.version.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_MINOR_VERSION,
@@ -28,6 +53,28 @@ static const struct guc_logfile_header default_guc_logfile_header = {
 					GUC_LOG_FILE_FORMAT_VERSION_MAJOR)
 };
 
+static struct guc_log_buffer_entry_markers {
+	u32 key[2];
+} const entry_markers[4] = {
+	{{
+		LFD_LOG_BUFFER_MARKER_1V2,
+		LFD_LOG_BUFFER_MARKER_2
+	}},
+	{{
+		LFD_LOG_BUFFER_MARKER_1V2,
+		LFD_CRASH_DUMP_BUFFER_MARKER_2
+	}},
+	{{
+		LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
+		LFD_STATE_CAPTURE_BUFFER_MARKER_2
+	}},
+	{{
+		GUC_LOG_INIT_CONFIG_LIC_MAGIC,
+		((GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR << 16)
+			| GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR)
+	}}
+};
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -225,10 +272,156 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static int xe_guc_log_add_lfd_header(void *buf, int buf_size)
+{
+	int len = sizeof(default_guc_logfile_lfd_data);
+
+	memcpy(buf, &default_guc_logfile_lfd_data, len);
+	return len;
+}
+
+static int xe_guc_log_add_payload(void *buf, int buf_size, u32 data_len, void *data)
+{
+	struct guc_logfile_lfd_data *lfd = buf;
+
+	/* make length DW aligned */
+	lfd->desc_dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
+	memcpy(lfd->data, data, data_len);
+	return lfd->desc_dw_size * sizeof(u32);
+}
+
+static int xe_guc_log_add_typed_payload(void *buf, int buf_size, u32 type,
+					u32 data_len, void *data)
+{
+	struct guc_logfile_lfd_data *lfd = buf;
+	int index;
+
+	index = xe_guc_log_add_lfd_header(buf, buf_size);
+	lfd->dw0 |= FIELD_PREP(GUC_LOGFILE_LFD_DESC_TYPE, type);
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
+	struct guc_logfile_lfd_data *lfd = buf;
+	struct guc_lfd_data_os_id *os_id;
+	char *version;
+	int info_len;
+
+	os_id = (void *)lfd->data;
+	os_id->os_id = id;
+
+	version = init_utsname()->release;
+	info_len = strlen(version) + 1;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_data) + info_len)
+		return -ENOMEM;
+
+	strscpy(os_id->build_version, version, info_len);
+
+	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
+					   info_len + sizeof(*os_id), os_id);
+}
+
+static void xe_guc_log_loop_log_init(struct guc_log_init_config *init,
+				     struct guc_log_init_config_save *config)
+{
+	struct guc_klv_generic_dw_t *p = (void *)init->data;
+	int i;
+
+	for (i = 0; i < init->dw_size;) {
+		int klv_len = FIELD_PREP(GUC_KLV_0_LEN, p->kl) + 1;
+		int key = FIELD_PREP(GUC_KLV_0_KEY, p->kl);
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
+	memset(config, 0, sizeof(struct guc_log_init_config_save));
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
+					xe_guc_log_loop_log_init((void *)p,
+								 config);
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
+xe_guc_log_output_lfd_init(char *buf, struct xe_guc_log_snapshot *snapshot,
+			   struct guc_log_init_config_save *config)
+{
+	int type, len, index;
+
+	/* fill LFD file header */
+	memcpy(buf, &default_guc_logfile_header, sizeof(default_guc_logfile_header));
+	index = offsetof(struct guc_logfile_header, lfd_stream);
+
+	/* FW required types */
+	for (type = GUC_LOG_LIC_TYPE_FIRST; type <= GUC_LOG_LIC_TYPE_LAST; type++)
+		index += xe_guc_log_add_klv(&buf[index], GUC_LOG_CHUNK_SIZE - index, type, config);
+
+	/* KMD required type(s) */
+	len = xe_guc_log_add_os_id(&buf[index], GUC_LOG_CHUNK_SIZE - index,
+				   GUC_LFD_OS_TYPE_OSID_LIN);
+	if (len < 0)
+		return len;
+	index += len;
+
+	return index;
+}
+
 static void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
 			      struct xe_guc_log *log)
 {
+	struct guc_log_init_config_save config;
 	char *lfd_buf;
 	int index;
 
@@ -242,9 +435,11 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 		goto lfd_out;
 	}
 
-	/* Fill LFD file header */
-	memcpy(lfd_buf, &default_guc_logfile_header, sizeof(default_guc_logfile_header));
-	index = offsetof(struct guc_logfile_header, lfd_stream);
+	xe_guc_log_load_lic(snapshot->copy[0], &config);
+	index = xe_guc_log_output_lfd_init(lfd_buf, snapshot, &config);
+	if (index < 0)
+		goto lfd_out;
+
 	xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, (size_t)index);
 
 lfd_out:
-- 
2.34.1

