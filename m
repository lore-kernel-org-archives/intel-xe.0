Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31F2C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 12:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCFE10E381;
	Mon, 24 Feb 2025 12:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AenvNkhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83B410E381
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740399370; x=1771935370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mlfe/AbIYDC1qLl+Hhmi949MWk2Jx7PJlwonb+B4xrA=;
 b=AenvNkhfWOafHqg57vU63kBtwpqNiIn/vUbJRcR05QOzMMRXn5eX9pEq
 Kvfk7ALx1MK8pFk91jCFIm2k5acbD4IilH1wWaKvSVTAHj7qHm+y0jJId
 jH2m/mF0v2fV0QP6BPn/5E78qHnb7D0KWZqGcJJalw2dHoSfnouNz6puC
 G2y9uen59vqiCA6i9VG2khZXEN5e4JLl8CD0kLKIOH0/u+nPvdVkmRSws
 jZLFDWuAlTWsUxZ0uanVU3a6ykWIr6Rco8u9DgKP1Vqc3+Tsyt1xUaQUS
 UWkxwnQFv9GP5QnQGf0CyGTaX3ZUo5/4TWT3vtLLmOhDzWOHvtE+kxPLZ A==;
X-CSE-ConnectionGUID: G8d7JWVoQ7y3FO8PLKzg8Q==
X-CSE-MsgGUID: 2AOW0kATSoCKM1h1HtCPZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44801669"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="44801669"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:16:09 -0800
X-CSE-ConnectionGUID: G2HQaVrBSLq0npgYOpERCg==
X-CSE-MsgGUID: +0UmrC2VR/iKGQKYYHX89g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="146897201"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:16:08 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: cancel pending job timer before freeing scheduler
Date: Mon, 24 Feb 2025 17:52:37 +0530
Message-Id: <20250224122237.576893-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Async call to __guc_exec_queue_fini_async frees scheduler
at the same time when some scheduler submission would have
timed out and restarted. To handle such small window race
case, all pending jobs timer should be cancelled before
freeing scheduler.

It will help to solve below which is not easily reproducible,
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223

V2(MattB):
 - Cancel pending jobs before scheduler finish

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f2ce3086838c..8b7165d3820b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1258,6 +1258,8 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 		cancel_work_sync(&ge->lr_tdr);
 	release_guc_id(guc, q);
 	xe_sched_entity_fini(&ge->entity);
+	/* Confirm no work left behind accessing device structures */
+	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
 	xe_sched_fini(&ge->sched);
 
 	kfree(ge);
-- 
2.34.1

