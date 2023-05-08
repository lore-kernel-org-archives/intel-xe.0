Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8C5C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F065C10E2DE;
	Mon,  8 May 2023 14:48:01 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DAE10E2DE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557279; x=1715093279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jslpNg49kkm1wPCcxbrKGF0M+YwKiOtq/J4QZb2s/pc=;
 b=LkHwZg9HsAlyO60Rly/u7duKfttCp66nUVadRjtCqZQp41HGiDoy3SXO
 dMCcgh/B+H/LmFhdqjKMzHHVKDsI2IWP2weZtBTZ9BPvtHymnyMrWTbyN
 rqQHajpV/TH3/Mpk5SEJvo+l0ync5lPoKTB4gNS+zQdpydSwyfnYqWzz5
 SJLHKZsLtI4fEwrTYj98bFLLNdxMlUJKbYvWtkFkqRprB8fHQHbTAng39
 2RMiUSfh9SP3f5RmEGeMjLGa0N4umo4AcOF7djcoECTfZP05g8BI5RC7p
 F4CJJ5TnhbD2FsQM5UgBHstn8GT90PmMTBkArTVZaXPPOZOblMM4txWyw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348494159"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="348494159"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768096499"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="768096499"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:17 +0300
Message-Id: <20230508144618.162140-18-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
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

