Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0788DFF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC89B10EBC5;
	Tue, 28 Apr 2026 14:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlPqnHGY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A380F10EBC5
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386459; x=1808922459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cpW6ZpDUBtEndss5wiltcIPNJYwdMS53RheREWG+pnc=;
 b=WlPqnHGYNasg0OknZSJesyC4TIsqMti0JNfd9+oEUs+G/2ZcVVzWH4Xk
 SE2PzngUov6wP3kFtvwfAuQxE/aqdS2W8eH2O09tFbRL9hBf510iY6aAz
 OMquHj0Vc3+h6zsS5fwk5DfYSmqqBSfBhGjWZwUq8dG6Z8yVs9r0Q6K6t
 Xs6T90UQzVVrDNNw56tge7UOglR6i5LTvCjbKToyPSvXMfw7f82HLMYYy
 ic0Da4yeuqG65rWxVLwzyYu+leuOU0kLPXAYIlQJM6GK7UOgVeoEkCGY9
 nLb9v4sRkSkqBBkg4eyAyUgXpGeTvnb4ySZbAjB+vE4uk0nSPMSOmnoDY w==;
X-CSE-ConnectionGUID: UbZ4whM2ScaeD3ceyZxx4g==
X-CSE-MsgGUID: gpqdVCVPTKeXC8vpwIRazQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862315"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:38 -0700
X-CSE-ConnectionGUID: 9EVwGttpQ5e6EjTOTQfm5g==
X-CSE-MsgGUID: TaD6N2GfRAmYo8laP/mlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942344"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 02/13] drm/xe/guc: Allow to replace xe_guc_irq_handler() with
 stub
Date: Tue, 28 Apr 2026 16:27:09 +0200
Message-ID: <20260428142722.582-3-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_guc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e468b638271b..13228b0bd63c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -7,6 +7,7 @@
 
 #include <linux/iopoll.h>
 #include <drm/drm_managed.h>
+#include <kunit/static_stub.h>
 
 #include <generated/xe_wa_oob.h>
 
@@ -1675,6 +1676,8 @@ static void xe_guc_sw_0_irq_handler(struct xe_guc *guc)
 
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_guc_irq_handler, guc, iir);
+
 	if (iir & GUC_INTR_GUC2HOST)
 		xe_guc_ct_irq_handler(&guc->ct);
 
-- 
2.47.1

