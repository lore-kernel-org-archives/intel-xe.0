Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C51FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5897510EB1E;
	Tue, 28 Apr 2026 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A18qLRPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B9310EBD9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386460; x=1808922460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PjZbunL6tgkIiF2tteI0WZk1NLTOxIc4D/H5uiwnEWI=;
 b=A18qLRPvA3hqIfI0t/a4BUaqrQerM9RofEqbjwdf3TsKGZQGWNy4kcI9
 rb2AoXscPl59lMP5SOdUuVW16fTSgZSZ/qXFKbnnkiih1QYUdX13pP8y6
 S4LGEzpJTEPLyUXKFOz6SoLxaRy3prUZy3vDPLd1qRnBDwM5lWeSYeobv
 MXc13nxRgSxL5bYK35PwIVFrn/hsb8S1OdwVYqKGRIF3IN0f0gAcF6yNp
 UVgYLXEAIIoXMtSMlWhwsSd0imeijOz3dN40oP0tDMSXWU+mcC2ruLEaS
 im1TVkXL9Mfv/Of2U4GOOXAcnCeI+OpzmGsgLELV2FTwtEGJeAN8TjFCB Q==;
X-CSE-ConnectionGUID: QrfN8fxYQOqvZsAz6r1+iA==
X-CSE-MsgGUID: SvFc4C0jSqGrSAly8mxUjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862320"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862320"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:40 -0700
X-CSE-ConnectionGUID: sMwM1b/NRke+HlLocYz9LQ==
X-CSE-MsgGUID: M3jYrwCySNWYLSCaUypJ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942351"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 03/13] drm/xe/hwe: Allow to replace xe_hw_engine_handle_irq()
 with stub
Date: Tue, 28 Apr 2026 16:27:10 +0200
Message-ID: <20260428142722.582-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

We want to use replacement functions in upcoming kunit tests.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0f0e08bcc182..fb1bd2550160 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -6,6 +6,7 @@
 #include "xe_hw_engine.h"
 
 #include <linux/nospec.h>
+#include <kunit/static_stub.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -882,6 +883,8 @@ int xe_hw_engines_init(struct xe_gt *gt)
 
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_hw_engine_handle_irq, hwe, intr_vec);
+
 	wake_up_all(&gt_to_xe(hwe->gt)->ufence_wq);
 
 	if (hwe->irq_handler)
-- 
2.47.1

