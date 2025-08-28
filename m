Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937EFCA0FF7
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 17:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF6410EA69;
	Thu, 28 Aug 2025 17:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpEgF/D/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA8210EA66
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756402922; x=1787938922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Rfu0F7ekvifS0miROTeRBtC21WdsZ8rme0zvAeQYCM=;
 b=lpEgF/D/xH5lzlqoMbuGZkvvr92XNXvw0JbTpLSF9/hLwU6TOorqEVZH
 qHEeknw70q1JwplgVMayqYRWmw19UtkiWC9E7W4odejPzCwulT4LlzKez
 7eMB3MHar0phKcQMA0e7nP0bO8ezvmYSl5mxLmY7L0PJzoThfHSZu4Nsq
 6lzUO4trm1tTOXDMT1sxG/QBoZqXiN7aZYJgkrJzwIaRve33DY2wtYD6z
 2T1tK7vv2dMZJJoXvNdUsctbn8DVaU8h2e3NBeticQzopYfBMeJtdGVP0
 JX3h7B0hma+GIyEKhe2ReFtgUvOdHS99DmuPEUA6AOSceql9P70a40W4z Q==;
X-CSE-ConnectionGUID: XZlZG1m9RDaF45duzlqw2Q==
X-CSE-MsgGUID: dKrAxJ4lR1qIbjDP92OPGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84085135"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="84085135"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:42:02 -0700
X-CSE-ConnectionGUID: 0EZp9wH+QSG18PU3E3IieQ==
X-CSE-MsgGUID: eF+kOQT2RraL/4heW5QlZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="207317135"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa001.jf.intel.com with ESMTP; 28 Aug 2025 10:42:01 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v7 5/6] drm/xe/guc: Only add GuC crash dump if available
Date: Thu, 28 Aug 2025 13:41:58 -0400
Message-Id: <20250828174159.1232994-6-zhanjun.dong@intel.com>
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

Add GuC crash dump data empty check. LFD will only include crash dump
section when data is not empty.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 3d4a49b77840..589975904153 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -524,6 +524,50 @@ xe_guc_log_add_log_event(struct drm_printer *p, struct xe_guc_log_snapshot *snap
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
+	entry = &config->entry[GUC_LOG_BUFFER_CRASH_DUMP];
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
@@ -553,6 +597,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 		return;
 
 	xe_guc_log_add_log_event(p, snapshot, &config);
+	xe_guc_log_add_crash_dump(p, snapshot, &config);
 }
 
 /**
-- 
2.34.1

