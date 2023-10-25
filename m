Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CBEC25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71310E638;
	Wed, 25 Oct 2023 10:43:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDCA10E597
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698230592; x=1729766592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lTCKB27S1cCXWd5cl/x7Jg1reNgnYSU+Mo3qHwHvQWg=;
 b=eni/RxmgbT8A7NUPAPYAR3W2rka2+tR8w/9R1udtEhdOsRUYFwAD1wM9
 cA66S9awPcRo1z225cXaDP5gaMj3QqAhmo07RDBTFNQ2mlOE4jvbGzpU3
 R4oVjt+kmbG5d3+e2EUfQKp2gNFrgjiIwGd+Bh4cbjkmHks0WNvBJxgva
 CRjb4Zn8mfdM0awu91eYYZNXIPqjvjvQX7NWKlxhdegs/p1kNVNlXAZ/v
 MkEJkPI+yjWa8AmvMHJLnSAT4ky4F9xxaqYszH6uKsmJctzaAWIkABSmu
 x8wgOsU+VdtBg9LG9jVY9VBXsOxAyFsrJcciDQglqgwQq4bN1JMD/zYXO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="384491534"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="384491534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 03:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6804144"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 03:43:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 13:43:05 +0300
Message-Id: <20231025104306.667700-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] Revert "FIXME: drm/i915: xe doesn't have
 IS_GFX_GT_IP_STEP()"
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit a2d686847fe5aa64932b0b1a25a889f6e96c8d03.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 7d91344ec1aa..6ce7dc419df1 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -21,8 +21,8 @@
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
-#ifdef I915
 #include "gt/intel_gt.h"
+#ifdef I915
 #include "pxp/intel_pxp.h"
 #else
 // TODO: pxp?
-- 
2.39.2

