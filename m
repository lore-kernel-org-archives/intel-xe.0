Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DCDC7EE2F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 23:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BA710E404;
	Tue,  6 Jun 2023 23:53:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7410E33B
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 23:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686095590; x=1717631590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcexxcbxBAqjlGoh96u0B1RkzH+Oj1db9aztVikPNcE=;
 b=AwzN96yICnZcgd/pxHTVn2R710yQpz/09GRPawPnOL6zXd7v1F96/2SY
 EBGfp+QDO1CN/KkbU9ZWAMeoz/HQl1WlXjq60kigcvxLkkxMT/7YCNve+
 xTD51D7Ggl+jjJRyYzGa9/xM1F6V7812AKKkeQFeDDYhfxMAcIYQtJtrs
 X84vWCPYYlE8Vfpor11qpl4TwxdVlIDubjmq0ChdZa7FbP0VWfCAS8+/N
 UEe84kXVjzOrG9y/gLALu3P1nc0m+94bpubU+M2Zv1fIUE/vMX0846zVM
 mvHyyIpdlDIG1MYfb4g+tMNvqsIjD8DODCVT6KtEIyU+UYr0mUU4aAaBz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341481327"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="341481327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703385589"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="703385589"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:52:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:52:39 -0700
Message-Id: <20230606235242.1895643-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606235242.1895643-1-matthew.d.roper@intel.com>
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/10] drm/i915/display: Include of display
 limits doesn't need 'display/'
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Drop the unnecessary directory prefix.  This also makes
intel_display_device.h easier to use from the Xe driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 2aa82cbdf1c5..327520b0ecb9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -8,7 +8,7 @@
 
 #include <linux/types.h>
 
-#include "display/intel_display_limits.h"
+#include "intel_display_limits.h"
 
 struct drm_i915_private;
 
-- 
2.40.1

