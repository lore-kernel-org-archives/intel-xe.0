Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D7DD21275
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 10:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7786E10E7ED;
	Thu, 17 Oct 2024 10:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhQPa0R9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED2C10E7ED
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729162430; x=1760698430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDy+QEgEq/uVLPo0Unzo3hii4mt2VhyqEfq9yMb1vIQ=;
 b=QhQPa0R9yrk/cq8nBU3cnssBQhdaDBtvSGUU8xuLOp5IGQGk89G8RGVO
 qhGK2X4Hby6Bpzz9Mb1GsuEXj0b91V9txQ6dM901eUCLfqLtxLTtzF/LX
 /4yGSGOzEWDk57mSaWsjEqNv42GG9OxPlL8vK6ZmzbNp4GBNuQ0ImqCwC
 zlK5ZK8VFpsqR1Gg2oEFiXbAS7rQms52ckpmhM+nHy37eDdDS5wrVs6sj
 TGaUcb1q7dEIrIjeIBIuzmnR2xnnFeqmjTGxZbpBC55XG1Sg7Kaz8pP20
 iKkleLQd4HuA5FLzXbVVnAlG8zRIsRqhuUPTflaIt8Z9bbuz71oMAvsFz A==;
X-CSE-ConnectionGUID: PVBqhFFqST2QehKyXf1lVw==
X-CSE-MsgGUID: D5mxMJFGSnOGB/g8UpHOBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="32571641"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="32571641"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 03:53:40 -0700
X-CSE-ConnectionGUID: BfCngxbtQnKr01+KpdWPSQ==
X-CSE-MsgGUID: 4lcB70pZQmSVlEtOn1tlYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78168772"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 03:53:37 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.auld@intel.com
Subject: [PATCH v3 1/1] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
Date: Thu, 17 Oct 2024 16:44:10 +0530
Message-Id: <20241017111410.2553784-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017111410.2553784-1-badal.nilawar@intel.com>
References: <20241017111410.2553784-1-badal.nilawar@intel.com>
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

In case if g2h worker doesn't get opportunity to within specified
timeout delay then flush the g2h worker explicitly.

v2:
  - Describe change in the comment and add TODO (Matt B/John H)
  - Add xe_gt_warn on fence done after G2H flush (John H)
v3:
  - Updated the comment with root cause
  - Clean up xe_gt_warn message (John H)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c7673f56d413..c260d8840990 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1018,6 +1018,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
 
+	/*
+	 * Occasionally it is seen that the G2H worker starts running after a delay of more than
+	 * a second even after being queued and activated by the Linux workqueue subsystem. This
+	 * leads to G2H timeout error. The root cause of issue lies with scheduling latency of
+	 * Lunarlake Hybrid CPU. Issue dissappears if we disable Lunarlake atom cores from BIOS
+	 * and this is beyond xe kmd.
+	 *
+	 * TODO: Drop this change once workqueue scheduling delay issue is fixed on LNL Hybrid CPU.
+	 */
+	if (!ret) {
+		flush_work(&ct->g2h_worker);
+		if (g2h_fence.done) {
+			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
+				   g2h_fence.seqno, action[0]);
+			ret = 1;
+		}
+	}
+
 	/*
 	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
 	 * the stack, since we have no clue if it will fire after the timeout before we can erase
-- 
2.34.1

