Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73530C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 02:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F45010E1E8;
	Fri, 28 Jul 2023 02:12:46 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE69A10E1E8
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 02:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690510364; x=1722046364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XoVWi/0lIs5QeXdu3rF1Hp3qr4JscfTmdzP9xdqgYB8=;
 b=YhoHqGT6dw8T+kl5iG1xLJIY1XtVXX+nSmaOGr/etOIs6t7rqwTn3ijK
 56ilUHMgSMf8qJZZQmPSQ8auHSuawZlv+zVaCEKI2EZgLdWVAoTj8Pkrs
 Nyg4lA+ZX1gtK+7j46ejyH3ihPRGn6fKLoshuK2W/7s9empjRRR0A+UOw
 yfI+m3ftMMqO++v0N5Q8aR8+1Um0+F4sHiA4apMxukNX2S++pL9gnhj5o
 +hX59HFAd8hmpA9L2qiZ2EbRUKiiGLcoLNMayfX59XLcpIlWX/mKJLYx2
 vV9O6D7xLHX24RttvIyguUwX8F8ov8CUDwsGZFFgvVkcIlawQdFkGDO2b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348766412"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348766412"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 19:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704344890"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="704344890"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 19:12:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 19:12:38 -0700
Message-Id: <20230728021238.17414-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove ct->fence_context
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

This is unused, remove it.

Suggested-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 1 -
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2925c3999168..97c12c1acd00 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -140,7 +140,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	mutex_init(&ct->lock);
 	spin_lock_init(&ct->fast_lock);
 	xa_init(&ct->fence_lookup);
-	ct->fence_context = dma_fence_context_alloc(1);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index dedbd686428b..d814d4ee3fc6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -100,8 +100,6 @@ struct xe_guc_ct {
 	bool enabled;
 	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
 	u32 fence_seqno;
-	/** @fence_context: context for G2H fence */
-	u64 fence_context;
 	/** @fence_lookup: G2H fence lookup */
 	struct xarray fence_lookup;
 	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
-- 
2.34.1

