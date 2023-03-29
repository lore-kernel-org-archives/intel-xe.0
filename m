Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4D9C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 17:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0DC10EBCE;
	Wed, 29 Mar 2023 17:34:00 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19A010EBCE
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680111233; x=1711647233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CVY1o6LLjrpYecNsyAh8MdxNM1TVqxLT5jpEs0GUKSU=;
 b=ZJXToFM7fUIg/EnRDN1OPW1wlKjPCgnvqr1KCQ3mv4MPG3vTE/8AwKL0
 8O6KrnC78lahpdF/rvwxC3MEKmmAYEqjAUxwyJeoU6LcR2Trc5CtoUVBS
 lsa2WEkmZAeAwxgta7ZBp0O4G4xgC6C2ouEbeMP4KU031Lj8qhjGMpqpq
 MiYBfVblco/c+iqtvahpDhmD8hYXZ8Hq0lsWqNE2BN+h0+NcM/nRraWm3
 cg4E+SHRTl39mRHykRuwDhvmsxng9RsjkcZN7pqrD2uDTuEqtKgWD1pL1
 GKtFcrBb6bEKMfZSwpwXnVdU7rqM+AshoAxtEnxgXV5MteVS4I6E2sR58 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405896899"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="405896899"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="677854289"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="677854289"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:33:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Mar 2023 10:33:33 -0700
Message-Id: <20230329173334.4015124-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329173334.4015124-1-matthew.d.roper@intel.com>
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Adjust batchbuffer space warning
 when creating a job
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We should WARN (not BUG) when creating a job if the batchbuffer does not
have sufficient space and padding.  The hardware prefetch requirements
should also be considered.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index f326f117ba3b..7172801ee570 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -63,10 +63,10 @@ __xe_bb_create_job(struct xe_engine *kernel_eng, struct xe_bb *bb, u64 *addr)
 {
 	u32 size = drm_suballoc_size(bb->bo);
 
-	XE_BUG_ON((bb->len * 4 + 1) > size);
-
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
+	WARN_ON(bb->len * 4 + bb_prefetch(kernel_eng->gt) > size);
+
 	xe_sa_bo_flush_write(bb->bo);
 
 	return xe_sched_job_create(kernel_eng, addr);
-- 
2.39.2

