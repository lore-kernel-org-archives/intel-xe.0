Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1888C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F8710E2C2;
	Mon,  8 May 2023 14:47:50 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3BD10E2C2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557269; x=1715093269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2r84N8eRVTAH0atIBEbLTUY+1k2V2XiqlnXTQUthpaQ=;
 b=fJfa5RG5tibtR71THwiLTckWHsqhAjQEZbC5puNTaeKL5KkXK73a7S1F
 XSHuILidN2OujEJUccAnetojg9bmSgRXhss7/aRl9DhEGg8Me9jqn0PGf
 u9ydBnoGu/U5afz/mkvkMOWikSprkl4+p24TAcJnlmrB5qWGmLCwHNp6f
 OQznDH3aIfMNYl3jTCQf8wIaBJ+7uZMRbEmXQQQMVzP77Ipzp48ot0Ukx
 tUh+iDA22s5w4x4bVUxPFpbE4Fwb6awT9TrTF/ce5LgMbAlvzn41j0Ilz
 mcKjlozbbzlMduHJ5brUVZR6hq5xC/8ZlqGm8hEMhMJmr/9yS5fjizwPN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="338888585"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="338888585"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729100322"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="729100322"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:15 +0300
Message-Id: <20230508144618.162140-16-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/18] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/ext/intel_clock_gating.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
index 7d1854652d17..0d67b0961d74 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
@@ -29,6 +29,7 @@
 #include "intel_display_trace.h"
 
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include "intel_clock_gating.h"
 #include "intel_mchbar_regs.h"
 
-- 
2.39.2

