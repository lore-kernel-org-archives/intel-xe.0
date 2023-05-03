Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8CAC77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAC010E29A;
	Wed,  3 May 2023 13:11:43 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB1010E29A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119502; x=1714655502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jslpNg49kkm1wPCcxbrKGF0M+YwKiOtq/J4QZb2s/pc=;
 b=N56nc5QcuvT9gyGTKJEzPs770NKdOPZSdBLh0VlRUakvfHqpAE0ls3JN
 vTJ/Y4kcJD31ltAWlux/qs6BK5uyChRSvCvq55YFV7mNZlF3ujmdZwI67
 UJubtqGk4X/loeljYqyq5RzJ1Yhzxdxp32mRsg2GiZn8ITPZFVXdjSREX
 XWUl5RzY5+apu2Ybbl1VeUOHcJr5pt0Z7wE0Gd/q1+OJxev7pFzAMUs92
 SYV3gFfTYXE9x37uSXVAG8IiUzlO/YH7XzBSKtmsjujZ50vbk3YgliuZL
 mW7yJqpP1qaFrgXsdyV5xhkQMRq7D0H82qweLS0O8Mu+3GX+8cjwzPXrr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347470122"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="347470122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="696558900"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="696558900"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:10:04 +0300
Message-Id: <20230503131005.1602412-18-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 17/18] fixup! drm/xe/display: Implement display
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
 drivers/gpu/drm/xe/display/ext/intel_device_info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 9e6844311ace..9a54611037b5 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -27,6 +27,7 @@
 #include "intel_display.h"
 #include "intel_device_info.h"
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include <drm/drm_drv.h>
 
 /**
-- 
2.39.2

