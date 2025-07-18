Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA26C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 23:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C389F10EA55;
	Fri, 18 Jul 2025 23:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJAfg3xb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263C10EA51
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 23:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752880346; x=1784416346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n3lpV86A1MFgOgvxNPHat5yYey+2qjDoH0SUsF1Jg4Y=;
 b=ZJAfg3xbTlLqHITeuZKRNG2QVPoK3YfCl6oGK6iO3IXUbrDq3W9BqWOP
 O0dUh13QxGTxYzeM2uPvcJ/cGMcJ+hy0N7n7uKPp8wc46vLrzRXCsMW+R
 eRedVmGzSWULYrz8YI8g3jimHwg7R7XoNDP4Kob38FzPup17iGJoQv7U7
 CUmmkFKfSLSd9BQrx0QGo55TH6qIstDaUACEMhaoFn2zavzTpLQaW26pH
 eGiQAERLVzggIiNnbVJWGknVoIg1Xd2y9GZ586G8JoYJlfdvKbIZBq9Di
 8SbuhEcEuFDjfJvciousNoyTtxZamyyWEUuCNm8De7nN8h2/tOFKBD151 w==;
X-CSE-ConnectionGUID: 9b7PLQuLSwuFapjF2m5OuQ==
X-CSE-MsgGUID: 42tOR3mATC66Z1CFYF6tvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58995571"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="58995571"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 16:12:25 -0700
X-CSE-ConnectionGUID: roR5wGAIQry2VslIWQvOSQ==
X-CSE-MsgGUID: 2rslgFAiQimF9nyOYzWf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="163949106"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 18 Jul 2025 16:12:25 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 5/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
Date: Fri, 18 Jul 2025 19:12:22 -0400
Message-Id: <20250718231223.670188-6-zhanjun.dong@intel.com>
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

Add GuC log event buffer output in LFD format.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 88 ++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 2258d73d9c24..e4ee67a9aa28 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -421,10 +421,92 @@ xe_guc_log_output_lfd_init(struct drm_printer *p, struct xe_guc_log_snapshot *sn
 	return size;
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
+xe_guc_log_add_log_event(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+			 struct guc_log_init_config_save *config)
+{
+	size_t size;
+	u32 data_len;
+	struct guc_lfd_data *lfd;
+	struct guc_log_buffer_entry_list *entry;
+	struct guc_lfd_data_log_events_buf *events_buf;
+	char buf[GUC_LFD_BUFFER_SIZE] = {0};
+
+	lfd = (void *)buf;
+	entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
+
+	/* Skip empty log */
+	if (entry->rd_ptr == entry->wr_ptr)
+		return 0;
+
+	size = xe_guc_log_add_lfd_header(buf, GUC_LFD_BUFFER_SIZE);
+	lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, GUC_LFD_TYPE_LOG_EVENTS_BUFFER);
+	events_buf = (void *)&lfd->data;
+	events_buf->log_events_format_version = config->version;
+
+	/* Adjust to log_format_buf */
+	data_len = offsetof(struct guc_lfd_data_log_events_buf, log_format_buf);
+	size += data_len;
+
+	/* Calculate data length */
+	data_len += (entry->wr_ptr + entry->buf_size - entry->rd_ptr) % entry->buf_size;
+	/* make length u32 aligned */
+	lfd->dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
+
+	/* Output GUC_LFD_TYPE_LOG_EVENTS_BUFFER header */
+	xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
+	xe_guc_log_lfd_print_from_chunks(p, snapshot, entry);
+
+	/* log event buffer content did not use buf, exclude from size count */
+	return size;
+}
+
 static void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
 {
 	struct guc_log_init_config_save config;
+	size_t size;
 
 	if (!snapshot || !snapshot->size)
 		return;
@@ -435,7 +517,11 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 
 	/* Output LFD stream */
 	xe_guc_log_load_lic(snapshot->copy[0], &config);
-	xe_guc_log_output_lfd_init(p, snapshot, &config);
+	size = xe_guc_log_output_lfd_init(p, snapshot, &config);
+	if (size < 0)
+		return;
+
+	xe_guc_log_add_log_event(p, snapshot, &config);
 }
 
 /**
-- 
2.34.1

