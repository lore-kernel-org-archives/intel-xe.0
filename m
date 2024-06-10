Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE95CC27C75
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B74610E492;
	Mon, 10 Jun 2024 14:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhCxsZ3F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F9E10E492
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718029082; x=1749565082;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ahlUwscNnEiCx4WjoCLCcHJY4dX/WNkfqSY/lTLtsh0=;
 b=MhCxsZ3F0Pcsfwmiro3GKorT/QYkS5yV0PNKt1kF0NyFy01tV9ttDHyr
 dgkOjO8DKjqtuIUoHEETZgxZDKwbXXsUPMW8gyc5a/sn+WnERgQNKTRW2
 D+BkZxfGHI3zoArPXKCcpubnf1FvP3zZjY1oNuofffRxSFX0YcdKIXGV9
 WE4vtr87BxvHlZ7xLaIqMMiJ2ViX221J9P/vpXSVsT2k58yXHayTEZcoq
 SepyBgQ/zFpIkdpfoN2IXpK8/YuORqgLJcysUd/SEr2Q/EM9hOgOk50Jm
 FiIuGw9RJTWt8Rvq6P1L8qdTmnk7r9UJRpi/LvGS+YwYsk3X4LKWSbmAv A==;
X-CSE-ConnectionGUID: HDnbSjalTEScqX8WznoQzA==
X-CSE-MsgGUID: d246R766R/iOiNhl7c4Z8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14864872"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14864872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:52 -0700
X-CSE-ConnectionGUID: cmtYSuPsSkSTBQAt5kyBbg==
X-CSE-MsgGUID: E0enDDI3RCmPNmeyEOo4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70238696"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 07/10] drm/xe: Add GuC state asserts to
 deregister_exec_queue
Date: Mon, 10 Jun 2024 07:18:20 -0700
Message-Id: <20240610141823.2605496-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610141823.2605496-1-matthew.brost@intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
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

Will help catch bugs in GuC state machine.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 766ff8e48dde..e697732f1e74 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1587,6 +1587,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 		q->guc->id,
 	};
 
+	xe_gt_assert(guc_to_gt(guc), exec_queue_destroyed(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
+
 	trace_xe_exec_queue_deregister(q);
 
 	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
-- 
2.34.1

