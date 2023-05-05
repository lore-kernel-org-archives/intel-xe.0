Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688ADC77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C8B10E5A7;
	Fri,  5 May 2023 08:31:04 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AD510E5AE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275462; x=1714811462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JCxEVx1IW+NquKKkDRpsr6Kxuoocj/3iUbf2HBkZIC0=;
 b=Bl0UPdw0gS6Jb82d32++q2YcTAMgp1gpRXQQZld984Xd3LelQhWQufwB
 1pp0Ggphw3bc/3zSkawVpyB7kSRcA4Ohze+Dr3n+ncdKH4uXSh9ai49PY
 x++Vhx8TVjxTa6qNMTTadL6vbYcR/Wp2JTfOhPEXf4zkaFM3MGAXv1cBq
 5r1ro1aYlzAkgjygH3I9CMCzP2CDI/iVKPcNCuuOJx4gXQeRG+KutT2t/
 gq1hqlBDTRswx1Zep8tHk1+AImTaza5q3Sp91K6NWVORngiErPrUFMT3P
 1jTnNKaTj+c/wSQOHmZJ1FOK7CrmZD+A8vCHHoVLOxEwFAkdczN/oGtCk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783273"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783273"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749315"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749315"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:59 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:46 +0300
Message-Id: <20230505082956.2247875-11-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 10/20] drm/xe: Add struct i915_active for Xe
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

Add empty definition for struct i915_active to kill ifdefs from
frontbuffer tracking code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/xe/compat-i915-headers/i915_active_types.h   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
index e69de29bb2d1..dd0e7b074c98 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
@@ -0,0 +1,12 @@
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
+
+#endif /* _I915_ACTIVE_TYPES_H_ */
-- 
2.34.1

