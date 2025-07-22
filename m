Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD59C87FC8
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 01:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF2610E5BE;
	Tue, 22 Jul 2025 01:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhdwyYQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E2210E5BA
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 01:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753148197; x=1784684197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sXK+plBNAzGyxCIkLfqquY0TRYnFSFE50HoD9YYcVlE=;
 b=WhdwyYQtO1NjyaRZasDzDfwBUzNe50eF/5Y5zbL/BVhDy/YIQvW3R1Wj
 d/HTBAOXagGqLQFGSLcDqeMi/nGMHHtZPtByI1grhl8288FMnDktYT6lQ
 +zEqjT1FjOOO5HVo+eIvYgYUgNmzQ5Gctcsnq4SFL+akZxr6hhqM/YXQR
 3MnGZeHTb4rlX3HHOib5T6/aU3wZcI8ltyGRss+7v1lOE2+gFbguBouIb
 1f3Pk3ORcWSjv7gUlgmRrUudbdwfVOuSh/2ADKw0rAiCF1vcf33wdpgKl
 SfCglfmS1frH4UdnayNk9+MD97fL783NSkYivu6b9HFLwIPooUWFezHqu g==;
X-CSE-ConnectionGUID: 3+x6v0jeSkyH88/mf5froA==
X-CSE-MsgGUID: vGVH5TZ2RnGMM0MfMMe4KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54596792"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="54596792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 18:35:57 -0700
X-CSE-ConnectionGUID: xo8fSD0CQWaQbuml7NpNsw==
X-CSE-MsgGUID: epO9hutmTASrdA/yOdJZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="163225890"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa003.jf.intel.com with ESMTP; 21 Jul 2025 18:35:56 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 5/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
Date: Mon, 21 Jul 2025 21:35:52 -0400
Message-Id: <20250722013553.1266218-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722013553.1266218-1-zhanjun.dong@intel.com>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
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
index 609a9fd5ba0c..a8910211c579 100644
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
+			 struct guc_lic_save *config)
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
 	struct guc_lic_save config;
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

