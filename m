Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA46C369D1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 01:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367AD10E0B7;
	Mon, 28 Apr 2025 01:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeoR4JxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A5010E0B7
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 01:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745803950; x=1777339950;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rmFehOHqsW9a8RqoaOZQQx/mwBXjwOfML00vmIGl+/M=;
 b=MeoR4JxBOG9vAzFfj//HA3jvJt4iGexnb7NqvXlXJ1kVq79Tc597D94M
 5MITEliN7lNJlsyXUH7QM7h5KSR+I445XylM1LGs6ZmW+WQC/tk5wF1fW
 sxp4pO0VKwuA4IXI/moD1NpUVjJDECIWs1TGCuvzTaLbd/t8hgDN30nB/
 4GmITHQ4MxnKi4XrP8k67eJK+9n10/71DxQ6O8HByzTmVAh1pWbCtqdum
 POhRVHMT5EmDq8Rg+9DWDdtFuHkgyQsFcbk6AcP46qHpbnl/uCGfwIRt8
 fWc/FC6jgUxO6MoHlB4CUdTSUVdXzNPbld6QOkDPrHjIoDfpZG+euMPTm A==;
X-CSE-ConnectionGUID: ki7d9VPyQweHQXCYp0SpaA==
X-CSE-MsgGUID: cgnbva8pTca9yyH9gJsVMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47294051"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47294051"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 18:32:24 -0700
X-CSE-ConnectionGUID: hpwxRWaNT4atuHDYI2Gicg==
X-CSE-MsgGUID: +cuTSTo1SdahZEUZ3UNn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="156602741"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 18:32:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Drop force_alloc from xe_bo_evict in selftests
Date: Sun, 27 Apr 2025 18:33:43 -0700
Message-Id: <20250428013343.877053-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The force_alloc flag was removed from TTM / Xe but updating the
selftests to new function interfaces was missed. Remove argument from
xe_bo_evict in selftests.

Fixes: 55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 230eb824550f..378dcd0fb414 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -60,7 +60,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	}
 
 	/* Evict to system. CCS data should be copied. */
-	ret = xe_bo_evict(bo, true);
+	ret = xe_bo_evict(bo);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to evict bo.\n");
 		return ret;
-- 
2.34.1

