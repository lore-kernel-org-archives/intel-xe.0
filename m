Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD3C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF4A10EE8C;
	Thu, 21 Mar 2024 19:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gh1GrcpT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A0C10EE8C
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711050921; x=1742586921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=72f/QE08cVX/yzx1wbOIMfTSWH1aJK9OKqX4Yt5ZNIY=;
 b=Gh1GrcpTPFtn5WXn6gjZm2m1P40f4xEVQi4D5c6jd4exTxfpZgk/KATm
 Syb9V0SLg4MSBRJs/1ghF7rsj8U8GWUiBC2U6qBwx2I12rnhEwuTQ9NHq
 bSEuDRNJyseOvvog7Zuqz8ORiP+BKHnqR00gkeWvOGqooJy/yDCh98dhq
 JX4ger8LQ67cbvyDKdumOA4tN6vEzPEpHXmDPRVSFuzxWYhyS/CV4e6eA
 W3smaEHjKcjxJOnpltWMQo3/v9oRomzJ35QAt+HiIqrIGLs5Is3UM3Wkq
 E2gQrbwqxUZ0ilJKafiWHTGUoyxUR6hleN2Rq8dQrnufoBPqN41+ma7nn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6188096"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6188096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14506599"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:55:21 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/guc: Check error code when initializing the CT mutex
Date: Thu, 21 Mar 2024 12:55:12 -0700
Message-ID: <20240321195512.274210-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The initialization via drmm_mutex_init can fail, so we need to check the
return code and escalate the failure.

The mutex initialization has been moved after all the other init steps
that can't fail, so we're always guaranteed to have those done and don't
have to check in the cleanup code.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index d9fa81900ff5..1d930a8eeeca 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -145,13 +145,16 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	xe_assert(xe, !(guc_ct_size() % PAGE_SIZE));
 
-	drmm_mutex_init(&xe->drm, &ct->lock);
 	spin_lock_init(&ct->fast_lock);
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
+	err = drmm_mutex_init(&xe->drm, &ct->lock);
+	if (err)
+		return err;
+
 	primelockdep(ct);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
-- 
2.43.0

