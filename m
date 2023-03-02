Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A3CC6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 14:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0174210E118;
	Thu,  2 Mar 2023 14:24:21 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C8F10E118
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677767059; x=1709303059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HT4LAYYQVk6oNjGUV+mn2/kVlpqcQ99dtRVsW4wJBsE=;
 b=B4d8lCcz30wZVsuYkF0+EQZ4DE+1MhG7xh9pjr7+vEAbD+01HkDujHfJ
 KcNwChhXl+ty7Wy1bPqEiS9WBnCqKujdy/ujKi2X3Bn7+hbG12rQbsGIP
 kOzv/gLTeH+j6nfWu47Q7r6TsugGBF7OO5i7EyEIBNOnXOaxGbb76id1u
 1ek3xba6eX7nVLexOXYOzKv0K19MUXHeGE1ZJKOe/cEd8nrSVs5qjR5fE
 uNYcxD30S2tv59116O6Jn8ZO7LuGqMFcigJf6bsIkeVl4cYAJd5XX8jkk
 M2y6gVZPh4O3SRqI3az3unRx1Ze1ZWB8O0r2x7t+pSBaEXOOtn2Plj4ir g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397301488"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="397301488"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:13:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739086261"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="739086261"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:13:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 16:12:29 +0200
Message-Id: <20230302141230.2804699-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302141230.2804699-1-jani.nikula@intel.com>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/8] drm/xe: remove unnecessary include
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/ext/intel_device_info.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 6311b8494e4d..7f50b5e386f5 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -24,7 +24,6 @@
 
 #include "intel_cdclk.h"
 #include "intel_de.h"
-#include "gt/intel_gt_regs.h"
 #include "intel_device_info.h"
 #include "i915_drv.h"
 #include <drm/drm_drv.h>
-- 
2.39.1

