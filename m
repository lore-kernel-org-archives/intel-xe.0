Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD058C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB39E10E5AB;
	Fri,  5 May 2023 08:31:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0B610E5AB
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275466; x=1714811466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vD7NDnjFazlx71M/04BmF64ZaN3uqe/0VLyORprM4Q4=;
 b=SdMzVbHJdMnzb4qwkXHesyFI8w+TqkOek5UiaRKlVjCXFTs2lizZOh5s
 XxCao8LRIH5TSpYBtsEv1HfSw3Xl57Jv2zCUBBLIzS4p+m1VsagaZxHQN
 ud4sjBoNSZrrUawY0IsInox51yYQlfHZxbNAv0rGw7aAJ2FzEc49Mu0pl
 h4xN39KB7iTOD2eP8OJnnOHI7m8SW/FKeV44e8Ig1XQEy8u7RgsMC5RKh
 vb2vg86MbGwZIHd9Sff0A7BGOxrK1F8FBXE45LGbeR8AHztbJqzQJxcEY
 DwquYEYZ1O7wDHUiu17Zg4S4/cYMcevyj2fWFlktjF9YFjICx+VPf9f1K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783290"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783290"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749413"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749413"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:02 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:47 +0300
Message-Id: <20230505082956.2247875-12-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 11/20] drm/xe: Add i915_active.h
 compatibility header
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add empty definitions for i915_active_init/fini to kill ifdefs from
frontbuffer tracking code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_active.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
new file mode 100644
index 000000000000..c4bf3764f7f0
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _I915_ACTIVE_H_
+#define _I915_ACTIVE_H_
+
+#define i915_active_init(ref, active, retire, flags) do { } while (0)
+#define i915_active_fini(active) do { } while (0)
+
+#endif
-- 
2.34.1

