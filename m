Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA75D116F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 17:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3E610E835;
	Thu, 27 Nov 2025 17:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmFJcrsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7610410E835
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764263283; x=1795799283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDOO8eey34hA1GgjR+142qQZiYb0a13plbZji4r1YG4=;
 b=PmFJcrsKDOC6oTP3OOhy0xUIT/ccIrbffKqNFeiTDwkdJF5uTsGTYxRo
 y7D+Xy6pTLotrlR/eC9vVmZDANDrX7fUU/WKDHHvAL7TehurWg5Dz7c3J
 6wNqfwv/RLEWj5UVI+WmnHiOXpPCM3G897drV8C4irSDiVGFgrmb70B2K
 RLvpKuB7V8UUQLyjEKPa59wPWQ6krcE6LuqaT53roSJYTVq2fqvlCIXlV
 BI630NFgBev3lwMZd83KsTbabeae40BmtntZrpnTLKg7s6IsgkxxZt4Nb
 TH85nsGM4WHYgY4MBjx8eQgvOD+09JTvTReu/KYikqonI2+wUiFuDJBwz g==;
X-CSE-ConnectionGUID: 7FclefLdTDiQLKiRt6nV5Q==
X-CSE-MsgGUID: 7aHI6UHHT5yrYX+ghkql7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66344055"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66344055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:08:02 -0800
X-CSE-ConnectionGUID: kbJRokMgSyewRN3txJujsw==
X-CSE-MsgGUID: vgPhAfzfQwe3RmpR4gEuMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="230554376"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 09:08:02 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 5/6] drm/xe/guc: Only add GuC crash dump if available
Date: Thu, 27 Nov 2025 12:07:58 -0500
Message-Id: <20251127170759.2620994-6-zhanjun.dong@intel.com>
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

Add GuC crash dump data empty check. LFD will only include crash dump
section when data is not empty.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 51c54d2a49fd..40c9e812e9d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -498,6 +498,50 @@ xe_guc_log_add_log_event(struct drm_printer *p, struct xe_guc_log_snapshot *snap
 	return size;
 }
 
+static int
+xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
+			  struct guc_lic_save *config)
+{
+	struct guc_log_buffer_entry_list *entry;
+	int chunk_from, chunk_id;
+	int from, to, i;
+	size_t size = 0;
+	u32 *buf32;
+
+	entry = &config->entry[GUC_LOG_TYPE_CRASH_DUMP];
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
+	buf32 = snapshot->copy[chunk_id] + chunk_from;
+
+	for (i = 0; i < entry->buf_size / sizeof(u32); i++)
+		if (buf32[i])
+			break;
+
+	/* Buffer has non-zero data? */
+	if (i < entry->buf_size / sizeof(u32)) {
+		struct guc_lfd_data lfd;
+
+		size = xe_guc_log_add_lfd_header(&lfd);
+		lfd.header |= FIELD_PREP(GUC_LFD_DATA_HEADER_MASK_TYPE, GUC_LFD_TYPE_FW_CRASH_DUMP);
+		/* Calculate data length */
+		lfd.data_count = DIV_ROUND_UP(entry->buf_size, sizeof(u32));
+		/* Output GUC_LFD_TYPE_FW_CRASH_DUMP header */
+		lfd_output_binary(p, (char *)&lfd, size);
+
+		/* rd/wr ptr is not used for crash dump */
+		xe_guc_log_print_chunks(p, snapshot, from, to);
+	}
+	return size;
+}
+
 void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
 void
@@ -527,6 +571,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 		return;
 
 	xe_guc_log_add_log_event(p, snapshot, &config);
+	xe_guc_log_add_crash_dump(p, snapshot, &config);
 }
 
 /**
-- 
2.34.1

