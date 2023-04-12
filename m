Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12E6C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813BB10E835;
	Wed, 12 Apr 2023 14:26:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB9410E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309581; x=1712845581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sEblJHUECkfJx879NoNd4itERlGnJFjfGz8EeQHnY/s=;
 b=aTqdoI7dm7bYB/6hFNVF3kQTo3b8SALXGgCHyv/R+/qnn3tQU9Qgu8T1
 mLKDJzGngY1g84EX4JBQFjUbQmD2atZqV3uf2qLvlxXA/GI+vGl/T0YoD
 Q+wIokDwbCF5TAITupvp1gcnIKOh3cfAcsywVtJxJKvrxalPwqfuGvWbk
 TEuzNVi09sPdfK0AJuM7quOuF9lMUGbxL+9Ncj0b8i3m1pwYksFlZz0f0
 ODyDMsOG3K7VdE7Z+l53MWHH/sEevboz8Il/AEXzTpxn2jxftmVCb0+Bt
 8ERyYH/BSYLxfyxzyjLxP7Am4EOzqf1ZsaOnJ9SGz1nIdBRyhGaEFCDqM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343916428"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343916428"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688956485"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688956485"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:55 +0300
Message-Id: <20230412142006.877109-31-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 30/41] fixup! drm/i915/display: Remaining changes
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

The #include can be removed altogether.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6900cfb93dc8..f6143ca60703 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -44,9 +44,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include "g4x_dp.h"
-#ifdef I915
 #include "i915_debugfs.h"
-#endif
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
-- 
2.39.2

