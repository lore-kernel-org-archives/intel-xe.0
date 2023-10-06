Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E85E92FFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED8310E06B;
	Fri,  6 Oct 2023 10:38:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE2010E0CA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696588716; x=1728124716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kd7KKdXZ+i8Hj+y/3XPVzafXEGF+leE9qBehZ198Z9o=;
 b=G/EBpwQyOQhyFQ2/ii/Z3qh1WIYMF8apmGd2YpMB5VJJ/Aq5bM4QAFWF
 rabrDVuEopZuMP7lcdU93+23mFDbtMhzVV7GLZFNTzKNvZPqbgK1bNA1f
 CvXe9Nx2DIpJ/Ik2otA8md7xtUmc5jyoaPuPc+fQt1DPmftFSevwi42k8
 Z+46Q5hSC96Q253V6cABjrZLqK/PBxi6r1pHJFi07AXEoachikD6Fp50+
 mkil2EOetXQsaTHszPbRIgVXWlq+MEeWizlug0QgeEDe8Jii8erk7u6/M
 Exutb4SZgkWulK1Myp7Q+Ro3VzaZlxm60wETKh6gHp1Gl/rbpuTlFNj/z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="374070254"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="374070254"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787348416"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="787348416"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.239])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:38:01 +0300
Message-Id: <bc3416000acd760e6befdd80ff766cd9560efd53.1696588392.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696588392.git.jani.nikula@intel.com>
References: <cover.1696588392.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/6] fixup! drm/xe/display: Implement display
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

Checks for CONFIG_DRM_XE_DISPLAY are useless in xe_display.c, because
it's not built when CONFIG_DRM_XE_DISPLAY=n.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 68729997e1fe..82d2c42629ce 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -3,8 +3,6 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-
 #include "xe_display.h"
 #include "regs/xe_regs.h"
 
@@ -438,5 +436,3 @@ void xe_display_probe(struct xe_device *xe)
 	unset_display_features(xe);
 }
 __diag_pop();
-
-#endif
-- 
2.39.2

