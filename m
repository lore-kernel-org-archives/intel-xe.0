Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF01EC27C77
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 05:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9290710E0F6;
	Fri, 14 Jun 2024 05:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxuRAWaw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDFF10E0F6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 05:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718342184; x=1749878184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fUtH+Vog80Xt3wfjS9IJnMHEloV+M4yoazSZlA/u5XE=;
 b=TxuRAWawaQJVMDyivjDYQKu25jauphkcTQ382jrZHYDEUQ9Z9lRh8vo2
 za18r/227B/Ce0IF7jb53dnIuuivkODgc9tqYgsOWZO0tbiCO4m6+Fby+
 KtRuBGANogR76adw0UrJ+QJlxf+mqbCAcB77TUb2q/xz9dKdc7Jn/9vpw
 HZOQJBkxUogN3ovYkTN8ov6Wmc8e40MGbXEV2EPWfU/hadhrxMQ/Z8Bgo
 oiQ18MSqr6x4e+beiQVD9se/vrnf/qoPivO2wX39Fu0ay9mZiZu2FMmcn
 z6GURCtNnX2bq0dXd9jZmaT2Y55aAKhZ88olzmfNyssa5mKsuUaTTua5G Q==;
X-CSE-ConnectionGUID: LWlM01UgQayd6v0dbKLYVQ==
X-CSE-MsgGUID: 9hFqGkKkRxuaO4SZ+kciOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25851024"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="25851024"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:16:24 -0700
X-CSE-ConnectionGUID: j1tl+pb0TEiCZmkDe2sn4g==
X-CSE-MsgGUID: qtNXmryKQkyKzuFh8fyYQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40482885"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:16:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Explicitly cast to u64 to avoid overflow
Date: Fri, 14 Jun 2024 07:15:56 +0200
Message-Id: <20240614051556.255455-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Without casting whole expression will be calculated on u32 what
means adding U32_MAX effectively decreases the result by one due to
overflow. Fix this and use explicit cast to u64.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 74552391dc5a..347773f003f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -967,7 +967,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
 
 	if (ctx_timestamp < ctx_job_timestamp)
-		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
+		diff = (u64) ctx_timestamp + U32_MAX - ctx_job_timestamp;
 	else
 		diff = ctx_timestamp - ctx_job_timestamp;
 
-- 
2.34.1

