Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807C3C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 21:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453AD10E0B9;
	Wed, 23 Apr 2025 21:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDm10Azg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5384210E0B9
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745445506; x=1776981506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sR73lAIson2Nz/yrXdktT4Qnc5TRTSuumqZgfSX4tuc=;
 b=mDm10AzgqELSIvgOE/vQGAEBkv0SariEBs+zK3C2x4chuzbnMjqAUz4A
 qcas9qG0tk9iiFpYW+0UrmQVCJmwWdimsTUjX5eea1NOkeR7KbdYlIacJ
 1NxzNVK95NgCvekubw+gheGxXTF+3OpO8AJ27kfXzoSxajIAL7uYkjxdI
 KFR2VTIIjdvH9ruuK3szq4/vkSuuQyn5nrGEU3JtIxaSc+XZLO8V5lUt6
 52zVlT0s590m/CSKYhGQ3a/QfdOTwfhWO7sTI7ftPDizBc6NZKXSZIyIB
 miaLK0H8XpCzfEcIVJKg7u0foETVvP76I9paKt1s6NdGhou1lAcOd1n9c w==;
X-CSE-ConnectionGUID: tbkpEsNUT7adYASi7X1cSA==
X-CSE-MsgGUID: LX+te/SZTt2Z3Hee9fwegg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47073117"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47073117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:58:23 -0700
X-CSE-ConnectionGUID: cHY1SexMTnKofGpRetbuMQ==
X-CSE-MsgGUID: N/y2+PaVTmqeMrxK57/lRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136507657"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 14:58:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 5/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
Date: Wed, 23 Apr 2025 14:58:20 -0700
Message-Id: <20250423215821.3078428-6-zhanjun.dong@intel.com>
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

Add GuC log event buffer output in LFD format.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 87 +++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 3fdf3823e2d0..5aa9b9dbe3f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -33,6 +33,7 @@ struct guc_log_buffer_entry_list {
 };
 
 struct guc_log_init_config_save {
+	u32 version;
 	/*
 	 * Array of init config KLVs.
 	 * Range from GUC_LOG_LIC_TYPE_FIRST to GUC_LOG_LIC_TYPE_LAST
@@ -336,7 +337,6 @@ static int xe_guc_log_add_os_id(void *buf, int buf_size, u32 id)
 		return -ENOMEM;
 
 	strscpy(os_id->build_version, version, info_len);
-
 	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
 					   info_len + sizeof(*os_id), os_id);
 }
@@ -366,6 +366,7 @@ static void xe_guc_log_load_lic(void *guc_log, struct guc_log_init_config_save *
 	int i = 0;
 
 	memset(config, 0, sizeof(struct guc_log_init_config_save));
+	config->version = p->version;
 	while (p) {
 		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
 			if (p->marker[0] == entry_markers[i].key[0] &&
@@ -380,8 +381,7 @@ static void xe_guc_log_load_lic(void *guc_log, struct guc_log_init_config_save *
 					p++;
 				} else {
 					/* Load log init config */
-					xe_guc_log_loop_log_init((void *)p,
-								 config);
+					xe_guc_log_loop_log_init((void *)p, config);
 
 					/* Init config is the last */
 					return;
@@ -417,6 +417,86 @@ xe_guc_log_output_lfd_init(char *buf, struct xe_guc_log_snapshot *snapshot,
 	return index;
 }
 
+static void
+xe_guc_log_print_over_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+			     u32 from, u32 to)
+{
+	int chunk_from = from % GUC_LOG_CHUNK_SIZE;
+	int chunk_id = from / GUC_LOG_CHUNK_SIZE;
+	int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
+	int chunk_to = to % GUC_LOG_CHUNK_SIZE;
+	int pos = from;
+
+	do {
+		size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : chunk_to) - chunk_from;
+
+		xe_print_blob_ascii85(p, NULL, 0, snapshot->copy[chunk_id], chunk_from, size);
+		pos += size;
+		chunk_id++;
+		chunk_from = 0;
+	} while (pos < to);
+}
+
+static void
+xe_guc_log_lfd_print_from_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+				 struct guc_log_buffer_entry_list *entry)
+{
+	/* Output data from guc log chunks directly */
+	if (entry->rd_ptr < entry->wr_ptr) {
+		xe_guc_log_print_over_chunks(p, snapshot,
+					     entry->offset + entry->rd_ptr,
+					     entry->offset + entry->wr_ptr);
+	} else {
+		/* print from rd to buf end 1st */
+		xe_guc_log_print_over_chunks(p, snapshot,
+					     entry->offset + entry->rd_ptr,
+					     entry->offset + entry->buf_size);
+
+		/* print from buf start to wr */
+		xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
+					     entry->offset + entry->wr_ptr);
+	}
+}
+
+static inline int
+xe_guc_log_add_log_event(struct drm_printer *p, char *buf, struct xe_guc_log_snapshot *snapshot,
+			 struct guc_log_init_config_save *config)
+{
+	struct guc_logfile_lfd_data *lfd = (void *)buf;
+	struct guc_lfd_data_log_events_buf *events_buf;
+	struct guc_log_buffer_entry_list *entry;
+	u32 data_len;
+	int index;
+
+	memset(buf, 0, GUC_LOG_CHUNK_SIZE);
+	entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
+
+	/* Skip empty log */
+	if (entry->rd_ptr == entry->wr_ptr)
+		return 0;
+
+	index = xe_guc_log_add_lfd_header(buf, GUC_LOG_CHUNK_SIZE);
+	lfd->dw0 |= FIELD_PREP(GUC_LOGFILE_LFD_DESC_TYPE, GUC_LFD_TYPE_LOG_EVENTS_BUFFER);
+	events_buf = (void *)&lfd->data;
+	events_buf->log_events_format_version = config->version;
+
+	/* Adjust to log_format_buf */
+	data_len = offsetof(struct guc_lfd_data_log_events_buf, log_format_buf);
+	index += data_len;
+
+	/* Calculate data length */
+	data_len += (entry->wr_ptr + entry->buf_size - entry->rd_ptr) % entry->buf_size;
+	/* make length u32 aligned */
+	lfd->desc_dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
+
+	/* Output GUC_LFD_TYPE_LOG_EVENTS_BUFFER header */
+	xe_print_blob_ascii85(p, NULL, 0, buf, 0, (size_t)index);
+
+	xe_guc_log_lfd_print_from_chunks(p, snapshot, entry);
+	/* log event buffer content did not use buf, exclude from size count */
+	return index;
+}
+
 static void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
 			      struct xe_guc_log *log)
@@ -441,6 +521,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 		goto lfd_out;
 
 	xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, (size_t)index);
+	index = xe_guc_log_add_log_event(p, lfd_buf, snapshot, &config);
 
 lfd_out:
 	drm_printf(p, "\n");
-- 
2.34.1

