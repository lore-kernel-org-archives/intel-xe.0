Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28177EE7FE3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E820710E0B8;
	Fri,  8 Sep 2023 12:24:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4950610E89D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694175888; x=1725711888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=35vldF29ShW2ESNo2VEtQgsmJfgg5tL8zTrPD5G1hmk=;
 b=bn8XyRI0g1p+lQsJT4Hi3zlDGnlDoyGi2GUmaymV1CqfwxqiM0IoF1Ul
 YXsqzaJOmPc4LJ3RJZUU6VKhTjjh0CQqLT37e1A3bnThyRDvLG1X0pIXN
 iPIsHQ5/9CEjcVe0qD/IGoe4mVvkKhE5DdCnruzOfoq5iIGqTM7dKLeqv
 8MZOYHbIp0nlIlmp5hsqupYN7LmSWs66yaB1bD7ihhv88yC+dYXPAIh1h
 U3ohLoVOsc/QiUkOVXX5Vxo22kVzcoG2o3bC4jda0thFD9DYPBYQubLC+
 ZmeG/rUAUsVQPBvb20UQ8h1MSD/QR3dSMPk53ariuZfKP16mGxWQe5xKK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441650058"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="441650058"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692244226"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692244226"
Received: from akorchin-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:46 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:24:13 +0300
Message-Id: <20230908122415.1886366-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908122415.1886366-1-jouni.hogander@intel.com>
References: <20230908122415.1886366-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 09/11] drm/xe: Add struct i915_active for Xe
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

