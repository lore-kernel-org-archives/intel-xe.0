Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCECDC77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ACB10E0CB;
	Wed,  3 May 2023 13:11:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690BE10E0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119491; x=1714655491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2r84N8eRVTAH0atIBEbLTUY+1k2V2XiqlnXTQUthpaQ=;
 b=fhk5VpBKwgqPDTZVGzKJzdv3HhmAyFwmrynu13h5VSpbeimmfaH6z2bo
 eqiu+hIlMtS90Y0eQwyQRztkDSoeqWCy4cAN8Kyeqq+GOlewWAJw/UZi9
 LJvGVOCsjGW7L0+hTVFn93Q+JqPtdl9o9uKLFrH4PrQd9G7e6IuBxT5+C
 TmLpBbcf1iMHiwSG4dBmhS1W0Tpj5XMkhVmyfYrinthBIqiHl9L/tcVLf
 b0WOKP8P0mjS0R7kyILa1FqThIWAXOFEUoDlIx0BJDbNo2MjokutwZ/4G
 3fUnTdYlJVIDjtSea2fK5m3lzHnWJYByjQRCTqpJ8iGewFs1TOEZZ8kj8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347470076"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="347470076"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="696558867"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="696558867"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:10:02 +0300
Message-Id: <20230503131005.1602412-16-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/18] fixup! drm/xe/display: Implement display
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
 drivers/gpu/drm/xe/display/ext/intel_clock_gating.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
index 7d1854652d17..0d67b0961d74 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
@@ -29,6 +29,7 @@
 #include "intel_display_trace.h"
 
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include "intel_clock_gating.h"
 #include "intel_mchbar_regs.h"
 
-- 
2.39.2

