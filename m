Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C639EC369AA
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 15:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792BE10E9FA;
	Thu, 10 Apr 2025 15:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duxKbMmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8959A10E9F9
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744300736; x=1775836736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QaUd3jP6TltcigQB4KdZJoiUi0VyX610Pvq7AamFu78=;
 b=duxKbMmZs7lskQL+9qNsLNaCEKJr8zY/Wi1gopHFTBFUQ5Gu3bYH1Ohe
 6luamQp7CXJMTm0sfZ13toxLJ5SAZSp55BTTC09WiVq665MRuw9fJHfiE
 HEYD53v4/HmkrUs4oUp7od42lK7iyHxLtCojpvnQctDgIdtmyJmLK9diQ
 npt8sDDFx/tl2GUWKBNBETEHtLsnVmL8WhxhwGG6e1OT6HnIHkbK8cRxP
 4P9JfFFRJEGzfv99mWOdiXpXskMg0FTqqqSOv7NiZJg6gQp03xdYqlGk4
 vGWgS236QuzZxIglsxk/rFvQUei5aVOfAsX96gtHRBU1axDljQMHvMqPG A==;
X-CSE-ConnectionGUID: Ybg2wZJTRiauq4fKh9AozA==
X-CSE-MsgGUID: n0dYuVhyQ+i9+ED5TgpDLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56810520"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56810520"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 08:58:56 -0700
X-CSE-ConnectionGUID: DB8LoKw2RqaBWmsSUJZ8sA==
X-CSE-MsgGUID: XnQCe6tPR8++W4IAWO6vvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129487197"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 10 Apr 2025 08:58:55 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 4/4] drm/xe/guc: Only add GuC crash dump if available
Date: Thu, 10 Apr 2025 08:58:53 -0700
Message-Id: <20250410155853.574830-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410155853.574830-1-zhanjun.dong@intel.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_log.c | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 7cdf6bf238f3..1e5976a382be 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -407,6 +407,36 @@ xe_guc_log_add_log_event(char *buf, int buf_size, char *log_bin,
 	return len + lfd->desc_dw_size * sizeof(u32);
 }
 
+static int
+xe_guc_log_add_crash_dump(char *buf, int buf_size, char *log_bin,
+			  struct guc_log_init_config_save_t *config)
+{
+	int i, dw_size;
+	u32 *buf32;
+	struct guc_log_buffer_entry_list *entry;
+
+	entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
+
+	/* Skip empty log */
+	if (!entry->buf_size)
+		return 0;
+
+	buf32 = (u32 *)&log_bin[entry->offset];
+	dw_size = entry->buf_size / sizeof(u32);
+
+	/* Check if crash dump section are all zero */
+	for (i = 0; i < dw_size; i++)
+		if (buf32[i])
+			break;
+
+	/* Buffer has non-zero data? */
+	if (i < dw_size)
+		return xe_guc_log_add_typed_payload(buf, buf_size,
+						    GUC_LFD_TYPE_FW_CRASH_DUMP,
+						    entry->buf_size, buf32);
+	return 0;
+}
+
 static inline int lic_type_to_KLV_index(u32 lic_type)
 {
 	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type >= GUC_LOG_LIC_TYPE_LAST);
@@ -532,6 +562,11 @@ static int xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_bin,
 		return len;
 	index += len;
 
+	len = xe_guc_log_add_crash_dump(&buf[index], size - index, char_bin, config);
+	if (len < 0)
+		return len;
+	index += len;
+
 	return index;
 }
 
-- 
2.34.1

