Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B8CC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFCB10E952;
	Fri, 27 Oct 2023 08:01:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EA910E94F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393627; x=1729929627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dRtlRoSk+t+ssPAPGnL16JRhum20zQPgohzk64dlOZc=;
 b=kVA8CFW4GJ2WSyFKCFS2dgnSGh6Q/ZnoS3cwTPJNKVFeVyQoGvOE9+f8
 51oLKoLso/HDRLcGAgRXCNjkcfVtnO/uw0giiAbDHHizrRW+ROqk9mNer
 eCx5J7r4CvPUzMZmrfEOn3oe3g9InIp0BEYUMIwBwpP27CX09XUuCIdMM
 Nj5zH1S48K+ZdJD9nHT+XaKIENtUuHD8DMDxwtMykr77YPaBYi9WnS6MR
 IymP/sNhKn2luvg2wenXe4suoSNWEVz4MVVfHm4Zdp/6COFz9myjF15a3
 SXaXyssnzgOS4lX5adF31T/cJANJ8V2VoHqDQ3pN1tP9gvBafX++paKDB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603889"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603889"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510419"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510419"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:25 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:59:15 +0300
Message-Id: <20231027075918.2206862-29-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 28/31] fixup! drm/xe/display: Implement display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are facing several build problems with Xe display due to missing include
of drm_drv.h in display source files. Add drm_drv.h into i915_drv.h.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 4e922446e40e..fe026a3792d2 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -10,6 +10,8 @@
  * TODO: refactor i915 and xe so this can cease to exist
  */
 
+#include <drm/drm_drv.h>
+
 #include "soc/intel_pch.h"
 #include "xe_device.h"
 #include "xe_bo.h"
-- 
2.34.1

