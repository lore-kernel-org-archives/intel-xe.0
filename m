Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45BFEE6456
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 10:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7935710E61A;
	Fri, 15 Sep 2023 10:57:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FA910E61D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694775459; x=1726311459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bCBE5US5Jz1GFx/ZbdnAYFy2Q0ssbGD2nPU2vRWpm4U=;
 b=jFrZ6lqqOiR0weW77VsqWrO8Iw3dh675Csptxo3yYOvTK5Dy8OkgUq0N
 wxFSy/7uwgCpCOmNyYPBlWLBhTuHhxlKUk3gqhoCQv4KehCGumyQeAW0E
 igSLlY+z7noGxslkBbHz3nEhElg9Lp+ECgihDwpA2oNmmDpoFshUVsPi2
 xw+LPhio1lrikFPVHobnOLi5QlpTFxb96cLW3g2JeCCmB68hzXXKM3C5Z
 2AFZr2wzhqNCW0BdhapK3GbgwKtvIjgZZXpIeS2MYX2NT0BrbU7iI6oEg
 ICeZmqjuC3HFVRrfDzs5n0h2JU1sQwvWuPiLkJkM0Q8m+qeZEAV5RqOE3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379140111"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="379140111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="835171643"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="835171643"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:38 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 13:57:21 +0300
Message-Id: <20230915105724.1025509-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915105724.1025509-1-jouni.hogander@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] Revert "FIXME: drm/i915/drrs: include
 intel_frontbuffer.h from intel_drrs.c"
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

This reverts commit 57f941a90c2c20e3884571b06c4c3e0a10794af7.

We are about to backport upstream changes that is taking care of including
intel_frontbuffer.h as necessary.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_drrs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 6282ec0fc9b4..0d35b6be5b6a 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -9,7 +9,6 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_drrs.h"
-#include "intel_frontbuffer.h"
 #include "intel_panel.h"
 
 /**
-- 
2.34.1

