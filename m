Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D7CC7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 22:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37EE10E1ED;
	Wed, 31 May 2023 22:48:41 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC9E10E09A
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 22:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685573310; x=1717109310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcexxcbxBAqjlGoh96u0B1RkzH+Oj1db9aztVikPNcE=;
 b=fO2vX9JeMcp44nGbeYpgMWiPVTRZJMh+w153jflYFcWawQjSpt1RgcL2
 QiPiA0pSLni7M64XaWbzhuL0tNp6nzteqY+4H3A6OMUwszVZZK5DjY1kL
 ycUgRVmoWsN3G+Ff97C6L7Ea3IcLoeyCUO/eQX7wCy6DuUCfTYi2TfUo8
 6M7ZR0ikxx4Rf4FjTwul7980GVYDZ8fTzGWt9vTRVd9qUHrG8PDJwixY6
 uYYuhMP/raaxmhKbmAWCUfEKI2cGbtFi3DA94ZIMtQtbmZnz/mILpqkkL
 9M45cb0mKhGavgnZWgyiiMJpduHsehlyxzu+KY7lrih5sxNmdC5loCYtc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354235482"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="354235482"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 15:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="1037229636"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="1037229636"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 15:48:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 15:48:20 -0700
Message-Id: <20230531224821.387722-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531224821.387722-1-matthew.d.roper@intel.com>
References: <20230531224821.387722-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/8] drm/i915/display: Include of display limits
 doesn't need 'display/'
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

