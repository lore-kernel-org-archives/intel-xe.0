Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08C5D30CF9
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CC310E577;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcJ68sSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF0910E56F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VbKk3+/Q+4KaUGz/onVs3m+wPng8ZCCCZrQQJVKbj/M=;
 b=NcJ68sSgPetFmcbmsXQ04I8TZjRKCqn2JxqChucg6s1Lu2roQJpKkh3Y
 ylO7u4x5+o63YcDXTN63vcQ2u5MU+BwUjRvHHus2b04u+v2KHKHnpQfcG
 D+FzxXy+3ofANGUBpkUbyRAFsn65TwqYcPIihfBEQB6cVwvZ8Xu+zeCvd
 O87tO2LXSW0Qiko3ttVd+OYIGoDg4Akltj+V/9jJdDEbaRLy/3M9jg7yP
 BnH+poExwLT4Wc6ncLtlCh6nCIlysr25rwqPiA2JJQ0noeLvPulBsYuwX
 nX2cV678JTJ9XWDBwkZKuh1CUegayOzX+lUKjY9jc3TC3ALs7vdege32q A==;
X-CSE-ConnectionGUID: x6Ts0vjmSOKXuAh7yb0OZg==
X-CSE-MsgGUID: xqtznxPwR7i3trZtjcgKeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311147"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311147"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: kDSKuYxRT1urC/6XF+sZgg==
X-CSE-MsgGUID: AlvURMdST/KjXjmJo+gHmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147381"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 34/79] drm/xe: Drop unused header in xe_heci_gsc.c
Date: Tue, 13 Jan 2026 15:03:39 -0800
Message-ID: <20260113230315.3081153-115-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
MIME-Version: 1.0
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

xe_heci_gsc.c doesn't use anything from xe_drv.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 495cdd4f948d..c1f15313f92e 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -11,7 +11,6 @@
 #include <drm/drm_print.h>
 
 #include "xe_device_types.h"
-#include "xe_drv.h"
 #include "xe_heci_gsc.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
-- 
2.52.0

