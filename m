Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6274BC77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EEA10E5A6;
	Fri,  5 May 2023 08:31:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622C210E5AC
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275471; x=1714811471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hpbCLR2fxEjJ7wcW5HIJJar7ZxYjqVODZTd3xsVS8mo=;
 b=DO4fvgYt4qufVUhTKdobI3Q1XR7+6SfT0nV/IRQGtAG//ngsfq9MboXC
 w+f3g5qE6c+/QBMFLQnhpEmWjMefocUWzuhZioxaag2l9ilESqQPkQZDl
 6NKWFb9GpavDFxk0Cem3YSHIIy6+O81QFK/MXYFT5+u/Qm+UkDebZovrM
 ZzIaY3LWN5n62TT6T/lud6LGuXAAYrY80xuplNWwKberIQZN0uRfrpKZf
 nbp1x3xm5i2TMdvzIrpIBTi9OwrRT7iKnJhoAG9Rwg31HNQZMVH7SEiYc
 7f0sV/3rENxdc8/xl4iMpD6QCbqkc4HrACMOBSm4+FCs24by12B6z1rjr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783304"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783304"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749515"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749515"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:06 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:48 +0300
Message-Id: <20230505082956.2247875-13-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 12/20] drm/xe/display: Include i916_active
 related headers
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

We have compatibility headers containing dummy defines to handle lack
of i915_active in Xe driver. Include those headers to avoid build
problems.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 1 +
 drivers/gpu/drm/i915/display/intel_frontbuffer.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index cdd214413746..d4788be078dd 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -55,6 +55,7 @@
  * cancelled as soon as busyness is detected.
  */
 
+#include "i915_active.h"
 #include "i915_drv.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index a3d47ab619cc..73d4581aba2c 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -40,6 +40,8 @@ enum fb_op_origin {
 	ORIGIN_CURSOR_UPDATE,
 };
 
+#include "i915_active_types.h"
+
 struct intel_frontbuffer {
 	struct kref ref;
 	atomic_t bits;
-- 
2.34.1

