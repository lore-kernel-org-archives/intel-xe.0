Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF15E9270D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422810E431;
	Thu,  5 Oct 2023 15:31:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DD610E42C;
 Thu,  5 Oct 2023 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519903; x=1728055903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IJlcEGoZqsslX0124nOZYbw8mkYiqZB59LyMk7h/Jjc=;
 b=SxXaF0HUIMs2Om8uInDqyVw1i28uOb+G8gdJ79MdLojKQgx47yapHzEy
 JXHnr5Co1Xw36lZjzanydF1ev8slOnUl37OX991ngUJGX2ZizBsBIcxMP
 fM2TVZKBIBPmZVrk0imtdVaPPZ4io7ITC/cZAgt2+PEkbfFFznVin4uz9
 Td0iC2Jt4RkoJqWz9wOuicnwqoOpVwCH/Z3OZgo3Rcz+xigkEQSYwb1R4
 Ypejmo1iHPlJBfrhHLrZ+PRJQ/fMrLBglcKgA8Vj7o0DQKW7sO3Ycz4tS
 uTNvsETBLVsS3f0FKVZLwLBMPydYl3PcfAENUy+S3LelwAIqhYbTL2f8x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810925"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810925"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631313"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631313"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:10 +0100
Message-ID: <20231005153116.452319-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 06/12] lib/intel_pat: add helpers for
 common pat_index modes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For now just add uc, wt and wb for every platform. The wb mode should
always be at least 1way coherent, if messing around with system memory.
Also make non-matching platforms throw an error rather than trying to
inherit the modes from previous platforms since they will likely be
different.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/intel_pat.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_pat.h | 19 ++++++++++++
 lib/meson.build |  1 +
 3 files changed, 97 insertions(+)
 create mode 100644 lib/intel_pat.c
 create mode 100644 lib/intel_pat.h

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
new file mode 100644
index 000000000..4d19d57ea
--- /dev/null
+++ b/lib/intel_pat.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "intel_pat.h"
+
+#include "igt.h"
+
+struct intel_pat_cache {
+	uint8_t uc; /* UC + COH_NONE */
+	uint8_t wt; /* WT + COH_NONE */
+	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
+
+	uint8_t max_index;
+};
+
+static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
+{
+	uint16_t dev_id = intel_get_drm_devid(fd);
+
+	if (intel_graphics_ver(dev_id) == IP_VER(20, 0)) {
+		pat->uc = 3;
+		pat->wt = 15;
+		pat->wb = 2;
+		pat->max_index = 31;
+	} else if (IS_METEORLAKE(dev_id)) {
+		pat->uc = 2;
+		pat->wt = 1;
+		pat->wb = 3;
+		pat->max_index = 3;
+	} else if (IS_PONTEVECCHIO(dev_id)) {
+		pat->uc = 0;
+		pat->wt = 2;
+		pat->wb = 3;
+		pat->max_index = 7;
+	} else if (intel_graphics_ver(dev_id) <= IP_VER(12, 60)) {
+		pat->uc = 3;
+		pat->wt = 2;
+		pat->wb = 0;
+		pat->max_index = 3;
+	} else {
+		igt_critical("Platform is missing PAT settings for uc/wt/wb\n");
+	}
+}
+
+uint8_t intel_get_max_pat_index(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.max_index;
+}
+
+uint8_t intel_get_pat_idx_uc(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.uc;
+}
+
+uint8_t intel_get_pat_idx_wt(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.wt;
+}
+
+uint8_t intel_get_pat_idx_wb(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.wb;
+}
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
new file mode 100644
index 000000000..c24dbc275
--- /dev/null
+++ b/lib/intel_pat.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef INTEL_PAT_H
+#define INTEL_PAT_H
+
+#include <stdint.h>
+
+#define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
+
+uint8_t intel_get_max_pat_index(int fd);
+
+uint8_t intel_get_pat_idx_uc(int fd);
+uint8_t intel_get_pat_idx_wt(int fd);
+uint8_t intel_get_pat_idx_wb(int fd);
+
+#endif /* INTEL_PAT_H */
diff --git a/lib/meson.build b/lib/meson.build
index a7bccafc3..48466a2e9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -64,6 +64,7 @@ lib_sources = [
 	'intel_device_info.c',
 	'intel_mmio.c',
 	'intel_mocs.c',
+	'intel_pat.c',
 	'ioctl_wrappers.c',
 	'media_spin.c',
 	'media_fill.c',
-- 
2.41.0

