Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A5CD2629C
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930D110E097;
	Tue, 20 Jan 2026 20:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XG8zTkiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916D510E220
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768940184; x=1800476184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5g7eNrockMgk0yivVHjBlRycQ6V13a9tjJgfB5sdCxI=;
 b=XG8zTkiqVUOkRmC6rSmJkMsRtvTU5uKM4bZ3T5PUAxFsaD6wWWsEjgKX
 S5Iyli4Rzwc0CS+N+w/Ybu54fCi67Nw6js4CdRO2ypOgSbg4hy3ZtunRj
 A+xUu38e4V+XGpHst4XZ3IkJHWAQz5esqQFWAqd/+NV/WUMDANOoyCLW2
 xOAyud4N9piDR9G2t0ibbLZb9X1h+93CzN5j42q64yKILGbI1InbSIUAz
 00vPHOofibtFXZAJWj6Uaw0YFi8zSLyCbC5lv5fgOznbL+s9g/R2rw+g2
 R1qBHtjAooFSOeIKKYMLwNrpPmW+SlFgch3X35HluJvD4NoGGKeSX7zve w==;
X-CSE-ConnectionGUID: unxw+COvTkaF08JLvQAJHw==
X-CSE-MsgGUID: iTLoTMYPRESTKxIE95JRIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87574652"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87574652"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:16:23 -0800
X-CSE-ConnectionGUID: UbO7E0B4RJ27XTWhpkHVCg==
X-CSE-MsgGUID: 7lVbbyBpRhemxjVoT4PRhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210373492"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 12:16:23 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v3 1/6] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Date: Tue, 20 Jan 2026 15:16:16 -0500
Message-Id: <20260120201621.2442803-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120201621.2442803-1-zhanjun.dong@intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
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
index 456f549c16f6..d61bd0094e0b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2774,8 +2774,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
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

