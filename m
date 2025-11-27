Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36536D116F9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 17:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF70210E83D;
	Thu, 27 Nov 2025 17:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2HrbNba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598CC10E834
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764263282; x=1795799282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=64lG+KMnJX5AMb4SpshmF1Xm+Y2c6+KRf8Fmk+D/Dro=;
 b=j2HrbNbaXRmdxtO1C70tkBAbMck/rBL6JDDgltGl1kiNXmS+xCmCc31V
 ZnvMxgeL1rWFo5tG2RU6ujK/ZlfTRKMelRPQ9ZJ+CfIC8ejx3FaumR/TA
 6eicaz3rRAYGTDSH4bihujtDU0SOkZwhHi3EfOMiIkj20bQsmwAHRnJKw
 0+pbJdJqxcWbIfXGMKrX9o3oVKfSCRNjG/3Qa0agfLt1dzLmMFIq1Oxls
 Z8cg/i/AzB0sYKzdUSjGvZhlnPM6KbB6J9nEi/0b9wnjvmkoe+ZyWVExn
 HBBgnxhTIZmi6hIx64WbMeQWe/0PxhKDwttuF7xIL3XxLyEueSFwd4kbn A==;
X-CSE-ConnectionGUID: z9LzhuEaS76UKMij/LDIbw==
X-CSE-MsgGUID: QLlgYJ49QpCeDU+t2yPWKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66344054"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66344054"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:08:02 -0800
X-CSE-ConnectionGUID: W3W1CqQ9RT6fESboz9r4kg==
X-CSE-MsgGUID: /rXrTiAsT2W8aHVzQ4I0Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="230554372"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 09:08:02 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 4/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
Date: Thu, 27 Nov 2025 12:07:57 -0500
Message-Id: <20251127170759.2620994-5-zhanjun.dong@intel.com>
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

Add GuC log event buffer output in LFD format.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 77 ++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 6e840f1abe4e..51c54d2a49fd 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -428,6 +428,76 @@ xe_guc_log_output_lfd_init(struct drm_printer *p, struct xe_guc_log_snapshot *sn
 	return size;
 }
 
+static void
+xe_guc_log_print_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+			u32 from, u32 to)
+{
+	int chunk_from = from % GUC_LOG_CHUNK_SIZE;
+	int chunk_id = from / GUC_LOG_CHUNK_SIZE;
+	int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
+	int chunk_to = to % GUC_LOG_CHUNK_SIZE;
+	int pos = from;
+
+	do {
+		size_t size = (to_chunk_id == chunk_id ? chunk_to : GUC_LOG_CHUNK_SIZE) -
+			      chunk_from;
+
+		lfd_output_binary(p, snapshot->copy[chunk_id] + chunk_from, size);
+		pos += size;
+		chunk_id++;
+		chunk_from = 0;
+	} while (pos < to);
+}
+
+static inline int
+xe_guc_log_add_log_event(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+			 struct guc_lic_save *config)
+{
+	size_t size;
+	u32 data_len, section_len;
+	struct guc_lfd_data lfd;
+	struct guc_log_buffer_entry_list *entry;
+	struct guc_lfd_data_log_events_buf events_buf;
+
+	entry = &config->entry[GUC_LOG_TYPE_EVENT_DATA];
+
+	/* Skip empty log */
+	if (entry->rd_ptr == entry->wr_ptr)
+		return 0;
+
+	size = xe_guc_log_add_lfd_header(&lfd);
+	lfd.header |= FIELD_PREP(GUC_LFD_DATA_HEADER_MASK_TYPE, GUC_LFD_TYPE_LOG_EVENTS_BUFFER);
+	events_buf.log_events_format_version = config->version;
+
+	/* Adjust to log_format_buf */
+	section_len = offsetof(struct guc_lfd_data_log_events_buf, log_event);
+	data_len = section_len;
+
+	/* Calculate data length */
+	data_len += entry->rd_ptr < entry->wr_ptr ? (entry->wr_ptr - entry->rd_ptr) :
+		(entry->wr_ptr + entry->wrap_offset - entry->rd_ptr);
+	/* make length u32 aligned */
+	lfd.data_count = DIV_ROUND_UP(data_len, sizeof(u32));
+
+	/* Output GUC_LFD_TYPE_LOG_EVENTS_BUFFER header */
+	lfd_output_binary(p, (char *)&lfd, size);
+	lfd_output_binary(p, (char *)&events_buf, section_len);
+
+	/* Output data from guc log chunks directly */
+	if (entry->rd_ptr < entry->wr_ptr) {
+		xe_guc_log_print_chunks(p, snapshot, entry->offset + entry->rd_ptr,
+					entry->offset + entry->wr_ptr);
+	} else {
+		/* 1st, print from rd to wrap offset */
+		xe_guc_log_print_chunks(p, snapshot, entry->offset + entry->rd_ptr,
+					entry->offset + entry->wrap_offset);
+
+		/* 2nd, print from buf start to wr */
+		xe_guc_log_print_chunks(p, snapshot, entry->offset, entry->offset + entry->wr_ptr);
+	}
+	return size;
+}
+
 void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
 void
@@ -435,6 +505,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 {
 	struct guc_lfd_file_header header;
 	struct guc_lic_save config;
+	size_t size;
 
 	if (!snapshot || !snapshot->size)
 		return;
@@ -451,7 +522,11 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 
 	/* Output LFD stream */
 	xe_guc_log_load_lic(snapshot->copy[0], &config);
-	xe_guc_log_output_lfd_init(p, snapshot, &config);
+	size = xe_guc_log_output_lfd_init(p, snapshot, &config);
+	if (!size)
+		return;
+
+	xe_guc_log_add_log_event(p, snapshot, &config);
 }
 
 /**
-- 
2.34.1

