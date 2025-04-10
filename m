Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DC9C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 15:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E461910E9FF;
	Thu, 10 Apr 2025 15:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zaj4mSEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF6F10E9FA
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744300736; x=1775836736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FxVPmCYnjmW4m++Eq/ZtEj8qjBA7COKFlZgVhGjXQ8o=;
 b=Zaj4mSEOFSttsINIK2GY96wTZqDyRjRN1pXg4TDCZWj0IlG5gfEqLnWC
 h9CyfWCu4QjxK6gpXnYRpKcmbEj7ZMEyMXhBb+jq+eI9q7iQlm5vvZTrC
 4Y23OI2yMyWdTIEZTEq/jDrDctObtBPUAMQDxYVZF6tn9za0hYK8a2cRz
 4fOGoPn4uAia+rh8JJeKes0WSE+82rb3TwEOVKf8OiZsUHhbArlH//IkX
 oDhKMorGYIK/2kE+9KLujtvfs8IRdo6DyJS0vBiFr69NW/6whtGIfM5j+
 vgnmEHtC5G0FX3OzXcuykxEZagrqPz25y6Kq5ORki4nuIovFIb0GUEfG8 Q==;
X-CSE-ConnectionGUID: PplOiZ4RQOqgnf2SxYE5DA==
X-CSE-MsgGUID: 2kzyGwsyQBSYgpbHSryQKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56810519"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56810519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 08:58:56 -0700
X-CSE-ConnectionGUID: VwIWChMrT8Gb8/4TCfaNwA==
X-CSE-MsgGUID: qfjtqE4BSVO3tD8GhD3Cvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129487188"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 10 Apr 2025 08:58:55 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 3/4] drm/xe/guc: Add GuC log LFD format support
Date: Thu, 10 Apr 2025 08:58:52 -0700
Message-Id: <20250410155853.574830-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410155853.574830-1-zhanjun.dong@intel.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
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

Add support to output GuC log in LFD format.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 344 +++++++++++++++++++++++++++++++-
 1 file changed, 342 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index df849a0ee7e5..7cdf6bf238f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -7,8 +7,10 @@
 
 #include <linux/fault-inject.h>
 
+#include <linux/utsname.h>
 #include <drm/drm_managed.h>
 
