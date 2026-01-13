Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB0ED318A2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228E310E5B5;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcsrY506";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C815E10E56A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mmo8vd+Jy22Z4ccgFJA+8+5ysDi9YhULPRSKs2DOLdc=;
 b=mcsrY506/M8DcU6LM/mQe7/Zrso2u6NsnPZzddLFaKTAgpC1mr5h/2xt
 uJhHz3Vuteb3pY9QLwhffROGIhKJ58XSFmb0wjvljo6N8xEc+TigDcf4l
 RFHnI3lWCHf3/Sv8w6+clOHhjwnActO3+6OgTOKnqJETUJV2O7UGNZfcN
 2GOZ5QluJWh+opSMp7Dybq/OnfA+TJbCLmonkf+dXZp68HzYR96SB4C8B
 xeJC3xuFFFTTLSi53XPTR/JvD5ZYJoAcD0gMdB/ZkQYggHGBvENRfpUIi
 UXvqhx6JWrXk2Idxbm8r752ZuoOzNBB2j8t2TiubiWQYWByp/G9Pynxeg w==;
X-CSE-ConnectionGUID: JpcjkdfvRda85QYumIu42A==
X-CSE-MsgGUID: /7MtCGH8QBWKIUDOdrIScA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311169"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311169"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: M9RQ/o94QrqRv24jMa2OEQ==
X-CSE-MsgGUID: S7K8eAMpTEqsbn2QeILwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147444"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 63/79] drm/xe: Drop unused header in xe_survivability_mode.c
Date: Tue, 13 Jan 2026 15:04:08 -0800
Message-ID: <20260113230315.3081153-144-matthew.d.roper@intel.com>
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

xe_survivability_mode.c doesn't use anything from xe_gt.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 31456f432fc8..6578ffc77bd5 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -12,7 +12,6 @@
 
 #include "xe_configfs.h"
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_heci_gsc.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
-- 
2.52.0

