Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C912CA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 14:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F9510E9B6;
	Thu, 21 Aug 2025 14:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPQFDQiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DF510E9B0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755786666; x=1787322666;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SmcGQkd/xUaA9RWuW8K+O56KYwuS7Dq+cwPIL/8SQtI=;
 b=CPQFDQiVaf6Rwx3JzwyOPa0rof0vs0VVbhESlDu5ApGDpYOmLeKDRzxq
 KDryksL0hjTWN69fgDds7dRZxd6AdBI3RM91mWMm+/O25jqoHc/0kFyKP
 +v1o3Je1dA37dgqxYXq53FAzNzq6KySnr3uqQ8/C1+pXUwHjuXUXKaPjS
 7TBDBZEU3iR4jsN8LPQBCFG9HuVVTapMrhmWk7BkK7PM77YEc1mdmUnmc
 uX1FDHdU/4Z+ARh+aVTtuz7IX0ZlC8f/trvSgZ658T2APY648Z9a8E6mz
 XB+ww62XfSjTH3fTRAD5N7H56G9h7QDwHfxdl9zUE8v8/wKfTm25QxOQ8 w==;
X-CSE-ConnectionGUID: agJZzzBaRROlLdlP1r3YSg==
X-CSE-MsgGUID: aoL7Rz+1TpeeOLszwqgPrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58175758"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58175758"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:06 -0700
X-CSE-ConnectionGUID: WuSj4YXBTvegkqjr6tHkkQ==
X-CSE-MsgGUID: fuJpWBoRTmCM6ir8cMtqbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172840854"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora) ([10.245.245.201])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf
 member
Date: Thu, 21 Aug 2025 16:30:44 +0200
Message-ID: <20250821143045.106005-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
References: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This member is set when exporting using prime. However
the xe_gem_prime_export() alone doesn't set it, since it's done
later in the prime export flow.
For the test, set it manually and remove the hack that set it
temporarily when it was really needed.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index c53f67ce4b0a..cde9530bef8c 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -57,16 +57,12 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 		return;
 
 	/*
-	 * Evict exporter. Note that the gem object dma_buf member isn't
-	 * set from xe_gem_prime_export(), and it's needed for the move_notify()
-	 * functionality, so hack that up here. Evicting the exported bo will
+	 * Evict exporter. Evicting the exported bo will
 	 * evict also the imported bo through the move_notify() functionality if
 	 * importer is on a different device. If they're on the same device,
 	 * the exporter and the importer should be the same bo.
 	 */
-	swap(exported->ttm.base.dma_buf, dmabuf);
 	ret = xe_bo_evict(exported);
-	swap(exported->ttm.base.dma_buf, dmabuf);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			KUNIT_FAIL(test, "Evicting exporter failed with err=%d.\n",
@@ -139,6 +135,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			   PTR_ERR(dmabuf));
 		goto out;
 	}
+	bo->ttm.base.dma_buf = dmabuf;
 
 	import = xe_gem_prime_import(&xe->drm, dmabuf);
 	if (!IS_ERR(import)) {
@@ -186,6 +183,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 		KUNIT_FAIL(test, "dynamic p2p attachment failed with err=%ld\n",
 			   PTR_ERR(import));
 	}
+	bo->ttm.base.dma_buf = NULL;
 	dma_buf_put(dmabuf);
 out:
 	drm_gem_object_put(&bo->ttm.base);
-- 
2.50.1

