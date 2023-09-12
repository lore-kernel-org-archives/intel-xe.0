Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A7FCA0ECF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D110E35C;
	Tue, 12 Sep 2023 06:47:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E1F10E370
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501256; x=1726037256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=35vldF29ShW2ESNo2VEtQgsmJfgg5tL8zTrPD5G1hmk=;
 b=KCDpUTVJZ/PiGKdqFdA7UGiDGHgdzFasxsOwXg7ZtRjiCRc6yKRKJ9Ub
 ocEgdJbdwdKS/roEOimFJacQDQM6lzW9Of7PXq2joK0EVumiXqyTTSUlu
 yjMKogW8bQsX8dx+JO4x8Bl8AdTqk1h5XUyK3nL5FG63KeKfkZsNjsqS9
 Y4cUqprtEWZIUB7SfBWQ4MelPyKvy2zRncepKEEaL+9FuZAgWYF8ttyKZ
 R+cjTRIZFUGNitwY1zCLzmM8RtsNxLNDeORasSsI7lR4f9f7U447mIyBI
 HH5pvtAstWnZAqjnG9DzSqQqJFU5BeEilByMliV85jfCbL92DbXgD0X0+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730358"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730358"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699070"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699070"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:34 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:47:07 +0300
Message-Id: <20230912064709.2802305-11-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 10/12] drm/xe: Add struct i915_active for Xe
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add empty definition for struct i915_active to kill ifdefs from
frontbuffer tracking code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/xe/compat-i915-headers/i915_active_types.h  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
index e69de29bb2d1..8c31f9a8b168 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
@@ -0,0 +1,13 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef _I915_ACTIVE_TYPES_H_
+#define _I915_ACTIVE_TYPES_H_
+
+struct i915_active {};
+#define I915_ACTIVE_RETIRE_SLEEPS 0
+
+#endif /* _I915_ACTIVE_TYPES_H_ */
-- 
2.34.1

