Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E56D116F8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 17:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B178910E83B;
	Thu, 27 Nov 2025 17:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCHBT/rr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C18710E835
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764263282; x=1795799282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7+pgVe03q5U9VHoRqKE8bs02lGYxBqCQev6kfmfG23w=;
 b=BCHBT/rr5M1D3pWaq+Nd121O3oICdREfW78mjGxGdqnejH1XL2Xdqk4V
 4OyJcbXcEzmIn7fcn7bWo/R8r2cDTWsgu5/NGPW/ssVZk73VHDnBAaDuW
 GqN3z82s+Ers2g2QFKwam9kAJswxLCN/fiHCR61ug5RXqi5iLAmya4TAs
 yasOIqBto6lqALDEZ5qQLNUY6ECbYMFlnl8DD4WSRM+JudxIYohG8ge+s
 AjK6ZDxH4p1gASyryB2SXws4i9tjrXE0rMrhWdOXC1ZKLDqkbS+s2UD/b
 2yD8BVbPS6RwNcjkUuilxFXaJA4IRC8O8X4rhM7hH6/jrGhHdgW/33ean A==;
X-CSE-ConnectionGUID: Ixhubav8QUGSlIOYkjwDZw==
X-CSE-MsgGUID: S50qrkyYTK6FS/kI6Je/7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66344053"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66344053"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:08:02 -0800
X-CSE-ConnectionGUID: 2gDVGXtMQFKV2ERCtrEe8A==
X-CSE-MsgGUID: a7r0mtslS5m+7AbfuxHm8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="230554369"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 09:08:02 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v8 3/6] drm/xe/guc: Add GuC log init config in LFD format
Date: Thu, 27 Nov 2025 12:07:56 -0500
Message-Id: <20251127170759.2620994-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127170759.2620994-1-zhanjun.dong@intel.com>
References: <20251127170759.2620994-1-zhanjun.dong@intel.com>
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
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 267 +++++++++++++++++++++++++++++++-
 1 file changed, 266 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 086cd60628f3..6e840f1abe4e 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -7,8 +7,10 @@
 
 #include <linux/fault-inject.h>
 
+#include <linux/utsname.h>
 #include <drm/drm_managed.h>
 