+#include "abi/guc_log_lfd_abi.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
@@ -19,6 +21,57 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
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
+static struct guc_log_buffer_entry_list {
+	u32 offset;
+	u32 rd_ptr;
+	u32 wr_ptr;
+	u32 buf_size;
+} entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
+
+static const struct guc_logfile_lfd_t default_guc_logfile_lfd = {
+	.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_LFD_T_MAGIC, GUC_LOGFILE_LFD_MAGIC)
+};
+
+static const struct guc_logfile_t default_guc_logfile = {
+	.magic = LFD_DRIVER_KEY_STREAMING,
+	.version.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_T_MINOR_VERSION,
+					GUC_LOG_FILE_FORMAT_VERSION_MINOR) |
+		       FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_T_MAJOR_VERSION,
+					GUC_LOG_FILE_FORMAT_VERSION_MAJOR)
+};
+
+struct guc_log_init_config_save_t {
+	/*
+	 * Array of init config KLVs.
+	 * Range from GUC_LOG_LIC_TYPE_FIRST to
+	 * GUC_LOG_LIC_TYPE_LAST
+	 */
+	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST];
+	struct guc_log_buffer_state log_buf_state;
+};
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -216,21 +269,308 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static int xe_guc_log_add_lfd_header(char *buf, int buf_size)
+{
+	int len;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_t))
+		return -ENOMEM;
+
+	len = sizeof(default_guc_logfile_lfd);
+	memcpy(buf, &default_guc_logfile_lfd, len);
+
+	return len;
+}
+
+static int xe_guc_log_add_payload(char *buf, int buf_size, u32 data_len, void *data)
+{
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
+		return -ENOMEM;
+
+	/* make length DW aligned */
+	lfd->desc_dw_size = data_len / sizeof(u32);
+	if (data_len / sizeof(u32))
+		lfd->desc_dw_size++;
+
+	if (lfd->data != data)
+		memcpy(lfd->data, data, data_len);
+
+	return lfd->desc_dw_size * 4;
+}
+
+static int xe_guc_log_add_typed_payload(char *buf, int buf_size, u32 type,
+					u32 data_len, void *data)
+{
+	int len;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
+		return -ENOMEM;
+
+	len = xe_guc_log_add_lfd_header(buf, buf_size);
+	lfd->dw0 |= FIELD_PREP(GUC_LOGFILE_LFD_T_DESC_TYPE, type);
+	len += xe_guc_log_add_payload(buf, buf_size, data_len, data);
+
+	return len;
+}
+
+static int xe_guc_log_add_os_id(char *buf, int buf_size, u32 id)
+{
+	char *version;
+	int info_len;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+	struct guc_lfd_data_os_id_t *os_id = (struct guc_lfd_data_os_id_t *)lfd->data;
+
+	os_id->os_id = id;
+
+	version = init_utsname()->release;
+	info_len = strlen(version) + 1;
+
+	if (buf_size < sizeof(struct guc_logfile_lfd_t) + info_len)
+		return -ENOMEM;
+
+	strscpy(os_id->build_version, version, info_len);
+
+	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
+					   info_len + sizeof(*os_id), os_id);
+}
+
+static int
+xe_guc_log_add_log_event(char *buf, int buf_size, char *log_bin,
+			 struct guc_log_init_config_save_t *config)
+{
+	int len;
+	char *data;
+	u32 data_len;
+	struct guc_lfd_data_log_events_buf_t *events_buf;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+	struct guc_log_buffer_entry_list *entry;
+
+	entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
+
+	/* Skip empty log */
+	if (entry->rd_ptr == entry->wr_ptr)
+		return 0;
+
+	len = xe_guc_log_add_lfd_header(buf, buf_size);
+	if (len < 0)
+		return len;
+
+	buf_size -= len;
+	lfd = (struct guc_logfile_lfd_t *)buf;
+
+	lfd->dw0 |= FIELD_PREP(GUC_LOGFILE_LFD_T_DESC_TYPE, GUC_LFD_TYPE_LOG_EVENTS_BUFFER);
+	events_buf = (struct guc_lfd_data_log_events_buf_t *)&lfd->data;
+	events_buf->log_events_format_version = config->log_buf_state.version;
+
+	data = log_bin + entry->offset + entry->rd_ptr;
+	if (entry->rd_ptr < entry->wr_ptr) {
+		data_len = entry->wr_ptr - entry->rd_ptr;
+		if (data_len <= buf_size) {
+			memcpy(events_buf->log_format_buf, data, data_len);
+			buf_size -= data_len;
+		} else {
+			return -ENOMEM;
+		}
+	} else {
+		int cp_len;
+
+		/* Copy rd to buf end 1st */
+		data_len = entry->buf_size - entry->rd_ptr;
+		if (data_len <= buf_size) {
+			memcpy(events_buf->log_format_buf, data, data_len);
+			buf_size -= data_len;
+		} else {
+			return -ENOMEM;
+		}
+
+		/* Copy buf start to wr */
+		data = &log_bin[entry->offset];
+		cp_len = entry->wr_ptr;
+		if (cp_len <= buf_size - cp_len)
+			memcpy(&events_buf->log_format_buf[data_len / sizeof(u32)], data, cp_len);
+		else
+			return -ENOMEM;
+		data_len += cp_len;
+	}
+
+	/* make length DW aligned */
+	lfd->desc_dw_size = data_len / sizeof(u32);
+	if (data_len % sizeof(u32))
+		lfd->desc_dw_size++;
+
+	/* Addup log_events_format_version size */
+	lfd->desc_dw_size++;
+
+	return len + lfd->desc_dw_size * sizeof(u32);
+}
+
+static inline int lic_type_to_KLV_index(u32 lic_type)
+{
+	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type >= GUC_LOG_LIC_TYPE_LAST);
+
+	return lic_type - GUC_LOG_LIC_TYPE_FIRST;
+}
+
+static int xe_guc_log_add_klv(char *buf, int size, u32 lic_type,
+			      struct guc_log_init_config_save_t *config)
+{
+	/* LFD type must matches LIC type */
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_FW_VERSION != (int)GUC_LOG_LIC_TYPE_GUC_SW_VERSION);
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_GUC_DEVICE_ID != (int)GUC_LOG_LIC_TYPE_GUC_DEVICE_ID);
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_TSC_FREQUENCY != (int)GUC_LOG_LIC_TYPE_TSC_FREQUENCY);
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_GMD_ID != (int)GUC_LOG_LIC_TYPE_GMD_ID);
+	BUILD_BUG_ON((int)GUC_LFD_TYPE_BUILD_PLATFORM_ID !=
+		     (int)GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID);
+
+	return xe_guc_log_add_typed_payload(buf, size, lic_type, sizeof(u32),
+				 &config->KLV[lic_type_to_KLV_index(lic_type)]);
+}
+
+static void xe_guc_log_loop_log_init(struct guc_log_init_config_t *init,
+				     struct guc_log_init_config_save_t *config)
+{
+	int i;
+	struct guc_klv_generic_t *p = (struct guc_klv_generic_t *)init->lic_data;
+
+	for (i = 0; i < init->lic_dw_size;) {
+		if (p->key < GUC_LOG_LIC_TYPE_GUC_SW_VERSION || p->key >= GUC_LOG_LIC_TYPE_LAST)
+			break;
+		config->KLV[lic_type_to_KLV_index(p->key)] = p->value[0];
+		i += p->length + 1; /* +1DW to include kev(u16) and len(u16) */
+		p = (struct guc_klv_generic_t *)((u32 *)p + p->length + 1);
+	}
+}
+
+static void xe_guc_log_load_log_buffer(u32 *guc_log, struct guc_log_init_config_save_t *config)
+{
+	int i = 0;
+	u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
+	struct guc_log_buffer_state *p = (struct guc_log_buffer_state *)guc_log;
+
+	memset(entry_list, 0, sizeof(entry_list));
+	while (p) {
+		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
+			if (p->marker[0] == entry_markers[i].key[0] &&
+			    p->marker[1] == entry_markers[i].key[1]) {
+				entry_list[i].offset = offset;
+				entry_list[i].rd_ptr = p->read_ptr;
+				entry_list[i].wr_ptr = p->write_ptr;
+				entry_list[i].buf_size = p->size;
+
+				if (i == GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG)
+					config->log_buf_state = *p;
+
+				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
+					offset += p->size;
+					p++;
+				} else {
+					/* Load log init config */
+					xe_guc_log_loop_log_init((struct guc_log_init_config_t *)p,
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
+static int xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_bin,
+				      struct xe_guc_log *log,
+				      struct guc_log_init_config_save_t *config)
+{
+	int index = 0, len = 0;
+	char *char_bin = (char *)guc_log_bin;
+	struct guc_logfile_t *guc_logfile;
+
+	if (size < sizeof(struct guc_logfile_t))
+		return -ENOMEM;
+
+	guc_logfile = (struct guc_logfile_t *)buf;
+	*guc_logfile = default_guc_logfile;
+	index = offsetof(struct guc_logfile_t, lfd_stream);
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_FW_VERSION, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_GUC_DEVICE_ID, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_TSC_FREQUENCY, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_GMD_ID, config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID,
+				 config);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_os_id(&buf[index], size - index, GUC_LFD_OS_TYPE_OSID_LIN);
+	if (len < 0)
+		return len;
+	index += len;
+
+	len = xe_guc_log_add_log_event(&buf[index], size - index, char_bin, config);
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
 	size_t remain;
 	int i;
+	struct guc_log_init_config_save_t init_config;
 
 	if (!snapshot)
 		return;
 
 	remain = snapshot->size;
+	if (!remain)
+		return;
+
+	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
+	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
+	drm_printf(p, "Log level: %u\n", snapshot->level);
+
 	for (i = 0; i < snapshot->num_chunks; i++) {
+		int len = 0;
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
-
-		/* To be add: Output snapshot in LFD format */
+		const char *prefix = i ? NULL : "[LOG].data";
+		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
+		char *lfd_buf = kzalloc(size, GFP_KERNEL);
+
+		/* load from log bin */
+		xe_guc_log_load_log_buffer(snapshot->copy[i], &init_config);
+		/* Output to LFD format */
+		len = xe_guc_log_save_to_lfd_buf(lfd_buf, size, snapshot->copy[i], log,
+						 &init_config);
+		if (len > 0)
+			xe_print_blob_ascii85(p, prefix, suffix, lfd_buf, 0, (size_t)len);
+
+		kfree(lfd_buf);
+		XE_WARN_ON(len <= 0);
 
 		remain -= size;
 	}
-- 
2.34.1

