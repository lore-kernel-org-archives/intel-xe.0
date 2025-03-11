Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67D3C28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 05:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A168610E123;
	Tue, 11 Mar 2025 05:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxeH3HCM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0E010E0C3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 05:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741671333; x=1773207333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ejTuRCkuf/U+LCi+jhw+0Nan9wbflRjgUobi0m7J3as=;
 b=YxeH3HCMsCaS5AzC6FmWUXqYpbjhFhRz2f1UMMlzMKaTaof7YZ/pY3YZ
 RZqzth13ffrNOy4oRd1TXtdVeZD4M0xddgxlNgnUCiPcgcuztCvsfunV1
 BINJoFHa/AXuAjcLMGFWxwd8p5yWcOxRBPV2+WZQC69mdEnhpVRcLkzN5
 BVR+BrMySli8g2UuhQ4vfl8D+zeB5xSvryOrTvj+ru9uLT2dHeOh2DOXc
 CEE7M+B9mOTcEJn3EKH7t+wEStGKG0myVhsiSSoGBUqBlRFVcrxBcuwoa
 tQcy/gtKRHdSOj6oQaNjwKUmeSpAX7ybtJ0qReVB0/7Hh3V5v/qWc1C4z Q==;
X-CSE-ConnectionGUID: yCnaQfdISyOYY8xQd9y6Mg==
X-CSE-MsgGUID: hbA7iidKSgaemPaFMzHHog==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41938544"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="41938544"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:35:33 -0700
X-CSE-ConnectionGUID: DOTp5eEmSpyHyW1tWsB73g==
X-CSE-MsgGUID: bv/fxv/QRL6P4oSJyMct4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120721010"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:35:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 2/2] drm/xe: Allow to inject error in xe_pcode_probe_early()
Date: Mon, 10 Mar 2025 22:35:17 -0700
Message-ID: <20250310-fix-survivability-v1-2-7af31432bbd0@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310-fix-survivability-v1-0-7af31432bbd0@intel.com>
References: <20250310-fix-survivability-v1-0-7af31432bbd0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-c25d1
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

Allow to test if driver behaves correctly when xe_pcode_probe_early()
fails. Note that this is not sufficient for testing survivability mode
as it's still required to read the hw to check for errors, which doesn't
happen on an injected failure.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 9333ce776a6e5..cf955b3ed52cd 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -7,6 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/errno.h>
+#include <linux/error-injection.h>
 
 #include <drm/drm_managed.h>
 
@@ -323,3 +324,4 @@ int xe_pcode_probe_early(struct xe_device *xe)
 {
 	return xe_pcode_ready(xe, false);
 }
+ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */

-- 
2.48.1