+#include "abi/guc_lfd_abi.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
@@ -19,7 +21,76 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
-#define GUC_LOG_CHUNK_SIZE	SZ_2M
+#define GUC_LOG_CHUNK_SIZE			SZ_2M
+
+/* Magic keys define */
+#define GUC_LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
+#define GUC_LFD_LOG_BUFFER_MARKER_2		0xDEADFEED
+#define GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2	0x8086DEAD
+#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
+#define GUC_LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
+#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
+#define GUC_LFD_DATA_HEADER_MAGIC		0x8086
+
+/* LFD supported LIC type range */
+#define GUC_LIC_TYPE_FIRST			GUC_LIC_TYPE_GUC_SW_VERSION
+#define GUC_LIC_TYPE_LAST			GUC_LIC_TYPE_BUILD_PLATFORM_ID
+#define GUC_LFD_TYPE_FW_RANGE_FIRST		GUC_LFD_TYPE_FW_VERSION
+#define GUC_LFD_TYPE_FW_RANGE_LAST		GUC_LFD_TYPE_BUILD_PLATFORM_ID
+
+#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH	4096
+#define GUC_LOG_BUFFER_INIT_CONFIG		3
+
+struct guc_log_buffer_entry_list {
+	u32 offset;
+	u32 rd_ptr;
+	u32 wr_ptr;
+	u32 wrap_offset;
+	u32 buf_size;
+};
+
+struct guc_lic_save {
+	u32 version;
+	/*
+	 * Array of init config KLV values.
+	 * Range from GUC_LOG_LIC_TYPE_FIRST to GUC_LOG_LIC_TYPE_LAST
+	 */
+	u32 values[GUC_LIC_TYPE_LAST - GUC_LIC_TYPE_FIRST + 1];
+	struct guc_log_buffer_entry_list entry[GUC_LOG_BUFFER_INIT_CONFIG];
+};
+
+static struct guc_log_buffer_entry_markers {
+	u32 key[2];
+} const entry_markers[GUC_LOG_BUFFER_INIT_CONFIG + 1] = {
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
+		(FIELD_PREP_CONST(GUC_LIC_VERSION_MASK_MAJOR, GUC_LIC_VERSION_MAJOR) |
+		 FIELD_PREP_CONST(GUC_LIC_VERSION_MASK_MINOR, GUC_LIC_VERSION_MINOR))
+	}}
+};
+
+static struct guc_log_lic_lfd_map {
+	u32 lic;
+	u32 lfd;
+} const lic_lfd_type_map[] = {
+	{GUC_LIC_TYPE_GUC_SW_VERSION,		GUC_LFD_TYPE_FW_VERSION},
+	{GUC_LIC_TYPE_GUC_DEVICE_ID,		GUC_LFD_TYPE_GUC_DEVICE_ID},
+	{GUC_LIC_TYPE_TSC_FREQUENCY,		GUC_LFD_TYPE_TSC_FREQUENCY},
+	{GUC_LIC_TYPE_GMD_ID,			GUC_LFD_TYPE_GMD_ID},
+	{GUC_LIC_TYPE_BUILD_PLATFORM_ID,	GUC_LFD_TYPE_BUILD_PLATFORM_ID}
+};
 
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
@@ -189,6 +260,200 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
+{
+	seq_write(p->arg, buf, buf_size);
+}
+
+static inline int xe_guc_log_add_lfd_header(struct guc_lfd_data *lfd)
+{
+	lfd->header = FIELD_PREP_CONST(GUC_LFD_DATA_HEADER_MASK_MAGIC, GUC_LFD_DATA_HEADER_MAGIC);
+	return offsetof(struct guc_lfd_data, data);
+}
+
+static int xe_guc_log_add_typed_payload(struct drm_printer *p, u32 type,
+					u32 data_len, void *data)
+{
+	struct guc_lfd_data lfd;
+	int len;
+
+	len = xe_guc_log_add_lfd_header(&lfd);
+	lfd.header |= FIELD_PREP(GUC_LFD_DATA_HEADER_MASK_TYPE, type);
+	/* make length DW aligned */
+	lfd.data_count = DIV_ROUND_UP(data_len, sizeof(u32));
+	lfd_output_binary(p, (char *)&lfd, len);
+
+	lfd_output_binary(p, data, data_len);
+	len += lfd.data_count * sizeof(u32);
+
+	return len;
+}
+
+static inline int lic_type_to_index(u32 lic_type)
+{
+	XE_WARN_ON(lic_type < GUC_LIC_TYPE_FIRST || lic_type > GUC_LIC_TYPE_LAST);
+
+	return lic_type - GUC_LIC_TYPE_FIRST;
+}
+
+static inline int lfd_type_to_index(u32 lfd_type)
+{
+	int i, lic_type = 0;
+
+	XE_WARN_ON(lfd_type < GUC_LFD_TYPE_FW_RANGE_FIRST || lfd_type > GUC_LFD_TYPE_FW_RANGE_LAST);
+
+	for (i = 0; i < ARRAY_SIZE(lic_lfd_type_map); i++)
+		if (lic_lfd_type_map[i].lfd == lfd_type)
+			lic_type = lic_lfd_type_map[i].lic;
+
+	/* If not found, lic_type_to_index will warning invalid type */
+	return lic_type_to_index(lic_type);
+}
+
+static int xe_guc_log_add_klv(struct drm_printer *p, u32 lfd_type,
+			      struct guc_lic_save *config)
+{
+	int klv_index = lfd_type_to_index(lfd_type);
+
+	return xe_guc_log_add_typed_payload(p, lfd_type, sizeof(u32), &config->values[klv_index]);
+}
+
+static int xe_guc_log_add_os_id(struct drm_printer *p, u32 id)
+{
+	struct guc_lfd_data_os_info os_id;
+	struct guc_lfd_data lfd;
+	int len, info_len, section_len;
+	char *version;
+	u32 blank = 0;
+
+	len = xe_guc_log_add_lfd_header(&lfd);
+	lfd.header |= FIELD_PREP(GUC_LFD_DATA_HEADER_MASK_TYPE, GUC_LFD_TYPE_OS_ID);
+
+	os_id.os_id = id;
+	section_len = offsetof(struct guc_lfd_data_os_info, build_version);
+
+	version = init_utsname()->release;
+	info_len = strlen(version);
+
+	/* make length DW aligned */
+	lfd.data_count = DIV_ROUND_UP(section_len + info_len, sizeof(u32));
+	lfd_output_binary(p, (char *)&lfd, len);
+	lfd_output_binary(p, (char *)&os_id, section_len);
+	lfd_output_binary(p, version, info_len);
+
+	/* Padding with 0 */
+	section_len = lfd.data_count * sizeof(u32) - section_len - info_len;
+	if (section_len)
+		lfd_output_binary(p, (char *)&blank, section_len);
+
+	len +=  lfd.data_count * sizeof(u32);
+	return len;
+}
+
+static void xe_guc_log_loop_log_init(struct guc_lic *init, struct guc_lic_save *config)
+{
+	struct guc_klv_generic_dw_t *p = (void *)init->data;
+	int i;
+
+	for (i = 0; i < init->data_count;) {
+		int klv_len = FIELD_GET(GUC_KLV_0_LEN, p->kl) + 1;
+		int key = FIELD_GET(GUC_KLV_0_KEY, p->kl);
+
+		if (key < GUC_LIC_TYPE_FIRST || key > GUC_LIC_TYPE_LAST) {
+			XE_WARN_ON(key < GUC_LIC_TYPE_FIRST || key > GUC_LIC_TYPE_LAST);
+			break;
+		}
+		config->values[lic_type_to_index(key)] = p->value;
+		i += klv_len + 1; /* Whole KLV structure length in dwords */
+		p = (void *)((u32 *)p + klv_len);
+	}
+}
+
+static int find_marker(u32 mark0, u32 mark1)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(entry_markers); i++)
+		if (mark0 == entry_markers[i].key[0] && mark1 == entry_markers[i].key[1])
+			return i;
+
+	return ARRAY_SIZE(entry_markers);
+}
+
+static void xe_guc_log_load_lic(void *guc_log, struct guc_lic_save *config)
+{
+	u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
+	struct guc_log_buffer_state *p = guc_log;
+
+	config->version = p->version;
+	while (p->marker[0]) {
+		int index;
+
+		index = find_marker(p->marker[0], p->marker[1]);
+
+		if (index < ARRAY_SIZE(entry_markers)) {
+			if (index == GUC_LOG_BUFFER_INIT_CONFIG) {
+				/* Load log init config */
+				xe_guc_log_loop_log_init((void *)p, config);
+
+				/* LIC structure is the last */
+				return;
+			}
+			config->entry[index].offset = offset;
+			config->entry[index].rd_ptr = p->read_ptr;
+			config->entry[index].wr_ptr = p->write_ptr;
+			config->entry[index].wrap_offset = p->wrap_offset;
+			config->entry[index].buf_size = p->size;
+		}
+		offset += p->size;
+		p++;
+	}
+}
+
+static int
+xe_guc_log_output_lfd_init(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+			   struct guc_lic_save *config)
+{
+	int type, len;
+	size_t size = 0;
+
+	/* FW required types */
+	for (type = GUC_LFD_TYPE_FW_RANGE_FIRST; type <= GUC_LFD_TYPE_FW_RANGE_LAST; type++)
+		size += xe_guc_log_add_klv(p, type, config);
+
+	/* KMD required type(s) */
+	len = xe_guc_log_add_os_id(p, GUC_LFD_OS_TYPE_OSID_LIN);
+	size += len;
+
+	return size;
+}
+
+void
+xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
+void
+xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
+{
+	struct guc_lfd_file_header header;
+	struct guc_lic_save config;
+
+	if (!snapshot || !snapshot->size)
+		return;
+
+	header.magic = GUC_LFD_DRIVER_KEY_STREAMING;
+	header.version = FIELD_PREP_CONST(GUC_LFD_FILE_HEADER_VERSION_MASK_MINOR,
+					  GUC_LFD_FORMAT_VERSION_MINOR) |
+			 FIELD_PREP_CONST(GUC_LFD_FILE_HEADER_VERSION_MASK_MAJOR,
+					  GUC_LFD_FORMAT_VERSION_MAJOR);
+
+	/* Output LFD file header */
+	lfd_output_binary(p, (char *)&header,
+			  offsetof(struct guc_lfd_file_header, stream));
+
+	/* Output LFD stream */
+	xe_guc_log_load_lic(snapshot->copy[0], &config);
+	xe_guc_log_output_lfd_init(p, snapshot, &config);
+}
+
 /**
  * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
  * @log: GuC log structure
-- 
2.34.1

