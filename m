Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E521AC04E69
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 09:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B522210E684;
	Fri, 11 Aug 2023 09:36:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B19110E684
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691746601; x=1723282601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99uoZY5cPoUUSChWYP+590b8E5DXSeqbw+FmzoZJyRc=;
 b=g8fxu1W1CZHlmAToi0OfEijPZKOxZG7IUCNceQFkKc/o000Eo8uvdnGm
 4l9OYktYCOfC9yyRckYNllN3pFqGGw+55y64t6Y+2ldIANORfKAy3pfAx
 urC5I0NYhJtjUGgh3nYvzrKtw1WQx+JqHxEdAD7XjYtQu589Qv7lycgpz
 RlfS4IihRbi9SF2zm2AbCbEJLajYyeS5NWtsEBgoGYrUXE5hW1R6v6Ach
 mS6DygT0bqUe7vUzw+qDNuIWSCEBNLRFo9QE0qql3zuC9eU8y+SQL+Eqq
 4T+yatarMhRy4dIZ5q/oPiQMqGF1fZSW8DSlHRBOjqlECgW2028GmXv3d Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="458012816"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="458012816"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906374756"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="906374756"
Received: from unknown (HELO localhost) ([10.252.49.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 12:35:56 +0300
Message-Id: <20230811093559.2304457-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811093559.2304457-1-jani.nikula@intel.com>
References: <20230811093559.2304457-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/9] fixup! drm/xe/display: Implement display
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

intel_display_irq_uninstall() seems to be unused. Remove it, along with
the somewhat useless comment.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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

