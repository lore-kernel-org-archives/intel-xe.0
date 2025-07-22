Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C059C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 01:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4E610E5BA;
	Tue, 22 Jul 2025 01:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lutxwsdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557310E5BD
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 01:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753148197; x=1784684197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=11iDJtqnUOrrCzKqC/9PBPex+ExdSwBE83hsYiHrDik=;
 b=LutxwsdpxLH4LUdULIq4R2SCgtE+wUztZB2dn/3XRwHYOvlMlXqoarzJ
 uNttleIV3szyyfTlYpUXMiD/hy96KTVhGtymDhAWVYymZjDar4RCdg2fT
 wDV0hLCdWxKRI3Q61Uc3MteBg6NlIB2YYZXRlT4r20oytTyjzpxmcRLPq
 J6+pBYJzl4xon2gj84cPHDoc9cR9u6W0Lj0qfAK5B7P565plcl5HnlCFF
 RzX1+tNxVbyOvh7Ik/2EJs1hj20ew0d3YoJYq1LpfPCnt8kGRMnN8Cxrb
 1ON511QDXxxD1u/nxyOufjNF4o1QEvzGiFPeMYRNOwl6WYephx4c4wF3e Q==;
X-CSE-ConnectionGUID: Y/OF3GK4S5WGo315Swu/uA==
X-CSE-MsgGUID: JMcmj4ZwT+2t/Zx8R7AvpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54596793"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="54596793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 18:35:57 -0700
X-CSE-ConnectionGUID: bEtKC1DWTcC3kI8gbGC7qQ==
X-CSE-MsgGUID: QHBL0vt4QOCQElAyaykZKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="163225893"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa003.jf.intel.com with ESMTP; 21 Jul 2025 18:35:56 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 6/6] drm/xe/guc: Only add GuC crash dump if available
Date: Mon, 21 Jul 2025 21:35:53 -0400
Message-Id: <20250722013553.1266218-7-zhanjun.dong@intel.com>
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

Add GuC crash dump data empty check. LFD will only include crash dump
section when data is not empty.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 60 +++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a8910211c579..f5f31f15e7e3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -502,6 +502,65 @@ xe_guc_log_add_log_event(struct drm_printer *p, struct xe_guc_log_snapshot *snap
 	return size;
 }
 
+static int
+xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+			  struct guc_lic_save *config)
+{
+	struct guc_log_buffer_entry_list *entry;
+	int chunk_from, chunk_id, to_chunk_id;
+	int pos, from, to;
+	size_t size = 0;
+	char buf[GUC_LFD_BUFFER_SIZE] = {0};
+
+	entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
+
+	/* Skip zero sized crash dump */
+	if (!entry->buf_size)
+		return 0;
+
+	/* Check if crash dump section are all zero */
+	from = entry->offset;
+	to = entry->offset + entry->buf_size;
+	chunk_from = from % GUC_LOG_CHUNK_SIZE;
+	chunk_id = from / GUC_LOG_CHUNK_SIZE;
+	to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
+	pos = from;
+
+	do {
+		size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : to) - chunk_from;
+		u32 *buf32 = snapshot->copy[chunk_id] + chunk_from;
+		int i;
+
+		for (i = 0; i < size / sizeof(u32); i++)
+			if (buf32[i])
+				break;
+		if (i < size / sizeof(u32)) {
+			pos += i * sizeof(u32) - chunk_from;
+			break;
+		}
+		pos += size;
+		chunk_id++;
+		chunk_from = 0;
+	} while (pos < to);
+
+	/* Buffer has non-zero data? */
+	if (pos < to) {
+		struct guc_lfd_data *lfd = (void *)buf;
+
+		size = xe_guc_log_add_lfd_header(buf, GUC_LFD_BUFFER_SIZE);
+		lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, GUC_LFD_TYPE_FW_CRASH_DUMP);
+		/* Calculate data length */
+		lfd->dw_size = DIV_ROUND_UP(entry->buf_size, sizeof(u32));
+		/* Output GUC_LFD_TYPE_FW_CRASH_DUMP header */
+		xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
+
+		/* rd/wr ptr is not used for crash dump */
+		xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
+					     entry->offset + entry->buf_size);
+	}
+	return size;
+}
+
 static void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
 {
@@ -522,6 +581,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 		return;
 
 	xe_guc_log_add_log_event(p, snapshot, &config);
+	xe_guc_log_add_crash_dump(p, snapshot, &config);
 }
 
 /**
-- 
2.34.1

