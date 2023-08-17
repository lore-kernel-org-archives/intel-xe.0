Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80848C2FC14
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4635810E414;
	Thu, 17 Aug 2023 08:25:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B2E10E417
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260710; x=1723796710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YEgKIOo8/zBUd/TOSbtRdqHCNDg4ZeP+RWpYLF3EviA=;
 b=emYiv+iUtPClunh/aX4EBGh/H+QpwrStt0NKpO3nTnOIE7QWoP5kbNkj
 LVloM+64n9dmZDUDwG0CZUzxWQh6dZwTGSQR6jYmTkHIkhqylI8RB6Xhq
 QHgIQc+cQpzS3g+tgr4KHJ7yso94xVapRToY+vOolf3S91+6ZPoRGrqIK
 rbEAWVtiRhG2+x1L1xFL55ZQzsl9qeU/1Jv/Kl7/UHHJcAD9tAQP/MnNd
 ZUKBDZuHzbf+z0jEgIw4j/tZWwEDgDLuk/MVfts4+HffvU11LMTgXqtsK
 i3sTXp02tCgyIxwrrcfVWXWmJ74sQdtg51lxaSAWbH5ON8uXgl4RTHfHV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459104384"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="459104384"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799944496"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="799944496"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:34 +0300
Message-Id: <20230817082437.3116208-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 6/9] fixup! drm/xe/display: Implement display support
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

intel_display_irq_uninstall() seems to be unused. Remove it, along with
the somewhat useless comment.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index 216cd6e6e7e3..bee191a4a97d 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -6,7 +6,6 @@
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
-#include "intel_hotplug.h"
 #include "intel_uncore.h"
 
 void gen3_irq_reset(struct intel_uncore *uncore, i915_reg_t imr,
@@ -56,19 +55,6 @@ void gen3_irq_init(struct intel_uncore *uncore,
 	intel_uncore_posting_read(uncore, imr);
 }
 
-/**
- * DOC: interrupt handling
- *
- * These functions provide the basic support for enabling and disabling the
- * interrupt handling support. There's a lot more functionality in i915_irq.c
- * and related files, but that will be described in separate chapters.
- */
-
-void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
-{
-	intel_hpd_cancel_work(dev_priv);
-}
-
 bool intel_irqs_enabled(struct xe_device *xe)
 {
 	/*
-- 
2.39.2

