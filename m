Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89494C369D7
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 21:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E3B10E2CA;
	Wed, 23 Apr 2025 21:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqAXAT89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691EE10E2CA
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745445506; x=1776981506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B2rcm50YVMkQtPfQVOw18kvgl8mOiO3rESARbGhcA0I=;
 b=jqAXAT89lgEFnTxDueJRvjsue86xK+23EiNIHN+oMsten2HVR0V2nkLt
 jLwm5KCNaLcimP2GqUvgy3TsgUtWk+NUiEiRWZXAFitO/TbGO6mPUvlvi
 2xRWNbKoJxl66Utc17dVgiYO2xSsDqP8qz+5TZ2gxOAOFjeMpQnCSyfxB
 dRpZZuHz2W6WgNEb0YakC1iY+EhsJ8vwny8g82NfCSATVJBSCWW6Pjs3l
 ezmTe3wwngtdc4EZjSEp9CnuVFRaYP7gZkiOzeUDMXTouskEM4BTCwZzy
 XoZ87oARVvEEpdmbI7zJRW+NALyxY3UzUQn4w64sixm+OGcu6fHLr5u3u A==;
X-CSE-ConnectionGUID: JBvYNogGRYSxGhBFc8F1Ew==
X-CSE-MsgGUID: ieeZRWZQRea4/g+8PfiXHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47073118"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47073118"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:58:23 -0700
X-CSE-ConnectionGUID: bHDYpD9ITwive5LBgeLZeg==
X-CSE-MsgGUID: GZ4uLB/VTLK28qj1RifYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136507660"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 14:58:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 6/6] drm/xe/guc: Only add GuC crash dump if available
Date: Wed, 23 Apr 2025 14:58:21 -0700
Message-Id: <20250423215821.3078428-7-zhanjun.dong@intel.com>
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

Add GuC crash dump data empty check. LFD will only include crash dump
section when data is not empty.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 63 +++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 5aa9b9dbe3f3..6e48c1a42899 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -497,6 +497,64 @@ xe_guc_log_add_log_event(struct drm_printer *p, char *buf, struct xe_guc_log_sna
 	return index;
 }
 
+static int
+xe_guc_log_add_crash_dump(struct drm_printer *p, char *buf, struct xe_guc_log_snapshot *snapshot,
+			  struct guc_log_init_config_save *config)
+{
+	struct guc_log_buffer_entry_list *entry;
+	int chunk_from, chunk_id, to_chunk_id;
+	int pos, from, to, index = 0;
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
+		struct guc_logfile_lfd_data *lfd = (void *)buf;
+
+		memset(buf, 0, GUC_LOG_CHUNK_SIZE);
+		index = xe_guc_log_add_lfd_header(buf, GUC_LOG_CHUNK_SIZE);
+		lfd->dw0 |= FIELD_PREP(GUC_LOGFILE_LFD_DESC_TYPE, GUC_LFD_TYPE_FW_CRASH_DUMP);
+		/* Calculate data length */
+		lfd->desc_dw_size = DIV_ROUND_UP(entry->buf_size, sizeof(u32));
+		/* Output GUC_LFD_TYPE_FW_CRASH_DUMP header */
+		xe_print_blob_ascii85(p, NULL, 0, buf, 0, (size_t)index);
+
+		/* rd/wr ptr is not used for crash dump */
+		xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
+					     entry->offset + entry->buf_size);
+	}
+	return index;
+}
+
 static void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
 			      struct xe_guc_log *log)
@@ -521,7 +579,12 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 		goto lfd_out;
 
 	xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, (size_t)index);
+
 	index = xe_guc_log_add_log_event(p, lfd_buf, snapshot, &config);
+	if (index < 0)
+		goto lfd_out;
+
+	index = xe_guc_log_add_crash_dump(p, lfd_buf, snapshot, &config);
 
 lfd_out:
 	drm_printf(p, "\n");
-- 
2.34.1

