Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4243C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F9310E82A;
	Wed, 12 Apr 2023 14:26:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADDF10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309586; x=1712845586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=StMa4u30Hd8VAf0mbgcUBAQDwRD7vFL5Il3P3TABSa0=;
 b=m6VmoVCA196uQqCs+j6WAVdZArShXk4a3FfsYm1OtPwQPaXZa16G0C0A
 aCs3VvgsDBs5zSN7cC+JW9zY0Iy7uPfHm3zG6yfYHPHhxZ4o/i7Wd0ZqJ
 SDVwypb5VxUq+oeLi+Gv4vEtH9jZhrAYjAkwZySKv56eGol6cePsu7brA
 QGJVIwA57iX5y+HvBRRYGY3PBFfTPGfCtTlnT8T7vJedjTbsFsbnLwMxm
 PJSGOdjdDlQlTSFLaRa+bsnWVPEPs/Uci/Pmdjl68WCoDFb6FZOwAISa+
 8PD8sKEb8siO6X7U5PQAI6smavxnn6JP0v6LLpvU3i0PlkmAG6+fU04Nh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328021602"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328021602"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666376031"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="666376031"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:56 +0300
Message-Id: <20230412142006.877109-32-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 31/41] fixup! drm/i915/display: Remove all uncore
 mmio accesses in favor of intel_de
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

Don't do drive-by include removals. Put it back, so it can be fixed
properly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index a73a315ac8ad..c7e9e1fbed37 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -40,6 +40,7 @@
 #include <drm/drm_edid.h>
 #include <drm/intel_lpe_audio.h>
 
+#include "i915_debugfs.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
-- 
2.39.2

