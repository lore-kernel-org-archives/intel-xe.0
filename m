Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B175CD8CA4
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A5210F768;
	Mon,  8 Jun 2026 16:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdfVY514";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DA410F772
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937694; x=1812473694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47nBsULGwRR9XvCfWurF8ooIrX/w702jgpPbLOQPsPI=;
 b=PdfVY514h6eYfy9FNRrA4DrLzUbdUCjvp+kHzE8MsvXk6iAZKrSUXSK4
 5EiwJI6Pd4iIY+TUKmrFsAfgZbgkY9mqOVj+hnpiJdN9QtF4FYZjFgxWv
 qIGJKW7OdA6FUxtV/PIxM5CcctwcFjywjvlip4DhJG7oX4gYOmmyIE4hK
 M8BoCsaaMjQpfj6/IPhtF1QYFu/Pmxw/jvN/7LPYkGw1H7dlLT0bffnf0
 1zJiDwPRcbrNxFYqPWmhsnA1eviKRChONuUu3qe8tMQHKW3/MbSlyt9LS
 K9bsET9MIk0uS4hR1ASNLksdhCTOWlDJqWN3ZP//8Ad4dEyDQdt8xJ8Pb Q==;
X-CSE-ConnectionGUID: r/AgxhxNT82CDA1fSTIYGA==
X-CSE-MsgGUID: eXPyS+fiTSaKVkchcjLHgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744567"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744567"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:54 -0700
X-CSE-ConnectionGUID: /3sGm6yCS0+XgTYHGbO9hQ==
X-CSE-MsgGUID: GoHU9H1YT4aVZYxgPat+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467590"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 11/16] drm/xe/tests: Increase DUT_GGTT_START
Date: Mon,  8 Jun 2026 18:54:24 +0200
Message-ID: <20260608165429.587-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

As we want to use more original xe_ggtt code, our fake GGTT range
should be still within expected [WOPCM, GUC_TOP) range.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index c341e84b6004..64f106406844 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -13,7 +13,7 @@
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 
-#define DUT_GGTT_START		SZ_1M
+#define DUT_GGTT_START		SZ_8M /* more than WOPCM */
 #define DUT_GGTT_SIZE		SZ_2M
 
 static void remove_ggtt_node(void *arg)
-- 
2.47.1

