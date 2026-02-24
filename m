Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9E3F3C9BC
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 16:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881BC10E5F2;
	Tue, 24 Feb 2026 16:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRu4+aRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C0910E5ED
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771950959; x=1803486959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QIdzlmeRuW02yxleV9RXkd4SZV/3Vp/4Ei7AIjsUXLo=;
 b=gRu4+aRLiuO4BgMLywNuLNZPbduM8rnEhRbHir2EbEoQ4u0NkjVSyYS1
 oLli3zi+5z5BFZ+IgoYc556dt26belHJuavW6+WP8wfwd0y7wTn2Ls5Ck
 Fcgq/EPtf5261nNvGMzi2k89i1ENB1sx+jYVTACH4v9GgBLu6/l8w1VFp
 N0oZwDggyb89MKfqPQm+y66dgW68KPPKMEuHFDTltX9MKZiewdd+qGg+u
 +BUJvjvjgSTD8Qd6ZnJ8HUGrc6ras9FLCYgDlKv8pVoHm+84X29iseouI
 8MAhHjQPngJKkPs8mQn4i74ADcebMokQ1Of9dI22e4/6flp8GO0LhjIeG g==;
X-CSE-ConnectionGUID: yKoIWcN8Qq6PNwOepBafSg==
X-CSE-MsgGUID: KwNV1htqTNGajY8HNaLbtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73040139"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73040139"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 08:35:58 -0800
X-CSE-ConnectionGUID: D9tES4ESQF+bKfsYQROrqg==
X-CSE-MsgGUID: z/V3sXsKTrWHrT/UAXTMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220555619"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 08:35:58 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v8 1/7] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Date: Tue, 24 Feb 2026 11:35:49 -0500
Message-Id: <20260224163555.218750-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224163555.218750-1-zhanjun.dong@intel.com>
References: <20260224163555.218750-1-zhanjun.dong@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

xe_guc_submit_pause_abort is intended to be called after something
disastrous occurs (e.g., VF migration fails, device wedging, or driver
unload) and should immediately trigger the teardown of remaining
submission state. With that, kill any remaining queues in this function.

Fixes: 7c4b7e34c83b ("drm/xe/vf: Abort VF post migration recovery on failure")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index de716c1fb18e..42712acf2ec2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2763,8 +2763,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
 			continue;
 
 		xe_sched_submission_start(sched);
-		if (exec_queue_killed_or_banned_or_wedged(q))
-			xe_guc_exec_queue_trigger_cleanup(q);
+		guc_exec_queue_kill(q);
 	}
 	mutex_unlock(&guc->submission_state.lock);
 }
-- 
2.34.1

