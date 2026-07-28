Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9C5C54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 18:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACA410E9AA;
	Tue, 28 Jul 2026 18:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ins43904";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEA210E9AA
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 18:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785261663; x=1816797663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WHsvgwlJF0Kzxy//eIS7PTQ3bDmJAcX1A0K6ntEuHzo=;
 b=ins43904/kCYDDx8ROptQ2DdZFYXzcMx2rlxfR5BedfHygIe35cedsbS
 H0IlV8rG49MdSkvqrL86uJKWm/HvfBd4AI9dXWW1sOtQmiLvf6zlUGPEv
 UIkCRapVTzb3CG/tm0m4J3I5yQcfn6MfQ8nTCv9fasS8Bp6Qq7BQQmSrh
 RKwSoOfRUQIJCjY36wX1Tz3xCmqmrMMUOhbVLiIuUOamfxJhRAK34rllQ
 49knU/X3Uz+NNj7eH0UC3dcNNUxeB+rz6ZktqNKQPyTy0tVjtnYchosei
 DOWivNgH09T5zUuO/lc3qbV6BN0KnqbFpoUp9w0bL970/F99IQgozhmjO A==;
X-CSE-ConnectionGUID: 6tNftIy4Tg+tJONzlmCwTw==
X-CSE-MsgGUID: dkS1Od/bTRipU6Jz5lOMAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96213595"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="96213595"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 11:00:59 -0700
X-CSE-ConnectionGUID: McOCL8gQR2qgz7z6ue+qZQ==
X-CSE-MsgGUID: WQidLbidTuaTODw6uL8xkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="298007032"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 11:00:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe/display: remove unnecessary includes
Date: Tue, 28 Jul 2026 21:00:53 +0300
Message-ID: <20260728180053.624215-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_display_rpm.c no longer needs the display includes, remove them.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_rpm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_rpm.c b/drivers/gpu/drm/xe/display/xe_display_rpm.c
index b3db40035499..548b503aa024 100644
--- a/drivers/gpu/drm/xe/display/xe_display_rpm.c
+++ b/drivers/gpu/drm/xe/display/xe_display_rpm.c
@@ -3,8 +3,6 @@
 
 #include <drm/intel/display_parent_interface.h>
 
-#include "intel_display_core.h"
-#include "intel_display_rpm.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_pm.h"
-- 
2.47.3

