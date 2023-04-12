Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49878C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295F110E82A;
	Wed, 12 Apr 2023 14:27:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A40010E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309660; x=1712845660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=957+eEQrbSUfUeTm/072bxRam/3lqlrXJyiAAtxcE9A=;
 b=H3evbshAFB6qFqivd9fp2n46xBhvo5+DOYqzTAiHVh640ooycl7L82dq
 eZ2NCUj/VlMNDioJEWes+7GmEzTA0LPzyzskhmflNIMJe7jkcE1aoe2jo
 Xt0ZMyR2oHM4cHOd/bWPvEsR+Nqvos9p9rC7cH6ps+9C7nXKz6N8zlcAh
 I5yh1uzuzhJNVkY+Gyx3Yj2hmRxT/Zia6/ujcL4JQcEnHyehaN+gB4l2D
 AvSnSsoXpL984CfejjCt/nbhrKSy7+nUJkv7T5QPXqn9pGrRB+axy+MDt
 0yLXhIEtYi9oWD3Ri0A5ETcSQWUu+x2QT7S+EkKdFF2Xq8LXEJpFssVZG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430198291"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="430198291"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758266065"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="758266065"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:20:02 +0300
Message-Id: <20230412142006.877109-38-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 37/41] fixup! drm/xe/display: Implement display
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
 .../gpu/drm/xe/compat-i915-headers/i915_debugfs.h  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
new file mode 100644
index 000000000000..b4c47617b64b
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __I915_DEBUGFS_H__
+#define __I915_DEBUGFS_H__
+
+struct drm_i915_gem_object;
+struct seq_file;
+
+static inline void i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj) {}
+
+#endif /* __I915_DEBUGFS_H__ */
-- 
2.39.2

