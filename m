Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB932C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 12:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC4B11A3EF;
	Thu, 25 Apr 2024 12:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOyWIFLa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A0D11A3EF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714047359; x=1745583359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xOhwk7WgiReZCEp0jYdWGQQylcr0YicFJacEnJ6ltOw=;
 b=fOyWIFLaonZaOeNtAD2G7oQaTwFHOdCtXYNmrbiEYyJqCusSTVX97pPc
 noHv1N2Hz1Ibawz2Rl8E6e9OXaVGsm5HybciLmCh2tc09goa0tQV8/WLD
 rr5QATHag9O2I+MygQQvgGm5up4FDzXcI/NKlQjapM0/ChmlNEXwFqTMM
 i2fdCi5//3nnVGtwYRJw/yU8HRh9769MeVPXKsgd5olYHMD1ZgNOIYwr8
 mN5xA+wik0BCghP0dzFYrCnpHvYk53+2VO8yMw7t3kGl1kNYZFE3EK9FX
 HIV73sp5ncVaGX6COgkubO7ph3ca51GM3E6FqBENJELTvTnwxi0JvcJ58 Q==;
X-CSE-ConnectionGUID: y09p9w+OSVmWMbWHn4vT/Q==
X-CSE-MsgGUID: BihBMHdjRHKpWvPKVjJ+UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32219934"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="32219934"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:15:59 -0700
X-CSE-ConnectionGUID: Om+abQijQPOIcBEtYmb0Nw==
X-CSE-MsgGUID: qiWaP673Tbeqh6LZu2UIUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25143076"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa010.fm.intel.com with ESMTP; 25 Apr 2024 05:15:57 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: skip error capture when exec queue is killed
Date: Thu, 25 Apr 2024 17:59:31 +0530
Message-Id: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

When user closes exec queue soon after job submission,
we are generating error coredump. Instead check if
exec queue is killed during job timeout then skip
error coredump capture, just free the job and return
proper scheduler state.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 93e1ee183e4a..376a2c04e899 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -971,7 +971,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
+	if (exec_queue_killed(q) || 
+	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
 		guc_exec_queue_free_job(drm_job);
 
 		return DRM_GPU_SCHED_STAT_NOMINAL;
-- 
2.25.1

