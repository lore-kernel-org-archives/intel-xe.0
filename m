Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F69CC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1103910E82A;
	Wed, 12 Apr 2023 14:27:54 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B0910E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309672; x=1712845672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DMZpOh43wNTgRfxyi6QO9EtLfkiztnaOUA6RkZoB9uI=;
 b=YCi8PLQvcmpgiXpCYYeQ+s70hEBIVx57IfOlaMNoR0qFPTD1b0yMWa5t
 1MrsiR+eW7NcVN2ebhFjlxR0m3AUFpRn5Mxj2Bdo02/M5tO5/lqiGRumP
 JWo02tXhYWYkrjxMGxS07Ha2cR6h22KevGLuX/35upz7f7uEdmlbkM4QE
 L7bLZlhM7wYFoVJBqDMrH2wBwoLvc/J4ca+s5mwf/O1OkFweCV3bhRfxO
 EOfzcINtY4sAQW+LWGH+yXPrJngi3Icr/uQ/NZu0kNc3NmiTYUVw5uI2R
 /6q0SfIZgYSZemJ5nbEx2vINjh2FPzpi8M2ooef06EeST/1DTDMQ7XVi0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430198327"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="430198327"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758266101"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="758266101"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:20:04 +0300
Message-Id: <20230412142006.877109-40-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 39/41] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
new file mode 100644
index 000000000000..d429d421ac70
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#define trace_i915_reg_rw(a...) do { } while (0)
-- 
2.39.2

