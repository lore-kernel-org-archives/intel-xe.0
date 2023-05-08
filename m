Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEB8C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDE810E2DB;
	Mon,  8 May 2023 14:47:39 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380A10E2DB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557258; x=1715093258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtWnbytAWBxDizALKqlTdgw3jtKdDFHMxm6fMUlsvwI=;
 b=ejctQMDjkCzhu+s1Ah0cwt/VHJQkEeJTlwrqR4OTwuipmPS5uG4wKsl7
 jH+gS1+kcb4WXV9sBQYYkAnic0SwE8xxRIRRxWO0WXZ0FK+V2m4+PY4+5
 DuQPN6DJyVwWIaxHuRijFYPpyZNm6H5lweEPHuZ5oq17/t6CVUwi+DrLG
 Jix3ppAiPjkVFfvuNk0ytx0LxjjejNI4jA4kP4VJoU0Kec0g9LJ4VeTK/
 QwXNxbpousDbeBt1kDH1krjLmxl0/KheAptfot7PCT5kZKLB9n3WSpxL2
 eTs05CiWQDExILFTPfEKkjzpi1Nn2pMoXk7L2U1lTpzySx7XuHGIEdk8s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="338888451"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="338888451"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729100259"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="729100259"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:13 +0300
Message-Id: <20230508144618.162140-14-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/18] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

Restore a removed include.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 0008676217b2..1c7e6468f3e3 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -18,6 +18,7 @@
 #include "intel_display_power.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
+#include "intel_pcode.h"
 #include "intel_wm.h"
 #include "skl_watermark.h"
 #include "skl_watermark_regs.h"
-- 
2.39.2

