Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D45FC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A24810E489;
	Wed, 10 May 2023 12:12:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA6F10E487
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720766; x=1715256766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=35vldF29ShW2ESNo2VEtQgsmJfgg5tL8zTrPD5G1hmk=;
 b=PZiY2NauNMjO02GJDJ6q52p1ElfCRz7OAn4Ra+RGe+vfXGUg12g5MG6W
 oPuCZc6KFP9D5sGkysWJtAuxfdDrPGKYA9uWipzO569t29PfhYsTIpKNV
 jXT/vYFB+LV4+1sIL7n2H+4kKtJB4VNuDuhjRPEGwVakDfCIz37f/BTm1
 eJZqiUE+zDtwpht7QE2jqAqPiMBLLrtBsRgnUR44wkMDh2AErGxjyhMib
 ytF4yJO9J/ureaTyaYoV/MhjEir32idrK2bO4eFovG8fnDMAJRmwiCLIB
 APVlFc9KQvjz1QhLQTraEAqe/KuJd4mgDCeO0ggg2IBE2OgCHTLHA6J7Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268174"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268174"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906277"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906277"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:43 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:42 +0300
Message-Id: <20230510121152.736148-14-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 13/23] drm/xe: Add struct i915_active for
 Xe
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
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

