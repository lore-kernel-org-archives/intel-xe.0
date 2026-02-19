Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCF9E9A053
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91B810E72F;
	Thu, 19 Feb 2026 18:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOiKPGI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCE710E72F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524423; x=1803060423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QIdzlmeRuW02yxleV9RXkd4SZV/3Vp/4Ei7AIjsUXLo=;
 b=aOiKPGI8EdIJ7whEUICy9m7yO+dQ1MD4kIHIbmY/DB8/ugUyBCnO0hJa
 DpUpKRUwIy2YiXRyKCNATVGMZJaRAGhEfEuF3feOq/4+GSdtzdZcxrRZO
 eymWYAHET3dUydokpFTOSGoaVxQiM2EnT6a6NHmgwapmCXM77eHijAqNW
 Dl2q0MX1KjpuSktZPXKcX71D/w2o4JGNtcsCOetYj3T8cUM7C6u3CS+Kg
 40z6Czp97Kp8rRSeRYSlWOMZI+YqkSRF50chUvTIq3tJp0ta1hx8wvvqu
 6DtFaIXVZsMQDHWEJHYRQex5jT8a+ZlTAeI7/tzaEOAX5AFH9slSy8UYP A==;
X-CSE-ConnectionGUID: O7Au5IEiSeCHZKaJzUFi6w==
X-CSE-MsgGUID: RDjVv5V1SzKxQItDVvtI8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76482810"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76482810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:03 -0800
X-CSE-ConnectionGUID: zAodoqX7RFe/mi3qygbY9A==
X-CSE-MsgGUID: FQOP7MgsS92zsAkqgPQ3mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245189015"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 10:07:03 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
	Zhanjun Dong <zhanjun.dong@intel.com>,
	Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v7 1/7] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Date: Thu, 19 Feb 2026 13:06:55 -0500
Message-Id: <20260219180701.2418453-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219180701.2418453-1-zhanjun.dong@intel.com>
References: <20260219180701.2418453-1-zhanjun.dong@intel.com>
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

