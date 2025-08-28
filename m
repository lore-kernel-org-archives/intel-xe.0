Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656BACA0FF9
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 17:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2855710EA6A;
	Thu, 28 Aug 2025 17:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITTKuN6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2476E10EA65
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756402922; x=1787938922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wz2fPh8OjFeR7xhVdE3bEJEzF/35Yf98CojL2MUzfIk=;
 b=ITTKuN6CZpkP3pc4ctAMgj9VaxD/epkdEVCOM/wjbC/DIbnfwHS1n+uP
 DXujJ/RVlwCUN7F2sWgLM1LURRgRcl7HuBAIDFQPI7Gw9UysYarJntQzZ
 6fxiS1G+Jbf8YQ0VCjyRryG5j+Ax9yns+5gz7jvU3OUO3TiZw5IqA61cC
 x/vpK8WTxcXq++BFAlMnxgVRYWDT9k2Slu8mx46FHdI+be+2wqlJ4TA0U
 BOt0Bg1aVwaOs8qYRGnZbWJ2mYinFyWeLqr1k3Ldeu99NGGsT5lrWZmte
 gQm2AtLaLjDRAEGc7wCnNcUpJBS/s7ygkvp7c6Pz+YiMGJ3Fo9F2sUXdT g==;
X-CSE-ConnectionGUID: OAnrSXWPS2O9xEOY2XUtSQ==
X-CSE-MsgGUID: BkzGZ/XXT/W1u4vndQHHJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84085134"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="84085134"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:42:02 -0700
X-CSE-ConnectionGUID: /br1EaftSSSLUYVF1EF7vg==
X-CSE-MsgGUID: n1YPy13SQz+A21V2S+YWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="207317131"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa001.jf.intel.com with ESMTP; 28 Aug 2025 10:42:01 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v7 4/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
Date: Thu, 28 Aug 2025 13:41:57 -0400
Message-Id: <20250828174159.1232994-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828174159.1232994-1-zhanjun.dong@intel.com>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_log.c | 76 ++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 0648dd50de46..3d4a49b77840 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -455,6 +455,75 @@ xe_guc_log_output_lfd_init(struct drm_printer *p, struct xe_guc_log_snapshot *sn
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
+		size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : chunk_to) - chunk_from;
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
+	entry = &config->entry[GUC_LOG_BUFFER_DEBUG];
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
@@ -462,6 +531,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 {
 	struct guc_lfd_file_header header;
 	struct guc_lic_save config;
+	size_t size;
 
 	if (!snapshot || !snapshot->size)
 		return;
@@ -478,7 +548,11 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 
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

