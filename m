Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EADEDE983
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 06:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987B310E508;
	Thu, 14 Sep 2023 06:32:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1F810E254
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 06:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694673151; x=1726209151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DfeNjF4DsgFEgUR3SMkBfStpb27RyzlzrHZT4ytTBBk=;
 b=DOduAvyDUwhbv5cevmEZGkQ6bR5uq4wU5i/XimctLOkHYt0xOpnGDxga
 mOpQe2vkhAba0gJHP5SPMuuQZ3/ueuhDviFpmMomZfm3LbYhS9915MyPM
 7PjIESiY80nu8wfPuRusAvAchV3CEXx/gQaKhuN1nBLEoA6LlUTRYfVeN
 T85OrT87miaTiPBzaN3jFQRPlwnGpXnqJ8Wt77dG8aRvtY9wnvYSKPgxj
 vtmvVeM3w3bzTFRhXZaO0InqeZze9CqA0WW5TVkkeZ3I9PsdL3Sskv+ya
 FBHNsumsSq4iJ9SQU/s9efUpOpE3y58cAOofMa5PmTiPM6r5NZhrw0tT6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="359127210"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="359127210"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="721110829"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="721110829"
Received: from stoicaan-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.36.89])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:32:24 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 09:32:11 +0300
Message-Id: <20230914063211.5210-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914063211.5210-1-jouni.hogander@intel.com>
References: <20230914063211.5210-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] Revert "FIXME: drm/i915: add a lot of
 includes in intel_display_power.h"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 304baa8c20cfad330a6c7cad47d86043e968642c.

We can revert this now as missing includes are added into
compat-i915-headers/i915_drv.h.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index b51442fe5976..ec2b5560877f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -10,11 +10,6 @@
 #include <linux/workqueue.h>
 
 #include "intel_wakeref.h"
-#include <linux/types.h>
-#include <linux/bitops.h>
-#include <linux/mutex.h>
-#include <linux/workqueue.h>
-#include "intel_runtime_pm.h"
 
 enum aux_ch;
 enum port;
-- 
2.34.1

