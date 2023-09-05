Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65929CA0FF6
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429A010E52E;
	Tue,  5 Sep 2023 14:14:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BDA10E52C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693923284; x=1725459284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9CtydT+U5/x656l9ttS5YyQ383ZZ+TK7THfjvVLTK1c=;
 b=h8JH3IJJim0xGCcHYea+l8avzOzqkSc4OBwXULN2J262o4/+ToQzEPQu
 yf0G2sn7lSerD2YC7YKwTY3wQgv4mMFi+fHDS/oIz4NsvMfcmwN3jaeyS
 7B8x5HmT7MW6PtmApsQ1T27oxYe4QGj+2b0G/3GZpaB2HFtx+I3iBGYBk
 9JDZiIPlPdGpQHi3mf7g5nUi3qRK3AXPmHvY0PgSS7IEQKjLeSk2tuIBX
 W4RNTpZgxCHOQnrECF/4YZRlJYQ1jXikQstA+WE2MXyPvguaUXZv41+uz
 +6C3vFLNGKMLt8t+exnATYY/I/QlFiiroR/FcZONKIHrhUWxL2ae4SJIZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407794906"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407794906"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806626563"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="806626563"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.152])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 17:13:44 +0300
Message-Id: <20230905141347.1027082-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
References: <20230905141347.1027082-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] Revert "FIXME: drm/i915: include
 i915_utils.h from intel_display_types.h"
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
Cc: Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit a32f371fb76efd55ce1642d8f8aecd8db10f9c5e.
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 23ca68fd359c..c0931d89d0dd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -46,7 +46,6 @@
 #include <drm/i915_hdcp_interface.h>
 #include <media/cec-notifier.h>
 
-#include "i915_utils.h"
 #include "i915_vma.h"
 #include "i915_vma_types.h"
 #include "intel_bios.h"
-- 
2.39.2

